<%@page contentType="text/html;charset=gb2312" %>
<%@ include file="session.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>联通机器人管理平台</title>
</head>
<%
String url= request.getContextPath()+"/admanager/index.jsp";
%>
<script>
function jumpurl(){
	parent.location.href="<%=url%>"
}
</script>
<script language=javascript>
function changePwd(){
  window.open('change_pwd.jsp','chngpwd','location=no,directories=no,status=no,menubar=no,scrollbars=auto,resizable=yes,width=440,height=360,top=190,left=280');
}
</script>
<link href="css/css.css" rel="stylesheet" type="text/css">
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
     <td align=left class="login_title"><img src="images/x.jpg" width="22" height="17" />
     &nbsp;联通机器人管理平台</td>
     <td align=right class="login_title">
     &nbsp;<a href="javascript:changePwd();" class="login_title"><font color=ffffff>修改密码</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;<a href="#" onclick=jumpurl(); class="login_title"><font color=ffffff>退出</font></a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
 </tr>
</table>
</body>
</html>



