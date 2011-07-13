package net.sf.service.agent.vo;

public class QuestionRefVo {

	private long questionid;
	private String question;
	private String answer;
	private String keyword1;
	private String keyword2;
	private String question_class;
	private String state;
	private String keyword1_num;
	private String normalstate;
	private long robotid;
	private long count;

	public long getQuestionid() {
		return questionid;
	}

	public void setQuestionid(long questionid) {
		this.questionid = questionid;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getKeyword1() {
		return keyword1;
	}

	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}

	public String getKeyword2() {
		return keyword2;
	}

	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}

	public String getQuestion_class() {
		return question_class;
	}

	public void setQuestion_class(String question_class) {
		this.question_class = question_class;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getKeyword1_num() {
		return keyword1_num;
	}

	public void setKeyword1_num(String keyword1_num) {
		this.keyword1_num = keyword1_num;
	}

	public String getNormalstate() {
		return normalstate;
	}

	public void setNormalstate(String normalstate) {
		this.normalstate = normalstate;
	}

	public long getRobotid() {
		return robotid;
	}

	public void setRobotid(long robotid) {
		this.robotid = robotid;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

}
