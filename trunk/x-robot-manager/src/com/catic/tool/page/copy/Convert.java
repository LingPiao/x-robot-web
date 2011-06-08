/*
 * Created on 2005-3-2 TODO To change the template for this generated file go to
 * Window - Preferences - Java - Code Style - Code Templates
 */

package com.catic.tool.page.copy;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author Administrator TODO To change the template for this generated type
 *         comment go to Window - Preferences - Java - Code Style - Code
 *         Templates
 */
public class Convert {

	/**
	 * Logger for this class
	 */

	/**
	 * 字符串数组转换成长整型类型数组
	 * 
	 * @param s
	 *            String[] 字符串数组
	 * @return List
	 */
	public static List stringToList(String[] s) {

		if (s == null) {
			return null;
		}

		int len = s.length;
		List list = new ArrayList();

		for (int i = 0; i < len; i++) {
			Long l;
			try {
				l = Long.valueOf(s[i]);
			} catch (NumberFormatException nfe) {
				continue;
			}
			list.add(l);
		}

		return list;

	}

	/**
	 * 把Nulll转化为空串
	 * 
	 * @param s
	 *            String
	 * @return String
	 */
	public static String NullToString(String s) {

		if (s == null) {
			return "";
		}
		return s;
	}

	/**
	 * 判断字符是否为NUll或空串
	 * 
	 * @param s
	 *            String
	 * @return boolean
	 */
	public static boolean isNull(String s) {

		if (s == null) {
			return true;
		}
		if (s.trim().equals("")) {
			return true;
		}
		return false;
	}

	/**
	 * 换换成UTF-8字符集
	 * 
	 * @param s
	 *            字符串
	 * @return UTF-8字符串
	 */
	public static String toUtf8String(String s) {

		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			// System.out.println(c);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception ex) {

					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}

	/**
	 * 日期按指定的模式转换为字符串
	 * 
	 * @param d
	 *            日期
	 * @param pattern MM 月 mm 分 yyyy/yy 年 dd日，除了月都是小写
	 *            模式
	 * @return 日期字符串
	 */
	public static String dateToString(Date d, String pattern) {

		if (d == null)
			return "";
		String s = "";
		SimpleDateFormat f = new SimpleDateFormat(pattern);
		s = f.format(d);
		return s;
	}

	public static String dateToQuarter(Date d) {

		String quarter = "";
		SimpleDateFormat f = new SimpleDateFormat("MM");
		return quarter;
	}

	/**
	 * 百分数字符串转换成小数
	 * 
	 * @param percent
	 *            百分数字符串
	 * @return double 百分数转换成小数
	 */
	public static double persTOdec(String percent) {

		if (percent == null || percent.equals("") || !percent.endsWith("%"))
			return 0.0;
		String digit = percent.substring(0, percent.length() - 1);
		if (!digit.equals(""))
			return Double.parseDouble(digit) / 100;
		return 0.0;
	}

	//转换编码级
	public static String getStr(Object str) {
		try {
			String temp_p = String.valueOf(str);
			byte[] temp_t = temp_p.getBytes("ISO8859-1");
			String temp = new String(temp_t);
			return temp;
		} catch (Exception e) {
		}
		return "NULL";
	}

	//转换编码级
	public static String getUrl(String str) {
		try {
			String temp_p = str;
			byte[] temp_t = temp_p.getBytes("GB2312");
			String temp = new String(temp_t);
			return temp;
		} catch (Exception e) {
		}
		return "NULL";
	}

	/**
	 * 返回季度的起始日期与截止日期 格式为-MM-dd
	 * 
	 * @param quarter
	 *            季度
	 * @param year
	 *            年度
	 * @return HashMap
	 */
	public static HashMap parseQuarter(String year, String quarter) {

		HashMap map = new HashMap();
		if (isNull(quarter))
			quarter = "1";
		if ("1".equals(quarter)) {
			map.put("START", year + "-01-01");
			map.put("END", year + "-03-31");
		}
		if ("2".equals(quarter)) {
			map.put("START", year + "-04-01");
			map.put("END", year + "-06-30");
		}
		if ("3".equals(quarter)) {
			map.put("START", year + "-07-01");
			map.put("END", year + "-09-30");
		}
		if ("4".equals(quarter)) {
			map.put("START", year + "-10-01");
			map.put("END", year + "-12-31");
		}
		return map;
	}

