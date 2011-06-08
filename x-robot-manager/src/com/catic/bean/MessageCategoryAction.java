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

public class MessageCategoryAction {
	private final String sKeyField = "CLASS_ID";
	private final String sTable = "SMS_CLASS";
	private final String sField = "CLASS_ID,CLASS_NAME";
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData = null;
	UpdateData updateData = null;
	DeleteData deleteData = null;
	public MessageCategoryAction() {
		dataConn = new DataConn();
	}
	
	public List getAllCategory() {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			sCond =  "1=1 order by " +sKeyField;
			queryData.setRecordSet(sTable, sField, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("CLASS_ID",rs.getString("CLASS_ID"));
				map.put("CLASS_NAME",rs.getString("CLASS_NAME"));
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
	public List getCategoryById(String cateid) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable;
			tempfield = sField;
			sCond =  sKeyField+"='"+cateid+"'";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			if (rs.next())
			{
				Map map = new HashMap();
				map.put("CLASS_ID",rs.getString("CLASS_ID"));			
				map.put("CLASS_NAME",rs.getString("CLASS_NAME"));
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
	public boolean insert(String CLASS_NAME) throws Exception {
		boolean flag = false;
		String tempValueStr="";
		queryData = new QueryData(dataConn);
		insertData = new InsertData(dataConn);
		try {
		    int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    tempValueStr =iKey+",'"+ CLASS_NAME +"'"; 
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
	public boolean update(String CLASS_ID,String CLASS_NAME) throws Exception { 
		boolean flag = false;
		String tempStr="";
		updateData = new UpdateData(dataConn);
		try {   
		    tempStr = "CLASS_NAME='"+CLASS_NAME+"'";
			sCond = "CLASS_ID='"+CLASS_ID+"'"; 
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
	public String getCategoryNameById(String cateid) {
		String temptable="";
		String tempfield="";
		String catename="";
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable;
			tempfield = sField;
			sCond =  sKeyField+"='"+cateid+"'";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			if (rs.next())
			{
				catename=rs.getString("CLASS_NAME");
			}
			//System.out.println(catename);
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("错误原因:" + e.getMessage());
		}
		return catename;
	}
	public void close() {
		 dataConn.close();
	}
}