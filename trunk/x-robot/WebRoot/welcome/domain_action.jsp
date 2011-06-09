<%@ page language="java" import="java.net.URL" pageEncoding="GB2312"%>
<%@ page language="java" import="java.net.URLConnection,java.io.*"%>
<%
	response.setContentType("text/xml;charset=GB2312"); 
	request.setCharacterEncoding("GB2312"); 
	String FromCode = request.getParameter("FromCode");
	String Msg = request.getParameter("Msg");
	
	URL url = new URL("http://www.x-robot.cn:8081/100002000100003");  
	URLConnection connection = url.openConnection(); 
	
	connection.setDoOutput(true); 
	OutputStreamWriter postinfo = new OutputStreamWriter(connection.getOutputStream(), "GB2312"); 
	
	String sendpara="";
	sendpara = "ToCode=10010";
	sendpara = sendpara +"&FromCode="+FromCode+"&Msg="+Msg;
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
	   System.out.println(line);
	} 
	
	in.close() ; 
%>
