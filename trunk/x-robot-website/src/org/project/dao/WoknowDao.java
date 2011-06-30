package org.project.dao;

import java.util.List;
import com.catic.tool.PageInfo;


public interface WoknowDao {
	public List getQuestionList(String qry_con,PageInfo pageInfo);
	public List getQuestionByid(String qid);
	public List getUnicomQuestionByid(String qid);
	public void setQuestionState(String state,String qid);
	public List getQuestionList(int nums);
	public List qry(String woknow_qry, PageInfo pageInfo);
	public List newqry(String woknow_qry);
	
}
