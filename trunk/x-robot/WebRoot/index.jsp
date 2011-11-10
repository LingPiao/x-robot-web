<%@page import="com.opensymphony.webwork.views.jsp.ElseIfTag"%>
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
	String agent = request.getHeader("User-Agent");
	String from="";
	System.out.println(agent);
	if(agent.indexOf("IE")>0 || agent.indexOf("Firefox")>0)
		from = "msn";
	else
		from="mobile";
%>
<% if (from.equals("msn")){ %>
<script type="text/javascript">
	//var myUsers = window.external.Users;
	//var myLocalUser = myUsers.Me;
	//18608033066
	//var msnid = myLocalUser.EMail;
	var msnid = "meixd@hotmaill.com";
	//alert(msnid);
	window.location.href = "welcome/login.action?op=check&user_msn=" + msnid;
</script>
<%} %>
<% if (from.equals("mobile")){  %>
<script type="text/javascript">
	window.location.href = "http://www.x-robot.cn/robotweb/woshop.action?userid=<%=request.getParameter("userid")%>";
</script>
<% }%>