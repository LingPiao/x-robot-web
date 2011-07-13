package net.sf.service.agent;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.service.agent.vo.QuestionRefVo;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.Assert;

public class QuestionRefCache {

	private final static String KEYWORDS_SAPARATOR = " ";

	private Map<Long, QuestionRefVo> cache = new HashMap<Long, QuestionRefVo>();

	private QuestionRefCache() {
	}

	private static class QuestionReCacheHolder {
		private static final QuestionRefCache instance = new QuestionRefCache();
	}

	public void initCache(List<QuestionRefVo> questionList) {
		for (QuestionRefVo questionRefVo : questionList) {
			QuestionRefCache.getInstance().cache.put(questionRefVo.getQuestionid(), questionRefVo);
		}
	}

	public List<QuestionRefVo> search(String searchKey) {
		List<QuestionRefVo> list = new ArrayList<QuestionRefVo>();
		if (StringUtils.isBlank(searchKey)) {
			return list;
		}
		String[] keyWords = searchKey.trim().replaceAll(" {2,}", KEYWORDS_SAPARATOR).split(KEYWORDS_SAPARATOR);
		for (Long key : QuestionReCacheHolder.instance.cache.keySet()) {
			QuestionRefVo qr = QuestionReCacheHolder.instance.cache.get(key);
			if (contains(qr.getKeyword1(), keyWords) || contains(qr.getQuestion(), keyWords)) {
				list.add(qr);
			}
		}
		return list;
	}

	private boolean contains(String str, String[] keysWords) {
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
