package org.project.dao;

import java.util.List;

import com.catic.tool.PageInfo;

public interface QuestionDao {
	public List getQuestionType();

	public List getQuestionList(String user_msn, String classID,
			String t_keyword, String normalstate, PageInfo pageInfo);

	public List getQuestionAnswer(String questionid);

}
