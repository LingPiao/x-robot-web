package net.sf.service.agent;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.db.TiSqlDao;
import net.sf.service.agent.server.AgentServer;
import net.sf.service.agent.server.AgentUser;
import net.sf.service.cache.QuestionCacheManager;
import net.sf.service.common.Constants;
import net.sf.service.common.HttpUtil;

import org.apache.log4j.Logger;

public class AgentServerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final static Logger log = Logger.getLogger(AgentServer.class);
	private final static String REMBER_ME = "1";

	private TiSqlDao sqlDao = (TiSqlDao) SpringInstance.getBean("sqlDao");

	public void init(ServletConfig servletConfig) throws ServletException {
		super.init(servletConfig);
		// Start the Agent Server.
		AgentServer.getInstance().start();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String act = req.getParameter("act");
		AgentUser agentUser = null;
		if ("status".equals(act)) {
			// HttpUtil.writeHtml(res, AgentServer.getInstance().showStatus());
			HttpUtil.writeHtml(res, AgentServer.getInstance().getGroupedAgentAsJson().toString());
			log.debug("服务状态:" + AgentServer.getInstance().showStatus());
		} else if ("login".equals(act)) {
			String un = req.getParameter("userName");
			String pwd = req.getParameter("password");
			String rmb = req.getParameter("rememberMe");
			List<Map> list = sqlDao.qryBySQLName("QRY_AGENT", new Object[] { un, pwd });
			if (list.isEmpty()) {
				String errorMessage = URLEncoder.encode("用户名或密码错误,请重新登录!", "UTF-8");
				res.sendRedirect("./login.jsp?errorMsg=" + errorMessage);
				return;
			}
			agentUser = AgentUser.parse(list.get(0));
			req.getSession().setAttribute(Constants.AGENT_SESSSION_KEY, agentUser);
			log.debug("Agent[" + un + "] login.");
			if (REMBER_ME.equals(rmb)) {
				Cookie cu = new Cookie("userName", un);
				Cookie cp = new Cookie("password", pwd);
				cu.setMaxAge(Integer.MAX_VALUE);
				cp.setMaxAge(Integer.MAX_VALUE);
				res.addCookie(cu);
				res.addCookie(cp);
			}
			res.sendRedirect("./agent.jsp?agent=" + un + "&agentType=" + agentUser.getAgentType() + "&mobileNo=" + agentUser.getMobileNo());
			return;
		} else if ("logout".equals(act)) {
			req.getSession().removeAttribute(Constants.AGENT_SESSSION_KEY);
			Cookie cu = new Cookie("userName", null);
			Cookie cp = new Cookie("password", null);
			cu.setMaxAge(0);
			cp.setMaxAge(0);
			res.addCookie(cu);
			res.addCookie(cp);
			res.sendRedirect("../");
			return;
		} else if ("notify".equals(act)) {
			// Clean the question cache
			QuestionCacheManager.getInstance().flushAll();
			// Notify the agent after received a new question.
			AgentServer.getInstance().sendMessage(AgentServer.JAVASCRIPT_PREFIX + "notify()");
		} else if ("send".equals(act)) {
			String msg = req.getParameter("msg");
			if (msg != null) {
				log.debug("Sending msg to alll clients[msg=" + msg + "]");
				AgentServer.getInstance().sendMessage(msg);
			}
		}
	}
}
