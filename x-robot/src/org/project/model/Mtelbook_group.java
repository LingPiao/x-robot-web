package org.project.model;

import java.util.Date;


public class Mtelbook_group implements java.io.Serializable{

	/**
	 * 
	 */
	public Mtelbook_group() {
		// TODO Auto-generated constructor stub
	}

	private int GROUPID;
	
	private String NAME;
	
	private String CONTACTEMAIL;

	

	public int getGROUPID() {
		return GROUPID;
	}

	public void setGROUPID(int gROUPID) {
		GROUPID = gROUPID;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getCONTACTEMAIL() {
		return CONTACTEMAIL;
	}

	public void setCONTACTEMAIL(String cONTACTEMAIL) {
		CONTACTEMAIL = cONTACTEMAIL;
	}

	/**
	 * @param gROUPID
	 * @param nAME
	 * @param cONTACTEMAIL
	 */
	public Mtelbook_group(int gROUPID, String nAME, String cONTACTEMAIL) {
		GROUPID = gROUPID;
		NAME = nAME;
		CONTACTEMAIL = cONTACTEMAIL;
	}

	/**
	 * @param gROUPID
	 * @param nAME
	 * @param cONTACTEMAIL
	 */
	
	

}
