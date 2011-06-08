<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import = "com.catic.tool.*"%>

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
	
	
	
	//System.out.println(action);
	String question=request.getParameter("question");
	if(question==null||"null".equals(question))
		question="";
	String answer=request.getParameter("answer");
	if(answer==null||"null".equals(answer))
		answer="";
	String msn=request.getParameter("msn");
	if(msn==null||"null".equals(msn))
		msn="";

	String state=request.getParameter("state");
	if(state==null||"null".equals(state))
		state="";
if("insert".equals(action)){	
    				net.sf.robot.util.SpringInstance.launch("spring_config.xml");
	    			ChatManage chatManage = new ChatManage();
	    		  	boolean b=true;
	    		  	Question q=new Question();
	    		  	Answer a=new Answer();
	    		  	q.setContent(question);
	    		  //	System.out.println(q.getContent());
	    		  	a.setContent(answer);
	    		 // 	System.out.println(a.getContent());
	    		  	q.setMsn(msn);
	    		  	a.setMsn(msn);
					InsertData insert=new InsertData(conn);	
					QueryData query=new QueryData(conn);
				
					
					table="T_TEACHSPEAK";
					int id=query.KeyNextValue(table,"SPEAK_ID");
					
					System.out.println(id);
					field_str="SPEAK_ID,question,answer,msn";
					value_str=id+",'"+question+"','"+answer+"','"+msn+"'";


		    		try{
		    			chatManage.add(q,a);
		    		}catch(Exception e){
		    			b=false;

		    		}
		    		

		  if(b){
		  	int i=insert.insert(table,field_str,value_str);
		out.print("<SCRIPT type=text/javascript>");
		out.print("window.location.href='../succee.jsp?msnid="+msn+"';");
		out.print("</SCRIPT>");
		   }else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("window.location.href='../failure.jsp?msnid="+msn+"';");
		out.print("</SCRIPT>");	   


		}

}
else if("update".equals(action)&&!"2".equals(state)){
	UpdateData update=new UpdateData(conn);
	table="SMS_SPEAK";
	String id=request.getParameter("id");
	
	//System.out.println(id);
	field_str="question,answer,msn,state";
	value_str="'"+question+"','"+answer+"','"+msn+"'";
	int i=update.update(table,field_str,value_str,"SPEAK_ID",id);

	
	if(i==0){
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改成功');window.location.href='../teachs.jsp';");
		out.print("</SCRIPT>");
		
	}else{
		out.print("<SCRIPT type=text/javascript>");
		out.print("alert('修改失败');window.location.href='../teachs.jsp';");
		out.print("</SCRIPT>");
		
	}
}
	//response.sendRedirect("../complaints_lists.jsp");
	conn.close();
	//request.getRequestDispatcher("../houtai.jsp").forward(request,response);
 %>
  </body>
</html>
