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
import org.project.model.Mtelbook_group;
import org.project.model.Mvistor_record;



import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class TelbookGroupAction extends ActionSupport 
{	
	private Mtelbook_group mtelbook_group;
	
	public Mtelbook_group getMtelbook_group() {
		return mtelbook_group;
	}
	public void setMtelbook_group(Mtelbook_group mtelbook_group) {
		this.mtelbook_group = mtelbook_group;
	}
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
			telgroupList=telbookgroupDao.getGroupByOnwer(user_msn);
			telbookgroupDao.getGroupByOnwer(user_msn, pageInfo);
			return "view";
		}
		if(op.equals("add"))
		{
			mtelbook_group.setCONTACTEMAIL(user_msn);
			telbookgroupDao.add(mtelbook_group);
			return "add";
		}
		if(op.equals("edit"))
		{
			
			telbookgroupDao.update(mtelbook_group);
			return "edit";
		}
		if(op.equals("del"))
		{
			if (delID != null)
			{
				String strDelId = KenString.arrayToString(delID);
				telbookgroupDao.del(strDelId);
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
	
	private String GROUPNAME;
	
	public String getGROUPNAME() {
		return GROUPNAME;
	}
	public void setGROUPNAME(String groupname) {
		GROUPNAME = groupname;
	}
	public String getSEQID() {
		return SEQID;
	}
	public void setSEQID(String seqid) {
		SEQID = seqid;
	}

	private String SEQID;
	private String[] delID;
	
	
	public String[] getDelID() {
		return delID;
	}
	public void setDelID(String[] delID) {
		this.delID = delID;
	}
	

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
