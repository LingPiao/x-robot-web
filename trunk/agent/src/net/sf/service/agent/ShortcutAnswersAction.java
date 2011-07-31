package net.sf.service.agent;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.db.TiSqlDao;
import net.sf.service.agent.server.AgentUser;
import net.sf.service.agent.vo.ShortcutAnswerVo;
import net.sf.service.common.Constants;
import net.sf.service.common.HttpUtil;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionSupport;

public class ShortcutAnswersAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private TiSqlDao sqlDao = (TiSqlDao) SpringInstance.getBean("sqlDao");

	@SuppressWarnings({ "unchecked" })
	public String execute() throws Exception {

		// --QRY_SHORTCUT_ANSWERS
		// SELECT * FROM T_AGENT_SHORTCUT_ANSWERS WHERE USERID=? AND ROWNUM<=10
		// ORDER BY DISP_ORDER
		AgentUser au = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		List<ShortcutAnswerVo> alist = new ArrayList<ShortcutAnswerVo>();
		alist = (List<ShortcutAnswerVo>) sqlDao.qryBySQLName("QRY_SHORTCUT_ANSWERS", new Object[] { au.getUserId() }, ShortcutAnswerVo.class);
		JSONObject json = new JSONObject();
		JSONArray answers = JSONArray.fromObject(alist);
		json.put("shortcutAnswers", answers);

		HttpUtil.writeHtml(json.toString());

		return NONE;
	}

	private String answer;
	private Long answerId;
	private Integer dispOrder;

	public String addShortcutAnswer() throws Exception {
		String fail = Constants.OPERATION_FAILURE;
		if (answer == null) {
			HttpUtil.writeHtml(fail);
			return NONE;
		}
		AgentUser agentUser = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		String decodedAnswer = URLDecoder.decode(answer, "UTF-8");
		// --ADD_SHORTCUT_ANSWER
		// INSERT INTO T_AGENT_SHORTCUT_ANSWERS
		// (ID,USERID,ANSWER,DISP_ORDER)VALUES(SEQ_AGT_SRT_ANSWER_ID.NEXTVAL,?,?,?)
		int r = sqlDao.updateBySQLName("ADD_SHORTCUT_ANSWER", new Object[] { agentUser.getUserId(), decodedAnswer, dispOrder });
		HttpUtil.writeHtml(String.valueOf(r));

		return NONE;
	}

	private String answerIds;

	@SuppressWarnings("unchecked")
	public String removeShortcutAnswer() throws Exception {
		if (answerIds == null) {
			HttpUtil.writeHtml(Constants.OPERATION_FAILURE);
			return NONE;
		}
		String sql = "DELETE FROM T_AGENT_SHORTCUT_ANSWERS WHERE USERID=? AND ID IN(" + answerIds + ")";
		AgentUser agentUser = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		int r = sqlDao.updateBySQLText(sql, new Object[] { agentUser.getUserId() });
		HttpUtil.writeHtml(String.valueOf(r));
		return NONE;
	}

	@SuppressWarnings("unchecked")
	public String updateShortcutAnswer() throws Exception {
		// --UPDATE_SHORTCUT_ANSWER
		// UPDATE T_AGENT_SHORTCUT_ANSWERS SET ANSWER=?,DISP_ORDER=? WHERE ID=?
		if (answerId == null || answer == null) {
			HttpUtil.writeHtml(Constants.OPERATION_FAILURE);
			return NONE;
		}
		String decodedAnswer = URLDecoder.decode(answer, "UTF-8");
		int r = sqlDao.updateBySQLName("UPDATE_SHORTCUT_ANSWER", new Object[] { decodedAnswer, dispOrder, answerId });
		HttpUtil.writeHtml(String.valueOf(r));
		return NONE;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public void setAnswerId(String answerId) {
		this.answerId = new Long(answerId);
	}

	public void setDispOrder(Integer dispOrder) {
		this.dispOrder = dispOrder;
	}

	public void setAnswerIds(String answerIds) {
		this.answerIds = answerIds;
	}
}
