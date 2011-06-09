<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>电话本联系人</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.STYLE16 {color: #333333}
-->
</style>
</head>
<script language='javascript'>
string actionstr = "user";
function tourl(string action){
	window.location.href=action+actionstr;
}
function setactiontype(string type){
	actionstr = str;
}
</script>
<body bgcolor="#FFFFFF">
<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="../images/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="../images/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="../images/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<%@ include file="../public/title.jsp"%>
	<tr>
		<td>
			<img src="../images/main_10.jpg" width="41" height="511" alt=""></td>
	  <td width="397" height="511" align="center" valign="top" background="../images/main_11.jpg">
		<table id="__01" width="364" height="477" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="images/connect_bg_01.gif" width="243" height="61" alt=""></td>
		<td width="121" height="98" colspan="2" rowspan="2" align="center" valign="top" background="images/connect_bg_02.gif">&nbsp;</td>
	</tr>
	<tr>
		<td width="93" height="37" align="center" valign="middle" background="images/connect_bg_03.gif"><img src="images/book.png" width="78" height="22"> </td>
		<td rowspan="3">
			<img src="images/connect_bg_04.png" width="11" height="358" alt=""></td>
		<td background="images/connect_bg_05.png" width="139" height="37"><img src="images/all.png" width="125" height="23"></td>
	</tr>
	<tr>
	  <td width="93" height="291" valign="top" background="images/connect_bg_03.gif"><table width="100%">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td align="center" class="font12"><a href="connectbook.action?ac=userlist&msnacc=<ww:property value="msnacc"/>" target="memo">联系人管理</a></td>
        </tr>
		<tr>
          <td>&nbsp;</td>
        </tr>
		<tr>
          <td align="center" class="font12"><a href="connectbook.action?ac=typelist&msnacc=<ww:property value="msnacc"/>" target="memo">分组管理</a></td>
        </tr>
      </table>
	    </td>
		<td colspan="2" background="images/connect_bg_06.png" width="238" height="291">
		   <iframe name="memo" src="connectbook.action?ac=userlist&msnacc=<ww:property value="msnacc"/>" width="235" height="291" frameborder="0" scrolling="no"></iframe>			</td>
		<td rowspan="2">
			<img src="images/connect_bg_07.gif" width="22" height="321" alt=""></td>
	</tr>
	<tr>
	  <td width="93" height="30" valign="top" background="images/connect_bg_03.gif"></td>
		<td colspan="2" background="images/connect_bg_08.png" width="238" height="30">
		</td>
	</tr>
	<tr>
		<td colspan="5" background="images/connect_bg_09.gif" width="364" height="30">
		</td>
	</tr>
	<tr>
		<td colspan="5">
			<img src="images/connect_bg_10.gif" width="364" height="27" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/分隔符.gif" width="93" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="11" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="139" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="99" height="1" alt=""></td>
		<td>
			<img src="images/分隔符.gif" width="22" height="1" alt=""></td>
	</tr>
</table>
	  </td>
	  <td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" align="right" valign="top" background="../images/main_14.jpg">&nbsp;</td>
		<td>
			<img src="../images/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="../images/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="../images/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</body>
</html>