<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import = "com.catic.tool.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     
    <title>My JSP 'operation.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%
	request.setCharacterEncoding("gb2312");
	String action=request.getParameter("action");
	String url="";
	String table="";
	String field_str="";
	String value_str="";
	DataConn conn=new DataConn();
	InsertData insert=new InsertData(conn);
	QueryData query=new QueryData(conn);
	
	
	String seqid=request.getParameter("seqid");
	if(seqid==null||"null".equals(seqid))
		seqid="";
	System.out.println(seqid);
	String DISPLAYNAME=new String(request.getParameter("DISPLAYNAME"));//.getBytes("8859_1")
	String mes_content=new String(request.getParameter("mes_content"));
	if(mes_content==null||"null".equals(mes_content))
		mes_content="";

if("add".equals(action)){		
	table="T_ROBOTDISPLAY";
	int rank=query.KeyNextValue("T_ROBOTDISPLAY where MANAGEMENTID=2","RANK");
	int id = query.KeyNextValue("T_ROBOTDISPLAY","seqid");
	//System.out.println(id);
	field_str="ROBOTEMAIL,DISPLAYNAME,PERSONALMESSAGE,RANK,MANAGEMENTID,seqid";
	value_str="'.*','"+DISPLAYNAME+"','"+mes_content+"',"+rank+",2,"+id;
	int i=insert.insert(table,field_str,value_str);

	//System.out.println(i);
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入成功')");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入失败')");
		out.print("</SCRIPT>");
		
	}
}
else if("edit".equals(action)){
	UpdateData update=new UpdateData(conn);
	table="T_ROBOTDISPLAY";
	
	field_str="DISPLAYNAME='"+DISPLAYNAME+"',PERSONALMESSAGE='"+mes_content+"'";
	value_str="seqid='"+seqid+"'";
	int i=update.update(table,field_str,value_str);

	
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改成功')");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改失败')");
		out.print("</SCRIPT>");
		
	}
}
	response.sendRedirect("robotname.jsp");
	conn.close();
 %>
  </body>
</html>
