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
	

	String msn=request.getParameter("mes_content");
	String mes_content=request.getParameter("mes_content1");
	if(msn==null||"null".equals(msn))
		msn="";
	if(mes_content==null||"null".equals(mes_content))
		mes_content="";

if("add".equals(action)){		
	table="T_FORBIDDENEMAIL";
	
	field_str="FORBIDDENEMAIL";
	value_str="'"+msn+"'";
	int i=insert.insert(table,field_str,value_str);

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
	table="T_FORBIDDENEMAIL";

	field_str="FORBIDDENEMAIL='"+msn+"'";
	value_str="FORBIDDENEMAIL='"+mes_content+"'";
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

	response.sendRedirect("filtermsn.jsp");
	conn.close();
	//request.getRequestDispatcher("../houtai.jsp").forward(request,response);
 %>
  </body>
</html>
