<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<html>
<head>
<title>添加联系人</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
	color: #cccccc;
}
a:visited {
	text-decoration: none;
	color: #ce8965;
}
a:hover {
	text-decoration: none;
	color: #ECE9D8;
}
a:active {
	text-decoration: none;
}
.STYLE15 {font-size: 14px}
-->
</style>
</head>
<body bgcolor="#FFFFFF">
<form action="connectbook.action">
<input name="ac" type="hidden" value="edituseraction">
<input name="uid" type="hidden" value="<ww:property value="uid"/>">
<input name="msnacc" type="hidden" value="<ww:property value="msnacc"/>">
<table width="100%">
              <tr>
                <td width="33%">&nbsp;</td>
                <td width="59%" align="left" class="font12 STYLE15">修改联系人</td>
              </tr>
              <tr>
                <td align="right" class="font12">姓名:</td>
                <td align="left"><input name="uname" type="text" class="input_loginadd" id="textfield" value="<ww:property value="uname"/>"></td>
              </tr>
			  <tr>
                <td align="right" class="font12">电话号码:</td>
                <td align="left"><input name="utel" type="text" class="input_loginadd" id="textfield" value="<ww:property value="utel"/>"></td>
              </tr>
              	<ww:select label="'分组'" labelposition="right" name="'tid'" listKey="TYPEID" listValue="TYPENAME" list="typeListinfo" value="<ww:property value='tid'/>"/>
              <tr>
                <td>&nbsp;</td>
                <td><input name="button" type="submit" class="input_button2" id="button" value="修改">&nbsp;<input name="button" type="button" class="input_button2" id="button" value="取消" onClick="window.location.href='connectbook.action?ac=userlist&msnacc=<ww:property value="msnacc"/>';"></td>
				<td>&nbsp;</td>
              </tr>
</table>
</form>
</body>
</html>