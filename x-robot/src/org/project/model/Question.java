package org.project.model;

public class Question implements java.io.Serializable {

	public Question() {

	}

	public Question(String questionid, String question, String answer) {
		QUESTIONID = questionid;
		QUESTION = question;
		ANSWER = answer;
	}

	private String QUESTIONID;
	private String QUESTION;
	private String ANSWER;

	public String getQUESTIONID() {
		return QUESTIONID;
	}

	public void setQUESTIONID(String questionid) {
		QUESTIONID = questionid;
	}

	public String getQUESTION() {
		return QUESTION;
	}

	public void setQUESTION(String question) {
		QUESTION = question;
	}

	public String getANSWER() {
		return ANSWER;
	}

	public void setANSWER(String answer) {
		ANSWER = answer;
	}

}
