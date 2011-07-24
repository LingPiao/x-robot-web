package net.sf.service.cache;

import java.util.Properties;

import net.sf.service.agent.client.Agent;
import net.sf.service.common.Constants;

import org.apache.log4j.Logger;
import org.springframework.util.Assert;

import com.opensymphony.oscache.base.NeedsRefreshException;
import com.opensymphony.oscache.general.GeneralCacheAdministrator;

public class QuestionCacheManager extends GeneralCacheAdministrator {

	private final static Logger log = Logger.getLogger(QuestionCacheManager.class);
	private static final long serialVersionUID = 1L;
	private static final String PREFIX = "QuestionCacheManager_";

	private int refreshPeriod = 60;// in seconds

	private QuestionCacheManager() {
		Properties p = new Properties();
		try {
			p.load(Agent.class.getResourceAsStream(Constants.AGENT_CONFIGURATION));
			String qrpStr = p.getProperty(Constants.QUESTION_REFRESH_PERIOD_KEY);
			if (qrpStr != null && qrpStr.trim().length() > 0) {
				refreshPeriod = Integer.parseInt(qrpStr);
			}
		} catch (Exception e) {
			log.warn("Load " + Constants.AGENT_CONFIGURATION + " error, using default values[refreshPeriod=" + refreshPeriod + "],error:", e);
		}
	}

	private static class QuestionCacheManagerHolder {
		private final static QuestionCacheManager cache = new QuestionCacheManager();
	}

	public static QuestionCacheManager getInstance() {
		return QuestionCacheManagerHolder.cache;
	}

	private String getKey(String key) {
		return PREFIX + key;
	}

	public void put(String key, Object value) {
		this.putInCache(getKey(key), value);
	}

	public Object get(String key) {
		try {
			return super.getFromCache(getKey(key), refreshPeriod);
		} catch (NeedsRefreshException e) {
			log.debug(e);
			try {
				super.putInCache(getKey(key), null);
			} catch (Exception ex) {
				super.cancelUpdate(getKey(key));
			}
		} catch (Exception ex) {
			log.debug(ex);
			super.cancelUpdate(getKey(key));
		}
		return null;
	}

	public static void main(String[] args) throws Exception {
		QuestionCacheManager.getInstance().put("a", "a");
		String a = (String) QuestionCacheManager.getInstance().get("a");
		Assert.isTrue("a".equals(a));
		QuestionCacheManager.getInstance().flushAll();
		a = (String) QuestionCacheManager.getInstance().get("a");
		Assert.isTrue(a == null);
		System.out.println("OK, passed.");
	}
}
