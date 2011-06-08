/*
 * Created on 2005-2-4
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.catic.tool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.project.dao.SqlDao;

/**
 * @author Administrator
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */

public class PageCtrl 
{
	private SqlDao sqlDao;
	private PageInfo pageInfo;
	private String strSQL = "";
	
	public void setPageRows(int pageRows)
	{
		pageInfo.setPageRows(pageRows);
	}
	
	public void setSqlDao(SqlDao sqlDao)
	{
		this.sqlDao = sqlDao;
	}
	
	public void setStrSQL(String strSQL)
	{
		if (this.strSQL.equalsIgnoreCase(strSQL.trim()))
			return;
	
		this.strSQL = strSQL.trim();
		   
		calRecordCount();
	}
	
	public PageInfo getPageInfo()
	{
		return pageInfo;
	}
	
	public void setPageInfo(PageInfo pageInfo)
	{
	    this.pageInfo = pageInfo;
	}
	
	private int calRecordCount()
	{
		int recordCount = 0;
		if (strSQL.equalsIgnoreCase(""))
			return recordCount;
		//System.out.println("222222222222222222222222222222222222222222222222222");        
        
		String sql = "Select Count(*) As RowCount From (" + strSQL + ") T1";
		//System.out.println("111111111111111111111111111111111111111111111122222222222");        
	       
		List count = sqlDao.qryBySQLText(sql, null);
		//List count = null;
		//System.out.println("233333333333333333333333333333333333333333333333");        
	        
		if (count != null)
		{
			Map map = (Map)count.get(0);
			recordCount = new Integer(map.get("ROWCOUNT").toString()).intValue();
		}
		
		pageInfo.setRecordCount(recordCount);
		
		return recordCount;
	}
	
	public List getRecords()
	{
	    int start = (pageInfo.getPage() - 1) * pageInfo.getPageRows() + 1;
	    int end = (pageInfo.getPage()) * pageInfo.getPageRows();
	    //System.out.println(start+"+qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	    //System.out.println(end+"+qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
	    return qryRecords(start, end);
	}
	  
	private List qryRecords(int start, int end)
	{
		List records = new ArrayList();
		
		if (strSQL.equalsIgnoreCase(""))
			return records;
	
		String sql = "Select T2.* From (" +
						"Select T1.*, RowNum Row_Num From(" + strSQL + ") T1) T2 " +
						" Where Row_Num >=" + start + " And Row_Num <=" + end;
		records = sqlDao.qryBySQLText(sql, null);
		
		pageInfo.setRecords(records);
		
		return records;
	}
	//��ӵ�
	public List getlist(){
		String sql = "Select Count(*) As RowCount From (" + strSQL + ") T1";
		  
		//List count = sqlDao.qryBySQLText(sql, null);
		return sqlDao.qryBySQLText(sql, null);
	}
}
