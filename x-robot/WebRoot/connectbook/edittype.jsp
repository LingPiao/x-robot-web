<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>�༭����</title>
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
<input name="ac" type="hidden" value="edittypeaction">
<input name="msnacc" type="hidden" value="<ww:property value="msnacc"/>">
<input name="tid" type="hidden" value="<ww:property value="tid"/>">
<table width="100%">
              <tr>
                <td width="33%">&nbsp;</td>
                <td width="59%" align="center" class="font12 STYLE15">�޸ķ���</td>
				<td width="8%">&nbsp;</td>
              </tr>
              <tr>
                <td align="right" class="font12">��������</td>
                <td align="center"><input name="tname" type="text" class="input_loginadd" id="textfield" value="<ww:property value="tname"/>"></td>
				<td>&nbsp;</td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><input name="button" type="submit" class="input_button2" id="button" value="�޸�">&nbsp;<input name="button" type="button" class="input_button2" id="button" value="ȡ��" onClick="window.location.href='connectbook.action?ac=typelist&msnacc=<ww:property value="msnacc"/>';"></td>
				<td>&nbsp;</td>
              </tr>
</table>
</form>
</body>
</html>