package org.project.ww;
import com.catic.tool.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.IOException;



import org.project.dao.Message_classDao;
import org.project.dao.Msn_certificationDao;
import org.project.dao.SmsDao;
import org.project.dao.Sms_recordDao;
import org.project.dao.TelbookDao;
import org.project.dao.Telbook_groupDao;
import org.project.dao.Vistor_recordDao;
import org.project.model.Msms_record;
import org.project.model.Mtelbook;
import org.project.model.Mvistor_record;



import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class TelbookAction extends ActionSupport 
{	
	public String execute()	throws Exception
	{
		//System.out.println(user_msn);
		msnLisinfo = msnDao.getUserTelByMsnId(user_msn);
		Map map = (Map) msnLisinfo.get(0);
		user_tel =map.get("USER_TEL").toString();
		if(op.equals("view"))
		{
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
			if(groupid==null)
				groupid="";
			telgroupList=telbookgroupDao.getGroupByOnwer(user_tel);
			telList = telbookDao.getTelByOnwer(user_tel,groupid,pageInfo);
			return "view";
		}
		if(op.equals("add"))
		{
			Mtelbook telbook = new Mtelbook();
			telbook.setCONTACT_NAME(CONTACT_NAME);
			telbook.setCONTACT_TEL(CONTACT_TEL);
			telbook.setONWER_NAME(user_tel);
			telbook.setONWER_TEL(user_tel);
			telbook.setGROUP_ID(GROUP_ID);
			//System.out.println("************************************************");
			telbookDao.add(telbook);
			return "add";
		}
		if(op.equals("edit"))
		{
			Mtelbook telbook = new Mtelbook();
			telbook.setCONTACT_NAME(CONTACT_NAME);
			telbook.setCONTACT_TEL(CONTACT_TEL);
			telbook.setONWER_NAME(user_tel);
			telbook.setONWER_TEL(user_tel);
			telbook.setGROUP_ID(GROUP_ID);
			telbook.setID(ID);
			telbookDao.update(telbook);
			return "edit";
		}
		if(op.equals("del"))
		{
			if (delID != null)
			{
				String strDelId = KenString.arrayToString(delID);
				telbookDao.del(strDelId);
			}
			return "del";
		}
    	return SUCCESS;
	}
	
	private List msnLisinfo;
	private List telgroupList;
	private List telList;
	private String groupid;

	public String getGroupid() {
		return groupid;
	}
	public void setGroupid(String groupid) {
		this.groupid = groupid;
	}
	private String op;
	private String user_msn;
	private String user_tel;
	
	private String ONWER_NAME;
	private String ONWER_TEL;
	private String CONTACT_NAME;
	private String ID;
	private String[] delID;
	
	public String getID() {
		return ID;
	}
	public void setID(String id) {
		ID = id;
	}
	public String[] getDelID() {
		return delID;
	}
	public void setDelID(String[] delID) {
		this.delID = delID;
	}
	public String getONWER_NAME() {
		return ONWER_NAME;
	}
	public void setONWER_NAME(String onwer_name) {
		ONWER_NAME = onwer_name;
	}
	public String getONWER_TEL() {
		return ONWER_TEL;
	}
	public void setONWER_TEL(String onwer_tel) {
		ONWER_TEL = onwer_tel;
	}
	public String getCONTACT_NAME() {
		return CONTACT_NAME;
	}
	public void setCONTACT_NAME(String contact_name) {
		CONTACT_NAME = contact_name;
	}
	public String getCONTACT_TEL() {
		return CONTACT_TEL;
	}
	public void setCONTACT_TEL(String contact_tel) {
		CONTACT_TEL = contact_tel;
	}
	public String getGROUP_ID() {
		return GROUP_ID;
	}
	public void setGROUP_ID(String group_id) {
		GROUP_ID = group_id;
	}
	private String CONTACT_TEL;
	private String GROUP_ID;

	private Msn_certificationDao msnDao;
	private Telbook_groupDao telbookgroupDao;
	
	public Telbook_groupDao getTelbookgroupDao() {
		return telbookgroupDao;
	}
	public void setTelbookgroupDao(Telbook_groupDao telbookgroupDao) {
		this.telbookgroupDao = telbookgroupDao;
	}
	public TelbookDao getTelbookDao() {
		return telbookDao;
	}
	public void setTelbookDao(TelbookDao telbookDao) {
		this.telbookDao = telbookDao;
	}
	private TelbookDao telbookDao;
	
	public List getTelgroupList() {
		return telgroupList;
	}
	public void setTelgroupList(List telgroupList) {
		this.telgroupList = telgroupList;
	}
	public List getTelList() {
		return telList;
	}
	public void setTelList(List telList) {
		this.telList = telList;
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
	
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private int page = 1;
	private int pageRows = 10;
	private PageInfo pageInfo;
	public PageInfo getPageInfo() {
		return pageInfo;
	}
	
	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}
	
	 /**
     * @return 返回 page。
     */
    public int getPage()
    {

        return page;
    }

    /**
     * @param page 要设置的 page。
     */
    public void setPage(int page)
    {
        if (page >= 1)
            this.page = page;
    }
    
    /**
     * @return 返回 pageRows。
     */
    public int getPageRows()
    {

        return pageRows;
    }
    
    /**
     * @param pageRows 要设置的 pageRows。
     */
    public void setPageRows(int pageRows)
    {

        this.pageRows = pageRows;
    }
}
