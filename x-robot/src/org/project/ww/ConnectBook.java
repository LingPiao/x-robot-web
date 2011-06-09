package org.project.ww;

import com.opensymphony.xwork.ActionSupport;
import java.io.IOException;
import java.util.*;
import com.catic.tool.*;

import org.project.dao.ConnectBookDao;

public class ConnectBook extends ActionSupport
{
	
	private ConnectBookDao connectBookDao;
	
	public ConnectBookDao getConnectBookDao() {
		return connectBookDao;
	}

	public void setConnectBookDao(ConnectBookDao connectBookDao) {
		this.connectBookDao = connectBookDao;
	}
	
	private List userListinfo;
	private List typeListinfo;
	
	public String execute() throws Exception {
		
		if(ac.equals("userlist"))
		{
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
			userListinfo = connectBookDao.GetUserList(msnacc,tid,pageInfo);

			return "userlist";
		}
		else if(ac.equals("adduser"))
		{
			typeListinfo = connectBookDao.GetGroupListAll(msnacc);
			return "adduser";
		}
		else if(ac.equals("edituser"))
		{
			System.out.println(msnacc);
			List userinfo = connectBookDao.GetUserInfo(uid);
			Map map = (Map) userinfo.get(0);
			System.out.println(userinfo);
			tid =map.get("TYPEID").toString();
			uname = map.get("USERNAME").toString();
			utel = map.get("USERTEL").toString();
			typeListinfo = connectBookDao.GetGroupListAll(msnacc);
			return "edituser";
		}
		else if(ac.equals("edituseraction"))
		{
			if((uname==null)||(uname.equals("")))
				return DoError("联系人姓名为空。");
			
			if((utel==null)||(utel.equals("")))
				return DoError("联系人电话为空。");
			
			int nresult = connectBookDao.EditUser(uid,CommonUtil.toGBK(uname),utel,tid);
			if(nresult>0)
			{
				pageInfo = new PageInfo();
			    pageInfo.setPage(page);
			    pageInfo.setPageRows(pageRows);
				userListinfo = connectBookDao.GetUserList(msnacc,tid,pageInfo);
				return "userlist";
			}
			else
				return DoError("修改联系人失败。");
		}
		else if(ac.equals("adduseraction"))
		{
			if((uname==null)||(uname.equals("")))
				return DoError("联系人姓名为空。");
			
			if((utel==null)||(utel.equals("")))
				return DoError("联系人电话为空。");
			
			int nresult = connectBookDao.AddUser(CommonUtil.toGBK(uname),utel,tid,msnacc);
			if(nresult>0)
			{
				pageInfo = new PageInfo();
			    pageInfo.setPage(page);
			    pageInfo.setPageRows(pageRows);
				userListinfo = connectBookDao.GetUserList(msnacc,tid,pageInfo);
				return "userlist";
			}
			else
				return DoError("添加联系人失败。");
		}
		else if(ac.equals("deluseraction"))
		{
			String s = "";
			for(int i=0;i<ts.length;i++)
			{
				if((ts[i]!=null)||(ts[i].equals("")))
					s+=ts[i]+",";
			}
			if(s.length()>0)
				s = s.substring(0,s.length()-1);
			else
				return DoError("请选择要删除的联系人。");
			
			int nresult = connectBookDao.DelUser(s);
			
			if(nresult>0)
			{
				pageInfo = new PageInfo();
			    pageInfo.setPage(page);
			    pageInfo.setPageRows(pageRows);
				userListinfo = connectBookDao.GetUserList(msnacc,tid,pageInfo);
				return "userlist";
			}
			else
				return DoError("联系人删除失败。");
		}
		else if(ac.equals("typelist"))
		{
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
			typeListinfo = connectBookDao.GetGroupList(msnacc,pageInfo);
			return "typelist";
		}
		else if(ac.equals("addtypeaction"))
		{
			if((tname==null)||(tname.equals("")))
				return DoError("分组名称为空。");
			
			int nresult = connectBookDao.AddGroup(CommonUtil.toGBK(tname), msnacc);
			if(nresult>0)
			{
				pageInfo = new PageInfo();
			    pageInfo.setPage(page);
			    pageInfo.setPageRows(pageRows);
				typeListinfo = connectBookDao.GetGroupList(msnacc,pageInfo);
				return "typelist";
			}
			else
				return DoError("添加分组失败。");
		}
		else if(ac.equals("edittype"))
		{
			List typeinfo = connectBookDao.GetGeoupInfo(tid);
			Map map = (Map) typeinfo.get(0);
			tname =map.get("TYPENAME").toString();
			return "edittype";
		}
		else if(ac.equals("edittypeaction"))
		{
			if((tname==null)||(tname.equals("")))
				return DoError("分组名称为空。");
			
			int nresult = connectBookDao.EditGroup(tid,CommonUtil.toGBK(tname));
			System.out.println(nresult);
			
			if(nresult>0)
			{
				pageInfo = new PageInfo();
			    pageInfo.setPage(page);
			    pageInfo.setPageRows(pageRows);
				typeListinfo = connectBookDao.GetGroupList(msnacc,pageInfo);
				return "typelist";
			}
			else
				return DoError("修改分组失败。");
		}
		else if(ac.equals("deltypeaction"))
		{
			String s = "";
			for(int i=0;i<ts.length;i++)
			{
				if((ts[i]!=null)||(ts[i].equals("")))
					s+=ts[i]+",";
			}
			if(s.length()>0)
				s = s.substring(0,s.length()-1);
			else
				return DoError("请选择要删除的分组。");
			
			int nresult = connectBookDao.DelGroup(s);
			
			if(nresult>0)
			{
				pageInfo = new PageInfo();
			    pageInfo.setPage(page);
			    pageInfo.setPageRows(pageRows);
				typeListinfo = connectBookDao.GetGroupList(msnacc,pageInfo);
				return "typelist";
			}
			else
				return DoError("删除分组失败。");
		}
		return ac;
    }
	
	public String DoError(String errorstr){
		errormsg = errorstr;
		return "action_false";
	}
	
	public List getUserListinfo() {
		return userListinfo;
	}

	public void setUserListinfo(List userListinfo) {
		this.userListinfo = userListinfo;
	}
	
	public List getTypeListinfo() {
		return typeListinfo;
	}

	public void setTypeListinfo(List typeListinfo) {
		this.typeListinfo = typeListinfo;
	}
	
	private String msnacc;
	private String uid;
	private String uname;
	private String utel;
	private String tid;
	private String tname;
	private String ac;
	private String errormsg;
	private String[] ts;
	private int page = 1;
	private int pageRows = 8;
	private PageInfo pageInfo;
	
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	public String getMsnacc() {
		return msnacc;
	}

	public void setMsnacc(String msnacc) {
		this.msnacc = msnacc;
	}
	
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}
	
	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}
	
	public String getUtel() {
		return utel;
	}

	public void setUtel(String utel) {
		this.utel = utel;
	}
	
	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}
	
	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}
	
	public String getAc() {
		return ac;
	}

	public void setAc(String ac) {
		this.ac = ac;
	}
	
	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public String[] getTs() {
		return ts;
	}

	public void setTs(String[] ts) {
		this.ts = ts;
	}
	
	public int getPage()
    {

        return page;
    }

    public void setPage(int page)
    {
        if (page >= 1)
            this.page = page;
    }
    
    public int getPageRows()
    {

        return pageRows;
    }
    
    public void setPageRows(int pageRows)
    {

        this.pageRows = pageRows;
    }
}
