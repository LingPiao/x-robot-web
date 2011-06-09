<%@ page contentType="text/html;charset=gb2312" %>
<%@ page language="java" import="java.net.URL" pageEncoding="GB2312"%>
<%@ page language="java" import="java.net.URLConnection,java.io.*"%>
<%@ page import="com.catic.tool.*"%>
<% 
	response.setContentType("text/html;charset=GB2312"); 
	request.setCharacterEncoding("GB2312"); 

	//ServletInputStream in1 = request.getInputStream ();
	String mms_picurl=request.getParameter("mms_picurl");
	String Subject=request.getParameter("mms_title");
	String user_msn=request.getParameter("user_msn");
	String FromCode=request.getParameter("user_tel");
	String ToCode=request.getParameter("recmobile");
%>
<html><body>
<form action="" method="post" name="sendform">
<input type="hidden" name="recmobile" value=<%=ToCode%>>
<input type="hidden" name="user_msn" value=<%=user_msn%>>
<input type="hidden" name="mms_picurl" value=<%=mms_picurl%>>
<input type="hidden" name="mms_title" value=<%=Subject%>>
</form></body></html>
<%
	String root = getServletContext().getRealPath("/");
	//System.out.println(root);
	String strBoundary=null;
	String imageurl=root+mms_picurl;
	File f=new File(imageurl);
	InputStream in1 = new FileInputStream(f);

	strBoundary = new String(""+(Math.random()+Math.random())).substring(2);
	
	URL url = new URL("http://119.6.5.183:8081/100002000300001");  
	URLConnection connection = url.openConnection(); 
	
	connection.setRequestProperty("Content-Type","multipart/form-data; boundary=-----------------------------"+strBoundary);

	connection.setDoOutput(true); 
	//OutputStreamWriter 
	OutputStream postinfo = connection.getOutputStream();//new OutputStreamWriter(connection.getOutputStream(), "GB2312"); 

				//in1.read();
	String s="-----------------------------"+strBoundary+"";
	s+="\r\nContent-Disposition: form-data; name=\"ToCode\"";
	
	s+="\r\n\r\n"+ToCode;
	s+="\r\n-----------------------------"+strBoundary+"";
	s+="\r\nContent-Disposition: form-data; name=\"file\"; filename=\""+imageurl+"\"\n";
	s+="Content-Type: image/pjpeg";
	s+="\r\n\r\n";
	ByteArrayInputStream stream = new ByteArrayInputStream(s.getBytes());
	
	String s11="\r\n";
					
	s11+="-----------------------------"+strBoundary+"";
	s11+="\r\nContent-Disposition: form-data; name=\"Subject\"";
	
	s11+="\r\n\r\n"+Subject;
	s11+="\r\n-----------------------------"+strBoundary+"";
	s11+="\r\nContent-Disposition: form-data; name=\"FromCode\"";
	
	s11+="\r\n\r\n"+FromCode;
	s11+="\r\n-----------------------------"+strBoundary+"--";
	s11+="\r\n";
	//System.out.println(s11);
	ByteArrayInputStream stream1 = new ByteArrayInputStream(s11.getBytes());

	int len = 0;   
	byte[] b = new byte[1024];   
	                    
	while ((len = stream.read(b)) != -1) {
		postinfo.write(b, 0, len); 
	                       // System.out.write(b, 0, len);
	}                 				
	len = 0;   
	b = new byte[1024]; 
	while ((len = in1.read(b)) != -1) {
		postinfo.write(b, 0, len); 
	}
	len = 0;   
	b = new byte[1024]; 
	while ((len = stream1.read(b)) != -1) {       
		postinfo.write(b, 0, len);  
	                        //每读满5000个byte，往磁盘上flush一下 
	}
	postinfo.flush(); 
	postinfo.close(); 
	//获取返回数据 
	BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream())); 
	
	String line = null; String line1 = "";
	String i="";String i1="";
	while((line = in.readLine()) != null) 
	{ 
		line1+=line;		
	} 
	//System.out.println(line1);
	String s1[]=	line1.split("flag");
	String s2[]=	line1.split("fromcode");

	i=s1[1].replace(">","");
	i=i.replace("</","");	
	

	i1=s2[1].replace(">","");
	i1=i1.replace("</","");

	in.close() ;

	if("1".equals(i))
	{
	%>
	<script>
	sendform.action="mms.action?op=send";
	sendform.submit();
	</script>
	<%
	}
	//response.sendRedirect("mms.action?op=send&recmobile="+ToCode+"&user_msn="+user_msn+"&mms_picurl="+mms_picurl+"&mms_title="+Subject);
	else
	{
		String str="";
		String s3[]=line1.split("msg");
		str=s3[1].replace(">","");
		str=str.replace("</","");
		response.sendRedirect("");
	}
%>

