package com.catic.tool;

/**
 * @author mikko
 * @filename DataConn.java
 * @date 2008-5-30
 */

import java.sql.*;
import java.io.*;

public class DataConn {
	// 采用jdbc-odbc
	protected static String sDBDriver = "";

	protected static String sDBUrl = "";

	protected static String sDBUser = "";

	protected static String sDBPassword = "";

	private static boolean initFlag = false;

	private Connection conn = null;

	private int dataconn_errcode = 0;

	private String dataconn_errstr = "";

	private String strMessage = "";

	public DataConn() {
		try {
			if (!initFlag) {

				getDbConfig();
			}
			setConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			dataconn_errstr = "读数据库配置文件出错：" + e.getMessage();
		}
		// 建立连接
	}

	private void getDbConfig() throws Exception {
		try {
			initFlag = true;

			// 数据库连接信息
			if (initFlag) {
				ConfigInfo configInfo = Config.getConfigInfo();
				sDBDriver = configInfo.getDriver();

				sDBUrl = configInfo.getUrl();
				sDBUser = configInfo.getUser();
				sDBPassword = configInfo.getPassword();

			}
		} catch (Exception pce) {
			dataconn_errstr = "读数据库配置文件出错：" + pce.getMessage();
			System.out.println(pce);
		}

	}

	public DataConn(String driver, String url, String user, String password) {
		sDBDriver = driver;
		sDBUrl = url;
		sDBUser = user;
		sDBPassword = password;

		// 建立连接
		setConnection();
	}

	public void close() {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException sqle) {
				dataconn_errstr = sqle.getMessage();
				dataconn_errcode = sqle.getErrorCode();
			}
		}
	}

	/**
	 * 连接数据库，设置public成员conn 同时也设置了数据库连接错误信息
	 */
	protected void setConnection() {
		conn = null;
		dataconn_errstr = "";
		dataconn_errcode = 0;
		try {
			// 采用jdbc-odbc
			// System.out.println("---------开始数据库连接--------");
			dataconn_errcode = 0;
			Class.forName(sDBDriver);
			conn = DriverManager.getConnection(sDBUrl, sDBUser, sDBPassword);

			// System.out.println("---------数据库连接成功--------");
		} catch (java.lang.ClassNotFoundException e) {
			System.out.println("创建数据库连接失败，驱动程序未找到：" + e.getMessage());
			// System.out.println(toString());
			dataconn_errstr = e.getMessage();
			dataconn_errcode = e.hashCode();
		} catch (SQLException e) {
			System.out
					.println("创建数据库连接失败,请确认连接方式、用户名、密码是否正确:" + e.getMessage());
			// System.out.println(toString());
			dataconn_errstr = e.getMessage();
			dataconn_errcode = e.getErrorCode();
		} catch (java.lang.NullPointerException enull) {
			System.out.println("创建数据库连接失败：" + enull.getMessage());
			dataconn_errstr = enull.getMessage();
			dataconn_errcode = enull.hashCode();
		} catch (Exception ex) {
			System.out.println("创建数据库连接失败：" + ex.getMessage());
			dataconn_errstr = ex.getMessage();
			dataconn_errcode = ex.hashCode();
		}
	}

	/**
	 * 通过getConnection()获得一个数据库连接
	 */
	public Connection getConnection() {
		return conn;
	}

	/**
	 * 通过getErrorMessage()获取数据库错误信息
	 */
	public String getErrorMessage() {
		return dataconn_errstr;
	}

	/**
	 * 通过getErrorCode()获取数据库错误代码
	 */
	public int getErrorCode() {
		return dataconn_errcode;
	}

	public String toString() {
		String s = null;
		s = "sDBDriver is： " + sDBDriver + "\n" + "sDBUrl is: " + sDBUrl + "\n"
				+ "sDBUser is: " + sDBUser + "\n" + "sDBPassword is: "
				+ sDBPassword + "\n";
		return s;
	}

	public String curPath() {
		String s = null;
		int index = 0;
		File file = new File("");
		s = file.getAbsolutePath();
		index = s.lastIndexOf("\\");
		s = s.substring(0, index);
		return s;
	}

	public void reset() {
		sDBDriver = "";
		sDBUrl = "";
		sDBUser = "";
		sDBPassword = "";
	}
}