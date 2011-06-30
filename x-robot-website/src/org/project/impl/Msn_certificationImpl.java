package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.Msn_certificationDao;
import org.project.model.Mmsn_certification;

public class Msn_certificationImpl implements Msn_certificationDao {

	private SqlDao sqlDao;


	public List getUserMsnByMobile(String user_mobile) 
	{
		// TODO 自动生成方法存根
		String sql = "SELECT USER_MSN FROM msn_certification "
				+ " WHERE USER_TEL =?";
		return sqlDao.qryBySQLText(sql,new Object[] { user_mobile });
	}
	public String getMobileByUserMsn(String user_msn)
	{
		String sql = "SELECT USER_TEL FROM msn_certification "
			+ " WHERE USER_MSN =?";
		List listtempList= sqlDao.qryBySQLText(sql,new Object[] { user_msn });
		if(listtempList.size()>0)
		{
			Map map = (Map)listtempList.get(0);
			if(map.get("USER_TEL")==null)
				return "";
			else
				return map.get("USER_TEL").toString();
		}
		else {
			return "";
		}

	}
	public void BindMobile(String userid,String mobile)
	{
		String sqlString="insert into MSN_CERTIFICATION(USER_MSN,USER_TEL,USER_AREA) values('"+userid+"','"+mobile+"','web')";
		sqlDao.insertBySQLText(sqlString);
	}
	
	public void UnBindMobile(String userid,String mobile)
	{
		String sqlString="delete from MSN_CERTIFICATION where USER_MSN='"+userid+"' and USER_TEL='"+mobile+"'";
		System.out.println(sqlString);
		sqlDao.insertBySQLText(sqlString);
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
