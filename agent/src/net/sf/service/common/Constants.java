package net.sf.service.common;

import java.util.Properties;

import org.apache.log4j.Logger;

public class Constants {

	private final static Logger log = Logger.getLogger(Constants.class);

	/** 普通坐席 */
	public final static String NORMAL_AGENT = "0";
	/** 客户经理 */
	public final static String VIP_MANAGER = "1";

	public final static String AGENT_SESSSION_KEY = "AGENT_SESSSION_KEY";

	public final static String OPERATION_FAILURE = "0";
	public final static String OPERATION_OK = "1";

	public final static String SOCKET_CONFIGURATION = "/socket.properties";
	public final static String AGENT_CONFIGURATION = "/agent.properties";
	public final static String SERVER_PORT_KEY = "AgentServerPort";
	public final static String MAX_AGENTS_KEY = "MaxAgents";
	public final static String SOCKET_TIME_OUT_KEY = "Timeout";
	public final static String PLATFORM_SERVER_IP_KEY = "PlatformServerIp";
	public final static String PLATFORM_SERVER_PORT_KEY = "PlatformServerPort";
	public final static String QUESTIONREF_REQUEST_DELAY_KEY = "QuestionRefRequestDelay";
	public final static String QUESTIONREF_REFRESH_PERIOD_KEY = "QuestionRefRefreshPeriod";
	public final static String QUESTION_REFRESH_PERIOD_KEY = "QuestionRefreshPeriod";

	public final static String QUESTION_COUNT_CACHE_KEY = "QuestionCacheCount";
	public final static String QUESTION_LIST_CACHE_KEY = "QuestionCacheList";

	public final static String QUESTION_LOCKED_TIMEOUT_KEY = "QuestionLockedTimeOut";
	public final static String QUESTION_LOCKED_CHECKING_PERIOD_KEY = "QuestionLockedCheckingPeriod";

	public static String QUESTIONREF_REQUEST_DELAY = "300";// in millisecond

	public static int LOCK_TIME_OUT = 30; // in minute
	public static int LOCK_CHECK_PERIOD = 5;// in minute

	static {
		Properties p = new Properties();
		try {
			p.load(Constants.class.getResourceAsStream(Constants.AGENT_CONFIGURATION));
			String v = p.getProperty(Constants.QUESTIONREF_REQUEST_DELAY_KEY);
			if (v != null && v.trim().length() > 0) {
				QUESTIONREF_REQUEST_DELAY = v.trim();
				log.info("Set QUESTIONREF_REQUEST_DELAY=" + QUESTIONREF_REQUEST_DELAY);
			}
			String qltv = p.getProperty(Constants.QUESTION_LOCKED_TIMEOUT_KEY);
			if (qltv != null && qltv.trim().length() > 0) {
				LOCK_TIME_OUT = Integer.parseInt(qltv.trim());
				log.info("Set LOCK_TIME_OUT=" + LOCK_TIME_OUT);
			}
			String qlcpv = p.getProperty(Constants.QUESTION_LOCKED_CHECKING_PERIOD_KEY);
			if (qlcpv != null && qlcpv.trim().length() > 0) {
				LOCK_CHECK_PERIOD = Integer.parseInt(qlcpv.trim());
				log.info("Set LOCK_CHECK_PERIOD=" + LOCK_CHECK_PERIOD);
			}
		} catch (Exception e) {
			log.error(e);
		}
	}

}
