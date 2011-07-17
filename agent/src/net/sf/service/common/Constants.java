package net.sf.service.common;

import java.util.Properties;

import net.sf.service.agent.client.Agent;

public class Constants {
	/** ��ͨ��ϯ */
	public final static String NORMAL_AGENT = "0";
	/** �ͻ����� */
	public final static String VIP_MANAGER = "1";

	public final static String AGENT_SESSSION_KEY = "AGENT_SESSSION_KEY";

	public final static String OPERATION_FAILURE = "0";
	public final static String OPERATION_OK = "1";

	public final static String SOCKET_CONFIGURATION = "/socket.properties";
	public final static String SERVER_PORT_KEY = "AgentServerPort";
	public final static String MAX_AGENTS_KEY = "MaxAgents";
	public final static String SOCKET_TIME_OUT_KEY = "Timeout";
	public final static String PLATFORM_SERVER_IP_KEY = "PlatformServerIp";
	public final static String PLATFORM_SERVER_PORT_KEY = "PlatformServerPort";
	public final static String QUESTIONREF_REQUEST_DELAY_KEY = "QuestionRefRequestDelay";

	public static String QUESTIONREF_REQUEST_DELAY = "300";
	static {
		Properties p = new Properties();
		try {
			p.load(Agent.class.getResourceAsStream(Constants.SOCKET_CONFIGURATION));
			String v = p.getProperty(Constants.QUESTIONREF_REQUEST_DELAY_KEY);
			if (v != null && v.trim().length() > 0) {
				QUESTIONREF_REQUEST_DELAY = v.trim();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
