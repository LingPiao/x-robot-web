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
	 * ����setErrorMessage :�������ݿ����ı�����Ϣ
	 * 
	 * @param dataConn��ʵ��
	 */
	private void setErrorMessage() {
	}

	/**
	 * ����getErrorMessage����ִ��Update�����Ĵ�����Ϣ
	 * 
	 * @return
	 */
	public String getErrorMessage() {
		return updatedata_errstr;
	}

	/**
	 * ����getErrorMessage����ִ��Update�����Ĵ������
	 * 
	 * @return
	 */
	public int getErrorCode() {
		return updatedata_errcode;
	}

	/**
	 * ����update(����, �޸ĵ��ֶμ�ֵ��ɵ����ֶδ�,����ֵ) ����и�������
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
				// �����ݱ��������
				sqlstr = " update  " + tablenamestr + "  set  ";
				// �������ݱ��е�����
				sqlstr = sqlstr + updatestr;
				// ���where ���
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
	 * ����update(�������޸ĵ��ֶδ����޸ĵ�ֵ�������ֶδ�������ֵ)����и�������
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
				// �����ݱ��������
				sqlstr = " update  " + tablenamestr + "  set  ";

				// ��fieldarraystrת��Ϊ�ַ�������,�� "," Ϊ��־
				StringTokenizer ssfield = new StringTokenizer(fieldarraystr,
						",", false);
				String fieldname = "";

				// �� valuearraystrת��Ϊ�ַ�������,�� "," Ϊ��־
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
				// �������ݱ��е�����

				sqlstr = sqlstr.substring(0, sqlstr.length() - 1);

				// ���where ���
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