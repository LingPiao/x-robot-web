
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
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
	var msnid = "meixd@hotmail.com";
	//alert(msnid);
	window.location.href = "yqhy.jsp?msnid=" + msnid;
</script>
<%} %>
<% if (from.equals("mobile")){  %>
<script type="text/javascript">
	window.location.href = "hdpm_mobile.jsp?userid=<%=request.getParameter("userid")%>";
</script>
<% }%>

