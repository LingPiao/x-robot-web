/*
 * Created on 2005-2-4
 *
 * TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
package com.catic.tool;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 *
 * TODO To change the template for this generated type comment go to
 * Window - Preferences - Java - Code Style - Code Templates
 */
public class PageInfo 
{
    private int page = 1;
    private int pageRows = 20;
	private int pageCount = 0;
	private int recordCount = 0;
	private List records = new ArrayList();
	
	public int getPage()
	{
	    return this.page;
	}
	
	public void setPage(int page)
	{
	    this.page = page;
	}
	
	public void setPageRows(int pageRows)
	{
		this.pageRows = pageRows;
		calPageCount();
	}
	
	public int getPageRows()
	{
		return this.pageRows;
	}
	
	public int getPageCount()
	{
		return this.pageCount;
	}
	
	public void setRecordCount(int recordCount)
	{
		this.recordCount = recordCount;
		
		calPageCount();
	}
	
	public int getRecordCount()
	{
		return this.recordCount;
	}
	
	
	public void setRecords(List records)
	{
		this.records = records;
	}
	
	public List getRecords()
	{
		return records;
	}
	
	private void calPageCount()
	{
	    if (pageRows == 0 || recordCount == 0)
	      return;
	
	    if ((recordCount % pageRows) == 0)
	      pageCount = recordCount / pageRows;
	    else
	      pageCount = recordCount / pageRows + 1;
	}
}
