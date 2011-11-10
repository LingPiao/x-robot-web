package org.project.dao;

import java.util.List;

import com.catic.tool.PageInfo;


public interface InviteBuddyDao {
	public void save(String msn,String email, String mobile, String delay);
}
