package org.project.dao;

import java.util.List;

import com.catic.tool.PageInfo;


public interface SmsDao {
	public List getSmsByClassId(String classid,PageInfo pageInfo);
	public String getSmsByMesId(String mesid);
}
