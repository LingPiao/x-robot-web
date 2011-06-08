<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<%@ include file="../session.jsp"%>


<%!
	private final String sKeyField = "BUG_ID";

	private final String sTable = "SMS_BUG";

	private final String sField = "BUG_ID,SUBJECT,CONTENT,FILEURL";

	String sCond = "";

	public boolean delete(String sID[],String url) throws Exception { 
		ResultSet rs1 = null;
	DataConn dataConn = new DataConn();
	QueryData queryData = new QueryData(dataConn);
	DeleteData deleteData = new DeleteData(dataConn);
		boolean flag = false; 
		try { 
			String idStr = KenString.arrayToString(sID); 
			sCond = sKeyField + " in (" + idStr + ")"; 
			queryData.setRecordSet(sTable,sField,sCond);
			rs1 = queryData.getResultSet();
			String filepath="";
			java.io.File file = null;
			while (rs1.next())
			{
				filepath = rs1.getString("FILEURL");
				filepath = url +filepath;
				 if (filepath != null) {
		             file    = new java.io.File(filepath);
		             if (file.exists()) {
		                 file.delete();
		             }
		         } 
			}
			rs1.close();			
			int iReturn = deleteData.delete(sTable, sCond);
			if(iReturn == 0)
		    	flag =true;
			dataConn.close();
		} 
		catch (Exception e) { 
			throw e; 
		} 
		return flag; 
	}
 %>
<% 
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
    
 
  
	String act =request.getParameter("action");

	if(act!=null)
	{
		if (act.equals("del"))
		{
			String mmsidArray[] = request.getParameterValues("mmsid");
			String url= request.getRealPath("runConfig.xml");
			//System.out.println(url);
			url = url.replace("runConfig.xml","");
			//System.out.println(url);
			if(this.delete(mmsidArray,url))
			{
				out.println("<script>alert('É¾³ý³É¹¦£¡');window.location.href='bug.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('É¾³ýÊ§°Ü£¡');window.location.href='bug.jsp';</script>");
			}
		}
	}


%>