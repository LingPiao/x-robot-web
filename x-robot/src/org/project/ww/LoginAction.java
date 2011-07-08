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


import org.project.dao.Msn_certificationDao;
import org.project.model.Mmsn_certification;


import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionSupport;



public class LoginAction extends ActionSupport 
{
	private Msn_certificationDao msnDao;
	
	public Msn_certificationDao getMsnDao() {
		return msnDao;
	}
	public void setMsnDao(Msn_certificationDao msnDao) {
		this.msnDao = msnDao;
	}
	private List msnLisinfo;
	public String execute()	throws Exception
	{
		if(op.equals("check"))
		{	
			//System.out.println(user_msn);
			msnLisinfo = msnDao.getUserTelByMsnId(user_msn);
			//System.out.println(msnLisinfo.size());
			if (msnLisinfo.size()<=0)
				return "checkerror";
			else {
				Map map = (Map) msnLisinfo.get(0);
				user_tel =map.get("USER_TEL").toString();
				return "check";
			}
		}
		if(op.equals("bind"))
		{
			System.out.println("****************************************");
			List tempList = msnDao.getUserTelByMsnId(user_msn);
			if(tempList .size()>0)
			{
				Map map = (Map) tempList.get(0);
				user_tel =map.get("USER_TEL").toString();
			}
			System.out.println(user_tel);
			return "bind";
		}
		if(op.equals("unbind"))
		{
			//System.out.println(user_tel);
			
			//System.out.println("****************************************");
			//System.out.println(areacode);
			msnDao.del(user_msn, user_tel);
			return "unbind";
		}
		if(op.equals("add"))
		{
			//System.out.println(user_tel);
			String areacode=getAreaCode(user_tel);
			//System.out.println("****************************************");
			//System.out.println(areacode);
			if(msnDao.check(user_msn))
				msnDao.update(user_msn, user_tel);
			else
				msnDao.insertUser(user_msn,user_tel,areacode);
			return "add";
		}
    	return SUCCESS;
	}
	public  String getAreaCode(String tel)
	{
		int begin=0;
		int end=0;
		String i="";
		String fanhui="";
    	String url="http://119.6.5.183:8081/100001000200001";
    	try 
    	{
    		Map<String, String> maps=new HashMap<String, String>();
    		maps.put("AccCode", tel);
    		HttpRequester request = new HttpRequester(); 
        
			HttpRespons hr =request.sendPost(url,maps);
			fanhui=hr.getContent();
			//System.out.println(fanhui);
	        i=String.valueOf(fanhui.charAt(56));       	
		} catch (IOException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		if("1".equals(i)){
			
			begin=fanhui.indexOf("<AreaName>");
			end=fanhui.indexOf("</AreaName>");
			if(begin>0&&end>0)
				fanhui=fanhui.substring(begin+10, end);    		
    	}else if("0".equals(i)){ 		
    	}
	return fanhui;	
	}	
	private String op;
	private String user_msn;
	private String user_tel;
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
}
