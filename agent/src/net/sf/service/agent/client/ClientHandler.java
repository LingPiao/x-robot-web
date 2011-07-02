package net.sf.service.agent.client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;

import netscape.javascript.JSObject;

public class ClientHandler extends Thread {
	private Socket conn;
	private BufferedReader in = null;
	private PrintWriter out = null;
	private JSObject jsObject = null;
	private volatile boolean stopped = false;

	ClientHandler(Socket conn, JSObject jsObject) throws IOException {
		this.conn = conn;
		this.jsObject = jsObject;
		in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		out = new PrintWriter(new OutputStreamWriter(conn.getOutputStream()));
	}

	public void run() {
		try {
			while (!stopped) {
				String content = in.readLine();
				if (content != null) {
					System.out.println("Received message from server:" + content);
					if (content.startsWith("javascript:")) {
						System.out.println("call eval:" + content);
						jsObject.eval(content);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
			ConnHandler.reconnect();
		}
	}

	public void closingSignal() {
		sendMessage(String.valueOf(Integer.MIN_VALUE));
	}

	public void sendMessage(String msg) {
		out.println(msg);
		out.flush();
	}

	public void agentLogin(String agentName, String agentType, String mobileNo) {
		sendMessage("login:agentName=" + agentName + ",agentType=" + agentType + ",mobileNo=" + mobileNo);
	}

	public void close() {
		stopped = true;
		System.out.println("Closing Handler...");
		try {
			if (out != null) {
				closingSignal();
			}
			System.out.println("Closing conn...");
			if (conn != null)
				conn.close();
			System.out.println("Conn closed.");
		} catch (IOException ioe) {
			System.out.println("Error:" + ioe.getMessage());
			ioe.printStackTrace();
		}
		System.out.println("Handler closed.");
	}
}
