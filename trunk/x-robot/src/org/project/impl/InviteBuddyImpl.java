package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.InviteBuddyDao;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class InviteBuddyImpl implements InviteBuddyDao {

	private SqlDao sqlDao;
	public void save(String msn,String email, String mobile, String delay)
	{
		String sql = "insert into T_FRIEND(FRIENDID,CONTACTEMAIL,FRIENDEMAIL,CREATEDATE,SUCCESS,INVITE_TIME,FRIEND_EMAIL,FRIEND_MOBILE) values(friendid.nextval,'" + 
		msn + "','" + email + "',sysdate,0,";
         
          if (delay.equals("0"))
          {
        	  sql = sql + "sysdate,'','" + mobile + "')";
          }
          if (delay.equals("5"))
          {
            sql = sql + "SYSDATE + 5/(24 * 60),'','" + mobile + "')";

          }
          if (delay.equals("60"))
          {
            sql = sql + "sysdate + 1/24,'','" + mobile + "')";
          }
          sqlDao.insertBySQLText(sql);
	}

	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
