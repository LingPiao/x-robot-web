<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
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
	UpdateData update = new UpdateData(conn);
	QueryData query=new QueryData(conn);
	ResultSet rs4=null;

if("add".equals(action)){	
	String cmobile=new String(request.getParameter("c_mobile"));//.getBytes("8859_1")
	String[] CONTACTEMAILARR=cmobile.split(";");
	String mmobile = request.getParameter("m_mobile");
	String con="m_mobile='"+mmobile+"'";
	query.setRecordCount("t_vip_manager",con);
	int count = query.getRecordCount();
	if(count == 0)
	{
		value_str="A_ID.nextval,'"+mmobile+"'";
		insert.insert("t_vip_manager","seqid,m_mobile",value_str);
	}
	int i=0;
	query.setRecordSet("select seqid from t_vip_manager where m_mobile='"+mmobile+"'");
	rs4 = query.getResultSet();
	String m_mobile="";
	if(rs4.next())
	{
		m_mobile=rs4.getString("seqid");
	}
	for(int j=0;j<CONTACTEMAILARR.length;j++)
	{		
	value_str="A_ID.nextval,'"+CONTACTEMAILARR[j]+"','"+m_mobile+"'";
	i=insert.insert("t_vip_customer","seqid,c_mobile,m_mobile",value_str);
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
else if("edit".equals(action)){
	String mobile=new String(request.getParameter("mobile"));//.getBytes("8859_1")
	String seqid = request.getParameter("seqid");
	String datatable = request.getParameter("table");
	String con="";
	String val="";
	if(datatable.equals("t_vip_customer"))
	{
		con="seqid='"+seqid+"'";
		val="c_mobile='"+mobile+"'";
	}
	else
	{
		con="seqid='"+seqid+"'";
		val="m_mobile='"+mobile+"'";
	}
	int i = update.update(datatable,val,con);
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('更新成功');");
		out.print("window.location.href='vip.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('更新失败');");
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
    	table="t_vip_customer";
    	value_str="seqid='"+ids[m]+"'";    		
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
