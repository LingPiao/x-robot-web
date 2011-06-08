package com.catic.bean;

import com.catic.tool.*;

import java.sql.*;
import java.util.*;


public class SendRecordAction {
	private final String sKeyField = "REC_ID";
	private final String sTable = "SMS_RECORD";
	private final String sField = "REC_ID,REC_SEND_TEL,REC_SEND_TIME,REC_SEND_CONTENT,REC_RECIEVE_TEL,REC_RECIEVE_NAME,MEG_CLASS,REC_SEND_PICURL,del";
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData = null;
	UpdateData updateData = null;
	Encryption encryption = new Encryption();
	public SendRecordAction() {
		dataConn = new DataConn();
	}
	public List getAllRecord() {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			sCond =  "1=1 order by " +sKeyField+ " desc";
			queryData.setRecordSet(sTable, sField, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("REC_ID",rs.getString("REC_ID"));
				map.put("REC_SEND_TEL",rs.getString("REC_SEND_TEL"));
				map.put("REC_SEND_TIME",rs.getString("REC_SEND_TIME"));
				map.put("REC_SEND_CONTENT",rs.getString("REC_SEND_CONTENT"));
				map.put("REC_RECIEVE_TEL",rs.getString("REC_RECIEVE_TEL"));
				map.put("REC_RECIEVE_NAME",rs.getString("REC_RECIEVE_NAME"));
				
				map.put("MEG_CLASS", rs.getObject("MEG_CLASS"));
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
	
	public List getRecordByMobile(String mobile,String con) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		ConvertDate cdate = new ConvertDate();
		mobile=encryption.getDecrypt(mobile);
		queryData = new QueryData(dataConn);
		try{
			if(con.equals("all"))
			{
				sCond = "1=1 and ";
			}
			if(con.equals("today"))
			{				
				String today=cdate.dateToYMD(new java.util.Date());
				sCond = "'"+today+"' = to_char(REC_SEND_TIME,'yyyy-mm-dd') and ";
			}
			if(con.equals("week"))
			{
				String bgin = cdate.getMondayOfThisWeek();
				String ends = cdate.getSundayOfThisWeek();
				sCond = "to_char(REC_SEND_TIME,'yyyy-mm-dd') >= '"+bgin+"' and  to_char(REC_SEND_TIME,'yyyy-mm-dd')<='"+ends+"' and ";
			}
			if(con.equals("month"))
			{
				String today=cdate.dateToYMD(new java.util.Date()).substring(0,7);
				sCond = "to_char(REC_SEND_TIME,'yyyy-mm-dd') like '"+today+"%' and ";
			}
			sCond +=  "REC_SEND_TEL='"+mobile+"' and del=0 order by REC_SEND_TIME desc";
			queryData.setRecordSet(sTable, sField, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("REC_ID",rs.getString("REC_ID"));
				map.put("REC_SEND_TEL",rs.getString("REC_SEND_TEL"));
				map.put("REC_SEND_TIME",rs.getString("REC_SEND_TIME"));
				map.put("REC_SEND_CONTENT",rs.getString("REC_SEND_CONTENT"));
				map.put("REC_RECIEVE_TEL",rs.getString("REC_RECIEVE_TEL"));
				map.put("REC_RECIEVE_NAME",rs.getString("REC_RECIEVE_NAME"));
				map.put("MEG_CLASS", rs.getObject("MEG_CLASS"));
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
//查询
	public List SerachResult(String mobile,String con,String val) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		mobile=encryption.getDecrypt(mobile);
		ConvertDate cdate = new ConvertDate();
		queryData = new QueryData(dataConn);
		try{

			if(con.equals("everyday"))
			{				
				sCond = "to_char(REC_SEND_TIME,'yyyy-mm-dd') like '"+val+"%' and ";
			}
			if(con.equals("num"))
			{
				sCond = "REC_RECIEVE_TEL like  '"+val+"%' and ";
			}
			
			sCond +=  "REC_SEND_TEL='"+mobile+"' and del=0 order by REC_SEND_TIME desc";
			queryData.setRecordSet(sTable, sField, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("REC_ID",rs.getString("REC_ID"));
				map.put("REC_SEND_TEL",rs.getString("REC_SEND_TEL"));
				map.put("REC_SEND_TIME",rs.getString("REC_SEND_TIME"));
				map.put("REC_SEND_CONTENT",rs.getString("REC_SEND_CONTENT"));
				map.put("REC_RECIEVE_TEL",rs.getString("REC_RECIEVE_TEL"));
				map.put("REC_RECIEVE_NAME",rs.getString("REC_RECIEVE_NAME"));
				map.put("MEG_CLASS", rs.getObject("MEG_CLASS"));
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
	
	public List CountBySend() {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			String ssField ="rec_send_tel,MEG_CLASS, count(rec_send_tel) as count";
			sCond =  "1=1 group by MEG_CLASS,rec_send_tel";
			queryData.setRecordSet(sTable, ssField, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				
				map.put("name",rs.getString("REC_SEND_TEL"));
				map.put("mesclass",rs.getString("MEG_CLASS"));
				map.put("count",rs.getString("count"));
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
	public List CountByDay() {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		queryData = new QueryData(dataConn);
		try{
			String ssField ="to_char(REC_SEND_TIME,'yyyy-mm') as REC_SEND_TIME,MEG_CLASS, count(to_char(REC_SEND_TIME,'yyyy-mm')) as count";
			sCond =  "1=1 group by MEG_CLASS,to_char(REC_SEND_TIME,'yyyy-mm')";
			queryData.setRecordSet(sTable, ssField, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				
				map.put("name",rs.getString("REC_SEND_TIME"));
				map.put("mesclass",rs.getString("MEG_CLASS"));
				map.put("count",rs.getString("count"));
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
	public boolean insert(String sendmobile,String recmobile,String recname,String content,String mesclass,String url) throws Exception {
		boolean flag = false;
		insertData = new InsertData(dataConn);
		queryData = new QueryData(dataConn);
		String tempValueStr="";
		sendmobile=encryption.getDecrypt(sendmobile);
		try {
		    int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    tempValueStr =iKey+",'"+ sendmobile + "',sysdate,'"+ content +"','"+ recmobile +"','"+ recname +"','"+mesclass+"','"+ url +"','0'"; 
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
	public boolean update(String sID[]) throws Exception { 
		boolean flag = false;
		String tempStr="";
		updateData = new UpdateData(dataConn);
		try {   
		    tempStr = "del='1'";
		    String idStr = KenString.arrayToString(sID); 
			sCond = sKeyField + " in (" + idStr + ")"; 
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
}
