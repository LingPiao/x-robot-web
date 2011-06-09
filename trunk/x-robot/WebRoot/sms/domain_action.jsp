<%@ page language="java" import="java.net.URL" pageEncoding="GB2312" %>
<%@ page language="java" import="java.net.URLConnection,java.io.*"%>
<%
	response.setContentType("text/xml;charset=GB2312"); 
	request.setCharacterEncoding("GB2312"); 
	String Bcode = request.getParameter("Bcode");
	String FromCode = request.getParameter("FromCode");
	String ToCode = request.getParameter("ToCode");
	String Msg = new String(request.getParameter("Msg").getBytes("8859_1"));

	URL url = new URL("http://119.6.5.183:8081/"+Bcode);  
	URLConnection connection = url.openConnection(); 
	
	connection.setDoOutput(true); 
	OutputStreamWriter postinfo = new OutputStreamWriter(connection.getOutputStream(), "GB2312"); 

	String sendpara="";
	sendpara = "FromCode="+FromCode;
	sendpara = sendpara +"&ToCode="+ToCode;
	sendpara = sendpara +"&Msg="+Msg;
	//System.out.println(sendpara);
	postinfo.write(sendpara);
	postinfo.flush(); 
	postinfo.close(); 
	
	//获取返回数据 
	BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream())); 
	
	String line = null; 
	
	while((line = in.readLine()) != null) 
	{ 
	   out.println(line);
	   //System.out.println(line);
	} 
	
	in.close() ; 
%>
