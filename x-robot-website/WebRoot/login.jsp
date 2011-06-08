<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />

<title></title>
<link rel="stylesheet" href="Style/main.css" type="text/css" />
<body>
<form action = "login.action?op=logindo" method=post>
<table>
<tr>
<td>用户名：<input type=text name=username id=username/></td>
</tr>
<tr>
<td>密码：<input type=text name=userpwd id=userpwd/></td>
</tr>
<tr>
<td><input type=submit value=登录/></td>
</tr>
</table>
</form>
</body>
</html>