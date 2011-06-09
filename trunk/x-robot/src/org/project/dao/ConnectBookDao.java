package org.project.dao;

import java.util.List;

import com.catic.tool.PageInfo;

public interface ConnectBookDao {
	public int AddGroup(String GroupName,String msnacc);
	public int DelGroup(String GroupID);
	public int EditGroup(String GroupID,String GroupName);
	public List GetGroupList(String msnacc,PageInfo pageInfo);
	public List GetGroupListAll(String msnacc);
	public List GetGeoupInfo(String GroupID);
	public int AddUser(String UserName,String UserTel,String GroupID,String msnacc);
	public int DelUser(String UserID);
	public int EditUser(String UserID,String UserName,String UserTel,String GroupID);
	public List GetUserList(String msnacc,String tid,PageInfo pageInfo);
	public List GetUserInfo(String UserID);
}
