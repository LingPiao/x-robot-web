<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="gb2312"%>
<%@ page import = "com.catic.tool.*"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  
  <body>
   <%
	String keyword1="";
	String keyword2="";
	String answer="";
	String keyword="";
	int sta=0;
	int sta1=0;
	String[] s=null;
	
	response.setContentType("text/xml");

	String state = request.getParameter("content");
	String questionid = request.getParameter("questionid");
	String classid = request.getParameter("classid");
System.out.println("questionid="+questionid);
	
	DataConn conn=new DataConn();

	QueryData query=new QueryData(conn);
	StringBuffer sb=new StringBuffer("<?xml version=\"1.0\" encoding=\"gb2312\" ?><state>");

state=new String(state.getBytes("8859_1"));
//System.out.println("state="+state);
	query.setRecordSet("select * from t_unicom_question where state='0'" );
	ResultSet rs = query.getResultSet();
	

	
	while(rs.next()){

		keyword1=rs.getString("KEYWORD1");
//System.out.println("KEYWORD1="+keyword1);

		if(!"".equals(keyword1)&&!"null".equals(keyword1)&&keyword1!=null){
			s=keyword1.split("£¬");
			int jishu=0;
			for(int i=0;i<s.length;i++)
			{


				sta=state.indexOf(s[0]);

				if(sta<0)
				{	
					jishu++;
					//sb.append("<question><questionid>"+rs.getString("QUESTIONID")+"</questionid><content>"+rs.getString("QUESTION")+"</content></question>");
					//break;
				}
			}
			if(jishu==0){
			
				
				
			
				sb.append("<question><questionid>"+rs.getString("QUESTION")+"</questionid><content>"+rs.getString("ANSWER")+"</content></question>");
			}else{
				
					keyword2=rs.getString("KEYWORD2");
	//System.out.println("KEYWORD2="+keyword2);
					if(!"".equals(keyword2)&&!"null".equals(keyword2)&&keyword2!=null){
						s=keyword2.split("£¬");
	
						for(int i=0;i<s.length;i++)
						{
	
							sta=state.indexOf(s[i]);
	
							if(sta>=0)
							{
								sb.append("<question><questionid>"+rs.getString("QUESTION")+"</questionid><content>"+rs.getString("ANSWER")+"</content></question>");
								//break;
							}
						}
					}
				
			}
		}
		
		else{
					keyword2=rs.getString("KEYWORD2");
//System.out.println("KEYWORD2="+keyword2);
				if(!"".equals(keyword2)&&!"null".equals(keyword2)&&keyword2!=null){
					s=keyword2.split("£¬");

					for(int i=0;i<s.length;i++)
					{

						sta=state.indexOf(s[i]);

						if(sta>=0)
						{
							sb.append("<question><questionid>"+rs.getString("QUESTION")+"</questionid><content>"+rs.getString("ANSWER")+"</content></question>");
							//break;
						}
					}
				}
		}
	}

	sb.append("</state>");

	PrintWriter out1=response.getWriter();
	out1.write(sb.toString());
	System.out.println(sb);
	out1.close();
  
    %>
  </body>
</html>
<%conn.close(); %>