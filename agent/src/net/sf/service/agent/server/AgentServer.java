package net.sf.service.agent.server;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.service.agent.client.Agent;
import net.sf.service.common.Constants;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * ��ϯͨ�Ÿ�ʽ:<br>
 * һ,�����ͻ���<br>
 * 1, <b>javascript:</b>xxxx...
 * --����Ϣ��javascript:��ʼ��ͻ��˽���Ϊjavascriptֱ�ӵ���,������Ϊ��ͨ��Ϣ����.<br>
 * <br>
 * ��,���տͻ���<br>
 * 1,<b>login:</b>gentName=xx,agentType=1,mobileNo=13x... -- ��ϯ��½��Ϣ<br>
 * 2,Integer.MIN_VALUE -- ��ϯ�����˳� <br>
 * 
 * @author kongling
 * 
 */
public class AgentServer extends Thread {
	private final static Logger log = Logger.getLogger(AgentServer.class);

	public final static String JAVASCRIPT_PREFIX = "javascript:";
	public final static String LOGIN_PREFIX = "login:";

	private int serverPort = 10010;
	private int maxAgents = 100;
	private int socketTimeout = 3 * 60 * 1000;

	private ServerSocket server;
	private Map<Integer, ServerHandler> agentList = null;
	private boolean running = true;

	// Prevent initiation
	private AgentServer(String name) {
		super(name);
		this.setDaemon(true);
		Properties p = new Properties();
		try {
			p.load(Agent.class.getResourceAsStream(Constants.SOCKET_CONFIGURATION));
			String port = p.getProperty(Constants.SERVER_PORT_KEY);
			if (port != null && port.trim().length() > 0) {
				serverPort = Integer.parseInt(port.trim());
			}
			String max = p.getProperty(Constants.MAX_AGENTS_KEY);
			if (max != null && max.trim().length() > 0) {
				maxAgents = Integer.parseInt(max);
			}
			String timeout = p.getProperty(Constants.SOCKET_TIME_OUT_KEY);
			if (timeout != null && timeout.trim().length() > 0) {
				socketTimeout = Integer.parseInt(timeout);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		agentList = new HashMap<Integer, ServerHandler>(maxAgents);
	}

	private static class AgentServerHolder {
		private static final AgentServer instance = new AgentServer("#AgentServer");
	}

	public static AgentServer getInstance() {
		return AgentServerHolder.instance;
	}

	public void run() {
		try {
			server = new ServerSocket(serverPort);
		} catch (IOException ioe) {
			log.error("��ϯ���񴴽��쳣,�˿�:" + serverPort + ",�쳣:", ioe);
			return;
		}
		log.info("��ϯ����������,�˿�:" + serverPort);

		int id = 0;
		while (running) {
			try {
				Socket connection = server.accept();
				connection.setSoTimeout(socketTimeout);
				if (agentList.size() < maxAgents) {
					ServerHandler handler = new ServerHandler(this, connection, ++id);
					handler.start();
					agentList.put(id, handler);
				} else {
					PrintWriter out = new PrintWriter(new OutputStreamWriter(connection.getOutputStream()));
					out.println("��ϯ�����Ѵﵽ�������������[" + maxAgents + "].");
					out.flush();
					connection.close();
				}
			} catch (Exception ex) {
				log.error("��ϯ�����쳣:", ex);
			}
		}
	}

	public void removeAgent(int agentId) {
		agentList.remove(agentId);
	}

	public void close(String agentId) {
		ServerHandler sh = agentList.get(new Integer(agentId));
		sh.close();
	}

	public void shutdown() {
		running = false;
		if (agentList != null) {
			for (Integer id : agentList.keySet()) {
				ServerHandler ah = agentList.get(id);
				ah.close();
			}
		}
		try {
			server.close();
		} catch (IOException e) {
			log.error(e);
		}
	}

	public void sendMessage(String msg) {
		for (Integer id : agentList.keySet()) {
			ServerHandler ah = agentList.get(id);
			ah.send(msg);
		}
	}

	/**
	 * Get all mobile numbers of the managers which are logined.
	 * 
	 * @return
	 */
	public List<String> getManagerMobiles() {
		List<String> l = new ArrayList<String>();
		for (Map.Entry<Integer, ServerHandler> h : agentList.entrySet()) {
			if (h.getValue().getAgentUser() == null || h.getValue().getAgentUser().getAgentType() == null) {
				continue;
			}
			if (h.getValue().getAgentUser().getAgentType().equals(Constants.VIP_MANAGER)) {
				String mobileNo = h.getValue().getAgentUser().getMobileNo();
				if (StringUtils.isNotBlank(mobileNo)) {
					l.add(mobileNo);
				}
			}
		}
		return l;
	}

	public JSONObject getGroupedAgentAsJson() {
		Map<String, AgentUser> m = new HashMap<String, AgentUser>();
		for (Map.Entry<Integer, ServerHandler> h : agentList.entrySet()) {
			String an = h.getValue().getAgentUser().getAgentName();
			int count = 0;
			for (Map.Entry<Integer, ServerHandler> h1 : agentList.entrySet()) {
				if (h1.getValue().getAgentUser().getAgentName().equals(an)) {
					count++;
				}
			}
			AgentUser au = (AgentUser) h.getValue().getAgentUser().clone();
			if (count > 1) {
				au.setAgentName(an + "[" + count + "]");
			}
			m.put(an, au);
		}

		List<AgentUser> auList = new ArrayList<AgentUser>();
		for (String k : m.keySet()) {
			auList.add(m.get(k));
		}

		JSONObject json = new JSONObject();
		JSONArray agents = JSONArray.fromObject(auList);
		json.put("agents", agents);
		return json;
	}

	public String showStatus() {
		StringBuilder sb = new StringBuilder();
		if (agentList.size() > 0) {
			sb.append("��" + agentList.size() + "����ϯ����:\n");
			for (Map.Entry<Integer, ServerHandler> h : agentList.entrySet()) {
				sb.append("#").append(h.getKey()).append(": agentName=").append(h.getValue().getAgentUser().getAgentName()).append(",agentType=").append(
						h.getValue().getAgentUser().getAgentType()).append(",status=online").append("\n");
			}
		} else {
			sb.append("������ϯ����.");
		}

		return sb.toString();
	}
}