package net.sf.service.agent;

import java.net.URLDecoder;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.robot.util.SpringInstance;
import net.sf.robot.util.db.TiSqlDao;
import net.sf.service.agent.lock.QuestionLock;
import net.sf.service.agent.server.AgentServer;
import net.sf.service.agent.server.AgentUser;
import net.sf.service.agent.vo.AnswerVo;
import net.sf.service.agent.vo.QuestionVo;
import net.sf.service.common.Constants;
import net.sf.service.common.DBUtils;
import net.sf.service.common.HttpUtil;

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
		if (isManager) {// �ͻ�����
			queryName = "QRY_QUESTION_4_MNG";
			para4Count = new String[] { au.getMobileNo() };
			para4Paging = new Object[] { au.getMobileNo(), startRowNo, endRowNo };
		} else {// ��ͨ��ϯ
			if (!managerMobiles.isEmpty()) {// �пͻ�������¼
				queryName = "QRY_QUESTION_NO_MNG";
				String mmsInStr = DBUtils.toInList(managerMobiles);
				para4Count = new String[] { mmsInStr };
				para4Paging = new Object[] { mmsInStr, startRowNo, endRowNo };
			} else {// �޿ͻ�����
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

		// long totalCount = 1;
		// QuestionVo q = new QuestionVo();
		// q.setQ_id(1);
		// q.setQ_state("1");
		// q.setQ_user("email");
		// q.setQ_content("Question 1");
		// q.setQ_date(new Date());
		// List<QuestionVo> questionList = new ArrayList<QuestionVo>();
		// questionList.add(q);
		// questionList.add(q);

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
			// PlatformMessager.sendAnswer(userMsn, decodedAnswer);
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
			answersList = (List<AnswerVo>) sqlDao.qryBySQLName("QRY_CHATLOG", new Object[] { qid, qid, days, qid }, AnswerVo.class);
		} else {
			answersList = (List<AnswerVo>) sqlDao.qryBySQLName("QRY_ANSWERS", new Object[] { qid }, AnswerVo.class);
		}

		JSONObject json = new JSONObject();
		JSONArray answers = JSONArray.fromObject(answersList);
		json.put("answers", answers);
		HttpUtil.writeHtml(json.toString());

		return NONE;
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