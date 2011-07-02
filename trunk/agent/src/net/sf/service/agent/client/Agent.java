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
		try {
			System.out.println("Connecting to the host[IP:" + this.getCodeBase().getHost() + ",port:" + serverPort + "]");
			agentName = getParameter("agent");
			agentType = getParameter("agentType");
			mobileNo = getParameter("mobileNo");
			conn = new Socket(this.getCodeBase().getHost(), serverPort);
			jsObject = JSObject.getWindow(this);
			monitor = new AgentMonitor(conn);
			System.out.println("Server connected.");
		} catch (Exception e) {
			e.printStackTrace();
			conn = null;
		}
		if (conn == null)
			return false;

		try {
			handler = new ClientHandler(conn, jsObject);
			handler.agentLogin(agentName, agentType, mobileNo);
		} catch (IOException e) {
			e.printStackTrace();
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
