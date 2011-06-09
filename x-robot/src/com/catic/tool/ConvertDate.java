package com.catic.tool;

import java.util.ArrayList;
import java.util.*;
import java.util.Date;
import java.util.List;
import java.text.SimpleDateFormat;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2008</p>
 * <p>Company: </p>
 * @author ÷����
 * @version 1.0
 */

public class ConvertDate {

	public ConvertDate() {

	}

	/**
	 * @param str  ��ʽҪ��:yyyy,m(mm),d(dd); �磺2002-01-02��2002-1-2��2002-2-15
	 * @return  �ɹ��������ڣ�ʧ�ܷ���null;
	 */
	public Date stringToDate(String str) {
		String strFormat = "yyyy-MM-dd HH:mm:ss";

		int iLen = str.length();
		if (str == null) {
			return null;
		} else {
			iLen = str.length();
		}
		//�����ڸ�ʽ����ȷ��ʱ��֤�������
		//KEN 2006-02-24
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

	//��������ʱ����������
	public int interval(Date first, Date last) {
		int inter = 0;
		//����Ϊyyyy-mm-dd֮��ıȽ�
		Date dt_first = stringToDate(dateToYMD(first));
		Date dt_last = stringToDate(dateToYMD(last));
		inter = (int) ((dt_last.getTime() - dt_first.getTime()) / (3600 * 24000));
		return inter;
	}
	
	//����ĳ��ʱ��ĺ��������
	public Date dateafter(int num) {
		
		Calendar c=Calendar.getInstance(); 
		c.add(Calendar.DATE,num); 
		//System.out.println(c.getTime());//ݔ����ǰ������num������� 
		 


		//Calendar c=Calendar.getInstance(); 
		//c.add(Calendar.DATE,-20); 
		//System.out.println(c.getTime());//ݔ����ǰ����ǰ20�������

		return c.getTime();
	}

	//���������·�֮�����������
	public List findDates(Date dBegin, Date dEnd) {
		List lDate = new ArrayList();
		lDate.add(dBegin);

		Calendar cal = Calendar.getInstance();
		cal.setTime(dBegin);

		boolean bContinue = true;

		while (bContinue) {
			cal.add(Calendar.DAY_OF_MONTH, 1);

			if (dEnd.after(cal.getTime())) {
				lDate.add(cal.getTime());
			} else {
				break;
			}
		}

		lDate.add(dEnd);

		return lDate;
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
		  *�õ��������� 
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
		Date dBegin = new Date(2008, 5, 3);
		Date dEnd = new Date(2008, 7, 3);
		ConvertDate cd = new ConvertDate();
		List lDate = cd.findDates(dBegin, dEnd);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		for (int i = 0; i < lDate.size(); i++) {
			System.out.println(sdf.format(lDate.get(i)));
		}
	}
}