	/**
	 * 给定日期取所在的季度
	 * 
	 * @param d
	 *            给定日期
	 * @return 返回日期所在季度
	 * @throws ParseException
	 */
	public static String getQuarter(Date d) {

		//取日期所在的年份
		String year = Convert.dateToString(d, "yyyy");
		try {
			if (d
					.compareTo(Convert.stringToDate(year + "-01-01",
							"yyyy-MM-dd")) >= 0
					&& d.compareTo(Convert.stringToDate(year + "-04-01",
							"yyyy-MM-dd")) < 0) {
				return "1";
			}

			else if (d.compareTo(Convert.stringToDate(year + "-04-01",
					"yyyy-MM-dd")) > 0
					&& d.compareTo(Convert.stringToDate(year + "-07-01",
							"yyyy-MM-dd")) < 0) {
				return "2";
			}

			else if (d.compareTo(Convert.stringToDate(year + "-07-01",
					"yyyy-MM-dd")) >= 0
					&& d.compareTo(Convert.stringToDate(year + "-10-01",
							"yyyy-MM-dd")) < 0) {
				return "3";
			}

			else if (d.compareTo(Convert.stringToDate(year + "-10-01",
					"yyyy-MM-dd")) >= 0
					&& d.compareTo(Convert.stringToDate(Integer.parseInt(year)
							+ 1 + "-01-01", "yyyy-MM-dd")) <= 0) {
				return "4";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "1";
		}
		return "1";

	}

	//求每个月最后一天
	public static String getMonthEndDay(int year, int month) {

		if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8
				|| month == 10 || month == 12)
			return "31";

		if (month == 4 || month == 6 || month == 9 || month == 11)
			return "30";

		if (month == 2) {
			if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
				return "29";
			else
				return "28";

		}
		return "30";
	}

	public static Date stringToDate(String s, String patten) {

		if (isNull(s))
			return null;
		SimpleDateFormat df = new SimpleDateFormat(patten);

		try {
			return df.parse(s);
		} catch (ParseException e) {

			e.printStackTrace();
		}
		return null;
	}

	/**
	 *  yyyy-MM-dd hh:mm
	 * @param s
	 * @return
	 */
	public static Timestamp stringToTimestamp(String s) {

		if (isNull(s))
			return null;

		return Timestamp.valueOf(s);

	}

	/**
	 * 格式化双精度数字
	 * @param d 双精度数值
	 * @param maxdigit 保留最大小数位数
	 * @param mindigit 保留最小小数位数
	 * @return 字符串
	 */
	public static String num2Str(double d, int maxdigit, int mindigit) {

		NumberFormat nf = DecimalFormat.getInstance();

		//设置最大小数位
		nf.setMaximumFractionDigits(maxdigit);

		//设置最小小数位
		nf.setMinimumFractionDigits(mindigit);
		return nf.format(d);
	}

	/**
	 * 数字月份变更为汉字月份
	 * 
	 * @param i
	 *            数字
	 * @return 汉字数字
	 */
	public static String num2hz(int month) {

		String smonth = "";
		switch (month) {
		case 1:
			smonth = "一月份";
			break;
		case 2:
			smonth = "二月份";
			break;
		case 3:
			smonth = "三月份";
			break;
		case 4:
			smonth = "四月份";
			break;
		case 5:
			smonth = "五月份";
			break;
		case 6:
			smonth = "六月份";
			break;
		case 7:
			smonth = "七月份";
			break;
		case 8:
			smonth = "八月份";
			break;
		case 9:
			smonth = "九月份";
			break;
		case 10:
			smonth = "十月份";
			break;
		case 11:
			smonth = "十一月份";
			break;
		case 12:
			smonth = "十二月份";
			break;
		default:
			smonth = "零";
			break;
		}
		return smonth;

	}

	/**
	 * 数组转换为字符串 
	 * @param arr Object[] 数组
	 * @param limit String 界限符
	 * @return String 
	 */
	public static String arr2Str(Object[] arr, String limit) {
		if (arr == null)
			return "";

		String str = "";
		for (int i = 0; i < arr.length; i++) {
			String o = arr[i].toString();
			str += o;
			if (i < arr.length - 1)
				str += limit;
		}
		return str;
	}

