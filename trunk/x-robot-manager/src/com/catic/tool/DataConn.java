package com.catic.tool;

/**
 * @author mikko
 * @filename DataConn.java
 * @date 2008-5-30
 */

import java.sql.*;
import java.io.*;

public class DataConn {
	// ����jdbc-odbc
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
			dataconn_errstr = "�����ݿ������ļ�����" + e.getMessage();
		}
		// ��������
	}

	private void getDbConfig() throws Exception {
		try {
			initFlag = true;

			// ���ݿ�������Ϣ
			if (initFlag) {
				ConfigInfo configInfo = Config.getConfigInfo();
				sDBDriver = configInfo.getDriver();

				sDBUrl = configInfo.getUrl();
				sDBUser = configInfo.getUser();
				sDBPassword = configInfo.getPassword();

			}
		} catch (Exception pce) {
			dataconn_errstr = "�����ݿ������ļ�����" + pce.getMessage();
			System.out.println(pce);
		}

	}

	public DataConn(String driver, String url, String user, String password) {
		sDBDriver = driver;
		sDBUrl = url;
		sDBUser = user;
		sDBPassword = password;

		// ��������
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
	 * �������ݿ⣬����public��Աconn ͬʱҲ���������ݿ����Ӵ�����Ϣ
	 */
	protected void setConnection() {
		conn = null;
		dataconn_errstr = "";
		dataconn_errcode = 0;
		try {
			// ����jdbc-odbc
			// System.out.println("---------��ʼ���ݿ�����--------");
			dataconn_errcode = 0;
			Class.forName(sDBDriver);
			conn = DriverManager.getConnection(sDBUrl, sDBUser, sDBPassword);

			// System.out.println("---------���ݿ����ӳɹ�--------");
		} catch (java.lang.ClassNotFoundException e) {
			System.out.println("�������ݿ�����ʧ�ܣ���������δ�ҵ���" + e.getMessage());
			// System.out.println(toString());
			dataconn_errstr = e.getMessage();
			dataconn_errcode = e.hashCode();
		} catch (SQLException e) {
			System.out
					.println("�������ݿ�����ʧ��,��ȷ�����ӷ�ʽ���û����������Ƿ���ȷ:" + e.getMessage());
			// System.out.println(toString());
			dataconn_errstr = e.getMessage();
			dataconn_errcode = e.getErrorCode();
		} catch (java.lang.NullPointerException enull) {
			System.out.println("�������ݿ�����ʧ�ܣ�" + enull.getMessage());
			dataconn_errstr = enull.getMessage();
			dataconn_errcode = enull.hashCode();
		} catch (Exception ex) {
			System.out.println("�������ݿ�����ʧ�ܣ�" + ex.getMessage());
			dataconn_errstr = ex.getMessage();
			dataconn_errcode = ex.hashCode();
		}
	}

	/**
	 * ͨ��getConnection()���һ�����ݿ�����
	 */
	public Connection getConnection() {
		return conn;
	}

	/**
	 * ͨ��getErrorMessage()��ȡ���ݿ������Ϣ
	 */
	public String getErrorMessage() {
		return dataconn_errstr;
	}

	/**
	 * ͨ��getErrorCode()��ȡ���ݿ�������
	 */
	public int getErrorCode() {
		return dataconn_errcode;
	}

	public String toString() {
		String s = null;
		s = "sDBDriver is�� " + sDBDriver + "\n" + "sDBUrl is: " + sDBUrl + "\n"
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