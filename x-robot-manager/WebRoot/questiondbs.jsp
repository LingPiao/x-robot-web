<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import = "com.catic.tool.*"%>

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
	int num=0;
	//System.out.println(action);
	String mes_id=request.getParameter("mes_id");
	if(mes_id==null||"null".equals(mes_id))
		mes_id="";
	String question=request.getParameter("question");
	if(question==null||"null".equals(question))
		question="";
	else
		question=question.replace(',','£¬');
		//question=new String(question.getBytes("8859_1"));
	String answer=request.getParameter("answer");
	if(answer==null||"null".equals(answer))
		answer="";
	else
		answer=answer.replace(',','£¬');
		//answer=new String(answer.getBytes("8859_1"));
	String keyword1=request.getParameter("keyword1");
	if(keyword1==null||"null".equals(keyword1))
		keyword1="";
	else
		keyword1=keyword1.replace(',','£¬');
		
	String keyword2=request.getParameter("keyword2");
	if(keyword2==null||"null".equals(keyword2))
		keyword2="";
	else
		keyword2=keyword2.replace(',','£¬');;
		
	String classes=request.getParameter("classes");
	if(classes==null||"null".equals(classes))
		classes="";
	String state=request.getParameter("state");
	if(state==null||"null".equals(state))
		state="";
num=(keyword1.length()-(keyword1.replace("£¬","")).length())+1;


if("add".equals(action)){		
	table="T_UNICOM_QUESTION";
	int id=query.KeyNextValue(table,"QUESTIONID");
	
	//System.out.println(id);
	field_str="QUESTIONID,QUESTION,ANSWER,KEYWORD1,KEYWORD2,QUESTION_CLASS,KEYWORD1_NUM";
	value_str=id+",'"+question+"','"+answer+"','"+keyword1+"','"+keyword2+"','"+classes+"','"+num+"'";
	int i=insert.insert(table,field_str,value_str);

	//System.out.println(i);
	if(i==0){

		out.print("true");
	}else{

		out.print("false");
	}
}

	//response.sendRedirect("question.jsp");
	conn.close();
 %>