	/**
	 * 根据指定的分隔符把字符串分隔为sql形式的逗号分隔符字符串
	 * @param str String 要分隔的字符串
	 * @param limit String 字符串分隔符
	 * @return String
	 */
	public static String str2Sqlstr(String str, String limit) {
		if (str == null)
			return "";
		String[] strs = str.split(limit);
		String sqlStr = "";
		for (int i = 0; i < strs.length; i++) {
			sqlStr += "'" + strs[i] + "'";
			if (i < strs.length - 1)
				sqlStr += ",";
		}
		return sqlStr;
	}

	// 根据13位id格式化时间2007-01-25 17:43:09
	public String getFormatTime(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = df.format(date);

		return strDate;
	}

	// 根据13位id返回14位时间
	public String get14COfDate(String id13) {
		java.util.Date dat = new java.util.Date(System.currentTimeMillis());
		try {
			Long lCurrTime = new Long(id13);
			dat = new java.util.Date(lCurrTime.longValue());
		} catch (NumberFormatException ex) {
			System.out.println(ex.getMessage());
		}

		java.util.Calendar cf = java.util.Calendar.getInstance();
		cf.setTime(dat);
		String month = new String("00"
				+ new Integer(cf.get(cf.MONTH) + 1).toString());
		String day = new String("00"
				+ new Integer(cf.get(cf.DAY_OF_MONTH)).toString());
		String hour = new String("00"
				+ new Integer(cf.get(cf.HOUR_OF_DAY)).toString());
		String min = new String("00"
				+ new Integer(cf.get(cf.MINUTE)).toString());
		String sec = new String("00"
				+ new Integer(cf.get(cf.SECOND)).toString());
		return new Integer(cf.get(cf.YEAR)).toString()
				+ month.substring(month.length() - 2, month.length())
				+ day.substring(day.length() - 2, day.length())
				+ hour.substring(hour.length() - 2, hour.length())
				+ min.substring(min.length() - 2, min.length())
				+ sec.substring(sec.length() - 2, sec.length());

	}

	// 根据日期时间得到13位id
	public String get13DateByStr(String date) {
		java.util.Calendar cf = java.util.Calendar.getInstance();
		int iYear = 2003;
		int iMonth = 0;
		int iDay = 1;
		int iHour = 1;
		int iMin = 1;
		int iSec = 1;
		switch (date.length()) {
		case 8:
		case 9:
			int b = date.indexOf("-");
			int e = date.indexOf("-", b + 1);
			iYear = Integer.parseInt(date.substring(0, 4));
			iMonth = Integer.parseInt(date.substring(b + 1, e));
			iDay = Integer.parseInt(date.substring(e + 1));
			cf.set(iYear, iMonth, iDay, 0, 0, 0);
			break;
		case 10:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			cf.set(iYear, iMonth, iDay, 0, 0, 0);
			break;
		case 13:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			iHour = new Integer(date.substring(11, 13)).intValue();
			cf.set(iYear, iMonth, iDay, iHour, 0, 0);
			break;
		case 16:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			iHour = new Integer(date.substring(11, 13)).intValue();
			iMin = new Integer(date.substring(14, 16)).intValue();
			cf.set(iYear, iMonth, iDay, iHour, iMin, 0);
			break;
		case 19:
			iYear = new Integer(date.substring(0, 4)).intValue();
			iMonth = new Integer(date.substring(5, 7)).intValue() - 1;
			iDay = new Integer(date.substring(8, 10)).intValue();
			iHour = new Integer(date.substring(11, 13)).intValue();
			iMin = new Integer(date.substring(14, 16)).intValue();
			iSec = new Integer(date.substring(17, 19)).intValue();
			cf.set(iYear, iMonth, iDay, iHour, iMin, iSec);
			break;
		default:
			cf.setTime(new java.util.Date(System.currentTimeMillis()));

		}
		return new Long(cf.getTime().getTime()).toString();

	}

	// 根据毫秒数取得 小时 分
	public String getHHmm(String id13) {

		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("HHmm");
		String strDate = df.format(date);

		return strDate;
	}

	// 根据毫秒数取得 年月日
	public String getyyyyMMdd(String id13) {

		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);

