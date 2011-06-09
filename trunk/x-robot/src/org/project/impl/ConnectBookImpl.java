package org.project.impl;

import java.util.List;
import java.util.Map;
import java.io.IOException;
import org.project.dao.SqlDao;
import org.project.dao.ConnectBookDao;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class ConnectBookImpl implements ConnectBookDao {
	
	private SqlDao sqlDao;
	
	/*
	public String DelGroup(String GroupID){
		return null;
	}
	public String EditGroup(String GroupID,String GroupName){
		return null;
	}
	public List GetGroupList(){
		return null;
	}
	public String AddUser(String UserName,String GroupID,String UserTel){
		return null;
	}
	public String DelUser(String UserID){
		return null;
	}
	public String EditUser(String UserID,String UserName,String GroupID,String UserTel){
		return null;
	}
	*/
	
	public List GetUserList(String msnacc,String tid,PageInfo pageInfo){
		
		String sql = "select ID,ONWER_NAME as MSNACC,CONTACT_NAME as USERNAME,CONTACT_TEL as USERTEL from SMS_TELBOOK WHERE ONWER_NAME =GETMSNACCCODE('"+msnacc+"')";
		if((tid!=null)&&(!tid.equals("")))
			sql += " and Group_ID="+tid;
				
		sql +=" order by id desc";
		
		System.out.println(sql);
		PageCtrl pageCtrl = new PageCtrl();
		pageCtrl.setSqlDao(sqlDao);
		pageCtrl.setPageInfo(pageInfo);
		pageCtrl.setStrSQL(sql);
		return pageCtrl.getRecords();
	}
	
	public int AddUser(String UserName,String UserTel,String GroupID,String msnacc){
		
		String sql = "insert into SMS_TELBOOK(ID,ONWER_NAME,ONWER_TEL,CONTACT_NAME,CONTACT_TEL,GROUP_ID) values(CONNECTUSERID.nextval,GETMSNACCCODE(?),GETMSNACCCODE(?),?,?,?)";
		return sqlDao.updateBySQLText(sql,new Object[] { msnacc,msnacc,UserName,UserTel,GroupID });
	}
	
	public List GetUserInfo(String UserID){
		String sql = "select ID,CONTACT_NAME as USERNAME,CONTACT_TEL as USERTEL,nvl(GROUP_ID,1) as TYPEID from SMS_TELBOOK where ID=?";
		return sqlDao.qryBySQLText(sql,new Object[] { UserID });
	}
	
	public int EditUser(String UserID,String UserName,String UserTel,String GroupID){
		String sql = "update SMS_TELBOOK set GROUP_ID=?,CONTACT_NAME=?,CONTACT_TEL=? where ID=?";
		return sqlDao.updateBySQLText(sql,new Object[] {GroupID,UserName,UserTel,UserID });
	}
	
	public int DelUser(String UserID){
		String sql = "delete from SMS_TELBOOK where ID in ("+UserID+")";
		return sqlDao.updateBySQLText(sql,new Object[] {});
	}
	
	public List GetGroupList(String msnacc,PageInfo pageInfo){
		String sql = "select SEQID as TYPEID,GROUPNAME as TYPENAME from SMS_TELBOOK_GROUP WHERE OWNERNAME =GETMSNACCCODE('"+msnacc+"') or OWNERNAME='*' order by SEQID";
		System.out.println(sql);
		PageCtrl pageCtrl = new PageCtrl();
		pageCtrl.setSqlDao(sqlDao);
		pageCtrl.setPageInfo(pageInfo);
		pageCtrl.setStrSQL(sql);
		return pageCtrl.getRecords();
	}
	
	public List GetGroupListAll(String msnacc){
		String sql = "select SEQID as TYPEID,GROUPNAME as TYPENAME from SMS_TELBOOK_GROUP WHERE OWNERNAME =GETMSNACCCODE('"+msnacc+"') or OWNERNAME='*' order by SEQID";
		return sqlDao.qryBySQLText(sql,new Object[] { });
	}
	
	public int AddGroup(String GroupName,String msnacc){
		String sql = "insert into SMS_TELBOOK_GROUP(SEQID,GROUPNAME,OWNERNAME) values(CONNECTTYPEID.nextval,?,GETMSNACCCODE(?))";
		return sqlDao.updateBySQLText(sql,new Object[] { GroupName,msnacc });
	}
	
	public int EditGroup(String GroupID,String GroupName){
		String sql = "update SMS_TELBOOK_GROUP set GROUPNAME=? where SEQID=?";
		return sqlDao.updateBySQLText(sql,new Object[] { GroupName,GroupID });
	}
	
	public List GetGeoupInfo(String GroupID){
		String sql = "select GROUPNAME as typename from SMS_TELBOOK_GROUP where SEQID=?";
		return sqlDao.qryBySQLText(sql,new Object[] { GroupID });
	}
	
	public int DelGroup(String GroupID){
		String sql = "delete from SMS_TELBOOK_GROUP where SEQID in ("+GroupID+")";
		return sqlDao.updateBySQLText(sql,new Object[] {});
	}
	
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}
}
