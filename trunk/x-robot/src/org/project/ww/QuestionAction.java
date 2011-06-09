package org.project.ww;

import java.util.List;
import java.util.Map;

import org.project.dao.QuestionDao;

import com.catic.tool.PageInfo;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

public class QuestionAction extends ActionSupport {

	public String execute() throws Exception {

		if (classID == null || classID.equals(""))
			classID = "0";

		if (t_keyword == null)
			t_keyword = "";

		if (normalstate == null)
			normalstate = "3";

		if (op.equals("question")) {

			typeList = questionDao.getQuestionType();

			return "question";
		}

		if (op.equals("answer")) {

			answerList = questionDao.getQuestionAnswer(questionid);
			return "answer";
		}

		if (op.equals("memo")) {

			pageInfo = new PageInfo();
			pageInfo.setPage(page);
			pageInfo.setPageRows(pageRows);

			questionList = questionDao.getQuestionList(user_msn, classID,
					t_keyword, normalstate, pageInfo);

			return "memo";
		}

		return SUCCESS;
	}

	private List questionList;
	private List typeList;
	private List answerList;

	private String op;
	private String user_msn;
	private String classID;
	private String t_keyword;
	private String questionid;
	private String normalstate;

	private QuestionDao questionDao;

	private int page = 1;
	private int pageRows = 12;
	private PageInfo pageInfo;

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * @return 返回 page。

	 */
	public int getPage() {

		return page;
	}

	/**
	 * @param page 要设置的 page。

	 */
	public void setPage(int page) {
		if (page >= 1)
			this.page = page;
	}

	/**
	 * @return 返回 pageRows。

	 */
	public int getPageRows() {

		return pageRows;
	}

	/**
	 * @param pageRows 要设置的 pageRows。

	 */
	public void setPageRows(int pageRows) {

		this.pageRows = pageRows;
	}

	public List getQuestionList() {
		return questionList;
	}

	public void setQuestionList(List questionList) {
		this.questionList = questionList;
	}

	public List getTypeList() {
		return typeList;
	}

	public void setTypeList(List typeList) {
		this.typeList = typeList;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public String getUser_msn() {
		return user_msn;
	}

	public void setUser_msn(String user_msn) {
		this.user_msn = user_msn;
	}

	public String getClassID() {
		return classID;
	}

	public void setClassID(String classID) {
		this.classID = classID;
	}

	public String getT_keyword() {
		return t_keyword;
	}

	public void setT_keyword(String t_keyword) {
		this.t_keyword = t_keyword;
	}

	public QuestionDao getQuestionDao() {
		return questionDao;
	}

	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public String getQuestionid() {
		return questionid;
	}

	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}

	public List getAnswerList() {
		return answerList;
	}

	public void setAnswerList(List answerList) {
		this.answerList = answerList;
	}

	public String getNormalstate() {
		return normalstate;
	}

	public void setNormalstate(String normalstate) {
		this.normalstate = normalstate;
	}

}
