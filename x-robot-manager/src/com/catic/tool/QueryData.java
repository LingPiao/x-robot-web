package com.catic.tool;

import java.sql.*;
import java.util.StringTokenizer;

public class QueryData {

	// 外面传进的参数
	private DataConn dataConn = null;

	private Connection conn = null;

	// 对外传递的参数
	private ResultSet resultSet = null;

	private int query_errcode = 0;

	private String query_errstr = "";

	protected int iRecordCount = 0; // 总记录数

	public QueryData() {

	}

	/**
	 * QueryData构造函数，获得一个连接
	 */
	public QueryData(DataConn dataConn) {
		dataConn = new DataConn();
		conn = dataConn.getConnection();
	}

	/**
	 * 方法getResultSet获得结果记录集
	 * 
	 * @return
	 */
	public ResultSet getResultSet() {
		return resultSet;
	}

	/**
	 * @return总记录数
	 */
	public int getRecordCount() {
		return iRecordCount;
	}

	/**
	 * setRecordCount获得表的记录
	 * 
	 * @param tablenamestr
	 * @param Condition
	 *            梅晓冬 2008-05-30
	 */
	public void setRecordCount(String tablenamestr, String Condition) {
		String sqlstr = "";
		int recordCount = 0;
		try {
			sqlstr = " Select count(*) as num from " + tablenamestr;
			if (!Condition.trim().equals("")) {
				sqlstr += " where " + Condition;
			}
			System.out.println(sqlstr);
			Statement stmt = conn.createStatement();
			ResultSet rs_count = stmt.executeQuery(sqlstr);
			if (rs_count.next()) {

				recordCount = rs_count.getInt("num");
			}
			rs_count.close();
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
			// System.out.println(query_errstr);
		}
		iRecordCount = recordCount;
	}

	public void setRecordCount(String tablenamestr, String field,
			String Condition) {
		String sqlstr = "";
		int recordCount = 0;
		try {
			sqlstr = " Select count(" + field + ") as num from " + tablenamestr;
			if (!Condition.trim().equals("")) {
				sqlstr += " where " + Condition;
			}
			//System.out.println(sqlstr);
			Statement stmt = conn.createStatement();
			ResultSet rs_count = stmt.executeQuery(sqlstr);
			if (rs_count.next()) {

				recordCount = rs_count.getInt("num");
			}
			rs_count.close();
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
			// System.out.println(query_errstr);
		}
		iRecordCount = recordCount;
	}

	/**
	 * 方法setRecordSet计算条件下的结果记录集；不带分页信息；
	 * 
	 * @param tablenamestr
	 *            ：表名
	 * @param fieldarraystr
	 *            ：显示的字段
	 * @param Condition
	 *            ：条件字段 梅晓冬 2008-05-30
	 */

	public void setRecordSet(String tablenamestr, String fieldarraystr,
			String Condition) {
		//System.out.println(Condition);
		String sqlstr = " Select " + fieldarraystr + " from " + tablenamestr
				+ " ";

		if (!Condition.trim().equals("")) {
			sqlstr += " where " + Condition;
			
		}
		//System.out.println(sqlstr);
		try {
			Statement stmt = conn.createStatement();
			resultSet = stmt.executeQuery(sqlstr);
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
		}
	}

	public void setRecordSet(String sql) {

		
		if (!sql.trim().equals("")) {
		

			try {
				Statement stmt = conn.createStatement();
				resultSet = stmt.executeQuery(sql);
			} catch (SQLException sqle) {
				query_errcode = sqle.getErrorCode();
				query_errstr = sqle.getMessage();
			}
		}
	}
	/**
	 * 从数据库中取出当前id的最大值，并返回下一个值
	 * 
	 * @param sqlstr
	 * @return
	 */
	public int KeyNextValue(String tablename, String key) {
		
		String sqlstr = "";
		int recordCount = 0;
		System.out.println("ttttttttttttttttttttttttt");
		try {
			sqlstr = " Select max(" + key + ") as num from " + tablename;
			System.out.println(sqlstr);
			Statement stmt = conn.createStatement();
			ResultSet rs_count = stmt.executeQuery(sqlstr);
			
			if (rs_count.next()) {
				
				recordCount = rs_count.getInt("num");
				System.out.println(recordCount);
			}
			rs_count.close();
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
			System.out.println(query_errcode);
			System.out.println(query_errstr);
		}
		System.out.println(recordCount);
		return ++recordCount;
	}
	public void close() {
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception sqle) {
				
			}
		}
		if (dataConn != null) {
			try {
				dataConn.close();
			} catch (Exception sqle) {
				
			}
		}
	}
}