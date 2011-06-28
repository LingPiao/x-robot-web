package net.sf.service.agent.client;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

class AgentMonitor implements Runnable {

	private PrintWriter out;
	private ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();

	public AgentMonitor(Socket connection) {
		try {
			this.out = new PrintWriter(new OutputStreamWriter(connection.getOutputStream()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		scheduler.scheduleAtFixedRate(this, 1, 10, TimeUnit.SECONDS);
	}

	@Override
	public void run() {
		try {
			// System.out.println("Sending heartbeat...");
			out.println("HB");
			out.flush();
			// System.out.println("Heartbeat sent successfully.");
		} catch (Throwable t) {
			t.printStackTrace();
		}

	}

	public void close() {
		scheduler.shutdown();
	}
}