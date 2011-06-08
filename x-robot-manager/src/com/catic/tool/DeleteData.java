package com.catic.tool;

import java.sql.*;
import java.util.*;

public class DeleteData {
	// 传进来的参数
	private DataConn dataConn;

	private Connection conn = null;

	private java.sql.ResultSet rs = null;

	private java.sql.Statement stmt = null;

	private String sqlstr = "";

	// 对外的参数
	private int deletedata_errcode = 0;

	private String deletedata_errstr = "";

	public DeleteData() {

	}

	/**
	 * 构造函数DeleteData(DataConn)获得数据库的一个连接 参数为数据库连接类DataConn的一个实例
	 */
	public DeleteData(DataConn dataConnection) {
		dataConn = dataConnection;
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
	 * 方法getErrorMessage返回执行delete操作的错误信息
	 * 
	 * @return
	 */
	public String getErrorMessage() {
		return deletedata_errstr;
	}

	/**
	 * 方法getErrorMessage返回执行delete操作的错误代码
	 * 
	 * @return
	 */
	public int getErrorCode() {
		return deletedata_errcode;
	}

	/**
	 * 方法deleteData（表名，条件）对表，字段及值进行合法检查后进行删除操作；
	 * 
	 * @param tablenamestr
	 * @param conditionstr
	 * @return 0为删除成功，其他为失败；
	 */
	public int delete(String tablenamestr, String conditionstr) {
		deletedata_errcode = 0;
		deletedata_errstr = "";
		boolean flag = true;
		try {
			if (conn != null) {
				// 删除数据表中的数据
				if (flag) {
					sqlstr = "  delete   from  " + tablenamestr + "   where  ";
					sqlstr = sqlstr + conditionstr;
					System.out.println(sqlstr);
					stmt = conn.createStatement();
					stmt.executeUpdate(sqlstr);
					stmt.close();
				}
			}
		} catch (java.sql.SQLException ex) {
			deletedata_errstr = ex.getMessage();
			deletedata_errcode = ex.getErrorCode();
		} catch (java.lang.Exception ex) {
			deletedata_errstr = ex.getMessage();
			deletedata_errcode = ex.hashCode();
		}
		//System.out.println(deletedata_errstr);
		return deletedata_errcode;

	}

	public int delete(String s) {
		deletedata_errcode = 0;
		deletedata_errstr = "";
		boolean flag = true;
		try {
			if (conn != null) {
				// 删除数据表中的数据
				if (flag) {

					// System.out.println(s);
					stmt = conn.createStatement();
					stmt.executeUpdate(s);
					stmt.close();
				}
			}
		} catch (java.sql.SQLException ex) {
			deletedata_errstr = ex.getMessage();
			deletedata_errcode = ex.getErrorCode();
		} catch (java.lang.Exception ex) {
			deletedata_errstr = ex.getMessage();
			deletedata_errcode = ex.hashCode();
		}
		return deletedata_errcode;

	}

	/**
	 * 方法deleteData（表名，字段串，值串）对表，字段及值进行合法检查后进行删除操作；
	 * 
	 * @param tablenamestr
	 * @param fieldarraystr
	 * @param valuearraystr
	 * @return 0为删除成功，其他为失败；
	 */
	// 向表中删除数据
	public int delete(String tablenamestr, String fieldarraystr,
			String valuearraystr) {
		deletedata_errcode = 0;
		deletedata_errstr = "";
		boolean flag = true;
		try {
			if (conn != null) {

				// 删除数据表中的数据
				if (flag) {
					sqlstr = "  delete   from  " + tablenamestr + "   where  ";

					// 将fieldarraystr转化为字符串数组,以 "," 为标志
					StringTokenizer ssfield = new StringTokenizer(
							fieldarraystr, ",", false);
					String fieldname = "";

					// 将 valuearraystr转化为字符串数组,以 "," 为标志
					StringTokenizer ssvalue = new StringTokenizer(
							valuearraystr, ",", false);
					String valuename = "";

					int ii = 0;
					while (ssfield.hasMoreElements()
							&& ssfield.hasMoreElements()) {
						fieldname = ssfield.nextElement().toString();
						valuename = ssvalue.nextElement().toString();
						sqlstr = sqlstr + "  " + fieldname + " = " + valuename
								+ "  and";
						ii = ii + 1;
					}
					// 删除数据表中的数据
					sqlstr = sqlstr.substring(0, sqlstr.length() - 3);
					// System.out.println(sqlstr);
					stmt = conn.createStatement();
					stmt.executeUpdate(sqlstr);
					stmt.close();
				}
			}
		} catch (java.sql.SQLException ex) {
			deletedata_errstr = ex.getMessage();
			deletedata_errcode = ex.getErrorCode();
		} catch (java.lang.Exception ex) {
			deletedata_errstr = ex.getMessage();
			deletedata_errcode = ex.hashCode();
		}
		return deletedata_errcode;
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