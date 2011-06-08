package org.project.dao;

import java.util.List;
import com.catic.tool.PageInfo;


public interface WoanswerDao {
	public void saveAnswer(String qid,String content,String userid);
	public void delAnswer(String aid);
	public List getAnswerByQid(String qid);
	public void setBestAnswer(String aid);
	public boolean isBestAnswer(String qid);
}
