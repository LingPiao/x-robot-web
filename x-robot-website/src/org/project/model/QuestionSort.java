package org.project.model;

public class QuestionSort implements Comparable<QuestionSort> {

	public QuestionSort() {

	}
	private String questionid;
	private String question;
	private String fromtable;	
	private String keywords;
	private int count;
	

	/**
	 * @param questionid
	 * @param question
	 * @param fromtable
	 * @param keywords
	 * @param count
	 */
	public QuestionSort(String questionid, String question, String fromtable,
			String keywords, int count) {
		this.questionid = questionid;
		this.question = question;
		this.fromtable = fromtable;
		this.keywords = keywords;
		this.count = count;
	}


	public String getQuestionid() {
		return questionid;
	}


	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getFromtable() {
		return fromtable;
	}


	public void setFromtable(String fromtable) {
		this.fromtable = fromtable;
	}


	public String getKeywords() {
		return keywords;
	}


	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int compareTo(QuestionSort other)
	{
//	   System.out.println("keywords="+Integer.parseInt(keywords));
//	   System.out.println("count="+count);
//	   if (count < other.count)
//	   {
//	    return 1;
//	   }
//	   if (count > other.count)
//	   {
//	    return -1;
//	   }
//	   return 0;
	   if (count < other.count)
	   {
		   return 1;
	   }
	   else if(count > other.count)
	   {
		   return -1;
	   }
	   else
	   {
		   if (Integer.parseInt(keywords) < Integer.parseInt(other.keywords))
		   {
			   return 1;
		   }
		   else if(Integer.parseInt(keywords) > Integer.parseInt(other.keywords))
		   {
			   return -1;
		   }
		   else 
		   {
			   return 0;
		   }
	   }
	}
}
