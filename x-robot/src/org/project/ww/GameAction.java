package org.project.ww;
import com.catic.tool.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;

import org.project.dao.Game_recordDao;
import org.project.model.Mgame;


import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

public class GameAction extends ActionSupport 
{	
	public String execute()	throws Exception
	{
		if(op.equals("game1"))
		{	
			return "game1";
		}
		if(op.equals("game1view"))
		{		
			return "game1view";
		}
		if(op.equals("game1result"))
		{	
			Mgame mgame = new Mgame();
			
			List rlist=gamerecordDao.getRecordByUser_msn(user_msn);
			float temp1=0;
			float temp2=0;
			if(rlist.size()>0)
			{
				Map map = (Map) rlist.get(0);
				//历史最好成绩
				his_game_results=map.get("GAME_RESULTS").toString();
				temp1 = Float.parseFloat(his_game_results);
				temp2 = Float.parseFloat(game_results);
				if(temp2>temp1)
				{
					mgame.setGAME_CLASS("1");
					mgame.setCOMMIT_DATE("sysdate");
					mgame.setGAME_RESULTS(game_results);
					mgame.setUSER_MSN(user_msn);
					gamerecordDao.updateRecord(mgame);
				}	
			}
			else 
			{
				mgame.setGAME_CLASS("1");
				mgame.setCOMMIT_DATE("sysdate");
				mgame.setGAME_RESULTS(game_results);
				mgame.setUSER_MSN(user_msn);
				gamerecordDao.addRecord(mgame);
			}
				
			week = Integer.parseInt(gamerecordDao.getWeek().get("WEEK").toString());
			List rlist1=gamerecordDao.getRecordByUser_msn(user_msn);
			Map map = (Map) rlist1.get(0);
			//当前排名
			now_paiming = map.get("PAINUM").toString();
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
			
		    gamerecordDao.getAllRecord(pageInfo, week);
		    
		    weeks = gamerecordDao.getWeeks();
		    
		  return "game1result";
		}
		else if (op.equals("weekresult"))
		{
			List rlist1=gamerecordDao.getRecordByUser_msn(user_msn);
			Map map = (Map) rlist1.get(0);
			his_game_results=map.get("GAME_RESULTS").toString();
			//当前排名
			now_paiming = map.get("PAINUM").toString();
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
			
		    gamerecordDao.getAllRecord(pageInfo, week);
		    
		    weeks = gamerecordDao.getWeeks();
		    
			return "game1result";
		}
    	return SUCCESS;
	}
	private List recordList;

	public List getRecordList() {
		return recordList;
	}
	public void setRecordList(List recordList) {
		this.recordList = recordList;
	}
	private String op;
	private String user_msn;
	private Game_recordDao gamerecordDao;
	
	public Game_recordDao getGamerecordDao() {
		return gamerecordDao;
	}
	public void setGamerecordDao(Game_recordDao gamerecordDao) {
		this.gamerecordDao = gamerecordDao;
	}
	public String getUser_msn() {
		return user_msn;
	}
	public void setUser_msn(String user_msn) {
		this.user_msn = user_msn;
	}
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	private int page = 1;
	private int pageRows = 10;
	private PageInfo pageInfo;
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	 /**
     * @return 返回 page。
     */
    public int getPage()
    {

        return page;
    }

    /**
     * @param page 要设置的 page。
     */
    public void setPage(int page)
    {
        if (page >= 1)
            this.page = page;
    }
    
    /**
     * @return 返回 pageRows。
     */
    public int getPageRows()
    {

        return pageRows;
    }
    
    /**
     * @param pageRows 要设置的 pageRows。
     */
    public void setPageRows(int pageRows)
    {

        this.pageRows = pageRows;
    }
    
    private String seqid;
    private String game_results;
    private String his_game_results;
    private String now_paiming;
    private List weeks;
    private int week;
    private Map currentWeek;
    
	public String getNow_paiming() {
		return now_paiming;
	}
	public void setNow_paiming(String now_paiming) {
		this.now_paiming = now_paiming;
	}
	public String getHis_game_results() {
		return his_game_results;
	}
	public void setHis_game_results(String his_game_results) {
		this.his_game_results = his_game_results;
	}
	public String getSeqid() {
		return seqid;
	}
	public void setSeqid(String seqid) {
		this.seqid = seqid;
	}
	public String getGame_results() {
		return game_results;
	}
	public void setGame_results(String game_results) {
		this.game_results = game_results;
	}
	
	public List getWeeks() {
		return weeks;
	}
	
	public void setWeek(int week) {
		this.week = week;
	}
	
	public int getWeek() {
		return week;
	}
	public Map getCurrentWeek() {
		currentWeek = gamerecordDao.getWeek();
		return currentWeek;
	}
}
