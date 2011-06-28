package net.sf.service.agent.server;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

import org.apache.log4j.Logger;

public class ServerHandler extends Thread {
	private final static Logger log = Logger.getLogger(ServerHandler.class);
	private volatile boolean stopped = false;
	private Socket socketConn;
	private int agentId = 0;
	private BufferedReader in = null;
	private PrintWriter out = null;
	private AgentServer server = null;
	private AgentUser agentUser = null;

	ServerHandler(AgentServer server, Socket conn, int connId) throws IOException {
		this.server = server;
		this.socketConn = conn;
		this.agentId = connId;
		this.in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		this.out = new PrintWriter(new OutputStreamWriter(conn.getOutputStream()));
	}

	public void run() {
		log.info("坐席[ID=" + agentId + ",IP=" + socketConn.getInetAddress().getHostAddress() + "]已连接.");
		try {
			while (!stopped) {
				String content = in.readLine();
				if (content != null) {
					log.debug("收到坐席[ID=" + agentId + "信息,内容:" + content + "]");
					// The closing signal from client.
					String login_flag = AgentServer.LOGIN_PREFIX;
					if (content.startsWith(login_flag)) {
						// login:agentName=xx,agentType=1
						agentUser = AgentUser.parseLogin(content.substring(login_flag.length()));
					} else if (content.equals(String.valueOf(Integer.MIN_VALUE))) {
						log.info("收到坐席关闭信息,准备关闭坐席连接...");
						break;
					}
				}
			}
		} catch (Exception e) {
			log.error("坐席[ID=" + agentId + "]连接异常:", e);
		} finally {
			close();
		}
	}

	public void send(String msg) {
		out.println(msg);
		out.flush();
	}

	public void close() {
		stopped = true;
		try {
			if (socketConn != null) {
				socketConn.close();
			}
			server.removeAgent(agentId);
			log.info("坐席[ID=" + agentId + "]已关闭.");
		} catch (IOException ioe) {
			log.error(ioe);
		}
	}

	public AgentUser getAgentUser() {
		return this.agentUser;
	}

	public void setAgentUser(AgentUser au) {
		this.agentUser = au;
	}
}
