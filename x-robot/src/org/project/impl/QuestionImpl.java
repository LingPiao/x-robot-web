package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.QuestionDao;
import org.project.dao.SqlDao;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class QuestionImpl implements QuestionDao {

	private SqlDao sqlDao;

	public List getQuestionList(String user_msn, String classID,
			String t_keyword, String normalstate, PageInfo pageInfo) {
		String sql = "select t.questionid,t.question,t.answer from t_unicom_question t where t.state = '0'";

		if (!t_keyword.equals("")) {
			sql = sql + " and (upper(t.keyword1) like '%"
					+ t_keyword.toUpperCase()
					+ "%' or upper(t.keyword2) like '%"
					+ t_keyword.toUpperCase() + "%')";
		}

		if (!classID.equals("0")) {
			sql = sql + " and t.question_class = '" + classID + "'";
		}

		if (normalstate.equals("3")) {
			sql = sql + " and t.normalstate = '3'";
		}
		sql = sql + " order by questionid desc";

		PageCtrl pageCtrl = new PageCtrl();
		pageCtrl.setSqlDao(sqlDao);
		pageCtrl.setPageInfo(pageInfo);
		pageCtrl.setStrSQL(sql);
		return pageCtrl.getRecords();
	}

	public List getQuestionAnswer(String questionid) {
		String sql = "select T.QUESTION,T.ANSWER from t_unicom_question t where t.questionid =?";
		return sqlDao.qryBySQLText(sql, new Object[] { questionid });
	}

	public List getQuestionType() {
		String sql = "select class_num,class_name from t_unicom_class t where class_type='question' order by CLASS_ORDER";
		return sqlDao.qryBySQLText(sql, new Object[] {});
	}

	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
