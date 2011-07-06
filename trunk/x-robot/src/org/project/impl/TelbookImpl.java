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
			sql ="SELECT ta.*,tagc.GROUPID FROM t_addressbook ta, t_address_group_contact tagc"
				+ " WHERE ta.CONTACTEMAIL =? and ta.ADDRESSBOOKID=tagc.ADDRESSBOOKID";
			return sqlDao.qryBySQLText(sql,new Object[] { onwer });			
	}
	public List getTelByOnwer(String onwer,String groupid,PageInfo pageInfo) {
		String sCond="";
		String sql="select ta.*,tagc.groupid from t_addressbook ta, t_address_group_contact tagc where ta.ADDRESSBOOKID = tagc.ADDRESSBOOKID(+) and ta.CONTACTEMAIL ='"+onwer+"' ";
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
        if(!groupid.equals(""))
        	sql+=" and tagc.groupid= '"+groupid+"' ";
		sql+=" order by name ";
		System.out.println(sql);
        pageCtrl.setStrSQL(sql);

		return pageCtrl.getRecords();
	}
	public void  add(Mtelbook telbook) {
		String sql ="";
		sql = "insert into t_addressbook(ADDRESSBOOKID,CONTACTEMAIL,NAME,TELNUMBER) values " +
				"(SEQ_ROBOT.nextval,'"+telbook.getCONTACTEMAIL()+"','"+telbook.getNAME()+"','"+telbook.getTELNUMBER()+"')";
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void  update(Mtelbook telbook) {
		String sql ="";
		sql = "update t_addressbook set NAME='"+telbook.getNAME()+"',TELNUMBER='"+telbook.getTELNUMBER()+"' where ADDRESSBOOKID="+telbook.getADDRESSBOOKID();
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void del (String delid) {
		String sql ="";
		sql = "delete from t_addressbook where ADDRESSBOOKID in ("+delid+")";
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
		sql = "delete from T_ADDRESS_GROUP_CONTACT where ADDRESSBOOKID in ("+delid+")";
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
