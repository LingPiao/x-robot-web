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
	String[] NOTIFY_TYPE = request.getParameterValues("NOTIFY_TYPE");
	int notype=0;
	if(NOTIFY_TYPE==null)
		notype=1;
	else
	{
		int temp1=0;
		int temp2=0;
		int temp3=0;
		for(int i=0;i<NOTIFY_TYPE.length;i++)
		{
			temp1=Integer.parseInt(NOTIFY_TYPE[i].substring(0,1))*2*2;
			temp2=Integer.parseInt(NOTIFY_TYPE[i].substring(1,2))*2;
			temp3=Integer.parseInt(NOTIFY_TYPE[i].substring(2,3));
			notype=notype+temp1+temp3+temp2;
		}
	}
	String GROUP_SEND = request.getParameter("group_send");
	if(GROUP_SEND==null)
		GROUP_SEND="0";
	if(EMAIL == null)
		EMAIL="";
	table="t_timer";
	
	field_str="timerid,CONTACTEMAIL,ROBOTEMAIL,NOTIFYTIME,PERIOD,CONTENT,EMAIL,NEXTNOTIFYTIME,NOTIFY_TYPE,GROUP_SEND";
	int i=0;
	for(int j=0;j<CONTACTEMAILARR.length;j++)
	{
	int id = query.KeyNextValue("t_timer","timerid");
	value_str=id+",'"+CONTACTEMAILARR[j]+"','www.10010.com@hotmail.com',to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff'),'"+PERIOD+"','"+CONTENT+"','"+EMAIL+"',to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff'),"+notype+",'"+GROUP_SEND+"'";
	i=insert.insert(table,field_str,value_str);
	}
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('����ɹ�');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('����ʧ��');");
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
	String[] NOTIFY_TYPE = request.getParameterValues("NOTIFY_TYPE");
	int notype=0;
	if(NOTIFY_TYPE==null)
		notype=1;
	else
	{
		int temp1=0;
		int temp2=0;
		int temp3=0;
		for(int i=0;i<NOTIFY_TYPE.length;i++)
		{
			temp1=Integer.parseInt(NOTIFY_TYPE[i].substring(0,1))*2*2;
			temp2=Integer.parseInt(NOTIFY_TYPE[i].substring(1,2))*2;
			temp3=Integer.parseInt(NOTIFY_TYPE[i].substring(2,3));
			notype=notype+temp1+temp3+temp2;
		}
	}
	String GROUP_SEND = request.getParameter("group_send");
	if(GROUP_SEND==null)
		GROUP_SEND="0";
	UpdateData update=new UpdateData(conn);
	String timerid = request.getParameter("timerid");
	table="t_timer";
	
	field_str="CONTACTEMAIL='"+CONTACTEMAIL+"',NOTIFYTIME=to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff'),PERIOD='"+PERIOD+"',CONTENT='"+CONTENT+"',EMAIL='"+EMAIL+"',NEXTNOTIFYTIME=to_timestamp('"+NOTIFYTIME+"','yyyy-mm-dd hh24:mi.ff'),NOTIFY_TYPE="+notype+",GROUP_SEND='"+GROUP_SEND+"'";
	value_str="timerid='"+timerid+"'";
	int i=update.update(table,field_str,value_str);

	
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('�޸ĳɹ�');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('�޸�ʧ��');");
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
		out.print("alert('ɾ���ɹ�');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('ɾ��ʧ��');");
		out.print("window.location.href='service_mind.jsp';");
		out.print("</SCRIPT>");
		
	}
	}
	//response.sendRedirect("service_mind.jsp");
	conn.close();
 %>
  </body>
</html>
