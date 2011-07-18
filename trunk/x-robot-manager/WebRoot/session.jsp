<%@page contentType="text/html;charset=gb2312" import="java.sql.*"%>

<%
String username = (String) session.getAttribute("username");
String userrole = (String) session.getAttribute("userrole");
String userpwd = (String) session.getAttribute("userpwd");
if ((username==null)||(username.equals("")) || userrole == null || userrole.equals("")){
	String url= request.getContextPath()+"/index.jsp";

%>
<script>
parent.location.href="<%=url%>"
</script>
<%
}
%>