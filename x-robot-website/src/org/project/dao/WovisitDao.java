package org.project.dao;

import java.util.List;
import com.catic.tool.PageInfo;


public interface WovisitDao {
	public List getByqid(String q_id);
	public void addBrows(String q_id);
	public void addAnswer(String q_id);
	//第一次访问，需要向访问表中增加一条记录，该记录访问值为1，回复为0
	public void inserVisit(String q_id);

}
