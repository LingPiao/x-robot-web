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
import org.project.model.Mvistor_record;



import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class SmsAction extends ActionSupport 
{	
	public String execute()	throws Exception
	{
		msnLisinfo = msnDao.getUserTelByMsnId(user_msn);
		Map map = (Map) msnLisinfo.get(0);
		user_tel =map.get("USER_TEL").toString();
		if(op.equals("view"))
		{	
			
			telgroupList=telbookgroupDao.getGroupByOnwer(user_tel);
			telList = telbookDao.getTelByOnwer(user_tel);
			
			if(mes_id!=null)
			{
				content = smsDao.getSmsByMesId(mes_id);
			}
			return "view";
		}
		if(op.equals("send"))
		{	
			String [] recmob = recmobile.split(",");
			Msms_record srecord = new Msms_record();
			//System.out.println(content);
			for(int i=0;i<recmob.length;i++)
			{
				srecord.setREC_SEND_TEL(user_tel);
				srecord.setREC_SEND_TIME("sysdate");
				srecord.setREC_SEND_CONTENT(content);
				srecord.setREC_RECIEVE_TEL(recmob[i]);
				srecord.setREC_RECIEVE_NAME("");
				srecord.setMEG_CLASS("sms");
				srecord.setREC_SEND_PICURL("");
				srecord.setDEL("0");
				smsrecordDao.addRecord(srecord);
			}
			Mvistor_record vrecord = new Mvistor_record();
			vrecord.setMSNID(user_msn);
			vrecord.setCLASSES("01");
			vistorDao.addRecord(vrecord);
			return "send";
		}
		if(op.equals("sms"))
		{	
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
			classList=messageDao.getMessageClassById("");
			if(smsclassid==null)
				smsclassid="";
			//System.out.println(smsclassid);
			smsList=smsDao.getSmsByClassId(smsclassid,pageInfo);
			return "sms";
		}
		if(op.equals("history"))
		{	
			pageInfo = new PageInfo();
		    pageInfo.setPage(page);
		    pageInfo.setPageRows(pageRows);
		    if(con==null)
		    	con="all";
		    vistorDao.getRecordByOnwer(user_tel, con, pageInfo);
			return "history";
		}
    	return SUCCESS;
	}
	private List msnLisinfo;
	private List telgroupList;
	private List telList;
	private List classList;
	private List smsList;
	private List recordList;

	public List getRecordList() {
		return recordList;
	}
	public void setRecordList(List recordList) {
		this.recordList = recordList;
	}
	private String op;
	private String user_msn;
	private String user_tel;
	private String recmobile;
	private String smsclassid;
	private String con;
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	private String mes_id;
	
	public String getMes_id() {
		return mes_id;
	}
	public void setMes_id(String mes_id) {
		this.mes_id = mes_id;
	}
	private SmsDao smsDao;
	private Message_classDao messageDao;
	private Msn_certificationDao msnDao;
	private Telbook_groupDao telbookgroupDao;
	private Vistor_recordDao vistorDao;
	private Sms_recordDao smsrecordDao;
	public Sms_recordDao getSmsrecordDao() {
		return smsrecordDao;
	}
	public void setSmsrecordDao(Sms_recordDao smsrecordDao) {
		this.smsrecordDao = smsrecordDao;
	}
	public Vistor_recordDao getVistorDao() {
		return vistorDao;
	}
	public void setVistorDao(Vistor_recordDao vistorDao) {
		this.vistorDao = vistorDao;
	}
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
	public SmsDao getSmsDao() {
		return smsDao;
	}
	public void setSmsDao(SmsDao smsDao) {
		this.smsDao = smsDao;
	}
	public Message_classDao getMessageDao() {
		return messageDao;
	}
	public void setMessageDao(Message_classDao messageDao) {
		this.messageDao = messageDao;
	}
	public String getSmsclassid() {
		return smsclassid;
	}
	public void setSmsclassid(String smsclassid) {
		this.smsclassid = smsclassid;
	}
	public String getRecmobile() {
		return recmobile;
	}
	public void setRecmobile(String recmobile) {
		this.recmobile = recmobile;
	}
	private String content;
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public List getClassList() {
		return classList;
	}
	public void setClassList(List classList) {
		this.classList = classList;
	}
	public List getSmsList() {
		return smsList;
	}
	public void setSmsList(List smsList) {
		this.smsList = smsList;
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
