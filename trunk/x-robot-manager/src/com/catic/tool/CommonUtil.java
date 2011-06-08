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
	 * 将文件名变成byte组合
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
	 * 将byte转换的字符串还原成原来的文件名
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
	 * 把 null 转变为 “0”；保证不会出现null
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

	// 采用正则表达式将包含有 单引号(')，分号(;) 和 注释符号(--)的语句给替换掉来防止SQL注入
	public static String TransactSQLInjection(String str) {
		return str.replaceAll(".*([';]+|(--)+).*", " ");
	}
}
