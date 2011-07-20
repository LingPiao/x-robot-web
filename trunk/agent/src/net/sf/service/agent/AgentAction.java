package net.sf.service.agent;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.db.TiSqlDao;
import net.sf.service.agent.lock.QuestionLock;
import net.sf.service.agent.server.AgentServer;
import net.sf.service.agent.server.AgentUser;
import net.sf.service.agent.server.PlatformMessager;
import net.sf.service.agent.vo.AnswerVo;
import net.sf.service.agent.vo.QuestionVo;
import net.sf.service.common.Constants;
import net.sf.service.common.DBUtils;
import net.sf.service.common.HttpUtil;

import org.apache.commons.lang.StringUtils;

import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionSupport;

public class AgentAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private TiSqlDao sqlDao = (TiSqlDao) SpringInstance.getBean("sqlDao");

	private String start;
	private String limit;

	@SuppressWarnings( { "unchecked" })
	public String execute() throws Exception {

		String queryName = "QRY_QUESTION";
		long totalCount = 0;
		Integer startRowNo = start == null ? new Integer(1) : Integer.parseInt(start);
		Integer endRowNo = limit == null ? new Integer(11) : (startRowNo + Integer.parseInt(limit));
		if (startRowNo == 0) {
			endRowNo = endRowNo + 1;
		}
		Object[] para4Count = null;
		Object[] para4Paging = null;
		AgentUser au = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		boolean isManager = au.getAgentType().equals(Constants.VIP_MANAGER) ? true : false;
		List<String> managerMobiles = AgentServer.getInstance().getManagerMobiles();
		if (isManager) {// 客户经理
			queryName = "QRY_QUESTION_4_MNG";
			para4Count = new String[] { au.getMobileNo() };
			para4Paging = new Object[] { au.getMobileNo(), startRowNo, endRowNo };
		} else {// 普通坐席
			if (!managerMobiles.isEmpty()) {// 有客户经理登录
				queryName = "QRY_QUESTION_NO_MNG";
				String mmsInStr = DBUtils.toInList(managerMobiles);
				para4Count = new String[] { mmsInStr };
				para4Paging = new Object[] { mmsInStr, startRowNo, endRowNo };
			} else {// 无客户经理
				para4Paging = new Object[] { startRowNo, endRowNo };
			}
		}
		totalCount = sqlDao.qryAllCountBySqlName(queryName, para4Count);
		if (totalCount < 1) {
			return NONE;
		}
		List<QuestionVo> questionList = (List<QuestionVo>) sqlDao.qryPageRecordsBySqlName(queryName, para4Paging, QuestionVo.class);
		for (QuestionVo questionVo : questionList) {
			if (QuestionLock.getInstance().isLocked(String.valueOf(questionVo.getQ_id()))) {
				questionVo.setQ_state(String.valueOf(QuestionStatus.PROCESSING.getCode()));
			}
		}

		JSONObject json = new JSONObject();
		JSONArray questions = JSONArray.fromObject(questionList);
		json.put("totalCount", totalCount);
		json.put("questions", questions);

		HttpUtil.writeHtml(json.toString());

		return NONE;
	}

	private String agent;
	private String answer;
	private Long qid;
	private String userMsn;

	public String answer() throws Exception {
		String fail = Constants.OPERATION_FAILURE;
		// --ADD_ANSWER
		// INSERT INTO
		// W_ANSWERS(A_ID,Q_ID,A_CONTENT,A_USER)VALUES(A_ID.NEXTVAL,?,?,?)
		if (qid == null || answer == null || agent == null) {
			HttpUtil.writeHtml(fail);
			return NONE;
		}
		String decodedAnswer = URLDecoder.decode(answer, "UTF-8");
		Long q_id = new Long(qid);
		int r = sqlDao.updateBySQLName("ADD_ANSWER", new Object[] { q_id, decodedAnswer, agent });

		if (r > 0) {
			// --UPDATE_QUESTION
			// UPDATE W_QUESTION SET Q_STATE='1' WHERE Q_ID=?
			sqlDao.updateBySQLName("UPDATE_QUESTION", new Object[] { q_id });
			// Send the answer to the platform.
			PlatformMessager.sendAnswer(userMsn, decodedAnswer);
		}

		QuestionLock.getInstance().removeLock(String.valueOf(qid));
		// Notify all of the other clients to update the question to be
		// answered.
		String notifyAndUpdate = AgentServer.JAVASCRIPT_PREFIX + "updateQuestion(" + qid + "," + QuestionStatus.ANSWERED.getCode() + ")";
		AgentServer.getInstance().sendMessage(notifyAndUpdate);

		HttpUtil.writeHtml(String.valueOf(r));

		return NONE;
	}

	public String lockQuestion() throws Exception {

		if (qid == null) {
			HttpUtil.writeHtml(Constants.OPERATION_FAILURE);
			return NONE;
		}
		AgentUser au = (AgentUser) ServletActionContext.getRequest().getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
		String r = Constants.OPERATION_FAILURE;
		if (QuestionLock.getInstance().tryLockQuestion(String.valueOf(qid), au.getAgentName())) {
			// Notify all of the other clients to update the question to be
			// processing.
			String notifyAndUpdate = AgentServer.JAVASCRIPT_PREFIX + "updateQuestion(" + qid + "," + QuestionStatus.PROCESSING.getCode() + ")";
			AgentServer.getInstance().sendMessage(notifyAndUpdate);
			r = Constants.OPERATION_OK;
		}
		HttpUtil.writeHtml(r);

		return NONE;
	}

	private Integer days;

	public void setDays(Integer days) {
		this.days = days;
	}

	@SuppressWarnings("unchecked")
	public String viewAnswers() throws Exception {
		if (qid == null) {
			HttpUtil.writeHtml(Constants.OPERATION_FAILURE);
			return NONE;
		}
		List<AnswerVo> answersList = null;
		if (days != null && days > 0) {
			answersList = (List<AnswerVo>) sqlDao.qryBySQLName("QRY_CHATLOG", new Object[] { qid, days, qid, days, qid }, AnswerVo.class);
		} else {
			answersList = (List<AnswerVo>) sqlDao.qryBySQLName("QRY_ANSWERS", new Object[] { qid }, AnswerVo.class);
		}

		JSONObject json = new JSONObject();
		JSONArray answers = JSONArray.fromObject(answersList);
		json.put("answers", answers);
		HttpUtil.writeHtml(json.toString());

		return NONE;
	}

	private String searchKey;
	private String searchUser;
	private String searchDateRange;

	@SuppressWarnings("unchecked")
	public String search() throws Exception {
		String sql = "SELECT * FROM W_QUESTION WHERE Q_DATE ";
		Object[] paras = null;
		if (StringUtils.isNotBlank(searchDateRange)) {
			String[] dt = searchDateRange.split("\\|");
			if (StringUtils.isNotBlank(dt[0]) && StringUtils.isNotBlank(dt[1])) {
				sql = sql + "BETWEEN TO_DATE('" + dt[0] + "','YYYY-MM-DD') AND TO_DATE('" + dt[1] + "','YYYY-MM-DD')";
			} else if (StringUtils.isNotBlank(dt[0])) {
				sql = sql + ">= TO_DATE('" + dt[0] + "','YYYY-MM-DD')";
			} else if (StringUtils.isNotBlank(dt[1])) {
				sql = sql + "<= TO_DATE('" + dt[1] + "','YYYY-MM-DD')";
			}
		} else {
			sql = sql + ">=SYSDATE-30";
		}

		if (StringUtils.isNotBlank(searchKey)) {
			this.searchKey = URLDecoder.decode(searchKey, "UTF-8");
		}

		if (StringUtils.isNotBlank(searchKey) && StringUtils.isNotBlank(searchUser)) {
			sql = sql + " AND Q_CONTENT LIKE ? AND Q_USER LIKE ?";
			paras = new Object[] { allLike(searchKey), allLike(searchUser) };
		} else if (StringUtils.isNotBlank(searchUser)) {
			sql = sql + " AND Q_USER LIKE ?";
			paras = new Object[] { allLike(searchUser) };
		} else if (StringUtils.isNotBlank(searchKey)) {
			sql = sql + " AND Q_CONTENT LIKE ?";
			paras = new Object[] { allLike(searchKey) };
		}

		long totalCount = 0;
		Integer startRowNo = start == null ? new Integer(1) : Integer.parseInt(start);
		Integer endRowNo = limit == null ? new Integer(11) : (startRowNo + Integer.parseInt(limit));
		if (startRowNo == 0) {
			endRowNo = endRowNo + 1;
		}

		totalCount = sqlDao.qryAllCountBySqlText(sql, paras);
		List<QuestionVo> questionList = new ArrayList<QuestionVo>(0);
		if (totalCount > 0) {
			int c = paras == null ? 0 : paras.length;
			Object[] para4Paging = new Object[c + 2];
			for (int i = 0; i < c; i++) {
				para4Paging[i] = paras[i];
			}
			para4Paging[c] = startRowNo;
			para4Paging[c + 1] = endRowNo;
			questionList = (List<QuestionVo>) sqlDao.qryPageRecordsBySqlText(sql, para4Paging, QuestionVo.class);
		}

		JSONObject json = new JSONObject();
		JSONArray questions = JSONArray.fromObject(questionList);

		json.put("totalCount", totalCount);
		json.put("questions", questions);

		HttpUtil.writeHtml(json.toString());

		return NONE;
	}

	private String allLike(String key) {
		return "%" + key + "%";
	}

	public void setSearchDateRange(String searchDateRange) {
		this.searchDateRange = searchDateRange;
	}

	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}

	public void setSearchUser(String searchUser) {
		this.searchUser = searchUser;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public void setQid(String qid) {
		this.qid = new Long(qid);
	}

	public void setUserMsn(String userMsn) {
		this.userMsn = userMsn;
	}

}
