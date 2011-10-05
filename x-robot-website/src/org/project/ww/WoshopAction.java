package org.project.ww;

import org.project.dao.Msn_certificationDao;
import com.opensymphony.xwork.ActionSupport;


public class WoshopAction extends ActionSupport {

	private Msn_certificationDao msnDao;
	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}
	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}
	
	public String execute() throws Exception {
		if(userid==null || userid.equals(""))
			userid=userId;
		usermobile=msnDao.getMobileByUserMsn(userid);
		System.out.println("33333");
		System.out.println("usermobile"+usermobile);
		if (!usermobile.equals("")) 
		{
			op="ok";
		}
		else
		{
			op="no";
		}
		System.out.println("op"+op);
		return "main";
	}
	
	private String usermobile;
	private String op;
	
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	public String getUsermobile() {
		return usermobile;
	}
	public void setUsermobile(String usermobile) {
		this.usermobile = usermobile;
	}
	private String userid;
	private String userId;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
