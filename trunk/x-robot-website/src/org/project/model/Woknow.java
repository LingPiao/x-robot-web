package org.project.model;

public class Woknow implements java.io.Serializable {

	public Woknow() {

	}
	private String Q_ID;
	private String Q_CONTENT;
	private String Q_USER;	
	private String Q_VIP;

	public String getQ_ID() {
		return Q_ID;
	}

	public void setQ_ID(String q_id) {
		Q_ID = q_id;
	}

	public String getQ_CONTENT() {
		return Q_CONTENT;
	}

	public void setQ_CONTENT(String q_content) {
		Q_CONTENT = q_content;
	}

	public String getQ_USER() {
		return Q_USER;
	}

	public void setQ_USER(String q_user) {
		Q_USER = q_user;
	}

	public String getQ_VIP() {
		return Q_VIP;
	}

	public void setQ_VIP(String q_vip) {
		Q_VIP = q_vip;
	}

	/**
	 * @param q_id
	 * @param q_content
	 * @param q_user
	 * @param q_vip
	 */
	public Woknow(String q_id, String q_content, String q_user, String q_vip) {
		Q_ID = q_id;
		Q_CONTENT = q_content;
		Q_USER = q_user;
		Q_VIP = q_vip;
	}

}
