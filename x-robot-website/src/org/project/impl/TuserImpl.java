package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.TuserDao;



public class TuserImpl implements TuserDao {

	private SqlDao sqlDao;
	public void addUser(String username,String userpwd,String nickname)
	{
		String sql="insert into t_user(USERID,USERNAME,NICKNAME,PASSWORD) values (SEQ_ROBOT.nextval,'"+username+"','"+nickname+"','"+userpwd+"')";
		sqlDao.insertBySQLText(sql);
	}

	public List login(String userid,String pwd) {
		// TODO 自动生成方法存根
		String sql = "SELECT * FROM t_user "
				+ " WHERE USERNAME =? and PASSWORD=?";
		return sqlDao.qryBySQLText(sql,new Object[] { userid,pwd });
	}
	public String getNicknameByUserid(String userid)
	{
		String sql = "SELECT NICKNAME FROM t_user  WHERE USERNAME ='"+userid+"'";
		System.out.println(sql);
		List listtempList= sqlDao.qryBySQLText(sql);
		if(listtempList.size()>0)
		{
			Map map = (Map)listtempList.get(0);
			if(map.get("NICKNAME")==null)
				return "";
			else
				return map.get("NICKNAME").toString();
		}
		else {
			return "";
		}

	}
	public String getTypeByUserid(String userid)
	{
		String sql = "SELECT TYPE FROM t_user "
			+ " WHERE USERNAME =?";
		List listtempList= sqlDao.qryBySQLText(sql,new Object[] { userid });
		if(listtempList.size()>0)
		{
			Map map = (Map)listtempList.get(0);
			if(map.get("TYPE")==null)
				return "";
			else
				return map.get("TYPE").toString();
		}
		else {
			return "";
		}

	}
	public List getUserInfoByUsername(String username)
	{
		String sql="select USERID from t_user where USERNAME=?";
		return sqlDao.qryBySQLText(sql,new Object[] { username });
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
