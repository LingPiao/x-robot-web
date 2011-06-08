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
	String questionid=request.getParameter("questionid");
	String answerid=request.getParameter("answerid");
	String question=request.getParameter("question");
	String num=request.getParameter("nums");
	if(question==null||"null".equals(question))
	{
		question="";
	}else{
		question=new String(question.getBytes("8859_1"));
	}	
	String answer=request.getParameter("answer");
	if(answer==null||"null".equals(answer))
	{
		answer="";
	}else{
		answer=new String(answer.getBytes("8859_1"));
	}

	//System.out.println(questionid);
	//System.out.println(question);
	//System.out.println(answerid);
	//System.out.println(answer);
	//System.out.println(num);
	String mes_id=request.getParameter("mes_id");
	if(mes_id==null||"null".equals(mes_id))
		mes_id="";
	String mes_content=request.getParameter("mes_content");
	if(mes_content==null||"null".equals(mes_content))
		mes_content="";
		
		//net.sf.robot.util.SpringInstance.launch("spring_config.xml");
	    ChatManage chatManage = new ChatManage();
		if("add".equals(action)){		
    				
	    		  	boolean b=true;
	    		  	Question q=new Question();
	    		  	Answer a=new Answer();
	    		  	q.setContent(question);
	    		  	//System.out.println(q.getContent());
	    		  	a.setContent(answer);
	    		  	//System.out.println(a.getContent());
	    		  	q.setMsn("ROBOT");
	    		  	a.setMsn("ROBOT");



		    		try{
		    			chatManage.add(q,a);
		    		}catch(Exception e){
		    			b=false;
						
		    		}
		    		

					if(b){
						out.print("<SCRIPT type=text/javascript>");
						out.print("alert('插入成功！');window.location.href='corpus.jsp?content="+question+"';");
						out.print("</SCRIPT>");
					}else{
						out.print("<SCRIPT type=text/javascript>");
						out.print("alert('插入失败！');window.location.href='corpus.jsp?content="+question+"';");
						out.print("</SCRIPT>");  
			
					}

		}else if("edit".equals(action)){
		
					boolean b=true;
	    		  	Question q=new Question();
	    		  	Answer a=new Answer();
	    		  	q.setId(new Integer(Integer.parseInt(questionid)));
	    		  	q.setContent(question);

	    		  	a.setContent(answer);

	    		  	q.setMsn("ROBOT");
	    		  	a.setMsn("ROBOT");



		    		try{
		    			chatManage.add(q,a);
		    		}catch(Exception e){
		    			b=false;
							//System.out.println(e.getMessage());
		    		}
		    		

					if(b){
						out.print("<SCRIPT type=text/javascript>");
						out.print("alert('插入成功！');window.location.href='corpus.jsp?num="+num+"';");
						out.print("</SCRIPT>");
					}else{
						out.print("<SCRIPT type=text/javascript>");
						out.print("alert('插入失败，关键词重复！');window.location.href='corpus.jsp?num="+num+"';");
						out.print("</SCRIPT>");  
			
					}
		}else if("edits".equals(action)){
		
					boolean b=true;
	    		  	Question q=new Question();
	    		  	Answer a=new Answer();
	    		  	q.setId(new Integer(Integer.parseInt(questionid)));
	    		  	a.setId(new Integer(Integer.parseInt(answerid)));
	    		  	q.setContent(question);

	    		  	a.setContent(answer);

	    		  	q.setMsn("ROBOT");
	    		  	a.setMsn("ROBOT");



		    		try{
		    			chatManage.updateQuestion(q);
		    			chatManage.updateAnswer(a);
		    		}catch(Exception e){
		    			b=false;

		    		}
		    		

					if(b){
						out.print("<SCRIPT type=text/javascript>");
						out.print("alert('修改成功！');window.location.href='corpus.jsp?num="+num+"';");
						out.print("</SCRIPT>");
					}else{
						out.print("<SCRIPT type=text/javascript>");
						out.print("alert('修改失败！关键词重复！');window.location.href='corpus.jsp?num="+num+"';");
						out.print("</SCRIPT>");  
			
					}
		}


	//response.sendRedirect("corpus.jsp");

	//request.getRequestDispatcher("../houtai.jsp").forward(request,response);
 %>
  </body>
</html>
