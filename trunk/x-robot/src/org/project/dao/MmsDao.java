package org.project.dao;

import java.util.List;

import com.catic.tool.PageInfo;


public interface MmsDao {
	public List getMmsByClassId(String classid,PageInfo pageInfo);
	public String getMmsByMesId(String mesid);
}
