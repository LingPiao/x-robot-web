package org.project.dao;

import java.util.List;



public interface TuserDao {
	public List login(String userid,String pwd);
	
	public String getNicknameByUserid(String userid);
	
	public String getTypeByUserid(String userid);
	
	public List getUserInfoByUsername(String username);
	
	public void addUser(String username,String userpwd,String nickname);
}
