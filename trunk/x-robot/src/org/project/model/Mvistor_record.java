package org.project.model;

import java.util.Date;


public class Mvistor_record implements java.io.Serializable{

	/**
	 * 
	 */
	public Mvistor_record() {
		// TODO Auto-generated constructor stub
	}

	private String ID;
	
	private String MSNID;

	private String RDATE;
	
	private String CLASSES;

	public String getID() {
		return ID;
	}

	public void setID(String id) {
		ID = id;
	}

	public String getMSNID() {
		return MSNID;
	}

	public void setMSNID(String msnid) {
		MSNID = msnid;
	}

	public String getRDATE() {
		return RDATE;
	}

	public void setRDATE(String rdate) {
		RDATE = rdate;
	}

	public String getCLASSES() {
		return CLASSES;
	}

	public void setCLASSES(String classes) {
		CLASSES = classes;
	}

	/**
	 * @param id
	 * @param msnid
	 * @param rdate
	 * @param classes
	 */
	public Mvistor_record(String id, String msnid, String rdate, String classes) {
		ID = id;
		MSNID = msnid;
		RDATE = rdate;
		CLASSES = classes;
	}
	
	
}
