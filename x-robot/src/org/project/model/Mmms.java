package org.project.model;

import java.util.Date;


public class Mmms implements java.io.Serializable{

	/**
	 * 
	 */
	public Mmms() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param mms_id
	 * @param mms_title
	 * @param mms_picurl
	 * @param mms_class
	 * @param mms_send
	 */
	public Mmms(String mms_id, String mms_title, String mms_picurl,
			String mms_class, int mms_send) {
		MMS_ID = mms_id;
		MMS_TITLE = mms_title;
		MMS_PICURL = mms_picurl;
		MMS_CLASS = mms_class;
		MMS_SEND = mms_send;
	}

	private String MMS_ID;
	
	private String MMS_TITLE;

	private String MMS_PICURL;
	
	public String getMMS_ID() {
		return MMS_ID;
	}

	public void setMMS_ID(String mms_id) {
		MMS_ID = mms_id;
	}

	public String getMMS_TITLE() {
		return MMS_TITLE;
	}

	public void setMMS_TITLE(String mms_title) {
		MMS_TITLE = mms_title;
	}

	public String getMMS_PICURL() {
		return MMS_PICURL;
	}

	public void setMMS_PICURL(String mms_picurl) {
		MMS_PICURL = mms_picurl;
	}

	public String getMMS_CLASS() {
		return MMS_CLASS;
	}

	public void setMMS_CLASS(String mms_class) {
		MMS_CLASS = mms_class;
	}

	public int getMMS_SEND() {
		return MMS_SEND;
	}

	public void setMMS_SEND(int mms_send) {
		MMS_SEND = mms_send;
	}

	private String MMS_CLASS;
	
	private int MMS_SEND;

	
}
