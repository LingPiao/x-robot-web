package com.catic.bean;

import com.catic.tool.*;

import java.io.IOException;
import java.sql.*;
import java.util.*;

/**
* <p>Title: </p>
* <p>Description: </p>
* <p>Copyright: Copyright (c) 2009</p>
* <p>Company: </p>
* @version 1.0
*/

public class UserCertificationAction {
	private final String sKeyField="USER_MSN";
	private final String sTable = "MSN_CERTIFICATION";
	private final String sField = "USER_MSN,USER_TEL,USER_AREA";
	private final String field_str[] = {"USER_MSN","USER_TEL","USER_AREA"};
	
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData =null;
	UpdateData updateData = null;

public UserCertificationAction() {
	dataConn = new DataConn();
}
	public boolean IsCertification(String usermsn) {
		queryData = new QueryData(dataConn);
		boolean flag = false;
		sCond =  sKeyField +" = '" + usermsn +"'";
		queryData.setRecordCount(sTable, sCond);
		int count = queryData.getRecordCount();
		if(count>0)
			flag = true;
		dataConn.close();
		queryData.close();
		return flag;
		
	}
	public String getUserTelByusermsn(String usermsn) {
		String realname="";
		queryData = new QueryData(dataConn);
		try{
			sCond =  sKeyField +" = '" + usermsn +"'";
			queryData.setRecordSet(sTable, sField, sCond);
			rs = queryData.getResultSet();
			if(rs.next())
				realname = rs.getString("user_tel");
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("错误原因:" + e.getMessage());
		}
		return realname;
	}
	public boolean insert(String usermsn,String usertel,String area) throws Exception {
		boolean flag = false;
		insertData = new InsertData(dataConn);
		String tempValueStr="";
		try {
		    tempValueStr ="'"+ usermsn + "','"+ usertel +"','"+ area +"'"; 
		    int iReturn = insertData.insert(sTable, sField, tempValueStr);
		    if(iReturn == 0)
		    	flag =true;
		    dataConn.close();
		    insertData.close();
		}
		catch (Exception e) {
		    throw e;
		}
		return flag;
	}
	public boolean update(String usermsn,String usertel,String area) throws Exception { 
		boolean flag = false;
		String tempStr="";
		updateData = new UpdateData(dataConn);
		try {   
		    tempStr = "user_tel='"+usertel+"',user_area='"+area+"'";
			sCond = "user_msn='"+usermsn+"'"; 
			int iReturn = updateData.update(sTable, tempStr, sCond);
			if(iReturn == 0)
		    	flag =true; 
			dataConn.close();
			updateData.close();
		} 
		catch (Exception e) { 
			throw e; 
		} 
		return flag; 
	}
	public void close() {

		 dataConn.close();
	}
	
	public  String getCode(String tel,String s_url){
			int begin=0;
			int end=0;
			String i="";
			String fanhui="";
			//System.out.println(phone);
        	String url=s_url;
        	try {
        	Map<String, String> maps=new HashMap<String, String>();
        	//phone="13258130175";
        	maps.put("AccCode", tel);

        	//url+="?MsnAcc="+msn;
        	//url+="&Question="+question;
        	//url+="&QuestionID="+questionid;
            HttpRequester request = new HttpRequester();   
            //HttpRespons hr = request.sendGet("http://www.csdn.net");   
            //System.out.println(url);
            //HttpRespons hr =request.sendPost(url);
            
			HttpRespons hr =request.sendPost(url,maps);
			fanhui=hr.getContent();
			System.out.println(fanhui);
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
			//	System.out.println(fanhui);
	    		
	    	}else if("0".equals(i)){
	    		
	    		
	    		//begin=fanhui.indexOf("<msg>");
				//end=fanhui.indexOf("</msg>");
				//if(begin>0&&end>0)
					//fanhui=fanhui.substring(begin+5, end);
			//	System.out.println(fanhui);
				fanhui="未知";
	    	}
		

		return fanhui;
		
	}
	public static void main(String[] arges){
		UserCertificationAction u=new UserCertificationAction();
		u.getCode("13260005227","http://119.6.5.183:8081/100001000200001");
	}
	public  boolean isNumeric(String str){
		for (int i = str.length();--i>=0;){   
		   if (!Character.isDigit(str.charAt(i))){
			   return false;
		   }
		}
		return true;
	}
	
}