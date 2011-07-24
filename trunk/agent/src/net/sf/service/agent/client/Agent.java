package net.sf.service.agent.client;

import java.applet.Applet;
import java.io.IOException;
import java.net.Socket;
import java.util.Properties;

import netscape.javascript.JSObject;

public class Agent extends Applet {

	private static final long serialVersionUID = 1L;
	private final static String SERVER_PORT_KEY = "AgentServerPort";

	private int serverPort = 10010;
	private Socket conn = null;
	private AgentMonitor monitor = null;
	private JSObject jsObject = null;
	private ClientHandler handler = null;

	private String agentName = null;
	private String agentType = null;
	private String mobileNo = null;

	@Override
	public void init() {
		System.out.println("Calling init...");
		Properties p = new Properties();
		try {
			p.load(Agent.class.getResourceAsStream("/socket.properties"));
			String port = p.getProperty(SERVER_PORT_KEY);
			if (port != null && port.trim().length() > 0) {
				serverPort = Integer.parseInt(port.trim());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		ConnHandler.initReconnector(this);
		initAgent();
	}

	public boolean initAgent() {
		System.out.println("Connecting to the host[IP:" + this.getCodeBase().getHost() + ",port:" + serverPort + "]");
		agentName = getParameter("agent");
		agentType = getParameter("agentType");
		mobileNo = getParameter("mobileNo");
		jsObject = JSObject.getWindow(this);
		int i = 3;
		String errorMsg = "";
		while (conn == null && i-- > 0) {
			if (i < 3) {
				System.out.println("Retry to connect to the server[" + (3 - i) + " times retried]");
			}
			try {
				conn = new Socket(this.getCodeBase().getHost(), serverPort);
				monitor = new AgentMonitor(conn);
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg = e.getMessage();
				conn = null;
			}
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		if (conn == null) {
			System.out.println("Connecting server exception:" + errorMsg);
			jsObject.eval("javascript:alert('坐席连接服务器异常[" + errorMsg + "],请退出重新登陆!');");
			return false;
		}
		System.out.println("Server connected.");
		try {
			System.out.println("Agent is logging in to the server...");
			handler = new ClientHandler(conn, jsObject);
			handler.agentLogin(agentName, agentType, mobileNo);
			System.out.println("Agent is logged in to the server.");
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Agent can not log in to the server caused by:" + e.getMessage());
			jsObject.eval("javascript:alert('登陆坐席服务器异常[" + e.getMessage() + "],请退出重新登陆!');");
			return false;
		}
		handler.start();
		return true;
	}

	// @Override
	// public void start() {
	// System.out.println("Starting...");
	// }

	public void close() {
		System.out.println("Closing...");
		ConnHandler.disableAutoRetry();
		try {
			if (monitor != null)
				monitor.close();
			System.out.println("Closing handler...");
			if (handler != null)
				handler.close();
			System.out.println("Closed.");
		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
			e.printStackTrace();
		}
	}

	// @Override
	// public void stop() {
	// System.out.println("Calling stop...");
	// close();
	// }

	@Override
	public void destroy() {
		System.out.println("Destroy...");
		close();
	}
}
