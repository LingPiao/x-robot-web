package org.project.dao;

import java.util.List;

import com.catic.tool.PageInfo;

public interface MusicDao {
	public List getMusicList(String t_key,String t_type,String type,PageInfo pageInfo);

}
