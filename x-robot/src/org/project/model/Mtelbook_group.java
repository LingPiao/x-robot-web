package org.project.model;

import java.util.Date;


public class Mtelbook_group implements java.io.Serializable{

	/**
	 * 
	 */
	public Mtelbook_group() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param seqid
	 * @param groupname
	 * @param ownername
	 */
	public Mtelbook_group(String seqid, String groupname, String ownername) {
		SEQID = seqid;
		GROUPNAME = groupname;
		OWNERNAME = ownername;
	}

	private String SEQID;
	
	private String GROUPNAME;
	
	public String getSEQID() {
		return SEQID;
	}

	public void setSEQID(String seqid) {
		SEQID = seqid;
	}

	public String getGROUPNAME() {
		return GROUPNAME;
	}

	public void setGROUPNAME(String groupname) {
		GROUPNAME = groupname;
	}

	public String getOWNERNAME() {
		return OWNERNAME;
	}

	public void setOWNERNAME(String ownername) {
		OWNERNAME = ownername;
	}

	private String OWNERNAME;



	
}
