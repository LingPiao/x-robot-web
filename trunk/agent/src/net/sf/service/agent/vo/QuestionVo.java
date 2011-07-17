package net.sf.service.agent.vo;

import java.sql.Timestamp;

public class QuestionVo {

	private long q_id;
	private String q_content;
	private String q_user;
	private Timestamp q_date;
	private String q_state;
	private String q_validity;
	private String user_tel;

	public long getQ_id() {
		return q_id;
	}

	public void setQ_id(long q_id) {
		this.q_id = q_id;
	}

	public String getQ_content() {
		return q_content;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public String getQ_user() {
		return q_user;
	}

	public void setQ_user(String q_user) {
		this.q_user = q_user;
	}

	public String getQ_state() {
		return q_state;
	}

	public void setQ_state(String q_state) {
		this.q_state = q_state;
	}

	public String getQ_validity() {
		return q_validity;
	}

	public void setQ_validity(String q_validity) {
		this.q_validity = q_validity;
	}

	public Timestamp getQ_date() {
		return q_date;
	}

	public void setQ_date(Timestamp q_date) {
		this.q_date = q_date;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

}
