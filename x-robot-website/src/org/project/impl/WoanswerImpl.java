package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.WoanswerDao;


import org.project.model.Woknow;


import com.catic.tool.ConvertDate;
import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class WoanswerImpl implements WoanswerDao {

	private SqlDao sqlDao;
	public void saveAnswer(String qid,String content,String userid)
	{
		if( userid == null || userid.equals("") )
			userid="热心网友";
		String sql="insert into W_ANSWERS (A_ID,Q_ID,A_CONTENT,A_USER,A_LEVELS,A_DEL) values (A_ID.nextval,"+qid+",'"+content+"','"+userid+"','0','0')";
		sqlDao.insertBySQLText(sql);
	}
	public void delAnswer(String aid)
	{
		String sql="update  W_ANSWERS set A_DEL='1' where a_id='"+aid+"'";
		sqlDao.insertBySQLText(sql);
	}
	public List getAnswerByQid(String qid)
	{
		String sql="select u.nickname,m.USER_TEL,a.* from W_ANSWERS a, t_user u,msn_certification m where a.Q_ID='"+qid+"'  and a.a_user=u.username(+) and a.a_user=m.user_msn(+) order by a.A_LEVELS desc,a.A_ID desc";
		return sqlDao.qryBySQLText(sql);
	}
	public void setBestAnswer(String aid)
	{
		String sql="update  W_ANSWERS set A_LEVELS='1' where a_id='"+aid+"'";
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public boolean isBestAnswer(String qid)
	{
		String sql="select * from W_ANSWERS  where Q_ID='"+qid+"' and A_LEVELS='1'";
		List tempList=sqlDao.qryBySQLText(sql);
		if(tempList.size()>0)
			return true;
		else {
			return false;
		}
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
