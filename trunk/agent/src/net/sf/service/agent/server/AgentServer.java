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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.service.common.Constants;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * 坐席通信格式:<br>
 * 一,发往客户端<br>
 * 1, <b>javascript:</b>xxxx...
 * --若消息以javascript:开始则客户端将视为javascript直接调用,否则视为普通消息接收.<br>
 * <br>
 * 二,接收客户端<br>
 * 1,<b>login:</b>gentName=xx,agentType=1,mobileNo=13x... -- 坐席登陆信息<br>
 * 2,Integer.MIN_VALUE -- 坐席正常退出 <br>
 * 
 * @author kongling
 * 
 */
public class AgentServer extends Thread {
	private final static Logger log = Logger.getLogger(AgentServer.class);

	public final static String JAVASCRIPT_PREFIX = "javascript:";
	public final static String LOGIN_PREFIX = "login:";

	public final static int SERVER_PORT = 11891;
	public final static int MAX_AGENTS = 100;
	private ServerSocket server;
	private Map<Integer, ServerHandler> agentList = new HashMap<Integer, ServerHandler>(MAX_AGENTS);

	// Prevent initiation
	private AgentServer() {

	}

	private static class AgentServerHolder {
		private static final AgentServer instance = new AgentServer();
	}

	public static AgentServer getInstance() {
		return AgentServerHolder.instance;
	}

	public void run() {
		try {
			server = new ServerSocket(SERVER_PORT);
		} catch (IOException ioe) {
			log.error("坐席服务创建异常,端口:" + SERVER_PORT + ",异常:", ioe);
		}
		log.info("坐席服务已启动,端口:" + SERVER_PORT);

		int id = 0;
		while (true) {
			try {
				Socket connection = server.accept();
				if (agentList.size() < MAX_AGENTS) {
					ServerHandler handler = new ServerHandler(this, connection, ++id);
					handler.start();
					agentList.put(id, handler);
				} else {
					PrintWriter out = new PrintWriter(new OutputStreamWriter(connection.getOutputStream()));
					out.println("坐席服务已达到最大连接数上限[" + MAX_AGENTS + "].");
					out.flush();
					connection.close();
				}
			} catch (Exception ex) {
				log.error("坐席连接异常:", ex);
			}
		}
	}

	public void removeAgent(int agentId) {
		agentList.remove(agentId);
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
			sb.append("共" + agentList.size() + "个坐席接入:\n");
			for (Map.Entry<Integer, ServerHandler> h : agentList.entrySet()) {
				sb.append("#").append(h.getKey()).append(": agentName=").append(h.getValue().getAgentUser().getAgentName()).append(",agentType=").append(
						h.getValue().getAgentUser().getAgentType()).append(",status=online").append("\n");
			}
		} else {
			sb.append("暂无坐席连接.");
		}

		return sb.toString();
	}
}