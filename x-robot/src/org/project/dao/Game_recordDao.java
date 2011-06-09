package org.project.dao;

import java.util.List;
import java.util.Map;

import org.project.model.Mgame;

import com.catic.tool.PageInfo;


public interface Game_recordDao {
	public void addRecord(Mgame mrecord);
	public void updateRecord(Mgame mrecord);
	public List getAllRecord(PageInfo pageInfo, int week);
	public List getRecordByUser_msn(String user_msn);
	
	public Map getWeek();
	public List getWeeks();
}
