<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>信息查询</title>
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
a:link img{
	background:url(../images/buttom_preview01.png);
}
a:visited img{
	background:url(../images/buttom_preview02.png);
	
}
-->
</style></head>
<body bgcolor="#FFFFFF">
<form name="qryForm" action=question.action?op=memo&user_msn=<ww:property value="user_msn"/> method="post" target="memo">
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
	  <td width="397" height="511" valign="top" background="../images/main_11.jpg">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td height="41" width="2%">&nbsp;</td>
            <td align="center" class="ban">关键词
              <label>
              <input name="t_keyword" type="text" id="t_keyword" size="15">
              </label></td>
            <td align="center" class="ban">业务分类
              <label>
              <select name="classID" id="classID">
              <ww:iterator value="typeList" status="row">
                <option value="<ww:property value="['CLASS_NUM']"/>"><ww:property value="['CLASS_NAME']"/></option>
                </ww:iterator>
              </select>
              </label></td>
            <td width="15%" align="center"><input type="image" src="../images/button_search.gif" name="button"></td>
          </tr>
        </table>
		<table width="395" height="83" align="center">
          <tr>
            <td height="43" align="center" valign="middle"><table width="100%" height="389">
			
              <tr>
			    <td width="5%" align="center" valign="middle">&nbsp;</td>
                <td height="35" align="left"><div id="div"></div></td>
                <td align="right"><a href="javascript:setFAQ('15');"><img src="../images/button_help.gif" width="131" height="33" border="0"></a></td>
				<td width="5%" align="center" valign="middle">&nbsp;</td>
              </tr>
			   <tr height="4">
			    <td width="5%" height="4" align="center" valign="middle">&nbsp;</td>
                <td colspan="2" height="4" align="left"><img src="../images/line02.png" width="348" height="3"></td>
                <td width="5%" align="center" valign="middle">&nbsp;</td>
              </tr>
			   <tr>
			    <td width="5%" height="300" align="center" valign="middle">&nbsp;</td>
                <td height="395" colspan="2" rowspan="3" align="left" valign="top" bgcolor="#6E020F"><iframe width="100%" height="395" frameborder="0" name="memo" src="question.action?op=memo&user_msn=<ww:property value="user_msn"/>"></iframe></td>
                <td width="5%" align="center" valign="middle">&nbsp;</td>
              </tr>
			   <tr>
			    <td width="5%" align="center" valign="middle">&nbsp;</td>
                <td width="5%" align="center" valign="middle">&nbsp;</td>
              </tr>
			  <tr>
			    <td width="5%" align="center" valign="middle">&nbsp;</td>
                <td width="5%" align="center" valign="middle">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table>
		
	  </td>
		<td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_14.jpg"><table width="100%" height="100%">
          <tr>
            <td width="20%" align="center" valign="top">&nbsp;</td>
            <td width="60%" align="center" valign="top" class="ban"></td>
            <td width="20%" align="center" valign="top">&nbsp;</td>
          </tr>
        </table></td>
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
<input name="normalstate" type="hidden" value="3">
<script>
div.innerHTML = "<a href=\"javascript:setStatus('0');\" title=\"当前为'常见问题'，点击切换为'全部问题'。\"><img src=\"../images/button_all.gif\" width=\"129\" height=\"31\" border=\"0\"></a>";
var t_keyword = '<ww:property value="t_keyword"/>';
var classID = '<ww:property value="classID"/>';
qryForm.t_keyword.value = t_keyword;
qryForm.classID.value = classID;
function setFAQ(val){
	qryForm.t_keyword.value = '';
	qryForm.classID.value = val;
	qryForm.normalstate.value = '3';
	div.innerHTML = "<a href=\"javascript:setStatus('0');\" title=\"当前为'常见问题'，点击切换为'全部问题'。\"><img src=\"../images/button_all.gif\" width=\"129\" height=\"31\" border=\"0\"></a>";
	qryForm.submit();
}
function setStatus(val){
	qryForm.t_keyword.value = '';
	qryForm.classID.value = '0';
	qryForm.normalstate.value = val;
	if(val == '0'){
		div.innerHTML = "<a href=\"javascript:setStatus('3');\" title=\"当前为'全部问题'，点击切换为'常见问题'。\"><img src=\"../images/button_always.gif\" width=\"129\" height=\"31\" border=\"0\"></a>";
	}
	if(val == '3'){
		div.innerHTML = "<a href=\"javascript:setStatus('0');\" title=\"当前为'常见问题'，点击切换为'全部问题'。\"><img src=\"../images/button_all.gif\" width=\"129\" height=\"31\" border=\"0\"></a>";
	}
	qryForm.submit();
}
</script>
</form>
</body>
</html>