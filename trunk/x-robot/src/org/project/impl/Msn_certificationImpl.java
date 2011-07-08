package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.Msn_certificationDao;
import org.project.model.Mmsn_certification;

public class Msn_certificationImpl implements Msn_certificationDao {

	private SqlDao sqlDao;


	public List getUserTelByMsnId(String userMsn) {
		// TODO 自动生成方法存根
		String sql = "SELECT * FROM msn_certification "
				+ " WHERE USER_MSN =?";
		return sqlDao.qryBySQLText(sql,new Object[] { userMsn });

	}
	public void insertUser(String user_msn,String user_tel,String areacode) {
		// TODO 自动生成方法存根
		String sql = "insert into msn_certification (USER_MSN,USER_TEL,USER_AREA) "
				+ " values(?,?,?)";
		sqlDao.updateBySQLText(sql,new Object[] { user_msn,user_tel,areacode });

	}
	public boolean check(String user_msn)
	{
		String sql = "SELECT * FROM msn_certification "
			+ " WHERE USER_MSN =? ";
		List tempList = sqlDao.qryBySQLText(sql,new Object[] { user_msn });
		if(tempList.size()>0)
			return true;
		else
			return false;
	}
	public void update(String user_msn,String user_tel)
	{
		String sql = "update msn_certification set USER_TEL='"+user_tel+"' where USER_MSN='"+user_msn+"'";
		sqlDao.insertBySQLText(sql);
	}
	public void del(String user_msn,String user_tel) {
		// TODO 自动生成方法存根
		String sql = "delete from msn_certification where USER_MSN='"+user_msn+"' and USER_TEL='"+user_tel+"'";
		sqlDao.insertBySQLText(sql);

	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
