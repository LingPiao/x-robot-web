package net.sf.service.common;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import net.sf.service.agent.lock.QuestionLock;
import net.sf.service.agent.server.AgentServer;
import net.sf.service.agent.server.PlatformMessager;
import net.sf.service.cache.QuestionRefCache;

import org.apache.log4j.Logger;

public class CleanerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final static Logger log = Logger.getLogger(CleanerServlet.class);

	public void init(ServletConfig servletConfig) throws ServletException {
	}

	@Override
	public void destroy() {

		log.info("Shutting down the AgentServer...");
		AgentServer.getInstance().shutdown();
		log.info("The AgentServer is shutdown");

		log.info("Stopping PlatformMessager...");
		PlatformMessager.stop();
		log.info("PlatformMessager is stopped.");

		log.info("Stopping QuestionLock...");
		QuestionLock.stop();
		log.info("QuestionLock is stopped.");

		log.info("Stopping QuestionRefCache...");
		QuestionRefCache.stop();
		log.info("QuestionRefCache is stopped.");

		try {
			// Waiting 3 second for cleaning.
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			log.error(e);
		}
	}

}
