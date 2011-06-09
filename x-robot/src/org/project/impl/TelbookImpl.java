package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.TelbookDao;

import org.project.model.Mtelbook;

import com.catic.tool.ConvertDate;
import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class TelbookImpl implements TelbookDao {

	private SqlDao sqlDao;

	public List  getTelByOnwer(String onwer) {
		String sql ="";
			sql ="SELECT * FROM sms_telbook "
				+ " WHERE onwer_tel =? ";
			return sqlDao.qryBySQLText(sql,new Object[] { onwer });			
	}
	public List getTelByOnwer(String onwer,String groupid,PageInfo pageInfo) {
		String sCond="";
		String sql="select * from sms_telbook where onwer_tel='"+onwer+"' ";
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
	
			if(!groupid.equals(""))
			{
				sql+= " and group_id='"+groupid+"'";
			}
			
			sql+=" order by onwer_name ";
			System.out.println(sql);
	        pageCtrl.setStrSQL(sql);

		return pageCtrl.getRecords();
	}
	public void  add(Mtelbook telbook) {
		String sql ="";
		sql ="Select max(id) as num from SMS_TELBOOK";
		int maxid = sqlDao.queryForInt(sql);
		maxid++;
		//System.out.println(maxid);
		sql = "insert into SMS_TELBOOK(id,ONWER_NAME,ONWER_TEL,CONTACT_NAME,CONTACT_TEL,GROUP_ID) values " +
				"("+maxid+",'"+telbook.getONWER_NAME()+"','"+telbook.getONWER_TEL()+"','"+telbook.getCONTACT_NAME()+"'," +
						"'"+telbook.getCONTACT_TEL()+"',"+telbook.getGROUP_ID()+")";
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void  update(Mtelbook telbook) {
		String sql ="";
		sql = "update SMS_TELBOOK set ONWER_NAME='"+telbook.getONWER_NAME()+"',ONWER_TEL='"+telbook.getONWER_TEL()+"',CONTACT_NAME='"+telbook.getCONTACT_NAME()+"',CONTACT_TEL='"+telbook.getCONTACT_TEL()+"',GROUP_ID="+telbook.getGROUP_ID()+" where id="+telbook.getID();
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void del (String delid) {
		String sql ="";
		sql = "delete from SMS_TELBOOK where ID in ("+delid+")";
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
