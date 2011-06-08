package com.catic.tool;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author mikko
 * @filename DataConn.java
 * @date 2008-5-30
 */
public class CommonUtil {
	public CommonUtil() {
	}

	/**
	 * ���ļ������byte���
	 */
	public String getByteStr(String filename) {
		String str = "";
		try {
			byte[] bt = filename.getBytes("gbk");
			for (int i = 0; i < bt.length; i++)
				str += bt[i] + "_";
		} catch (Exception e) {
			System.out.println(e + "      :getByteStr");
		}
		return str;
	}

	/**
	 * ��byteת�����ַ�����ԭ��ԭ�����ļ���
	 */
	public String getReturnFileName(String filename) {
		try {
			if (filename == null
					|| (filename != null && filename.indexOf("_") == -1)) {
				return "";
			}
			String a[] = filename.split("_");
			byte b[] = new byte[a.length];

			for (int i = 0; i < a.length; i++) {
				b[i] = Byte.valueOf(a[i]);
			}
			return new String(b, "gbk");
		} catch (Exception e) {
			System.out.println(e + "      :getReturnFileName");
			return "";
		}
	}

	/**
	 * �� null ת��Ϊ ��0������֤�������null
	 * 
	 * @param sqlstr
	 * @return
	 */
	public static String toZeroStr(String str) {
		String strsql = "";
		try {
			if ((str == null) || (str.equals(""))) {
				strsql = "0";
			} else {
				strsql = str;
			}
		} catch (java.lang.Exception e) {
		}
		return strsql;
	}

	// ����������ʽ�������� ������(')���ֺ�(;) �� ע�ͷ���(--)�������滻������ֹSQLע��
	public static String TransactSQLInjection(String str) {
		return str.replaceAll(".*([';]+|(--)+).*", " ");
	}
}
