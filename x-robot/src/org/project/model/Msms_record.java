package org.project.model;

import java.util.Date;


public class Msms_record implements java.io.Serializable{

	/**
	 * 
	 */
	public Msms_record() {
		// TODO Auto-generated constructor stub
	}

	private String REC_ID;
	
	private String REC_SEND_TEL;

	private String REC_SEND_TIME;
	
	private String REC_SEND_CONTENT;

	private String REC_RECIEVE_TEL;
	
	private String MEG_CLASS;
	
	private String REC_SEND_PICURL;
	
	private String DEL;
	
	private String REC_RECIEVE_NAME;

	public String getREC_ID() {
		return REC_ID;
	}

	public void setREC_ID(String rec_id) {
		REC_ID = rec_id;
	}

	public String getREC_SEND_TEL() {
		return REC_SEND_TEL;
	}

	public void setREC_SEND_TEL(String rec_send_tel) {
		REC_SEND_TEL = rec_send_tel;
	}

	public String getREC_SEND_TIME() {
		return REC_SEND_TIME;
	}

	public void setREC_SEND_TIME(String rec_send_time) {
		REC_SEND_TIME = rec_send_time;
	}

	public String getREC_SEND_CONTENT() {
		return REC_SEND_CONTENT;
	}

	public void setREC_SEND_CONTENT(String rec_send_content) {
		REC_SEND_CONTENT = rec_send_content;
	}

	public String getREC_RECIEVE_TEL() {
		return REC_RECIEVE_TEL;
	}

	public void setREC_RECIEVE_TEL(String rec_recieve_tel) {
		REC_RECIEVE_TEL = rec_recieve_tel;
	}

	public String getMEG_CLASS() {
		return MEG_CLASS;
	}

	public void setMEG_CLASS(String meg_class) {
		MEG_CLASS = meg_class;
	}

	public String getREC_SEND_PICURL() {
		return REC_SEND_PICURL;
	}

	public void setREC_SEND_PICURL(String rec_send_picurl) {
		REC_SEND_PICURL = rec_send_picurl;
	}

	public String getDEL() {
		return DEL;
	}

	public void setDEL(String del) {
		DEL = del;
	}

	public String getREC_RECIEVE_NAME() {
		return REC_RECIEVE_NAME;
	}

	public void setREC_RECIEVE_NAME(String rec_recieve_name) {
		REC_RECIEVE_NAME = rec_recieve_name;
	}

	/**
	 * @param rec_id
	 * @param rec_send_tel
	 * @param rec_send_time
	 * @param rec_send_content
	 * @param rec_recieve_tel
	 * @param meg_class
	 * @param rec_send_picurl
	 * @param del
	 * @param rec_recieve_name
	 */
	public Msms_record(String rec_id, String rec_send_tel,
			String rec_send_time, String rec_send_content,
			String rec_recieve_tel, String meg_class, String rec_send_picurl,
			String del, String rec_recieve_name) {
		REC_ID = rec_id;
		REC_SEND_TEL = rec_send_tel;
		REC_SEND_TIME = rec_send_time;
		REC_SEND_CONTENT = rec_send_content;
		REC_RECIEVE_TEL = rec_recieve_tel;
		MEG_CLASS = meg_class;
		REC_SEND_PICURL = rec_send_picurl;
		DEL = del;
		REC_RECIEVE_NAME = rec_recieve_name;
	}
}
