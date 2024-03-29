package net.sf.service.agent;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.db.TiSqlDao;
import net.sf.service.agent.vo.QuestionRefVo;
import net.sf.service.cache.QuestionRefCache;
import net.sf.service.common.HttpUtil;

import org.apache.commons.lang.StringUtils;

public class QuestionRefServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private TiSqlDao sqlDao = (TiSqlDao) SpringInstance.getBean("sqlDao");

	public void init(ServletConfig servletConfig) throws ServletException {
		super.init(servletConfig);
		QuestionRefCache.getInstance().initCache();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String act = req.getParameter("act");
		if ("search".equals(act)) {
			String keyWords = req.getParameter("keyWords");
			List<QuestionRefVo> qList = new ArrayList<QuestionRefVo>();
			if (StringUtils.isNotBlank(keyWords)) {
				keyWords = URLDecoder.decode(keyWords, "UTF-8");
				qList = QuestionRefCache.getInstance().search(keyWords);
			}
			JSONObject json = new JSONObject();
			JSONArray questions = JSONArray.fromObject(qList);
			json.put("questions", questions);

			HttpUtil.writeHtml(res, json.toString());

		} else if ("view".equals(act)) {
			String qid = req.getParameter("qid");
			// QRY_QUESTIONREF_BY_ID
			// SELECT * FROM T_UNICOM_QUESTION WHERE QUESTIONID=?
			List<Map> list = sqlDao.qryBySQLName("QRY_QUESTIONREF_BY_ID", new Object[] { new Long(qid) });
			JSONObject json = new JSONObject();
			JSONArray questions = JSONArray.fromObject(list);
			json.put("questions", questions);
			HttpUtil.writeHtml(res, json.toString());
		}

	}
}
