<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<% 
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
	String id = request.getParameter("id");
	String count = request.getParameter("count");
	KeyWordAction mcAction = new KeyWordAction();
	boolean flag = mcAction.updateywck(id,count);
out.clear();
if(flag) out.println("设置成功");
else  out.println("设置失败");mcAction.close();%>