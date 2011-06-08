package com.catic.bean;

import com.catic.tool.*;

import java.sql.*;
import java.util.*;

/**
* <p>Title: </p>
* <p>Description: </p>
* <p>Copyright: Copyright (c) 2009</p>
* <p>Company: </p>
* @version 1.0
*/

public class UserManagerAction {
	private final String sKeyField="USERID";
	private final String sNAMEField = "USERNAME";
	private final String sPWDField = "USERPWD";
	private final String sTable = "SMS_MANAGER_USER";
	private final String sField = "USERID,USERNAME,USERPWD,USERREALNAME,USERROLE";
	private final String field_str[] = {"USERID","USERNAME","USERPWD","USERREALNAME","USERROLE"};
	
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData = null;
	UpdateData updateData = null;
	DeleteData deleteData = null;

public UserManagerAction() {
	dataConn = new DataConn();
}
	public List getAllUser() {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable;
			tempfield = sField;
			sCond =  "USERNAME<>'admin' order by "+sKeyField+" desc";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("USERID",rs.getString("USERID"));
				map.put("USERNAME",rs.getString("USERNAME"));
				map.put("USERPWD",rs.getString("USERPWD"));
				map.put("USERREALNAME",rs.getString("USERREALNAME"));
				map.put("USERROLE",rs.getString("USERROLE"));
				
				list.add(map);
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("错误原因:" + e.getMessage());
		}
		return list;
	}
	public boolean IsLogin(String username,String userpwd) {
		boolean flag = false;
		sCond =  sNAMEField +" = '" + username +"' and  " + sPWDField + " = '" +userpwd+"'";
		queryData = new QueryData(dataConn);
		queryData.setRecordCount(sTable, sCond);
		int count = queryData.getRecordCount();
		if(count>0)
			flag = true;
		dataConn.close();
		queryData.close();
		return flag;
		
	}
	public String getRealNameByname(String username) {
		String realname="";
		queryData = new QueryData(dataConn);
		try{
			sCond =  sNAMEField +" = '" + username +"'";
			queryData.setRecordSet(sTable, sField, sCond);
			rs = queryData.getResultSet();
			if(rs.next())
				realname = rs.getString("userrealname");
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("错误原因:" + e.getMessage());
		}
		return realname;
	}
	public boolean insert(String username,String pwd,String realname,String user_role) throws Exception {
		queryData = new QueryData(dataConn);
		insertData = new InsertData(dataConn);	
		boolean flag = false;
		String tempValueStr="";
		try {
		    int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    tempValueStr =iKey+",'"+ username + "','"+ pwd +"','"+ realname +"','"+user_role+"'"; 
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
	public boolean update(String userid,String username,String pwd,String realname,String user_role) throws Exception { 
		boolean flag = false;
		updateData = new UpdateData(dataConn);
		String tempStr="";
		try {   
		    tempStr = "USERNAME='"+username+"',USERPWD='"+pwd+"',USERREALNAME='"+realname+"',USERROLE='"+user_role+"'";
			sCond = "USERID='"+userid+"'"; 
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
	 
	public boolean delete(String sID[]) throws Exception { 
		deleteData = new DeleteData(dataConn);
		boolean flag = false; 
		try { 
			String idStr = KenString.arrayToString(sID); 
			sCond = sKeyField + " in (" + idStr + ")";   
			int iReturn = deleteData.delete(sTable, sCond);
			if(iReturn == 0)
		    	flag =true;
			dataConn.close();
			deleteData.close();
		} 
		catch (Exception e) { 
			throw e; 
		} 
		return flag; 
	}
	public void close() {

		 dataConn.close();
	}
}