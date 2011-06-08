<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<%@ include file="../session.jsp"%>
<% 
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
    
 
  
	String act =request.getParameter("action");
	MmsManagerAction mmAction = new MmsManagerAction();
	if(act!=null)
	{
		if (act.equals("del"))
		{
			String mmsidArray[] = request.getParameterValues("mmsid");
			String url= request.getRealPath("runConfig.xml");
			//System.out.println(url);
			url = url.replace("runConfig.xml","");
			//System.out.println(url);
			if(mmAction.delete(mmsidArray,url))
			{
				out.println("<script>alert('É¾³ý³É¹¦£¡');window.location.href='mms.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('É¾³ýÊ§°Ü£¡');window.location.href='mms.jsp';</script>");
			}
		}
	}
	

%>