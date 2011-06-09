<%@ page language="java" import="java.net.URL" pageEncoding="GBK"%>
<%@ page language="java" import="java.net.URLConnection,java.io.*"%>
<%
	
	response.setContentType("text/xml;charset=GBK"); 
	request.setCharacterEncoding("GBK"); 
	String ToCode = request.getParameter("ToCode");
	String Msg = new String(request.getParameter("Msg").getBytes("8859_1"));

	URL url = new URL("http://119.6.5.183:8081/100002000200001");  
	URLConnection connection = url.openConnection(); 
	connection.setDoOutput(true);
	OutputStreamWriter postinfo = new OutputStreamWriter(connection.getOutputStream(), "GBK"); 
	String sendpara="";
	sendpara = sendpara +"&ToCode="+ToCode;
	sendpara = sendpara +"&Msg="+Msg;
	System.out.println(sendpara);
	postinfo.write(sendpara);
	postinfo.flush(); 
	postinfo.close(); 
	
	//获取返回数据 
	BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream())); 
	
	String line = null; 
	
	while((line = in.readLine()) != null) 
	{ 
	   out.println(line);
	} 
	
	in.close() ; 
%>
