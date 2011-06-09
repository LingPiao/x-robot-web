<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<script type="text/javascript">
	//var myUsers = window.external.Users;
	//var myLocalUser = myUsers.Me;
	//18608033066
	//var msnid = myLocalUser.EMail;
	var msnid = "meixd@hotmaill.com";
	//alert(msnid);
	window.location.href = "welcome/login.action?op=check&user_msn=" + msnid;
</script>