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
	 * �ַ�������ת���ɳ�������������
	 * 
	 * @param s
	 *            String[] �ַ�������
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
	 * ��Nulllת��Ϊ�մ�
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
	 * �ж��ַ��Ƿ�ΪNUll��մ�
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
	 * ������UTF-8�ַ���
	 * 
	 * @param s
	 *            �ַ���
	 * @return UTF-8�ַ���
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
	 * ���ڰ�ָ����ģʽת��Ϊ�ַ���
	 * 
	 * @param d
	 *            ����
	 * @param pattern MM �� mm �� yyyy/yy �� dd�գ������¶���Сд
	 *            ģʽ
	 * @return �����ַ���
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
	 * �ٷ����ַ���ת����С��
	 * 
	 * @param percent
	 *            �ٷ����ַ���
	 * @return double �ٷ���ת����С��
	 */
	public static double persTOdec(String percent) {

		if (percent == null || percent.equals("") || !percent.endsWith("%"))
			return 0.0;
		String digit = percent.substring(0, percent.length() - 1);
		if (!digit.equals(""))
			return Double.parseDouble(digit) / 100;
		return 0.0;
	}

	//ת�����뼶
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

	//ת�����뼶
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
	 * ���ؼ��ȵ���ʼ�������ֹ���� ��ʽΪ-MM-dd
	 * 
	 * @param quarter
	 *            ����
	 * @param year
	 *            ���
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
	 * ��������ȡ���ڵļ���
	 * 
	 * @param d
	 *            ��������
	 * @return �����������ڼ���
	 * @throws ParseException
	 */
	public static String getQuarter(Date d) {

		//ȡ�������ڵ����
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

	//��ÿ�������һ��
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
	 * ��ʽ��˫��������
	 * @param d ˫������ֵ
	 * @param maxdigit �������С��λ��
	 * @param mindigit ������СС��λ��
	 * @return �ַ���
	 */
	public static String num2Str(double d, int maxdigit, int mindigit) {

		NumberFormat nf = DecimalFormat.getInstance();

		//�������С��λ
		nf.setMaximumFractionDigits(maxdigit);

		//������СС��λ
		nf.setMinimumFractionDigits(mindigit);
		return nf.format(d);
	}

	/**
	 * �����·ݱ��Ϊ�����·�
	 * 
	 * @param i
	 *            ����
	 * @return ��������
	 */
	public static String num2hz(int month) {

		String smonth = "";
		switch (month) {
		case 1:
			smonth = "һ�·�";
			break;
		case 2:
			smonth = "���·�";
			break;
		case 3:
			smonth = "���·�";
			break;
		case 4:
			smonth = "���·�";
			break;
		case 5:
			smonth = "���·�";
			break;
		case 6:
			smonth = "���·�";
			break;
		case 7:
			smonth = "���·�";
			break;
		case 8:
			smonth = "���·�";
			break;
		case 9:
			smonth = "���·�";
			break;
		case 10:
			smonth = "ʮ�·�";
			break;
		case 11:
			smonth = "ʮһ�·�";
			break;
		case 12:
			smonth = "ʮ���·�";
			break;
		default:
			smonth = "��";
			break;
		}
		return smonth;

	}

	/**
	 * ����ת��Ϊ�ַ��� 
	 * @param arr Object[] ����
	 * @param limit String ���޷�
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
	 * ����ָ���ķָ������ַ����ָ�Ϊsql��ʽ�Ķ��ŷָ����ַ���
	 * @param str String Ҫ�ָ����ַ���
	 * @param limit String �ַ����ָ���
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

	// ����13λid��ʽ��ʱ��2007-01-25 17:43:09
	public String getFormatTime(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String strDate = df.format(date);

		return strDate;
	}

	// ����13λid����14λʱ��
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

	// ��������ʱ��õ�13λid
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

	// ���ݺ�����ȡ�� Сʱ ��
	public String getHHmm(String id13) {

		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("HHmm");
		String strDate = df.format(date);

		return strDate;
	}

	// ���ݺ�����ȡ�� ������
	public String getyyyyMMdd(String id13) {

		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);

		return strDate;
	}

	// ���ݺ���ȡ�õڶ��� ������
	public String getNextyyyyMMdd(String id13) {
		Date date = new Date(Long.parseLong(id13) + (1 * 24 * 60 * 60 * 1000));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = df.format(date);

		return strDate;
	}

	// ���ݺ���ȡ�� ��
	public String getyyyy(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		String strDate = df.format(date);

		return strDate;
	}

	// ���ݺ���ȡ�� ��
	public String getMM(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("MM");
		String strDate = df.format(date);

		return strDate;
	}

	// ���ݺ���ȡ�� ��
	public String getdd(String id13) {
		Date date = new Date(Long.parseLong(id13));
		SimpleDateFormat df = new SimpleDateFormat("dd");
		String strDate = df.format(date);

		return strDate;
	}

	// ���ݺ���ȡ�� ������Сʱ����
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

	// ����������֮���������
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
				/ (24 * 60 * 60 * 1000) + "");// �������
		return days;
	}

	// �ֲ�ʱ��
	public Long getUserTime(String curid, String fromquestid) {

		String worktime = "08001800";

		String beginWork = worktime.substring(0, 4);// �ϰ�ʱ��0800

		String endWork = worktime.substring(4, 8);// �°�ʱ��1700

		String curRightTime = "";

		String fromRightTime = "";

		if (Integer.parseInt(getHHmm(curid)) < Integer.parseInt(beginWork)) {// �����ϰ�֮ǰ�鵽�����ϰ�ʱ��
			curRightTime = getyyyyMMdd(curid) + "-" + beginWork.substring(0, 2)
					+ "-00-00";
		} else if (Integer.parseInt(getHHmm(curid)) > Integer.parseInt(endWork)) {
			curRightTime = getNextyyyyMMdd(curid) + "-"
					+ beginWork.substring(0, 2) + "-00-00";// �����°�֮��鵽�ڶ����ϰ�ʱ��
		} else {
			curRightTime = getyyyyMMddHHmmss(curid);// �����ϰ�ʱ��
		}

		if (Integer.parseInt(getHHmm(fromquestid)) < Integer
				.parseInt(beginWork)) {// �����ϰ�֮ǰ�鵽�����ϰ�ʱ��
			fromRightTime = getyyyyMMdd(fromquestid) + "-"
					+ beginWork.substring(0, 2) + "-00-00";
		} else if (Integer.parseInt(getHHmm(fromquestid)) > Integer
				.parseInt(endWork)) {
			fromRightTime = getNextyyyyMMdd(fromquestid) + "-"
					+ beginWork.substring(0, 2) + "-00-00";// �����°�֮��鵽�ڶ����ϰ�ʱ��
		} else {
			fromRightTime = getyyyyMMddHHmmss(fromquestid);// �����ϰ�ʱ��
		}

		int days = getDays(get13DateByStr(fromRightTime),
				get13DateByStr(curRightTime));// ��ȷʱ���������

		long time = ((Long.parseLong(get13DateByStr(curRightTime)) - Long
				.parseLong(get13DateByStr(fromRightTime))) / (1000 * 60))
				- (days * 900);

		if (time <= 0) {
			time = 1;
		}

		return new Long(time);

	}

	//������������֮�����Сʱ��

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