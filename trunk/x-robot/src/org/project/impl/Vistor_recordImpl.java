package org.project.impl;

import java.util.List;

import org.project.dao.SqlDao;
import org.project.dao.Vistor_recordDao;
import org.project.model.Mvistor_record;

import com.catic.tool.ConvertDate;
import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;

public class Vistor_recordImpl implements Vistor_recordDao {

	private SqlDao sqlDao;
	public void  addRecord(Mvistor_record vrecord) {
		String sql ="";
		sql ="Select max(ID) as num from T_VISIT_RECORD";
		int maxid = sqlDao.queryForInt(sql);
		maxid++;
		//System.out.println(maxid);
		sql = "insert into T_VISIT_RECORD(ID,MSNID,CLASSES) values ("+maxid+",'"+vrecord.getMSNID()+"','"+vrecord.getCLASSES()+"')";
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public List getRecordByOnwer(String onwer,String con,PageInfo pageInfo) {
		String sCond="";
		ConvertDate cdate = new ConvertDate();
		String sql="select * from sms_record where ";
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
	
			if(con.equals("all"))
			{
				sql+= "1=1 and ";
			}
			if(con.equals("today"))
			{				
				String today=cdate.dateToYMD(new java.util.Date());
				sql+= "'"+today+"' = to_char(REC_SEND_TIME,'yyyy-mm-dd') and ";
			}
			if(con.equals("week"))
			{
				String bgin = cdate.getMondayOfThisWeek();
				String ends = cdate.getSundayOfThisWeek();
				sql+= "to_char(REC_SEND_TIME,'yyyy-mm-dd') >= '"+bgin+"' and  to_char(REC_SEND_TIME,'yyyy-mm-dd')<='"+ends+"' and ";
			}
			if(con.equals("month"))
			{
				String today=cdate.dateToYMD(new java.util.Date()).substring(0,7);
				sql+= "to_char(REC_SEND_TIME,'yyyy-mm-dd') like '"+today+"%' and ";
			}
			sql+=" REC_SEND_TEL='"+onwer+"' and del=0 order by REC_SEND_TIME desc ";
			System.out.println(sql);
	        pageCtrl.setStrSQL(sql);

		return pageCtrl.getRecords();
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
