<%@ page pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
<%@ page import="java.net.URLDecoder"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	String ckUser = null;
	String ckPwd = null;
	String unKey = "userName";
	String pwdKey = "password";
	String errorMsg = request.getParameter("errorMsg");
	if (errorMsg != null) {
		errorMsg = new String(URLDecoder.decode(errorMsg, "GB2312")
				.getBytes("ISO-8859-1"));
		//Cleaning the cookies while error.
		Cookie cu = new Cookie(unKey, null);
		Cookie cp = new Cookie(pwdKey, null);
		response.addCookie(cu);
		response.addCookie(cp);
	} else {
		Cookie c[] = request.getCookies();
		for (int i = 0; c != null && i < c.length; i++) {
			if (unKey.equals(c[i].getName()))
				ckUser = c[i].getValue();
			if (pwdKey.equals(c[i].getName()))
				ckPwd = c[i].getValue();
		}
		if (ckUser != null && ckPwd != null) {
			response.sendRedirect("./agentServer?act=login&userName="
					+ ckUser + "&password=" + ckPwd);
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>联通贝贝坐席</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link href="../images/login/style.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
function login(){
      if(document.fmLogin.userName.value.length<1) { 
              alert( "请填写用户名! "); 
			  document.fmLogin.userName.focus();
              return false; 
      } 
	  if(document.fmLogin.password.value.length<1) { 
              alert( "请输入密码! "); 
			  document.fmLogin.password.focus();
              return false; 
      } 
      document.fmLogin.submit(); 
      return true;
}
 
</script>
</head>
<body>
<div class="top">
<div class="banner"></div>
</div>
<div>
<div class="login">
<form name="fmLogin" action="./agentServer?act=login" method="post" onsubmit="return login();">
<ul>
	<li>用 户：<input tabindex="1" type="text" name="userName" class="input" /></li>
	<li>密 码：<input tabindex="2" type="password" name="password" class="input" /></li>
	<li><input id="rememberMe" name="rememberMe" tabindex="3" type="checkbox" value="1" /><label for="rememberMe"
		style="font-size: 12px;">下次自动登录</label> <input type="submit" value="登录" class="button" /></li>
	<%
		if (errorMsg != null) {
	%>
	<li style="padding-top: 8px; font-size: 12px; color: red"><%=errorMsg%></li>
	<%
		}
	%>
</ul>
</form>
</div>
</div>
<div class="bottom">版权所有：中国联通</div>
</body>
</html>
