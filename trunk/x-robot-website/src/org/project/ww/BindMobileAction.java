package org.project.ww;

import java.util.Map;

import org.project.dao.Msn_certificationDao;
import org.project.dao.TuserDao;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;

public class BindMobileAction extends ActionSupport {
	private Msn_certificationDao msnDao;
	private TuserDao tuserDao;
	
	public TuserDao getTuserDao() {
		return tuserDao;
	}
	public void setTuserDao(TuserDao tuserDao) {
		this.tuserDao = tuserDao;
	}
	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}
	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}
	public String execute() throws Exception {
		Map session = ActionContext.getContext().getSession();
		
		if(session.get("userid") != null)
		{
			userid=session.get("userid").toString();
			nickname=tuserDao.getNicknameByUserid(userid);
		}
		else {
			return "error";
		}
		if(op.equals("bind"))
		{
			return "bind";
		}
		if(op.equals("bindok"))
		{
			msnDao.BindMobile(userid, usermobile);
			return "bindok";
		}
		if(op.equals("unbind"))
		{
			usermobile=msnDao.getMobileByUserMsn(userid);
			return "unbind";
		}
		if(op.equals("unbindok"))
		{
			System.out.println(userid);
			System.out.println(usermobile);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			msnDao.UnBindMobile(userid, usermobile);
			return "unbindok";
		}
		return SUCCESS;
	}
	private String userid;
	private String nickname;
	private String usermobile;
	
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
