package org.project.ww;

import org.project.dao.Msn_certificationDao;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

public class BindMobileAction extends ActionSupport {
	private Msn_certificationDao msnDao;
	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}
	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}
	public String execute() throws Exception {
		if(op.equals("bind"))
		{
			return "bind";
		}
		if(op.equals("bindok"))
		{
			msnDao.BindMobile(userid, user_mobile);
			return "bindok";
		}
		if(op.equals("unbind"))
		{
			user_mobile=msnDao.getMobileByUserMsn(userid);
			return "unbind";
		}
		if(op.equals("unbindok"))
		{
			
			msnDao.UnBindMobile(userid, user_mobile);
			return "unbindok";
		}
		return SUCCESS;
	}
	private String userid;
	private String user_mobile;
	
	public String getUser_mobile() {
		return user_mobile;
	}
	public void setUser_mobile(String user_mobile) {
		this.user_mobile = user_mobile;
	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	private String op;
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	
	
}
