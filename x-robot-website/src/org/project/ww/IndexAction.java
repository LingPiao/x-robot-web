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



public class IndexAction extends ActionSupport 
{
	private TuserDao tuserDao;
	private VipManagerDao vipmanagerDao;
	private Msn_certificationDao msnDao;
	
	
	public VipManagerDao getVipmanagerDao() {
		return vipmanagerDao;
	}

	public void setVipmanagerDao(VipManagerDao vipmanagerDao) {
		this.vipmanagerDao = vipmanagerDao;
	}

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
		Map session = ActionContext.getContext().getSession();
		System.out.println(op+"&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		if(op!=null)
		{
			if(op.equals("logout"))
			{
				session.put("userid", null);
			}
		}
		else
		{
			if(session.get("userid") != null)
			{
				userid=session.get("userid").toString();
				System.out.println(userid);
				if(userid!=null &&!userid.equals(""))
				{
					nickname=tuserDao.getNicknameByUserid(userid);
					usermobile=msnDao.getMobileByUserMsn(userid);
					if (!usermobile.equals("")) 
					{
						if(vipmanagerDao.isExistMobile(usermobile))
							vip="1";
						else
							vip="0";
					}
					else
					{
						vip="0";
					}
				}
			}
		}
    	return SUCCESS;
	}
	private String op;
	private String userid;
	private String nickname;
	private String vip;
	private String usermobile;
	
	public String getVip() {
		return vip;
	}

	public void setVip(String vip) {
		this.vip = vip;
	}

	public String getUsermobile() {
		return usermobile;
	}

	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}

	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

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
