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
	String action=request.getParameter("rr_action");
	int num=0;
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
	String question=request.getParameter("question");
	if(question==null||"null".equals(question))
		question="";
	else
		question=question.replace(',','，');
		//question=new String(question.getBytes("8859_1"));
	String answer=request.getParameter("answer");
	if(answer==null||"null".equals(answer))
		answer="";
	else
		answer=answer.replace(',','，');
		//answer=new String(answer.getBytes("8859_1"));
	String keyword1=request.getParameter("keyword1");
	if(keyword1==null||"null".equals(keyword1))
		keyword1="";
	else
		keyword1=keyword1.replace(',','，');
		
	String keyword2=request.getParameter("keyword2");
	if(keyword2==null||"null".equals(keyword2))
		keyword2="";
	else
		keyword2=keyword2.replace(',','，');;
		
	String classes=request.getParameter("classes");
	if(classes==null||"null".equals(classes))
		classes="";
	String state=request.getParameter("state");
	if(state==null||"null".equals(state))
		state="";
	String state1=request.getParameter("state1");
	if(state1==null||"null".equals(state1))
		state1="0";
if(keyword1.length()==0){
num=0;
}else{
num=(keyword1.length()-(keyword1.replace("，","")).length())+1;
}
if("add".equals(action)){		
	table="T_UNICOM_QUESTION";
	int id=query.KeyNextValue(table,"QUESTIONID");
	
	//System.out.println(id);
	field_str="QUESTIONID,QUESTION,ANSWER,KEYWORD1,KEYWORD2,QUESTION_CLASS,STATE,KEYWORD1_NUM,NORMALSTATE";
	value_str=id+",'"+question+"','"+answer+"','"+keyword1+"','"+keyword2+"','"+classes+"','"+state+"','"+num+"','"+state1+"'";
	int i=insert.insert(table,field_str,value_str);

	//System.out.println(i);
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入成功');window.location.href='question.jsp';");
		out.print("</SCRIPT>");
		
	}else{

		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('插入失败');window.location.href='question.jsp';");
		out.print("</SCRIPT>");	
	}
}
else if("edit".equals(action)){
	UpdateData update=new UpdateData(conn);
	table="T_UNICOM_QUESTION";
	String id=request.getParameter("mes_id");
	
	System.out.println(id);
	field_str="QUESTION,ANSWER,KEYWORD1,KEYWORD2,QUESTION_CLASS,STATE,KEYWORD1_NUM,NORMALSTATE";
	
	value_str="'"+question+"','"+answer+"','"+keyword1+"','"+keyword2+"','"+classes+"','"+state+"','"+num+"','"+state1+"'";
	int i=update.update(table,field_str,value_str,"QUESTIONID",id);

	
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改成功');window.location.href='question.jsp';");
		out.print("</SCRIPT>");
		
	}else{

		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改失败');window.location.href='question.jsp';");
		out.print("</SCRIPT>");	
	}
}
	//response.sendRedirect("question.jsp");
	conn.close();
 %>
  </body>
</html>
