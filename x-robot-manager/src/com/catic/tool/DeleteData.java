package com.catic.tool;

import java.sql.*;
import java.util.*;

public class DeleteData {
	// �������Ĳ���
	private DataConn dataConn;

	private Connection conn = null;

	private java.sql.ResultSet rs = null;

	private java.sql.Statement stmt = null;

	private String sqlstr = "";

	// ����Ĳ���
	private int deletedata_errcode = 0;

	private String deletedata_errstr = "";

	public DeleteData() {

	}

	/**
	 * ���캯��DeleteData(DataConn)������ݿ��һ������ ����Ϊ���ݿ�������DataConn��һ��ʵ��
	 */
	public DeleteData(DataConn dataConnection) {
		dataConn = dataConnection;
		conn = dataConn.getConnection();
	}

	/**
	 * ����setErrorMessage :�������ݿ����ı�����Ϣ
	 * 
	 * @param dataConn��ʵ��
	 */
	private void setErrorMessage() {
	}

	/**
	 * ����getErrorMessage����ִ��delete�����Ĵ�����Ϣ
	 * 
	 * @return
	 */
	public String getErrorMessage() {
		return deletedata_errstr;
	}

	/**
	 * ����getErrorMessage����ִ��delete�����Ĵ������
	 * 
	 * @return
	 */
	public int getErrorCode() {
		return deletedata_errcode;
	}

	/**
	 * ����deleteData���������������Ա��ֶμ�ֵ���кϷ��������ɾ��������
	 * 
	 * @param tablenamestr
	 * @param conditionstr
	 * @return 0Ϊɾ���ɹ�������Ϊʧ�ܣ�
	 */
	public int delete(String tablenamestr, String conditionstr) {
		deletedata_errcode = 0;
		deletedata_errstr = "";
		boolean flag = true;
		try {
			if (conn != null) {
				// ɾ�����ݱ��е�����
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
				// ɾ�����ݱ��е�����
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
	 * ����deleteData���������ֶδ���ֵ�����Ա��ֶμ�ֵ���кϷ��������ɾ��������
	 * 
	 * @param tablenamestr
	 * @param fieldarraystr
	 * @param valuearraystr
	 * @return 0Ϊɾ���ɹ�������Ϊʧ�ܣ�
	 */
	// �����ɾ������
	public int delete(String tablenamestr, String fieldarraystr,
			String valuearraystr) {
		deletedata_errcode = 0;
		deletedata_errstr = "";
		boolean flag = true;
		try {
			if (conn != null) {

				// ɾ�����ݱ��е�����
				if (flag) {
					sqlstr = "  delete   from  " + tablenamestr + "   where  ";

					// ��fieldarraystrת��Ϊ�ַ�������,�� "," Ϊ��־
					StringTokenizer ssfield = new StringTokenizer(
							fieldarraystr, ",", false);
					String fieldname = "";

					// �� valuearraystrת��Ϊ�ַ�������,�� "," Ϊ��־
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
					// ɾ�����ݱ��е�����
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