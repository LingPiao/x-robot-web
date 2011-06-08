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
	
	//System.out.println(action);
	String mes_id=request.getParameter("mes_id");
	if(mes_id==null||"null".equals(mes_id))
		mes_id="";
	String mes_content=request.getParameter("mes_content");
	if(mes_content==null||"null".equals(mes_content))
		mes_content="";

if("add".equals(action)){		
	table="T_FORBIDDENWORD";
	int id=query.KeyNextValue(table,"FORBIDDENID");
	
	//System.out.println(id);
	field_str="FORBIDDENID,FORBIDDEN";
	value_str=id+",'"+mes_content+"'";
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
	table="T_FORBIDDENWORD";
	String id=request.getParameter("mes_id");
	
	//System.out.println(id);
	field_str="FORBIDDEN";
	value_str="'"+mes_content+"'";
	int i=update.update(table,field_str,value_str,"FORBIDDENID",id);

	
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

	response.sendRedirect("filter.jsp");
	conn.close();
	//request.getRequestDispatcher("../houtai.jsp").forward(request,response);
 %>
  </body>
</html>
