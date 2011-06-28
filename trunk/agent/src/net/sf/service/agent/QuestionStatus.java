package net.sf.service.agent;

public enum QuestionStatus {

	UNANSWERED(0), ANSWERED(1), PROCESSING(2);

	private int code;

	private QuestionStatus(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

}
