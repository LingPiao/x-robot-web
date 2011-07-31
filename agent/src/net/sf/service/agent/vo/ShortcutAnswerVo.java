package net.sf.service.agent.vo;

import java.util.Date;

public class ShortcutAnswerVo {
	private long id;
	private long userId;
	private String answer;
	private int disp_order;
	private Date created_date;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getDisp_order() {
		return disp_order;
	}

	public void setDisp_order(int disp_order) {
		this.disp_order = disp_order;
	}

	public Date getCreated_date() {
		return created_date;
	}

	public void setCreated_date(Date created_date) {
		this.created_date = created_date;
	}

}
