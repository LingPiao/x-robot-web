<%@ page language="java" import="java.net.URL" pageEncoding="GB2312"%>
<%@ page language="java" import="java.net.URLConnection,java.io.*"%>
<%
	response.setContentType("text/xml;charset=GB2312"); 
	request.setCharacterEncoding("GB2312"); 
	String Bcode = request.getParameter("Bcode");
	String AccCode = request.getParameter("AccCode");
	//System.out.println(AccCode);
	String Month = request.getParameter("Month");
	String Password = "";
	Password = request.getParameter("Password");
	URL url = new URL("http://119.6.5.183:8081/"+Bcode);  
	URLConnection connection = url.openConnection(); 
	
	connection.setDoOutput(true); 
	OutputStreamWriter postinfo = new OutputStreamWriter(connection.getOutputStream(), "GB2312"); 
	
	String sendpara="";
	sendpara = "AccCode="+AccCode;
	
	if(Bcode.equals("100001000400002"))//积分消费清单查询
	{
		sendpara = sendpara +"&BeginMonth="+Month+"&EndMonth="+Month;
	}
	else
	{
		if(!Month.equals("") && Month!=null)
			sendpara = sendpara +"&Month="+Month;
		if(!Password.equals("") && Password!=null)
			sendpara = sendpara +"&Password="+Password;
	}
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
	   System.out.println(line);
	} 
	
	in.close() ; 
%>
