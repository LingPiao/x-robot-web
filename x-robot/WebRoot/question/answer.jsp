<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Page-Enter" content="blendTrans(duration=0.5)"/>
<title>answer</title>
<style type="text/css">
<!--
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
	color: #CCCCCC;
}
body {
	background-color: #6E020F;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	color: #CCCCCC;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #CCCCCC;
}
a:hover {
	text-decoration: underline;
	color: #FFFFFF;
}
a:active {
	text-decoration: none;
	color: #CCCCCC;
}
.font14 {
	font-size: 14px;
	line-height:35px;
}
.font12 {
	font-size: 12px;
	line-height:22px;
}
body {
	SCROLLBAR-FACE-COLOR: #cfcfcf;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #595959;
	SCROLLBAR-3DLIGHT-COLOR: #595959;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
	SCROLLBAR-BASE-COLOR: #cfcfcf;
}
-->
</style></head>

<body>
<ww:iterator value="answerList" status="row">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="40" align="left" class="font12"><a href="javascript:history.go(-1);"><b>[返回]</b></a></td>
  </tr>
  <tr>
    <td><span class="font14">
      <ww:property value="['QUESTION']"/></span></td>
  </tr>
  <tr>
    <td><hr noshade width="95%" color="#CCCCCC" size="1"></td>
  </tr>
  <tr>
    <td><span class="font12">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<ww:property value="['ANSWER']"/></span></td>
  </tr>
</table></ww:iterator>
</body>
</html>
