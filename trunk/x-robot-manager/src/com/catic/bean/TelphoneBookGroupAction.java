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

public class TelphoneBookGroupAction {
	private final String sKeyField = "seqid";

	private final String sTable = "SMS_TELBOOK_GROUP";

	private final String sField = "SEQID,GROUPNAME,OWNERNAME";
	Encryption encryption = new Encryption();
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData = null;
	UpdateData updateData = null;
	DeleteData deleteData = null;
	public TelphoneBookGroupAction() {
		dataConn = new DataConn();
	}
	//��ѯ���з�����Ϣ������������ϵ�ˣ�Ҳ�������ݿ���idΪ1�ģ���idÿ���û�����ӵ��,���ֶβ���ɾ��
	public List getOwnGroupByMobile(String mobile) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		mobile=encryption.getDecrypt(mobile);
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable ;
			tempfield = sField ;
			sCond =  "OWNERNAME='"+mobile+"' or OWNERNAME='*' order by GROUPNAME";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("SEQID",rs.getString("SEQID"));
				map.put("GROUPNAME",rs.getString("GROUPNAME"));
				map.put("OWNERNAME",rs.getString("OWNERNAME"));
				list.add(map);
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return list;
	}
	//��ѯ���з�����Ϣ��������������ϵ�ˣ�Ҳ�������ݿ���idΪ1�ģ���idÿ���û�����ӵ��
	public List getGroupByMobile(String mobile) {
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		mobile=encryption.getDecrypt(mobile);
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable ;
			tempfield = sField ;
			sCond =  "OWNERNAME='"+mobile+"' order by GROUPNAME";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("SEQID",rs.getString("SEQID"));
				map.put("GROUPNAME",rs.getString("GROUPNAME"));
				map.put("OWNERNAME",rs.getString("OWNERNAME"));
				list.add(map);
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return list;
	}
	
//	������Ϣ
	public String getGroupBySeqid(String id) {
		String temptable="";
		String tempfield="";
		String conname="";
		queryData = new QueryData(dataConn);
		try{
			temptable = sTable ;
			tempfield = sField ;
			
			sCond =  "SEQID='"+id+"'";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			if (rs.next())
			{
				conname=rs.getString("GROUPNAME");
			}
			rs.close();
			dataConn.close();
			queryData.close();
		}  
		catch (java.sql.SQLException e) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return conname;
	}
	
	public boolean insert(String groupname,String ownername) throws Exception {
		ownername=encryption.getDecrypt(ownername);
		insertData = new InsertData(dataConn);
		boolean flag = false;
		String tempValueStr="";
		try {
		    int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    tempValueStr =iKey+",'"+ groupname + "','"+ ownername +"'"; 
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
	public boolean update(String seqid,String groupname,String ownername) throws Exception { 
		ownername=encryption.getDecrypt(ownername);
		 updateData = new UpdateData(dataConn);
		boolean flag = false;
		String tempStr="";
		try {   
		    tempStr = "GROUPNAME='"+groupname+"'";
			sCond = "SEQID='"+seqid+"'"; 
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