		return strDate;
	}

	// 根据毫秒取得第二天 年月日
	public String getNextyyyyMMdd(String id13) {
		Date date = new Date(Long.parseLong(id13) + (1 * 24 * 60 * 60 * 1000));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);

		return strDate;
	}

	// 根据毫秒取得 年
	public String getyyyy(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		String strDate = df.format(date);

		return strDate;
	}

	// 根据毫秒取得 月
	public String getMM(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("MM");
		String strDate = df.format(date);

		return strDate;
	}

	// 根据毫秒取得 日
	public String getdd(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("dd");
		String strDate = df.format(date);

		return strDate;
	}

	// 根据毫秒取得 年月日小时分秒
	public String getyyyyMMddHHmmss(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String strDate = df.format(date);

		return strDate;
	}

	public String get14Time(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String strDate = df.format(date);

		return strDate;
	}

	// 计算两毫秒之间相差天数
	public int getDays(String id1, String id2) {

		int days = 0;
		java.util.GregorianCalendar calendar1 = new java.util.GregorianCalendar(
				Integer.parseInt(getyyyy(id1)), Integer.parseInt(getMM(id1)),
				Integer.parseInt(getdd(id1)));
		java.util.GregorianCalendar calendar2 = new java.util.GregorianCalendar(
				Integer.parseInt(getyyyy(id2)), Integer.parseInt(getMM(id2)),
				Integer.parseInt(getdd(id2)));
		days = Integer.parseInt((calendar2.getTimeInMillis() - calendar1
				.getTimeInMillis())
				/ (24 * 60 * 60 * 1000) + "");// 相差天数
		return days;
	}

	// 分步时长
	public Long getUserTime(String curid, String fromquestid) {

		String worktime = "08001800";

		String beginWork = worktime.substring(0, 4);// 上班时间0800

		String endWork = worktime.substring(4, 8);// 下班时间1700

		String curRightTime = "";

		String fromRightTime = "";

		if (Integer.parseInt(getHHmm(curid)) < Integer.parseInt(beginWork)) {// 当天上班之前归到当天上班时间
			curRightTime = getyyyyMMdd(curid) + "-" + beginWork.substring(0, 2)
					+ "-00-00";
		} else if (Integer.parseInt(getHHmm(curid)) > Integer.parseInt(endWork)) {
			curRightTime = getNextyyyyMMdd(curid) + "-"
					+ beginWork.substring(0, 2) + "-00-00";// 当天下班之后归到第二天上班时间
		} else {
			curRightTime = getyyyyMMddHHmmss(curid);// 正常上班时间
		}

		if (Integer.parseInt(getHHmm(fromquestid)) < Integer
				.parseInt(beginWork)) {// 当天上班之前归到当天上班时间
			fromRightTime = getyyyyMMdd(fromquestid) + "-"
					+ beginWork.substring(0, 2) + "-00-00";
		} else if (Integer.parseInt(getHHmm(fromquestid)) > Integer
				.parseInt(endWork)) {
			fromRightTime = getNextyyyyMMdd(fromquestid) + "-"
					+ beginWork.substring(0, 2) + "-00-00";// 当天下班之后归到第二天上班时间
		} else {
			fromRightTime = getyyyyMMddHHmmss(fromquestid);// 正常上班时间
		}

		int days = getDays(get13DateByStr(fromRightTime),
				get13DateByStr(curRightTime));// 正确时间相差天数

		long time = ((Long.parseLong(get13DateByStr(curRightTime)) - Long
				.parseLong(get13DateByStr(fromRightTime))) / (1000 * 60))
				- (days * 900);

		if (time <= 0) {
			time = 1;
		}

		return new Long(time);

	}

	//计算两个日期之间相差小时数

	public static float getUseHours(String fromTime, Date currDate) {

		fromTime = fromTime.substring(0, 4) + "/" + fromTime.substring(4, 6)
				+ "/" + fromTime.substring(6, 8) + " "
				+ fromTime.substring(8, 10) + ":" + fromTime.substring(10, 12)
				+ ":" + fromTime.substring(12, 14);
		Date formDate = new Date(fromTime);
		return (float) (currDate.getTime() - formDate.getTime())
				/ (1000 * 60 * 60);

	}

}