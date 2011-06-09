package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.Message_classDao;
import org.project.model.Mmessage_class;

public class Message_classImpl implements Message_classDao {

	private SqlDao sqlDao;


	public List  getMessageClassById(String id) {
		String sql ="";
		if(id.equals("") || id == null)
		{
			sql ="SELECT * FROM sms_class order by class_id ";
			return sqlDao.qryBySQLText(sql,new Object[] { });
		}
		else 
		{
			sql ="SELECT * FROM sms_class "
				+ " WHERE class_id =? ";
			return sqlDao.qryBySQLText(sql,new Object[] { id });			
		}
	}

	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
