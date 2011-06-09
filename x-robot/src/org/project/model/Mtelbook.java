package org.project.model;

import java.util.Date;


public class Mtelbook implements java.io.Serializable{

	/**
	 * 
	 */
	public Mtelbook() {
		// TODO Auto-generated constructor stub
	}

	private String ID;
	
	private String ONWER_NAME;

	private String ONWER_TEL;
	
	private String CONTACT_NAME;
	
	public String getID() {
		return ID;
	}

	public void setID(String id) {
		ID = id;
	}

	public String getONWER_NAME() {
		return ONWER_NAME;
	}

	public void setONWER_NAME(String onwer_name) {
		ONWER_NAME = onwer_name;
	}

	public String getONWER_TEL() {
		return ONWER_TEL;
	}

	public void setONWER_TEL(String onwer_tel) {
		ONWER_TEL = onwer_tel;
	}

	public String getCONTACT_NAME() {
		return CONTACT_NAME;
	}

	public void setCONTACT_NAME(String contact_name) {
		CONTACT_NAME = contact_name;
	}

	public String getCONTACT_TEL() {
		return CONTACT_TEL;
	}

	public void setCONTACT_TEL(String contact_tel) {
		CONTACT_TEL = contact_tel;
	}

	public String getGROUP_ID() {
		return GROUP_ID;
	}

	/**
	 * @param id
	 * @param onwer_name
	 * @param onwer_tel
	 * @param contact_name
	 * @param contact_tel
	 * @param group_id
	 */
	public Mtelbook(String id, String onwer_name, String onwer_tel,
			String contact_name, String contact_tel, String group_id) {
		ID = id;
		ONWER_NAME = onwer_name;
		ONWER_TEL = onwer_tel;
		CONTACT_NAME = contact_name;
		CONTACT_TEL = contact_tel;
		GROUP_ID = group_id;
	}

	public void setGROUP_ID(String group_id) {
		GROUP_ID = group_id;
	}

	private String CONTACT_TEL;
	
	private String GROUP_ID;



	
}
