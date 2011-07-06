package org.project.model;

import java.util.Date;


public class Mtelbook_group_contract implements java.io.Serializable{

	/**
	 * 
	 */
	public Mtelbook_group_contract() {
		// TODO Auto-generated constructor stub
	}

	private int ID;
	
	private int GROUPID;
	
	private int ADDRESSBOOKID;

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getGROUPID() {
		return GROUPID;
	}

	public void setGROUPID(int gROUPID) {
		GROUPID = gROUPID;
	}

	public int getADDRESSBOOKID() {
		return ADDRESSBOOKID;
	}

	public void setADDRESSBOOKID(int aDDRESSBOOKID) {
		ADDRESSBOOKID = aDDRESSBOOKID;
	}

	/**
	 * @param iD
	 * @param gROUPID
	 * @param aDDRESSBOOKID
	 */
	public Mtelbook_group_contract(int iD, int gROUPID, int aDDRESSBOOKID) {
		ID = iD;
		GROUPID = gROUPID;
		ADDRESSBOOKID = aDDRESSBOOKID;
	}

	
}
