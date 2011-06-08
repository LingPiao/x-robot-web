package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.WovisitDao;

import com.catic.tool.ConvertDate;
import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class WovisitImpl implements WovisitDao {

	private SqlDao sqlDao;
	public List getByqid(String q_id)
	{
		String sqlString="select * from W_QUESTION_VISIT where QID='"+q_id+"'";
		return sqlDao.qryBySQLText(sqlString);
	}
	public void addBrows(String q_id)
	{
		String sqlString="update W_QUESTION_VISIT set BROWS=BROWS+1 where QID='"+q_id+"'";
		sqlDao.insertBySQLText(sqlString);
	}
	public void addAnswer(String q_id)
	{
		String sqlString="update W_QUESTION_VISIT set ANSWERS=ANSWERS+1 where QID='"+q_id+"'";
		sqlDao.insertBySQLText(sqlString);
	}
	public void inserVisit(String q_id)
	{
		String sqlString="insert into W_QUESTION_VISIT values('"+q_id+"',1,0)";
		sqlDao.insertBySQLText(sqlString);
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
