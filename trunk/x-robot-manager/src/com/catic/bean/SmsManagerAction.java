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

public class SmsManagerAction {
	private final String sKeyField = "MES_ID";
	private final String sUnionKeyField = "CLASS_ID";
	private final String sTable = "SMS_SMS";
	private final String sUnionTable = "SMS_CLASS";
	private final String sField = "MES_ID,MES_CLASS,MES_CONTENT";
	private final String sUnionField = "CLASS_ID,CLASS_NAME";
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData =null;
	InsertData insertData = null;
	UpdateData updateData = null;
	DeleteData deleteData = null;
	public SmsManagerAction() {
		dataConn = new DataConn();
	}
	//所有信息
	public List getAllSms() {
		String temptable="";
		String tempfield="";
		queryData = new QueryData(dataConn);
		java.util.List list = new ArrayList();
		try{
			temptable = sTable + "," + sUnionTable;
			tempfield = sField + "," + sUnionField;
			sCond =  "CLASS_ID=MES_CLASS order by "+sKeyField+" desc";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("MES_ID",rs.getString("MES_ID"));
				map.put("CLASS_ID",rs.getString("CLASS_ID"));
				map.put("CLASS_NAME",rs.getString("CLASS_NAME"));
				map.put("MES_CONTENT",rs.getString("MES_CONTENT"));
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
	
	//根据类别取信息
	public List getSmsByCateId(String cateid) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable;
			tempfield = sField;
			sCond =  "MES_CLASS='"+cateid+"' order by "+sKeyField+" desc";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("MES_ID",rs.getString("MES_ID"));
				map.put("MES_CONTENT",rs.getString("MES_CONTENT"));
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
	
	//根据信息id取信息
	public List getSmsById(String mesid) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable + "," + sUnionTable;
			tempfield = sField + "," + sUnionField;
			sCond =  "CLASS_ID=MES_CLASS and MES_ID='"+mesid+"'";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			if (rs.next())
			{
				Map map = new HashMap();
				map.put("MES_ID",rs.getString("MES_ID"));
				
				map.put("CLASS_NAME",rs.getString("CLASS_NAME"));
				map.put("MES_CONTENT",rs.getString("MES_CONTENT"));
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
	
	//根据发送次数取信息
	public List getSmsBySend() {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable + "," + sUnionTable;
			tempfield = sField + "," + sUnionField;
			sCond =  "CLASS_ID=MES_CLASS  order by MES_SEND desc";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("MES_ID",rs.getString("MES_ID"));
				
				map.put("CLASS_NAME",rs.getString("CLASS_NAME"));
				map.put("MES_CONTENT",rs.getString("MES_CONTENT"));
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
	
	public boolean insert(String MES_CLASS,String MES_CONTENT) throws Exception {
		insertData = new InsertData(dataConn);
		queryData = new QueryData(dataConn);
		boolean flag = false;
		String tempValueStr="";
		try {
		    int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    tempValueStr =iKey+",'"+ MES_CLASS + "','"+ MES_CONTENT +"'"; 
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
	public boolean update(String MES_ID,String MES_CLASS,String MES_CONTENT) throws Exception { 
		updateData = new UpdateData(dataConn);
		boolean flag = false;
		String tempStr="";
		try {   
		    tempStr = "MES_CLASS='"+MES_CLASS+"',MES_CONTENT='"+MES_CONTENT+"'";
			sCond = "MES_ID='"+MES_ID+"'"; 
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