package net.sf.service.agent.client;

import java.applet.Applet;
import java.io.IOException;
import java.net.Socket;

import netscape.javascript.JSObject;

public class Agent extends Applet {

	private static final long serialVersionUID = 1L;
	public final static int SERVER_PORT = 11891;
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
		try {
			System.out.println("Connecting to the host[IP:" + this.getCodeBase().getHost() + ",port:" + SERVER_PORT
					+ "]");
			agentName = getParameter("agent");
			agentType = getParameter("agentType");
			mobileNo = getParameter("mobileNo");
			conn = new Socket(this.getCodeBase().getHost(), SERVER_PORT);
			jsObject = JSObject.getWindow(this);
			monitor = new AgentMonitor(conn);
			System.out.println("Server connected.");
		} catch (Exception e) {
			e.printStackTrace();
			conn = null;
		}
		if (conn == null)
			return;

		try {
			handler = new ClientHandler(conn, jsObject);
			handler.agentLogin(agentName, agentType, mobileNo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		handler.start();

	}

	// @Override
	// public void start() {
	// System.out.println("Starting...");
	// }

	private void close() {
		System.out.println("Closing...");
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
