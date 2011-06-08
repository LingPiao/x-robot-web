package com.catic.tool;

import java.sql.*;
import java.util.*;

public class UpdateData {

	private DataConn dataConn;

	public int updatedata_errcode = 0;

	public String updatedata_errstr = "";

	private Connection conn = null;

	private java.sql.ResultSet rs = null;

	private java.sql.Statement stmt = null;

	private String sqlstr = "";

	public UpdateData() {
	}

	public UpdateData(DataConn dataConn) {
		dataConn = new DataConn();
		conn = dataConn.getConnection();
	}

	/**
	 * 方法setErrorMessage :设置数据库检验的报错信息
	 * 
	 * @param dataConn的实例
	 */
	private void setErrorMessage() {
	}

	/**
	 * 方法getErrorMessage返回执行Update操作的错误信息
	 * 
	 * @return
	 */
	public String getErrorMessage() {
		return updatedata_errstr;
	}

	/**
	 * 方法getErrorMessage返回执行Update操作的错误代码
	 * 
	 * @return
	 */
	public int getErrorCode() {
		return updatedata_errcode;
	}

	/**
	 * 方法update(表名, 修改的字段及值组成的字字段串,条件值) 向表中更新数据
	 * 
	 * @param tablenamestr
	 * @param updatestr
	 * @param conditionstr
	 * @return
	 */
	public int update(String tablenamestr, String updatestr, String conditionstr) {
		updatedata_errcode = 0;
		updatedata_errstr = "";
		boolean flag = true;
		try {
			if (flag) {
				// 向数据表更新数据
				sqlstr = " update  " + tablenamestr + "  set  ";
				// 更新数据表中的数据
				sqlstr = sqlstr + updatestr;
				// 组合where 语句
				sqlstr += " where " + conditionstr;
				//System.out.println(sqlstr);
				stmt = conn.createStatement();
				stmt.executeUpdate(sqlstr);
				stmt.close();
			}
		} catch (java.sql.SQLException ex) {
			updatedata_errstr = ex.getMessage();
			updatedata_errcode = ex.getErrorCode();
		} catch (java.lang.Exception ex) {
			updatedata_errstr = ex.getMessage();
			updatedata_errcode = ex.hashCode();
		}
		return updatedata_errcode;
	}

	/**
	 * 方法update(表名，修改的字段串，修改的值，条件字段串，条件值)向表中更新数据
	 * 
	 * @return
	 */
	public int update(String tablenamestr, String fieldarraystr,
			String valuearraystr, String fieldCondition, String valueCondition) {
		updatedata_errcode = 0;
		updatedata_errstr = "";
		boolean flag = true;
		try {

			if (flag) {
				// 向数据表更新数据
				sqlstr = " update  " + tablenamestr + "  set  ";

				// 将fieldarraystr转化为字符串数组,以 "," 为标志
				StringTokenizer ssfield = new StringTokenizer(fieldarraystr,
						",", false);
				String fieldname = "";

				// 将 valuearraystr转化为字符串数组,以 "," 为标志
				StringTokenizer ssvalue = new StringTokenizer(valuearraystr,
						",", false);
				String valuename = "";

				int ii = 0;
				while (ssfield.hasMoreElements() && ssfield.hasMoreElements()) {
					fieldname = ssfield.nextElement().toString();
					valuename = ssvalue.nextElement().toString();
					sqlstr = sqlstr + fieldname + "=" + valuename + ",";
					ii = ii + 1;
				}
				// 更新数据表中的数据

				sqlstr = sqlstr.substring(0, sqlstr.length() - 1);

				// 组合where 语句
				sqlstr += " where ";

				StringTokenizer ssfieldCond = new StringTokenizer(
						fieldCondition, ",", false);
				StringTokenizer ssvalueCond = new StringTokenizer(
						valueCondition, ",", false);
				fieldname = "";
				valuename = "";
				ii = 0;
				while (ssfieldCond.hasMoreElements()
						&& ssvalueCond.hasMoreElements()) {
					fieldname = ssfieldCond.nextElement().toString();
					valuename = ssvalueCond.nextElement().toString();
					sqlstr = sqlstr + fieldname + " = " + valuename + " and ";
					ii = ii + 1;
				}

				sqlstr = sqlstr.substring(0, sqlstr.length() - 4);
				System.out.println(sqlstr);
				stmt = conn.createStatement();
				stmt.executeUpdate(sqlstr);
				stmt.close();
			}
		} catch (java.sql.SQLException ex) {
			updatedata_errstr = ex.getMessage();
			updatedata_errcode = ex.getErrorCode();
		} catch (java.lang.Exception ex) {
			updatedata_errstr = ex.getMessage();
			updatedata_errcode = ex.hashCode();
		}
		return updatedata_errcode;
	}
	public void close() {
		if (dataConn != null) {
			try {
				dataConn.close();
			} catch (Exception sqle) {
				
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception sqle) {
				
			}
		}
	}
}