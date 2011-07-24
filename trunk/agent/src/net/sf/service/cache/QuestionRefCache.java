package net.sf.service.cache;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.db.TiSqlDao;
import net.sf.service.agent.client.Agent;
import net.sf.service.agent.vo.QuestionRefVo;
import net.sf.service.common.Constants;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.util.Assert;

public class QuestionRefCache implements Runnable {
	private final static Logger log = Logger.getLogger(QuestionRefCache.class);
	private final static String KEYWORDS_SAPARATOR = " ";
	private TiSqlDao sqlDao = (TiSqlDao) SpringInstance.getBean("sqlDao");
	private Map<Long, QuestionRefVo> cache = new HashMap<Long, QuestionRefVo>();
	private static final byte[] lock = new byte[0];
	private ScheduledExecutorService ses = Executors.newSingleThreadScheduledExecutor();

	private int refreshPeriod = 1440;// in minute,24hours

	private QuestionRefCache() {

		Properties p = new Properties();
		try {
			p.load(Agent.class.getResourceAsStream(Constants.AGENT_CONFIGURATION));
			String rpStr = p.getProperty(Constants.QUESTIONREF_REFRESH_PERIOD_KEY);
			if (rpStr != null && rpStr.trim().length() > 0) {
				refreshPeriod = Integer.parseInt(rpStr);
			}
		} catch (Exception e) {
			log.warn("Load " + Constants.AGENT_CONFIGURATION + " error, using default values[refreshPeriod=" + refreshPeriod + "],error:", e);
		}
		log.debug("启动快速回复的缓存更新计划,每" + refreshPeriod + "分钟后自动更新.");
		ses.scheduleWithFixedDelay(this, refreshPeriod, refreshPeriod, TimeUnit.MINUTES);
	}

	private static class QuestionReCacheHolder {
		private static final QuestionRefCache instance = new QuestionRefCache();
	}

	@SuppressWarnings({ "unchecked" })
	public void initCache() {
		synchronized (lock) {
			log.info("初始化快速回复缓存...");
			// QRY_QUESTIONREF
			// SELECT * FROM T_UNICOM_QUESTION
			List<QuestionRefVo> list = sqlDao.qryBySQLName("QRY_QUESTIONREF", null, QuestionRefVo.class);
			// List<QuestionRefVo> list =
			// sqlDao.qryBySQLText("SELECT * FROM T_UNICOM_QUESTION where rownum<=100",
			// null, QuestionRefVo.class);
			initCache(list);
			log.info("快速回复缓存初始化完成.");
		}
	}

	public void initCache(List<QuestionRefVo> questionList) {
		for (QuestionRefVo questionRefVo : questionList) {
			QuestionRefCache.getInstance().cache.put(questionRefVo.getQuestionid(), questionRefVo);
		}
	}

	public static void stop() {
		QuestionRefCache.getInstance().ses.shutdown();
	}

	@SuppressWarnings("unchecked")
	@Override
	public void run() {
		try {
			List<QuestionRefVo> list = sqlDao.qryBySQLName("QRY_QUESTIONREF", null, QuestionRefVo.class);
			if (list != null && !list.isEmpty()) {
				synchronized (lock) {
					log.info("更新快速回复缓存...");
					cache.clear();
					initCache(list);
					log.info("快速回复缓存更新完成.");
				}
			}
		} catch (Throwable t) {
			log.error(t);
		}
	}

	public List<QuestionRefVo> search(String searchKey) {
		List<QuestionRefVo> list = new ArrayList<QuestionRefVo>();
		if (StringUtils.isBlank(searchKey)) {
			return list;
		}
		String[] keyWords = searchKey.trim().replaceAll(" {2,}", KEYWORDS_SAPARATOR).split(KEYWORDS_SAPARATOR);
		synchronized (lock) {
			for (Long key : QuestionReCacheHolder.instance.cache.keySet()) {
				QuestionRefVo qr = QuestionReCacheHolder.instance.cache.get(key);
				if (contains(qr.getKeyword1(), keyWords) || contains(qr.getQuestion(), keyWords)) {
					list.add(qr);
				}
			}
		}
		return list;
	}

	private boolean contains(String str, String[] keysWords) {
		if (StringUtils.isBlank(str) || keysWords == null) {
			return false;
		}
		boolean r = true;
		for (String k : keysWords) {
			r = r && str.toUpperCase().contains(k.toUpperCase());
		}
		return r;
	}

	public static QuestionRefCache getInstance() {
		return QuestionReCacheHolder.instance;
	}

	public static void main(String[] args) {
		List<QuestionRefVo> list = new ArrayList<QuestionRefVo>();
		QuestionRefVo q1 = new QuestionRefVo();
		q1.setQuestionid(1);
		q1.setQuestion("有哪些3g套餐");
		q1.setKeyword1("3g");
		list.add(q1);

		QuestionRefVo q2 = new QuestionRefVo();
		q2.setQuestionid(2);
		q2.setQuestion("网上视频怎么收费");
		q2.setKeyword1("3G,收费");
		list.add(q2);

		QuestionRefVo q3 = new QuestionRefVo();
		q3.setQuestionid(3);
		q3.setQuestion("无关项");
		q3.setKeyword1("无关");
		list.add(q3);

		QuestionRefCache.getInstance().initCache(list);

		List<QuestionRefVo> l0 = QuestionRefCache.getInstance().search("3g");
		Assert.isTrue(l0.size() == 2);

		List<QuestionRefVo> l1 = QuestionRefCache.getInstance().search("    3g             收费     ");
		Assert.isTrue(l1.size() == 1);

		List<QuestionRefVo> l2 = QuestionRefCache.getInstance().search("3g 收费");
		Assert.isTrue(l2.size() == 1);

		System.out.println("OK");
	}
}
