package com.catic.tool.page;

import java.util.ArrayList;
import java.util.List;

/**
 * 
 * ��ҳҳ����Ϣ��װ��
 * ����ҳ���¼����ҳ��
 * �ܵļ�¼��
 * @author steven
 */
public class PageInfo {

	//ҳ��
	private int page = 1;

	//ÿҳ��¼��
	private int pageRows = 15;

	//ҳ��
	private int pageCount = 0;

	//�ܵļ�¼��
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
	 * ����ҳ�����ܵļ�¼������ҳ�ڼ�¼����������������¼
	 * ����1	 *
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
