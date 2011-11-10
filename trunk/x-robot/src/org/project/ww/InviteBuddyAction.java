package org.project.ww;
import com.catic.tool.*;

import javax.servlet.http.HttpServletRequest;

import org.project.dao.InviteBuddyDao;

import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class InviteBuddyAction extends ActionSupport 
{	
	private InviteBuddyDao inviteBuddyDao;
	
	public InviteBuddyDao getInviteBuddyDao() {
		return inviteBuddyDao;
	}

	public void setInviteBuddyDao(InviteBuddyDao inviteBuddyDao) {
		this.inviteBuddyDao = inviteBuddyDao;
	}

	public String execute()	throws Exception
	{
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)ctx.get("com.opensymphony.xwork.dispatcher.HttpServletRequest");
		String emailString="";
		String mobile="";
		String delayString=request.getParameter("delay");
		String msnid =request.getParameter("msnid");
		for(int i=1;i<6;i++)
		{
			emailString=request.getParameter("FRIENDEMAILSTR"+i);
			mobile=request.getParameter("Email"+i);
			if(!emailString.equals("") || !mobile.equals(""))
			{
				inviteBuddyDao.save(msnid, emailString, mobile, delayString);
			}
		}
    	return SUCCESS;
	}
	
	
}
