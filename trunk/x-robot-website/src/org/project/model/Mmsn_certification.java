package org.project.model;

import java.util.Date;


public class Mmsn_certification implements java.io.Serializable{

	/**
	 * 
	 */
	public Mmsn_certification() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param user_msn
	 * @param user_tel
	 * @param user_date
	 * @param user_area
	 */
	public Mmsn_certification(String user_msn, String user_tel, Date user_date,
			String user_area) {
		this.USER_MSN = user_msn;
		this.USER_TEL = user_tel;
		this.USER_DATE = user_date;
		this.USER_AREA = user_area;
	}

	private String USER_MSN;

	private String USER_TEL;

	private Date USER_DATE;
	
	private String USER_AREA;

	public String getUSER_MSN() {
		return USER_MSN;
	}

	public void setUSER_MSN(String user_msn) {
		USER_MSN = user_msn;
	}

	public String getUSER_TEL() {
		return USER_TEL;
	}

	public void setUSER_TEL(String user_tel) {
		USER_TEL = user_tel;
	}

	public Date getUSER_DATE() {
		return USER_DATE;
	}

	public void setUSER_DATE(Date user_date) {
		USER_DATE = user_date;
	}

	public String getUSER_AREA() {
		return USER_AREA;
	}

	public void setUSER_AREA(String user_area) {
		USER_AREA = user_area;
	}

	
	
}
