package org.project.impl;

import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;
import org.project.dao.Game_recordDao;
import org.project.model.Mgame;


import com.catic.tool.PageCtrl;
import com.catic.tool.PageInfo;
public class Game_recordImpl implements Game_recordDao {

	private SqlDao sqlDao;
	private static int WEEK_OFFSET = 42;
	
	public void  addRecord(Mgame srecord) {
		String sql ="";
		sql ="Select max(seqid) as num from UNICOM_GAME";
		int maxid = sqlDao.queryForInt(sql);
		maxid++;
		//System.out.println(maxid);
		sql = "insert into UNICOM_GAME(SEQID,USER_MSN,COMMIT_DATE,GAME_CLASS,GAME_RESULTS) values " +
				"("+maxid+",'"+srecord.getUSER_MSN()+"',"+srecord.getCOMMIT_DATE()+",'"+srecord.getGAME_CLASS()+"'," +
						"'"+srecord.getGAME_RESULTS()+"')";
		//System.out.println(sql);
		sqlDao.insertBySQLText(sql);
	}
	public List getAllRecord(PageInfo pageInfo) {
		String sql ="";
		sql ="select rownum as painum ,a1.* from (select a.* ,m.USER_TEL from unicom_game a,MSN_CERTIFICATION m where a.game_class='1' and to_char(commit_date,'iw')=to_char(sysdate,'iw') and a.user_msn=m.user_msn(+) order by to_number(a.game_results) desc) a1";
		
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
        pageCtrl.setStrSQL(sql);
        return pageCtrl.getRecords();
	}
	public List getAllRecord(PageInfo pageInfo, int week) {
		String sql ="";
		week = WEEK_OFFSET + week;
		sql ="select rownum as painum ,a1.* from (select a.* ,m.USER_TEL from unicom_game a,MSN_CERTIFICATION m where a.game_class='1' and to_char(commit_date,'iw')='" + week + "' and a.user_msn=m.user_msn(+) order by to_number(a.game_results) desc) a1";
		
		PageCtrl pageCtrl = new PageCtrl();
        pageCtrl.setSqlDao(sqlDao);
        pageCtrl.setPageInfo(pageInfo);
        pageCtrl.setStrSQL(sql);
        return pageCtrl.getRecords();
	}
	public Map getWeek()
	{
		String sql = "select to_number(to_char(sysdate,'iw')) - " + WEEK_OFFSET + " week, to_char(sysdate - to_number(to_char(sysdate,'D')) +1,'yyyy-mm-dd') startdate, to_char(sysdate + 7 - to_number(to_char(sysdate,'D')),'yyyy-mm-dd') enddate from dual";
		List List = sqlDao.qryBySQLText(sql, new Object[] {});
		
		Map map = (Map)List.get(0);
		
		return map;
	}
	public List getWeeks()
	{
		String sql = "select to_number(to_char(commit_date,'iw')) - " + WEEK_OFFSET + " weeks from unicom_game group by to_char(commit_date,'iw') order by to_char(commit_date,'iw')";
		return sqlDao.qryBySQLText(sql, new Object[] {});
	}
	
	public List getRecordByUser_msn(String user_msn){
		String str="";
		String sql ="";
		sql ="select a2.* from(select rownum as painum,a1.* from(select a.* from unicom_game a where a.game_class='1' and to_char(commit_date,'iw')=to_char(sysdate,'iw') order by to_number(a.game_results) desc) a1) a2 where a2.user_msn =?";
		return sqlDao.qryBySQLText(sql,new Object[] {user_msn});	
	}
	public void  updateRecord(Mgame srecord) {
		String sql ="";
		sql = "update UNICOM_GAME set COMMIT_DATE="+srecord.getCOMMIT_DATE()+",GAME_RESULTS='"+srecord.getGAME_RESULTS()+"' where to_char(commit_date,'iw')=to_char(sysdate,'iw') and user_msn='"+srecord.getUSER_MSN()+"'";
		//System.out.println(sql);
		sqlDao.updateBySQLText(sql, new Object[] {});
	}
	public SqlDao getSqlDao() {
		return sqlDao;
	}

	public void setSqlDao(SqlDao sqlDao) {
		this.sqlDao = sqlDao;
	}

}
