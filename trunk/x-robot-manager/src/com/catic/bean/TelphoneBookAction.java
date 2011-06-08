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

public class TelphoneBookAction {
	private final String sKeyField = "ID";

	private final String sTable = "SMS_TELBOOK";

	private final String sField = "ID,ONWER_NAME,ONWER_TEL,CONTACT_NAME,CONTACT_TEL,GROUP_ID";
	Encryption encryption = new Encryption();
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData = null;
	UpdateData updateData = null;
	DeleteData deleteData = null;
	public TelphoneBookAction() {
		dataConn = new DataConn();
	}
	//所有信息
	public List getBookByMobile(String mobile,String groupid) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		mobile=encryption.getDecrypt(mobile);
		queryData = new QueryData(dataConn);
		try{
			temptable = "sms_telbook t";
			tempfield = "t.id,t.onwer_name,t.onwer_tel,t.contact_name,t.contact_tel,t.group_id";
			sCond =  "ONWER_TEL='"+mobile+"'";
			if(!groupid.equals(""))
				sCond += " and group_id='"+groupid+"' ";
			sCond += " order by CONTACT_NAME";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("ID",rs.getString("ID"));
				map.put("CONTACT_NAME",rs.getString("CONTACT_NAME"));
				map.put("CONTACT_TEL",rs.getString("CONTACT_TEL"));
				map.put("GROUP_ID",rs.getString("GROUP_ID"));			
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
	public List getBookByMobile(String mobile) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		mobile=encryption.getDecrypt(mobile);
		queryData = new QueryData(dataConn);
		try{
			temptable = "sms_telbook t,sms_telbook_group t1";
			tempfield = "t.id,t.onwer_name,t.onwer_tel,t.contact_name,t.contact_tel,t.group_id";
			sCond =  "t.group_id=t1.seqid and t.ONWER_TEL='"+mobile+"'";
			sCond += " order by CONTACT_NAME";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("ID",rs.getString("ID"));
				map.put("CONTACT_NAME",rs.getString("CONTACT_NAME"));
				map.put("CONTACT_TEL",rs.getString("CONTACT_TEL"));
				map.put("GROUP_ID",rs.getString("GROUP_ID"));			
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
	//所有信息
	public List getBookByGroup(String groupid) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			temptable = "sms_telbook t,sms_telbook_group"; ;
			tempfield = "sms_telbook_group.groupname,t.id,t.onwer_name,t.onwer_tel,t.contact_name,t.contact_tel"; ;
			sCond =  "t.group_id='"+groupid+"' and  t.group_id = sms_telbook_group.seqid order by CONTACT_NAME";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("ID",rs.getString("ID"));
				map.put("CONTACT_NAME",rs.getString("CONTACT_NAME"));
				map.put("CONTACT_TEL",rs.getString("CONTACT_TEL"));
				map.put("GROUP_ID",rs.getString("GROUP_ID"));
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
//	所有信息
	public String getConNameByMobile(String mobile) {
		mobile=encryption.getDecrypt(mobile);
		queryData = new QueryData(dataConn);
		String temptable="";
		String tempfield="";
		String conname="";
		try{
			temptable = sTable ;
			tempfield = sField ;
			
			sCond =  "CONTACT_TEL='"+mobile+"'";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			if (rs.next())
			{
				conname=rs.getString("CONTACT_NAME");
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("错误原因:" + e.getMessage());
		}
		return conname;
	}
	
	public boolean insert(String owntel,String conname,String contel,String groupid) throws Exception {
		owntel=encryption.getDecrypt(owntel);
		insertData = new InsertData(dataConn);
		queryData = new QueryData(dataConn);
		boolean flag = false;
		String tempValueStr="";
		try {
		    int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    tempValueStr =iKey+",'"+ owntel + "','"+ owntel +"','"+ conname + "','"+ contel +"','"+ groupid +"'"; 
		    int iReturn = insertData.insert(sTable, sField, tempValueStr);
		    if(iReturn == 0)
		    	flag =true;
		    dataConn.close();
		    insertData.close();
		    queryData.close();
		}
		catch (Exception e) {
		    throw e;
		}
		return flag;
	}
	public boolean update(String ID,String conname,String contel,String groupid) throws Exception { 
		boolean flag = false;
		updateData = new UpdateData(dataConn);
		String tempStr="";
		try {   
		    tempStr = "CONTACT_NAME='"+conname+"',CONTACT_TEL='"+contel+"',GROUP_ID='"+groupid+"'";
			sCond = "ID='"+ID+"'"; 
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