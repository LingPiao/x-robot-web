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
import org.project.dao.WoknowDao;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class IndexAction extends ActionSupport 
{
	private WoknowDao woknowDao;
	
	public WoknowDao getWoknowDao() {
		return woknowDao;
	}

	public void setWoknowDao(WoknowDao woknowDao) {
		this.woknowDao = woknowDao;
	}

	public String execute()	throws Exception
	{
		Map session = ActionContext.getContext().getSession();
		System.out.println(session.get("userid"));
		if(session.get("userid")!=null)
			userid = session.get("userid").toString();
		woList = woknowDao.getQuestionList(5);
		System.out.println(woList);
    	return SUCCESS;
	}
	private List woList;
	private String userid;
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public List getWoList() {
		return woList;
	}

	public void setWoList(List woList) {
		this.woList = woList;
	}
	
}
