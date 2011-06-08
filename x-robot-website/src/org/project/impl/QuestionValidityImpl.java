package org.project.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.QuestionValidityDao;

import com.catic.tool.ConvertDate;

public class QuestionValidityImpl implements QuestionValidityDao {

	private SqlDao sqlDao;


	public void questionValidity()
	{
		Date today = new Date();
		ConvertDate cDate= new ConvertDate();
		String strday=cDate.dateToString(today, "yyyy-MM-dd");
		String sql = "update W_QUESTION set Q_STATE='1' where to_char(Q_VALIDITY, 'yyyy-mm-dd ')<'"+strday+"' and Q_STATE='0'";
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
