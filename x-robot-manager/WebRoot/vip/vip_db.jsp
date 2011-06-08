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


if("add".equals(action)){	
	String cmobile=new String(request.getParameter("c_mobile"));//.getBytes("8859_1")
	String[] CONTACTEMAILARR=cmobile.split(";");
	String mmobile = request.getParameter("m_mobile");
	String con="m_mobile='"+mmobile+"'";
	query.setRecordCount("t_vip_manager",con);
	int count = query.getRecordCount();
	if(count == 0)
	{
		insert.insert("t_vip_manager","m_mobile",mmobile);
	}
	int i=0;
	for(int j=0;j<CONTACTEMAILARR.length;j++)
	{
	
	value_str="'"+CONTACTEMAILARR[j]+"','"+mmobile+"'";
	i=insert.insert("t_vip_customer","c_mobile,m_mobile",value_str);
	}
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入成功');");
		out.print("window.location.href='vip.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入失败');");
		out.print("window.location.href='vip.jsp';");
		out.print("</SCRIPT>");		
	}
}
else if(action.equals("del"))
	{
	int i=0;
		DeleteData delete=new DeleteData(conn);
    String[] ids=request.getParameterValues("mesid");
    for(int m=0;m<ids.length;m++)
    {
	String[] temp =ids[m].split("-");
    	table="t_vip_customer";
    	value_str="m_mobile='"+temp[0]+"' and c_mobile='"+temp[1]+"'";    		
	i = delete.delete(table,value_str);
    }
		if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('删除成功');");
		out.print("window.location.href='vip.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('删除失败');");
		out.print("window.location.href='vip.jsp';");
		out.print("</SCRIPT>");
		
	}
	}
	//response.sendRedirect("service_mind.jsp");
	conn.close();
 %>
  </body>
</html>
