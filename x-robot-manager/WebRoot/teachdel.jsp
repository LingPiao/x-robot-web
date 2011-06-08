<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
 
    <%
    		String action = request.getParameter("action");
    		String[] ids=request.getParameterValues("mesid");
    		String url="teach.jsp";
			String table="";
			String conditionstr="";
			String updatestr="";

			DataConn conn=new DataConn();
			if("del".equals(action)){
				DeleteData delete=new DeleteData(conn);
	    		
	    		table="T_TEACHSPEAK";
	    		
	    		for(int i=0;i<ids.length;i++){
	    		conditionstr="SPEAK_ID="+ids[i]+" and STATE!='2'";    		
	    		//System.out.println(conditionstr);
		    		delete.delete(table,conditionstr);
	    		}
    		}
    		if("edit".equals(action)){
    			net.sf.robot.util.SpringInstance.launch("spring_config.xml");
    			UpdateData update=new UpdateData(conn);
				QueryData query=new QueryData(conn);
	    		ChatManage chatManage = new ChatManage();
	    		//String[] ids=request.getParameterValues("mesid");
	    		table="T_TEACHSPEAK";
	    		updatestr="state='2'";//ÉóºËÍ¨¹ý'2';
	    		conditionstr="SPEAK_ID";
	    		for(int i=0;i<ids.length;i++){
	    		conditionstr="SPEAK_ID="+ids[i]+"";  
	    		  	query.setRecordSet("select * from T_TEACHSPEAK where SPEAK_ID="+ids[i]+"");
	    		  	ResultSet rs3 = query.getResultSet();
	    		  	String msn="";
	    		  	String question="";
	    		  	String answer="";
	    		  	boolean b=true;
	    		  	Question q=new Question();
	    		  	Answer a=new Answer();
	    		  	if(rs3.next()){
	    		  	 msn=rs3.getString("msn");
	    		  	 question=rs3.getString("question");
	    		  	 answer=rs3.getString("answer");
	    		  	q.setContent(question);
	    		  //	System.out.println(q.getContent());
	    		  	a.setContent(answer);
	    		 // 	System.out.println(a.getContent());
	    		  	q.setMsn(msn);
	    		  	a.setMsn(msn);
	    		  	}
	    		//System.out.println(conditionstr);
		    		//
		    		try{
		    			chatManage.add(q,a);
		    		}catch(Exception e){
		    			b=false;

						
		    		}
		    		if(b){
		    		update.update(table,updatestr,conditionstr);
		    		}
	    		}
    		}
    		conn.close();
    		response.sendRedirect(url);
     %>