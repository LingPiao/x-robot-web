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

import oracle.sql.OPAQUE;

import org.project.dao.Msn_certificationDao;
import org.project.dao.TuserDao;
import org.project.dao.VipManagerDao;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class FaqAction extends ActionSupport 
{
	private TuserDao tuserDao;
	
	public TuserDao getTuserDao() {
		return tuserDao;
	}

	public void setTuserDao(TuserDao tuserDao) {
		this.tuserDao = tuserDao;
	}

	public String execute()	throws Exception
	{
		Map session = ActionContext.getContext().getSession();
		
		if(session.get("userid") != null)
		{
			userid=session.get("userid").toString();
			if(userid!=null &&!userid.equals(""))
			{
				nickname=tuserDao.getNicknameByUserid(userid);
			}
		}
    	return SUCCESS;
	}
	
	private String userid;
	private String nickname;
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
