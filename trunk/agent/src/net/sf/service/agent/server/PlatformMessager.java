package net.sf.service.agent.server;

import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import net.sf.service.agent.client.Agent;
import net.sf.service.common.Constants;

import org.apache.log4j.Logger;

public class PlatformMessager implements Runnable {
	private final static Logger log = Logger.getLogger(PlatformMessager.class);

	private static final int CHECK_PERIOD = 500;
	private Socket conn = null;
	private PrintWriter out = null;
	private String ip = "127.0.0.1";
	private int port = 45678;
	private BlockingQueue<Message> queue = new LinkedBlockingQueue<Message>();

	private ScheduledExecutorService ses = Executors.newSingleThreadScheduledExecutor();

	private PlatformMessager() {
		conn = connect2Server();
		Properties p = new Properties();
		try {
			p.load(Agent.class.getResourceAsStream(Constants.SOCKET_CONFIGURATION));
			String sip = p.getProperty(Constants.PLATFORM_SERVER_IP_KEY);
			if (sip != null && sip.trim().length() > 0) {
				ip = sip;
			}
			String pt = p.getProperty(Constants.PLATFORM_SERVER_PORT_KEY);
			if (pt != null && pt.trim().length() > 0) {
				port = Integer.parseInt(pt.trim());
			}
		} catch (Exception e) {
			log.warn("Load " + Constants.SOCKET_CONFIGURATION + " error, using default values[ip=" + ip + ",port=" + port + "],error:", e);
		}
		this.ses.scheduleWithFixedDelay(this, 0, CHECK_PERIOD, TimeUnit.MILLISECONDS);
	}

	private Socket connect2Server() {
		try {
			return new Socket(ip, port);
		} catch (Exception e) {
			log.error("Connect to the socket server [ip=" + ip + ",port=" + port + "] error:", e);
		}
		return null;
	}

	private static class PlatformMessagerHolder {
		private static PlatformMessager instance = new PlatformMessager();
	}

	public static PlatformMessager getInstance() {
		return PlatformMessagerHolder.instance;
	}

	private void reconnect() {
		PlatformMessagerHolder.instance.conn = connect2Server();
	}

	public static void stop() {
		if (PlatformMessager.getInstance().queue.size() > 0) {
			log.info("The Platform message queue is not empty, waiting for finish...");
			while (PlatformMessager.getInstance().queue.size() > 0) {
				try {
					Thread.sleep(CHECK_PERIOD);
				} catch (InterruptedException e) {
					log.error(e);
				}
			}
			log.info("The Platform message queue is finished.");
		}
		PlatformMessager.getInstance().ses.shutdown();
		if (PlatformMessager.getInstance().conn != null) {
			try {
				PlatformMessager.getInstance().conn.close();
			} catch (IOException e) {
				log.error(e);
			}
		}
	}

	/**
	 * Send answer to the platform.
	 * 
	 * @param userMsn
	 * @param answer
	 * @return true,if sent successfully. false, otherwise.
	 */
	public static boolean sendAnswerSync(String userMsn, String answer) {
		return PlatformMessager.getInstance().sendAnswerMsg(userMsn, answer);
	}

	/**
	 * Send answer to the platform.
	 * 
	 * @param userMsn
	 * @param answer
	 * @return true,if sent successfully. false, otherwise.
	 */
	public static boolean sendAnswer(String userMsn, String answer) {
		return PlatformMessager.getInstance().queue.add(new Message(userMsn, answer));
	}

	public boolean sendAnswerMsg(Message msg) {
		return PlatformMessager.getInstance().sendAnswerMsg(msg.getUserMsn(), msg.getAnswer());
	}

	/**
	 * Send answer to the platform.
	 * 
	 * @param userMsn
	 * @param answer
	 * @return true,if sent successfully. false, otherwise.
	 */
	private boolean sendAnswerMsg(String userMsn, String answer) {
		if (conn == null) {
			this.reconnect();
		}
		if (conn == null) {
			return false;
		}
		if (out == null) {
			try {
				out = new PrintWriter(new OutputStreamWriter(conn.getOutputStream()));
			} catch (IOException e) {
				log.error("Get output stream exception: ", e);
				return false;
			}
		}
		// 内容: <msnacc>用户帐号</msnacc><msg>回复内容<msg>
		String msg = "<msnacc>" + userMsn + "</msnacc><msg>" + answer + "</msg>";
		out.write(msg);
		out.flush();
		log.info("通知平台信息内容:" + msg);

		return true;
	}

	@Override
	public void run() {
		try {
			log.debug("将回复信息通知平台...");
			boolean r = sendAnswerMsg(this.queue.take());
			if (r) {
				log.debug("回复信息已通知平台.");
			} else {
				log.debug("通知平台消息发送失败.");
			}
		} catch (Throwable t) {
			log.error("通知平台消息发送失败:", t);
		}
	}

	public static void main(String[] args) throws InterruptedException {

		boolean r = PlatformMessager.sendAnswer("us@11.com", "aa");
		PlatformMessager.sendAnswer("us@11.com", "aa1");
		System.out.println(r);
		Thread.sleep(3000);
		PlatformMessager.sendAnswer("us@11.com", "aa");

	}

}

class Message {
	private String userMsn;
	private String answer;

	public Message(String userMsn, String answer) {
		this.userMsn = userMsn;
		this.answer = answer;
	}

	public String getUserMsn() {
		return userMsn;
	}

	public void setUserMsn(String userMsn) {
		this.userMsn = userMsn;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}
