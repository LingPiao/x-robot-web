package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.Telbook_groupDao;

import org.project.model.Mtelbook_group;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class Telbook_groupImpl implements Telbook_groupDao {

	private SqlDao sqlDao;

	//
	public List  getGroupByOnwer(String onwer) {
		String sql ="";
			sql ="SELECT * FROM T_ADDRESS_GROUP "
				+ " WHERE CONTACTEMAIL =?  order by NAME ";
			return sqlDao.qryBySQLText(sql,new Object[] { onwer });			
	}
	public List getGroupByOnwer(String onwer,PageInfo pageInfo) {
		String sCond="";
		String sql="select * from T_ADDRESS_GROUP where CONTACTEMAIL='"+onwer+"' order by NAME ";
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
	
	    pageCtrl.setStrSQL(sql);

		return pageCtrl.getRecords();
	}
	public void  add(Mtelbook_group telbook) {
		String sql ="";
		sql = "insert into T_ADDRESS_GROUP(GROUPID,NAME,CONTACTEMAIL) values " +
				"(SEQ_ROBOT.nextval,'"+telbook.getNAME()+"','"+telbook.getCONTACTEMAIL()+"')";
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void  update(Mtelbook_group telbook) {
		String sql ="";
		sql = "update T_ADDRESS_GROUP set NAME='"+telbook.getNAME()+"' where GROUPID="+telbook.getGROUPID();
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void del (String delid) {
		String sql ="";
		sql = "delete from T_ADDRESS_GROUP where GROUPID in ("+delid+")";
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
		
		sql = "delete from T_ADDRESS_GROUP_CONTACT where GROUPID in ("+delid+")";
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
