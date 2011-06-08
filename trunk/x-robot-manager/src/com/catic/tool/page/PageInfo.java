package com.catic.tool.page;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * 分页页面信息包装内
 * 包含页面记录数、页数
 * 总的记录数
 * @author steven
 */
public class PageInfo {

	//页码
	private int page = 1;

	//每页记录数
	private int pageRows = 15;

	//页数
	private int pageCount = 0;

	//总的记录数
	private int recordCount = 0;

	private List records = new ArrayList();

	public int getPage() {
		return this.page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
		calPageCount();
	}

	public int getPageRows() {
		return this.pageRows;
	}

	public int getPageCount() {
		return this.pageCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;

		calPageCount();
	}

	public int getRecordCount() {
		return this.recordCount;
	}

	public void setRecords(List records) {
		this.records = records;
	}

	public List getRecords() {
		return records;
	}

	/**
	 * 计算页数，总的记录数除以页内记录数，如果有余数则记录
	 * 数加1	 *
	 */
	private void calPageCount() {
		if (pageRows == 0 || recordCount == 0)
			return;

		if ((recordCount % pageRows) == 0)
			pageCount = recordCount / pageRows;
		else
			pageCount = recordCount / pageRows + 1;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
}
