package org.project.model;

import java.util.Date;


public class Mtelbook implements java.io.Serializable{

	/**
	 * 
	 */
	public Mtelbook() {
		// TODO Auto-generated constructor stub
	}

	private int ADDRESSBOOKID;
	
	private String CONTACTEMAIL;

	private String NAME;
	
	private String TELNUMBER;

	public int getADDRESSBOOKID() {
		return ADDRESSBOOKID;
	}

	public void setADDRESSBOOKID(int aDDRESSBOOKID) {
		ADDRESSBOOKID = aDDRESSBOOKID;
	}

	public String getCONTACTEMAIL() {
		return CONTACTEMAIL;
	}

	public void setCONTACTEMAIL(String cONTACTEMAIL) {
		CONTACTEMAIL = cONTACTEMAIL;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getTELNUMBER() {
		return TELNUMBER;
	}

	public void setTELNUMBER(String tELNUMBER) {
		TELNUMBER = tELNUMBER;
	}

	/**
	 * @param aDDRESSBOOKID
	 * @param cONTACTEMAIL
	 * @param nAME
	 * @param tELNUMBER
	 */
	public Mtelbook(int aDDRESSBOOKID, String cONTACTEMAIL, String nAME,
			String tELNUMBER) {
		ADDRESSBOOKID = aDDRESSBOOKID;
		CONTACTEMAIL = cONTACTEMAIL;
		NAME = nAME;
		TELNUMBER = tELNUMBER;
	}
	
	
}
