<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
 
    <%
    		
    		//net.sf.robot.util.SpringInstance.launch("spring_config.xml");
	    	ChatManage chatManage = new ChatManage();
			String questionid=request.getParameter("questionid");
			String num=request.getParameter("num");
			String url="corpus.jsp?num="+num;
				if(questionid!=null&&!"0".equals(questionid)){
					Question q=new Question();
	    			q.setId(new Integer(Integer.parseInt(questionid)));
	    			chatManage.delQuestion(q);
				}
			else{
	    		String[] ids=request.getParameterValues("mesid");
	
	    		
	    		for(int i=0;i<ids.length;i++){
	    			Answer a=new Answer();
	    			a.setId(new Integer(Integer.parseInt(ids[i])));
	    			chatManage.delAnswer(a);
		    		
	    		}
    		}
    		
    		
    		response.sendRedirect(url);
     %>