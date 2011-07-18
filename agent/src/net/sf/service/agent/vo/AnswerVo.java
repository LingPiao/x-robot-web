package net.sf.service.agent.vo;

import java.sql.Timestamp;

public class AnswerVo {
	private long a_id;
	private long q_id;
	private String a_user;
	private String a_content;
	private Timestamp a_date;
	private String a_responser;

	public long getA_id() {
		return a_id;
	}

	public void setA_id(long a_id) {
		this.a_id = a_id;
	}

	public long getQ_id() {
		return q_id;
	}

	public void setQ_id(long q_id) {
		this.q_id = q_id;
	}

	public String getA_user() {
		return a_user;
	}

	public void setA_user(String a_user) {
		this.a_user = a_user;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public Timestamp getA_date() {
		return a_date;
	}

	public void setA_date(Timestamp a_date) {
		this.a_date = a_date;
	}

	public String getA_responser() {
		return a_responser;
	}

	public void setA_responser(String a_responser) {
		this.a_responser = a_responser;
	}

}
