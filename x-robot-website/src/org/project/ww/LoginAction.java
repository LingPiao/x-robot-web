package org.project.ww;
import com.catic.tool.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import java.sql.*;
import java.util.*;


import org.project.dao.Msn_certificationDao;
import org.project.dao.TuserDao;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class LoginAction extends ActionSupport 
{
	private TuserDao tuserDao;
	private Msn_certificationDao msnDao;
	
	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}
	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}
	public TuserDao getTuserDao() {
		return tuserDao;
	}
	public void setTuserDao(TuserDao tuserDao) {
		this.tuserDao = tuserDao;
	}

	public String execute()	throws Exception
	{
		if(op.equals("login"))
		{	
			return "login";
		}
		if(op.equals("reg"))
		{	
			return "reg";
		}
		if(op.equals("regdo"))
		{	
			if(tuserDao.getUserInfoByUsername(username).size()==1)
			{
				flag="0";
				return "regdoF";
			}
			else 
			{
				flag="1";
				tuserDao.addUser(username, userpwd, nickname);
				return "regdoS";
			}
		}
		
		if(op.equals("logindo"))
		{	
			List userList=tuserDao.login(username, userpwd);
			if(userList.size()>0)
			{
				Map map = (Map)userList.get(0);
				//这里userid对应的就是username
				userid= map.get("USERNAME").toString();
				nickname=map.get("NICKNAME").toString();
				//usertype=map.get("TYPE").toString();
				//System.out.println(nickname);
				usermobile=msnDao.getMobileByUserMsn(userid);
				Map session = ActionContext.getContext().getSession();
		    	session.put("userid", userid);
				return "loginok";
			}
			else {
				return "loginerror";
			}
		}
    	return SUCCESS;
	}
	private String flag;

	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	private String op;
	private String userid;
	private String username;
	private String userpwd;
	private String nickname;
	private String usermobile;
	private String usertype;
	
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public String getUsermobile() {
		return usermobile;
	}
	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	
}
