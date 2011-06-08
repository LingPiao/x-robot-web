package com.catic.tool.page.copy;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.catic.tool.DataBase;

/**
 * @author xuyun
 * 
 * TODO To change the template for this generated type comment go to Window -
 * Preferences - Java - Code Style - Code Templates
 */
public class PageCtrlImpl implements PageCtrl {

	private PageInfo pageInfo;

	private String sql = "";

	private String hql = "";

	private String jdbcSql = "";

	private String sqlwhere = "";

	public String getJdbcSql() {
		return jdbcSql;
	}

	public void setJdbcSql(String jdbcSql) {
		this.jdbcSql = jdbcSql;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.catic.page.PageCtrle#setSql(java.lang.String)
	 */
	public void setSql(String sql) {
		if (Convert.isNull(sql))
			return;

		this.sql = sql.trim();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.catic.page.PageCtrle#setSql(java.lang.String)
	 */
	public void setHql(String hql) {
		if (Convert.isNull(hql))
			return;

		this.hql = hql.trim();
	}

	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * 计算总的记录集数
	 * 
	 * @return int
	 */

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.catic.page.PageCtrle#getSqlRecords()
	 */

	// 数据库分页，
	public List getJdbcRecords() {
		// 计算总的记录数
		// if(pageInfo.getRecordCount()==0)
		getRecordCount();

		// pageInfo.setRecordCount(60);
		if (pageInfo.getPage() <= 0)
			pageInfo.setPage(1);

		int start = (pageInfo.getPage() - 1) * pageInfo.getPageRows();
		// System.out.println("start:"+start);
		// System.out.println("pageInfo.getPage:"+pageInfo.getPage());
		return qryJdbcRecords(start, pageInfo.getPageRows());
	}

	private List qryJdbcRecords(int start, int pageRows) {
		DataBase baseJdbcDAO = new DataBase();
		if (start < 0)
			start = 0; // 应该是=0,原来是=1(GJH)
		Statement stmt = null;
		List records = new ArrayList();

		jdbcSql = jdbcSql.trim();
		jdbcSql.toUpperCase();

		// System.out.println(sql);

		try {
			Connection c = baseJdbcDAO.getConn();
			stmt = c.createStatement();
			jdbcSql = jdbcSql + " where row_num >" + start + " and row_num<="
					+ (start + pageInfo.getPageRows());
			// System.out.println(jdbcSql);

			ResultSet rs = stmt.executeQuery(jdbcSql);

			ResultSetMetaData rmd = rs.getMetaData();
			while (rs.next()) {
				java.sql.ResultSetMetaData rsmt = rs.getMetaData();
				int count = rsmt.getColumnCount();
				ArrayList data = new ArrayList(count);
				for (int i = 0; i < count; i++) {
					if (rs.getString(i + 1) != null) {
						data.add(rs.getString(i + 1));
					} else {
						data.add("");
					}
				}
				records.add(data);
			}
			stmt.close();
			rs.close();
			c.close();
		} catch (Exception e) {

		}
		return records;
	}

	private int getRecordCount() {
		DataBase baseJdbcDAO = new DataBase();
		int recordCount = 0;

		// 如果sql为空，则返回记录集数0
		if (Convert.isNull(jdbcSql))
			return recordCount;

		String sqlCount = "select count(1) from (" + sqlwhere + ")";
		// System.out.println("sqlCount:"+sqlCount);
		// 获取总的记录数

		recordCount = Integer.parseInt(baseJdbcDAO.getBySql(sqlCount));

		pageInfo.setRecordCount(recordCount);

		return recordCount;

	}

	public void setSqlwhere(String sqlwhere) {
		this.sqlwhere = sqlwhere;
	}

	public List getHqlRecords() {
		// TODO Auto-generated method stub
		return null;
	}

	public List getSqlRecords() {
		// TODO Auto-generated method stub
		return null;
	}

}
