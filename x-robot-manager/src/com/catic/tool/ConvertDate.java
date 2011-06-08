package com.catic.tool;

import java.util.*;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2004
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author 梅晓冬
 * @version 1.0
 */

public class ConvertDate {

	public ConvertDate() {
	}

	/**
	 * @param str
	 *            格式要求:yyyy,m(mm),d(dd); 如：2002-01-02，2002-1-2，2002-2-15
	 * @return 成功返回日期，失败返回null;
	 */
	public Date stringToDate(String str) {
		String strFormat = "yyyy-MM-dd HH:mm:ss";

		int iLen = str.length();
		if (str == null) {
			return null;
		} else {
			iLen = str.length();
		}
		// 当日期格式不正确的时候保证不会出错
		// KEN 2006-02-24
		if (iLen == 10) {
			strFormat = "yyyy-MM-dd";
		} else if (iLen == 16) {
			strFormat = "yyyy-MM-dd HH:mm";
		} else if (iLen == 19) {
			strFormat = "yyyy-MM-dd HH:mm:ss";
		}

		SimpleDateFormat sdFormat = new SimpleDateFormat(strFormat);
		Date date = new Date();
		try {
			date = sdFormat.parse(str);
		} catch (Exception e) {
			// System.out.println("Error="+e);
			return null;
		}
		return date;
	}

	public Date stringToDate(String str, String strFormat) {
		SimpleDateFormat sdFormat = new SimpleDateFormat(strFormat);
		Date date = new Date();
		try {
			date = sdFormat.parse(str);
		} catch (Exception e) {
			return null;
		}
		return date;
	}

	public String dateToYMD(Date dt) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
		String str = "";
		try {
			str = sdFormat.format(dt);
		} catch (Exception e) {
			return "";
		}
		if (str.equals("1900-01-01")) {
			str = "";
		}

		return str;
	}

	public String dateToString(Date dt) {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String str = "";
		try {
			str = sdFormat.format(dt);
		} catch (Exception e) {
			return "";
		}
		if (str.equals("1900-01-01 00:00")) {
			str = "";
		}

		return str;
	}

	public String dateToString(Date dt, String strFormat) {
		SimpleDateFormat sdFormat = new SimpleDateFormat(strFormat);
		String str = "";
		try {
			str = sdFormat.format(dt);
		} catch (Exception e) {
			return "";
		}
		if (str.equals("1900-01-01 00:00")) {
			str = "";
		}

		return str;
	}

	// 计算两个时间相差的天数
	public int interval(Date first, Date last) {
		int inter = 0;
		// 限制为yyyy-mm-dd之间的比较
		Date dt_first = stringToDate(dateToYMD(first));
		Date dt_last = stringToDate(dateToYMD(last));
		inter = (int) ((dt_last.getTime() - dt_first.getTime()) / (3600 * 24000));
		return inter;
	}
	 public static String getMondayOfThisWeek() {
		  Calendar c = Calendar.getInstance();
		  int dayofweek = c.get(Calendar.DAY_OF_WEEK) - 1;
		  if (dayofweek == 0)
		   dayofweek = 7;
		  c.add(Calendar.DATE, -dayofweek + 1);
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  return sdf.format(c.getTime());
		 }

		/**
		  *得到本周周日 
		  * @return yyyy-MM-dd
		  */
		 public static String getSundayOfThisWeek() {
		  Calendar c = Calendar.getInstance();
		  int dayofweek = c.get(Calendar.DAY_OF_WEEK) - 1;
		  if (dayofweek == 0)
		   dayofweek = 7;
		  c.add(Calendar.DATE, -dayofweek + 7);
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		  return sdf.format(c.getTime());
		 }
	public static void main(String[] args) {
		ConvertDate convertDate = new ConvertDate();
		System.out.println(convertDate.getSundayOfThisWeek());
		// "yyyy年MM月dd日 HH:mm"));
		// System.out.println(convertDate.stringToDate("2005-01-10"));
	}

}
