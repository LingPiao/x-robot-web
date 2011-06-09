package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.Telbook_groupDao;

import org.project.model.Mtelbook_group;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class Telbook_groupImpl implements Telbook_groupDao {

	private SqlDao sqlDao;

	//查询所有分组信息，包括常用联系人，也就是数据库中id为1的，此id每个用户都会拥有,该字段不能删除
	public List  getGroupByOnwer(String onwer) {
		String sql ="";
			sql ="SELECT * FROM sms_telbook_group "
				+ " WHERE OWNERNAME =? or OWNERNAME='*' order by SEQID ";
			return sqlDao.qryBySQLText(sql,new Object[] { onwer });			
	}
	public List getGroupByOnwer(String onwer,PageInfo pageInfo) {
		String sCond="";
		String sql="select * from sms_telbook_group where OWNERNAME='"+onwer+"' order by SEQID ";
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
	
	    pageCtrl.setStrSQL(sql);

		return pageCtrl.getRecords();
	}
	public void  add(Mtelbook_group telbook) {
		String sql ="";
		sql ="Select max(seqid) as num from SMS_TELBOOK_GROUP";
		int maxid = sqlDao.queryForInt(sql);
		maxid++;
		//System.out.println(maxid);
		sql = "insert into SMS_TELBOOK_GROUP(SEQID,GROUPNAME,OWNERNAME) values " +
				"("+maxid+",'"+telbook.getGROUPNAME()+"','"+telbook.getOWNERNAME()+"')";
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void  update(Mtelbook_group telbook) {
		String sql ="";
		sql = "update SMS_TELBOOK_GROUP set GROUPNAME='"+telbook.getGROUPNAME()+"' where seqid="+telbook.getSEQID();
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void del (String delid) {
		String sql ="";
		sql = "delete from SMS_TELBOOK_GROUP where SEQID in ("+delid+")";
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
