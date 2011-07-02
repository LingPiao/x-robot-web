package net.sf.service.agent.client;

public class ConnHandler {

	private final static int RETRY_PERIOD = 1;
	private final static int MAX_RETRY_TIMES = 100;

	private Agent agent = null;
	private volatile boolean autoRetry = true;

	private static class ReconnectorHolder {
		private static ConnHandler instance = new ConnHandler();
	}

	public static void initReconnector(Agent agent) {
		ReconnectorHolder.instance.agent = agent;
	}

	public static void disableAutoRetry() {
		ReconnectorHolder.instance.autoRetry = false;
	}

	public static ConnHandler getInstance() {
		return ReconnectorHolder.instance;
	}

	public static void reconnect() {
		if (!ReconnectorHolder.instance.autoRetry) {
			return;
		}
		if (ConnHandler.getInstance().agent != null) {
			ConnHandler.getInstance().agent.close();
		}
		for (int i = 1;; i++) {
			if (i > MAX_RETRY_TIMES) {
				System.out.println("The server can NOT be reconnected after " + i + " times retrying.");
			}
			System.out.println("Reconnect to server...");
			if (ConnHandler.getInstance().agent.initAgent()) {
				System.out.println("Server reconnected.");
				break;
			}
			int p = i * RETRY_PERIOD;
			System.out.println("Waiting " + p + " seconds for retrying.");
			try {
				Thread.sleep(p * 1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
