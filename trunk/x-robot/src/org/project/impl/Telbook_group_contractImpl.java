package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.Telbook_group_contractDao;

import org.project.model.Mtelbook_group_contract;

import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class Telbook_group_contractImpl implements Telbook_group_contractDao {

	private SqlDao sqlDao;
	public List getByGroupId(String groupid,PageInfo pageInfo) {
		String sCond="";
		String sql="select ta.* from T_ADDRESS_GROUP_CONTACT tagc ,T_ADDRESSBOOK ta where tagc.groupid='"+groupid+"' and tagc.ADDRESSBOOKID=ta.ADDRESSBOOKID order by ta.NAME ";
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
	
	    pageCtrl.setStrSQL(sql);

		return pageCtrl.getRecords();
	}
	public void  add(Mtelbook_group_contract telbook) {
		String sql ="";
		if(telbook.getADDRESSBOOKID()==0)
		{
			sql = "insert into T_ADDRESS_GROUP_CONTACT(ID,GROUPID,ADDRESSBOOKID) values " +
				"(SEQ_ROBOT.nextval,"+telbook.getGROUPID()+",SEQ_ROBOT.CURRVAL-1)";
		}
		else 
		{
			sql = "insert into T_ADDRESS_GROUP_CONTACT(ID,GROUPID,ADDRESSBOOKID) values " +
			"(SEQ_ROBOT.nextval,"+telbook.getGROUPID()+","+telbook.getADDRESSBOOKID()+")";
		}
		System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public void  mod(Mtelbook_group_contract telbook) {
		String sql ="";
//		
		sql = "update T_ADDRESS_GROUP_CONTACT set GROUPID="+telbook.getGROUPID()+" where ADDRESSBOOKID = "+telbook.getADDRESSBOOKID();
		
		sqlDao.insertBySQLText(sql);
	}
	public boolean checkExist(Mtelbook_group_contract telbook)
	{
		String sqlString="select * from T_ADDRESS_GROUP_CONTACT where ADDRESSBOOKID="+telbook.getADDRESSBOOKID();
		List temp = sqlDao.qryBySQLText(sqlString);
		if(temp.size()>0)
			return true;
		else {
			return false;
		}
	}
	public void del (Integer addressbookid,Integer groupid) {
		String sql ="";
		sql = "delete from T_ADDRESS_GROUP_CONTACT where ADDRESSBOOKID="+addressbookid+" and GROUPID="+groupid;
		System.out.println(sql);
		System.out.println("111111111111111111111111111");
		sqlDao.insertBySQLText(sql);
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
