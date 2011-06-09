<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>错误</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
  
<body>
<table width="100%">
<tr><td height="30" align="center" class="font12">错误信息</td></tr>
<tr><td height="30" align="center" class="font12"><ww:property value="errormsg"/></td></tr>
<tr><td height="30" align="center" class="font12"></td></tr>
<tr><td height="30" align="center" class="font12"><a href="#" onClick="window.history.back(-1);">返回</a></td></tr>
</table>
</body>
</html>
