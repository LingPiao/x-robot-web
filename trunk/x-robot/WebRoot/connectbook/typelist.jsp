<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<title>�����б�</title>
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
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	
}
body,td,th {
	font-size: 8px;
	font-family: Arial, Helvetica, sans-serif;
}
.STYLE2 {color: #666666}
.STYLE8 {
	color: #666666;
	font-size: 9px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
}
.STYLE9 {
	color: #666666;
	font-size: 9px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
}
.STYLE10 {
	color: #666666;
	font-size: 9px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
}
.STYLE12 {
	color: #666666;
	font-size: 9px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
 }
-->
</style>
<script language="jscript">
function chkall(input1)
{
	var objForm = document.forms[input1];
 	var objLen = objForm.length;
 	
 	for(var i=0;i<objLen;i++)
	{
		if(objForm.elements[i].type=="checkbox")
		{
			objForm.elements[i].checked=!objForm.elements[i].checked;
		}
	}
}
function deltype()
{
	document.form1.ac.value='deltypeaction';
	document.form1.submit();
} 
</script>
<script language="JavaScript" src="../js/page.js"></script>
</head>

<body bgcolor="#F3F1F0">
<form action="connectbook.action" name='form1'>
<input name="ac" type="hidden" value="typelist">
<input name="msnacc" type="hidden" value="<ww:property value="msnacc"/>">
<table width="100%">
	<tr>
		<td width="40%" align="center"><input name="button" type="button" class="input_button6" id="button" value="ȫѡ/��ѡ" OnClick="javascript:chkall('form1')"></td>
		<td width="30%" align="center"><input name="button" type="button" class="input_button3" id="button" value="���" onClick="window.location.href='connectbook.action?ac=addtype&msnacc=<ww:property value="msnacc"/>';"></td>
		<td width="30%"><input name="button" type="button" class="input_button3" id="button" value="ɾ��" OnClick="javasctipt:deltype()"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#F3F1F0">
  <tr>	
    <td width="20" height="22" align="center" valign="middle" class="STYLE12" background="images/book_bg.jpg">ѡ��</td>
    <td width="25%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE12">������</td>
	<td width="25%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE12">�޸�</td>
	<td width="25%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE10">�鿴��ϵ��</td>
  </tr>
  <ww:iterator value="typeListinfo">
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE9"><label>
    <ww:if test="TYPEID==1">
    &nbsp;
    </ww:if>
    <ww:else>
       <input name="ts" type="checkbox" value="<ww:property value="TYPEID"/>">
    </ww:else>
    </label>
    </td>
    <td width="25%" height="22" colspan="3" align="center" class="STYLE9"><ww:property value="TYPENAME"/></td>
    <ww:if test="TYPEID==1">
    <td width="25%" height="22" colspan="3" align="center" class="STYLE9"><img src="images/edit.png" width="10" height="10"></td>
    </ww:if>
    <ww:else>
	<td width="25%" height="22" colspan="3" align="center" class="STYLE9"><a href="connectbook.action?ac=edittype&tid=<ww:property value="TYPEID"/>&msnacc=<ww:property value="msnacc"/>"><img src="images/edit.png" width="10" height="10"></a></td>
	</ww:else>
	<td width="25%" height="22" colspan="3" align="center" class="STYLE8"><a href="connectbook.action?ac=userlist&tid=<ww:property value="TYPEID"/>&msnacc=<ww:property value="msnacc"/>"><img src="images/edit.png" width="10" height="10"></a></td>
  </tr>
  </ww:iterator>
</table>
<br>
<%@ include file="../public/page.jsp" %>
</form>
</body>
</html>
