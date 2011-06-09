package org.project.model;

import java.util.Date;


public class Mgame implements java.io.Serializable{

	/**
	 * 
	 */
	public Mgame() {
		// TODO Auto-generated constructor stub
	}

	
	private int SEQID;
	
	private String USER_MSN;
	
	private String COMMIT_DATE;
	
	private String GAME_CLASS;
	
	private String GAME_RESULTS;

	public int getSEQID() {
		return SEQID;
	}

	public void setSEQID(int seqid) {
		SEQID = seqid;
	}

	public String getUSER_MSN() {
		return USER_MSN;
	}

	public void setUSER_MSN(String user_msn) {
		USER_MSN = user_msn;
	}

	public String getCOMMIT_DATE() {
		return COMMIT_DATE;
	}

	public void setCOMMIT_DATE(String commit_date) {
		COMMIT_DATE = commit_date;
	}

	public String getGAME_CLASS() {
		return GAME_CLASS;
	}

	public void setGAME_CLASS(String game_class) {
		GAME_CLASS = game_class;
	}

	public String getGAME_RESULTS() {
		return GAME_RESULTS;
	}

	public void setGAME_RESULTS(String game_results) {
		GAME_RESULTS = game_results;
	}

	/**
	 * @param seqid
	 * @param user_msn
	 * @param commit_date
	 * @param game_class
	 * @param game_results
	 */
	public Mgame(int seqid, String user_msn, String commit_date,
			String game_class, String game_results) {
		SEQID = seqid;
		USER_MSN = user_msn;
		COMMIT_DATE = commit_date;
		GAME_CLASS = game_class;
		GAME_RESULTS = game_results;
	}

	

	
}
