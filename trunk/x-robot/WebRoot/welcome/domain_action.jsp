<%@ page language="java" import="java.net.URL" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.net.URLConnection,java.io.*"%>
<%
	response.setContentType("text/xml;charset=GB2312"); 
	request.setCharacterEncoding("GB2312"); 
	String calleds = request.getParameter("calleds");
	System.out.println(calleds);
	String content = request.getParameter("content");
	String userid = request.getParameter("userid");
	String caller = request.getParameter("caller");
	URL url = new URL("http://www.x-robot.cn/SmsServlet");  
	URLConnection connection = url.openConnection(); 
	
	connection.setDoOutput(true); 
	OutputStreamWriter postinfo = new OutputStreamWriter(connection.getOutputStream(), "UTF-8"); 
	
	String sendpara="";
	sendpara = "p2p=true&caller="+caller+"&calleds="+calleds+"&content="+content+"&userid="+userid;
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
