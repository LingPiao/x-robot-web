package com.catic.bean;

import com.catic.tool.*;

import java.sql.*;
import java.util.*;
import java.io.*;

/**
* <p>Title: </p>
* <p>Description: </p>
* <p>Copyright: Copyright (c) 2009</p>
* <p>Company: </p>
* @version 1.0
*/

public class MmsManagerAction {
	private final String sKeyField = "MMS_ID";
	private final String sUnionKeyField = "CLASS_ID";
	private final String sTable = "SMS_MMS";
	private final String sUnionTable = "SMS_CLASS";
	private final String sField = "MMS_ID,MMS_TITLE,MMS_CLASS,MMS_PICURL";
	private final String sUnionField = "CLASS_ID,CLASS_NAME";
	String sCond = "";
	ResultSet rs = null;
	DataConn dataConn = null;
	QueryData queryData = null;
	InsertData insertData = null;
	UpdateData updateData = null;
	DeleteData deleteData = null;
	public MmsManagerAction() {
		dataConn = new DataConn();
	}
	
	public List getAllMms() {
		queryData = new QueryData(dataConn);
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		try{
			temptable = sTable + "," + sUnionTable;
			tempfield = sField + "," + sUnionField;
			sCond =  "CLASS_ID=MMS_CLASS order by "+sKeyField+" desc";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("MMS_ID",rs.getString("MMS_ID"));
				map.put("CLASS_ID",rs.getString("CLASS_ID"));
				map.put("CLASS_NAME",rs.getString("CLASS_NAME"));
				map.put("MMS_TITLE", rs.getString("MMS_TITLE"));
				map.put("MMS_PICURL",rs.getString("MMS_PICURL"));
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
	public List getMmsById(String mmsid) {
		queryData = new QueryData(dataConn);
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		try{
			temptable = sTable + "," + sUnionTable;
			tempfield = sField + "," + sUnionField;
			sCond =  "CLASS_ID=MMS_CLASS and MMS_ID='"+mmsid+"'";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			if (rs.next())
			{
				Map map = new HashMap();
				map.put("MMS_ID",rs.getString("MMS_ID"));
				map.put("MMS_TITLE", rs.getString("MMS_TITLE"));
				map.put("CLASS_NAME",rs.getString("CLASS_NAME"));
				map.put("MMS_PICURL",rs.getString("MMS_PICURL"));
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
	
	public List getMmsByCateId(String cateid) {
		queryData = new QueryData(dataConn);
		String temptable="";
		String tempfield="";
		java.util.List list = new ArrayList();
		try{
			temptable = sTable ;
			tempfield = sField ;
			sCond =  "MMS_CLASS='"+cateid+"' order by "+sKeyField+" desc";
			queryData.setRecordSet(temptable, tempfield, sCond);
			rs = queryData.getResultSet();
			
			while (rs.next())
			{
				Map map = new HashMap();
				map.put("MMS_ID",rs.getString("MMS_ID"));
				map.put("MMS_TITLE", rs.getString("MMS_TITLE"));
				map.put("MMS_PICURL",rs.getString("MMS_PICURL"));
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
	
	//MMS_CONTENT代表图片的路径，图片存放到BLOG字段
	public boolean insert(String MMS_CLASS,String MMS_TITLE,String MMS_CONTENT) throws Exception {
		insertData = new InsertData(dataConn);
		queryData = new QueryData(dataConn);
		boolean flag = false;
		try {
		    int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    int iReturn=insertData.insertBinaryStream(sTable, sField, iKey, MMS_CLASS, MMS_TITLE, MMS_CONTENT); 	       
		    //System.out.println("file   is   saved   into   filetable");   
		    //System.out.println("file   is   saved   into   filetable"+iReturn);   
		    if(iReturn == 0)
		    	flag =true;
		    dataConn.close();
		    queryData.close();
		    insertData.close();
		}
		catch (Exception e) {
		    throw e;
		}
		return flag;
	}
	public boolean update(String MmS_ID,String MmS_CLASS,String MmS_title) throws Exception { 
		updateData = new UpdateData(dataConn);
		boolean flag = false;
		String tempStr="";
		try {   
			tempStr ="MMS_TITLE='"+MmS_title+"',MMS_CLASS='"+MmS_CLASS+"'";
			sCond = "MMS_ID='"+MmS_ID+"'"; 
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
	 
	public boolean delete(String sID[],String url) throws Exception { 
		queryData = new QueryData(dataConn);
		deleteData = new DeleteData(dataConn);
		boolean flag = false; 
		try { 
			String idStr = KenString.arrayToString(sID); 
			sCond = sKeyField + " in (" + idStr + ")"; 
			queryData.setRecordSet(sTable,sField,sCond);
			rs = queryData.getResultSet();
			String filepath="";
			java.io.File file = null;
			while (rs.next())
			{
				filepath = rs.getString("MMS_PICURL");
				filepath = url +filepath;
				 if (filepath != null) {
		             file    = new java.io.File(filepath);
		             if (file.exists()) {
		                 file.delete();
		             }
		         } 
			}
			
			
			int iReturn = deleteData.delete(sTable, sCond);
			if(iReturn == 0)
		    	flag =true;
			dataConn.close();
			rs.close();	
			queryData.close();
			deleteData.close();
		} 
		catch (Exception e) { 
			throw e; 
		} 
		return flag; 
	}
	   /**
     * 附件添加方法
     * @param mySmartUpload
     * @throws Exception
     */
    public boolean InsertAndUpload(String syspath,String savepath,com.jspsmart.upload.File myFile,String mmscateid,String mmstitle)throws Exception{
    	boolean flag = false;
    	String tempValueStr="";
    	insertData = new InsertData(dataConn);
    	queryData = new QueryData(dataConn);
        try {
            String strPath = "";
            String changefilename= "";
            int iKey = queryData.KeyNextValue(sTable, sKeyField);
		    tempValueStr =iKey+",'"+ mmstitle + "','"+ mmscateid +"'";
            com.jspsmart.upload.strDateTime theDateTime;           
            theDateTime = new com.jspsmart.upload.strDateTime();     
            String strDateTime;        
            strDateTime = theDateTime.getDateTime();
            String xdUrl=savepath+"/"+iKey;
            java.io.File f = new java.io.File(syspath+"/"+iKey);
			if(!f.exists())
			{
				f.mkdirs();
			}
            
	        if (!myFile.isMissing()) {
	        	changefilename =strDateTime+"."+myFile.getFileExt();
	            strPath = xdUrl+"/"+ changefilename;

		        tempValueStr = tempValueStr +",'"+strPath+"'";
		        int iReturn =insertData.insert(sTable, sField, tempValueStr);
	            if(iReturn == 0)
	            {
	            	myFile.saveAs(strPath);
	            	flag =true;
	            }
	            
	        }
			dataConn.close();
			queryData.close();
			insertData.close();
        }
        catch(Exception e) {
            throw e;
        }
        return flag;  
    }
    /**
     * 附件修改方法
     * @param mySmartUpload
     * @throws Exception
     */
    public boolean UpdateAndUpload(String syspath,String savepath,com.jspsmart.upload.File myFile,String mmsid,String mmscateid,String mmstitle)throws Exception{
    	boolean flag = false;
    	String tempValueStr="";
    	updateData = new UpdateData(dataConn);
        try {
            String strPath = "";
            String changefilename= "";
		    
		    sCond = "MMS_ID='"+mmsid+"'"; 
            com.jspsmart.upload.strDateTime theDateTime;           
            theDateTime = new com.jspsmart.upload.strDateTime();     
            String strDateTime;        
            strDateTime = theDateTime.getDateTime();
            String xdUrl=savepath  +"/"+mmsid;
            java.io.File f = new java.io.File(syspath+"\\"+mmsid);
			if(!f.exists())
			{
				f.mkdirs();
			}
            
	        if (!myFile.isMissing()) {
	        	changefilename =strDateTime+"."+myFile.getFileExt();
	            strPath = xdUrl+"/"+ changefilename;
	            tempValueStr ="MMS_TITLE='"+mmstitle+"',MMS_CLASS='"+mmscateid+"',MMS_PICURL='"+strPath+"'";
		        int iReturn =updateData.update(sTable, tempValueStr, sCond);
	            if(iReturn == 0)
	            {
	            	myFile.saveAs(strPath);
	            	flag =true;
	            }
	        }
			dataConn.close();
			updateData.close();
        }
        catch(Exception e) {
            throw e;
        }
        return flag;
    }
	public void close() {
		 dataConn.close();
	}
}