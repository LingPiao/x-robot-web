package org.project.model;

import java.util.Date;


public class Msms implements java.io.Serializable{

	/**
	 * 
	 */
	public Msms() {
		// TODO Auto-generated constructor stub
	}


	/**
	 * @param mes_id
	 * @param mes_class
	 * @param mes_content
	 * @param mes_send
	 */
	public Msms(String mes_id, String mes_class, String mes_content,
			String mes_send) {
		MES_ID = mes_id;
		MES_CLASS = mes_class;
		MES_CONTENT = mes_content;
		MES_SEND = mes_send;
	}


	public String getMES_ID() {
		return MES_ID;
	}



	public void setMES_ID(String mes_id) {
		MES_ID = mes_id;
	}

	public String getMES_CLASS() {
		return MES_CLASS;
	}

	public void setMES_CLASS(String mes_class) {
		MES_CLASS = mes_class;
	}

	public String getMES_CONTENT() {
		return MES_CONTENT;
	}

	public void setMES_CONTENT(String mes_content) {
		MES_CONTENT = mes_content;
	}

	public String getMES_SEND() {
		return MES_SEND;
	}

	public void setMES_SEND(String mes_send) {
		MES_SEND = mes_send;
	}
	private String MES_ID;
	
	private String MES_CLASS;

	private String MES_CONTENT;
	
	private String MES_SEND;

	
}
