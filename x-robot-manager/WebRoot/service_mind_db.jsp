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
	String CONTACTEMAIL1=new String(request.getParameter("contactemail"));//.getBytes("8859_1")
	String[] CONTACTEMAILARR=CONTACTEMAIL1.split(";");
	String begin = request.getParameter("begin");
	String Hours = request.getParameter("Hours");
	String Minutes = request.getParameter("Minutes");
	String NOTIFYTIME=begin+" "+Hours+":"+Minutes;
	String PERIOD=new String(request.getParameter("period"));
	String CONTENT=new String(request.getParameter("content"));
	String EMAIL=new String(request.getParameter("email"));
	if(EMAIL == null)
		EMAIL="";
	table="t_timer";
	
	field_str="timerid,CONTACTEMAIL,ROBOTEMAIL,NOTIFYTIME,PERIOD,CONTENT,EMAIL,NEXTNOTIFYTIME";
	int i=0;
	for(int j=0;j<CONTACTEMAILARR.length;j++)
	{
	int id = query.KeyNextValue("t_timer","timerid");
	value_str=id+",'"+CONTACTEMAILARR[j]+"','www.10010.com@hotmail.com',to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff'),'"+PERIOD+"','"+CONTENT+"','"+EMAIL+"',to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff')";
	i=insert.insert(table,field_str,value_str);
	}
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入成功');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入失败');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");		
	}
}
else if("edit".equals(action)){
		String CONTACTEMAIL=new String(request.getParameter("contactemail"));//.getBytes("8859_1")
	String begin = request.getParameter("begin");
	String Hours = request.getParameter("Hours");
	String Minutes = request.getParameter("Minutes");
	String NOTIFYTIME=begin+" "+Hours+":"+Minutes;
	String PERIOD=new String(request.getParameter("period"));
	String CONTENT=new String(request.getParameter("content"));
	String EMAIL=new String(request.getParameter("email"));
	if(EMAIL == null)
		EMAIL="";
	UpdateData update=new UpdateData(conn);
	String timerid = request.getParameter("timerid");
	table="t_timer";
	
	field_str="CONTACTEMAIL='"+CONTACTEMAIL+"',NOTIFYTIME=to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff'),PERIOD='"+PERIOD+"',CONTENT='"+CONTENT+"',EMAIL='"+EMAIL+"',NEXTNOTIFYTIME=to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff')";
	value_str="timerid='"+timerid+"'";
	int i=update.update(table,field_str,value_str);

	
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改成功');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改失败');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}
}
else if(action.equals("del"))
	{
		DeleteData delete=new DeleteData(conn);
    String[] ids=request.getParameterValues("mesid");
    String idstr = KenString.arrayToString(ids);
    table="t_timer";
    value_str="timerid in ("+idstr+")";    		
	  int i = delete.delete(table,value_str);
		if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('删除成功');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('删除失败');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}
	}
	//response.sendRedirect("service_mind.jsp");
	conn.close();
 %>
  </body>
</html>
