<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html>
<head>
<title>Memo</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="Page-Enter" content="blendTrans(duration=0.2)"/>
<style type="text/css">
<!--
.font14 {
	font-size: 14px;
}
.font12 {
	font-size: 12px;
}
body {
	background-color: #6E020F;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
body,td,th {
	color: #CCCCCC;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
-->
</style>
<style type="text/css">
<!--
a:link {
	color: #CCCCCC;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #CCCCCC;
}
a:hover {
	text-decoration: none;
	color: #FFFFFF;
}
a:active {
	text-decoration: none;
	color: #CCCCCC;
}
-->
</style>
<script language="JavaScript" src="../js/page.js"></script>
</head>
<body scroll=no>
<form name="pageForm" method="post" action=question.action?op=memo&user_msn=<ww:property value="user_msn"/>>
<input name="t_keyword" type="hidden">
<input name="classID" type="hidden">
<input name="normalstate" type="hidden">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="365" valign="top"><table width="100%" cellpadding="5">
<ww:iterator value="questionList" status="row">
  <tr>
    <td height="25" class="font14"><a href=question.action?op=answer&user_msn=<ww:property value="user_msn"/>&questionid=<ww:property value="['QUESTIONID']"/> title="<ww:property value="['QUESTION']"/>"><ww:if test="['QUESTION'].length() >= 22"><ww:property value="['QUESTION'].substring(0,22)+\"...\""/></ww:if><ww:else><ww:property value="['QUESTION']"/></ww:else></a></td>
  </tr>
  </ww:iterator>
</table></td>
  </tr>
  <tr>
    <td height="5" align="center" valign="middle"><img src="../images/line02.png" width="348" height="3"></td>
  </tr>
  <tr>
    <td height="25" align="center" valign="middle"><%@ include file="../public/page.jsp" %></td>
  </tr>
</table>
<script>
var t_keyword = '<ww:property value="t_keyword"/>';
var classID = '<ww:property value="classID"/>';
var normalstate = '<ww:property value="normalstate"/>';
pageForm.t_keyword.value = t_keyword;
pageForm.classID.value = classID;
pageForm.normalstate.value = normalstate;
</script>
</form>
</body>
</html>