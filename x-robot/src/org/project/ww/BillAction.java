package org.project.ww;
import com.catic.tool.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;



import org.project.dao.Msn_certificationDao;
import org.project.model.Mmsn_certification;


import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class BillAction extends ActionSupport 
{
	private Msn_certificationDao msnDao;
	
	private List msnLisinfo;
	public String execute()	throws Exception
	{
		if(op.equals("view"))
		{	
			//System.out.println(user_msn);
			msnLisinfo = msnDao.getUserTelByMsnId(user_msn);
			//System.out.println(msnLisinfo);
			Map map = (Map) msnLisinfo.get(0);
			user_tel =map.get("USER_TEL").toString();
			//Map session = ActionContext.getContext().getSession();
	    	//session.put("user_tel", user_tel);
	    	//session.put("user_msn", user_msn);
			return "view";
		}
		if(op.equals("login"))
		{	
			//Map session = ActionContext.getContext().getSession();
			//user_tel=session.get("user_tel").toString();
			//user_msn=session.get("user_msn").toString();
			return "login";
		}
		if(op.equals("remain"))
		{	
			return "remain";
		}
		if(op.equals("history"))
		{	
			return "history";
		}
		if(op.equals("history_detail"))
		{	
			return "history_detail";
		}
		if(op.equals("tel"))
		{	
			return "tel";
		}
		if(op.equals("tel_detail"))
		{	
			if(pageno == null)
				pageno="1";
			return "tel_detail";
		}
		if(op.equals("sms"))
		{	
			return "sms";
		}
		if(op.equals("sms_detail"))
		{	
			if(pageno == null)
				pageno="1";
			return "sms_detail";
		}
		if(op.equals("sp"))
		{	
			return "sp";
		}
		if(op.equals("sp_detail"))
		{	
			if(pageno == null)
				pageno="1";
			return "sp_detail";
		}
		if(op.equals("gprs"))
		{	
			return "gprs";
		}
		if(op.equals("gprs_detail"))
		{	
			if(pageno == null)
				pageno="1";
			return "gprs_detail";
		}
		if(op.equals("jf"))
		{	
			return "jf";
		}
		if(op.equals("jfyf"))
		{	
			return "jfyf";
		}
		if(op.equals("jifen_detail"))
		{	
			return "jifen_detail";
		}
		if(op.equals("jfxf"))
		{	
			return "jfxf";
		}
		if(op.equals("jifen_costdetail"))
		{	
			if(pageno == null)
				pageno="1";
			return "jifen_costdetail";
		}
		if(op.equals("fam"))
		{	
			if(pageno == null)
				pageno="1";
			return "fam";
		}
		if(op.equals("service"))
		{	
			return "service";
		}
		if(op.equals("service_detail"))
		{	
			if(pageno == null)
				pageno="1";
			return "service_detail";
		}
    	return SUCCESS;
	}

	private String op;
	private String user_msn;
	private String user_tel;
	private String month;
	
	private String pageno;
	public String getPageno() {
		return pageno;
	}
	public void setPageno(String pageno) {
		this.pageno = pageno;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getUser_msn() {
		return user_msn;
	}
	public void setUser_msn(String user_msn) {
		this.user_msn = user_msn;
	}
	public String getOp() {
		return op;
	}
	public void setOp(String op) {
		this.op = op;
	}
	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}
	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}
}
