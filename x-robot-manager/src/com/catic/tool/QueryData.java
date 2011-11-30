package com.catic.tool;

import java.sql.*;
import java.util.StringTokenizer;

public class QueryData {

	// ���洫���Ĳ���
	private DataConn dataConn = null;

	private Connection conn = null;

	// ���⴫�ݵĲ���
	private ResultSet resultSet = null;

	private int query_errcode = 0;

	private String query_errstr = "";

	protected int iRecordCount = 0; // �ܼ�¼��

	public QueryData() {

	}

	/**
	 * QueryData���캯�������һ������
	 */
	public QueryData(DataConn dataConn) {
		dataConn = new DataConn();
		conn = dataConn.getConnection();
	}

	/**
	 * ����getResultSet��ý����¼��
	 * 
	 * @return
	 */
	public ResultSet getResultSet() {
		return resultSet;
	}

	/**
	 * @return�ܼ�¼��
	 */
	public int getRecordCount() {
		return iRecordCount;
	}

	/**
	 * setRecordCount��ñ�ļ�¼
	 * 
	 * @param tablenamestr
	 * @param Condition
	 *            ÷���� 2008-05-30
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
	 * ����setRecordSet���������µĽ����¼����������ҳ��Ϣ��
	 * 
	 * @param tablenamestr
	 *            ������
	 * @param fieldarraystr
	 *            ����ʾ���ֶ�
	 * @param Condition
	 *            �������ֶ� ÷���� 2008-05-30
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
	 * �����ݿ���ȡ����ǰid�����ֵ����������һ��ֵ
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