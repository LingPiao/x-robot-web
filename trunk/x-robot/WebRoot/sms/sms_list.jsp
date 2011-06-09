<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>

<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>常用短信</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE8 {color: #747373}
.STYLE10 {font-size: 11px}

.STYLE19 {
	font-size: 12px;
	
}
.STYLE9 {
	font-size: 12px;
	color: #cccccc;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #666666;
}
.STYLE9 a:link{
	font-size:12px;
	color:#666666;
}
.STYLE9 a:hover,
  .STYLE9 a:active{
	font-size:12px;
	color:#B20ccc;
}

-->
</style>
<script language="JavaScript" src="../js/page.js"></script>
</head>

<body bgcolor="#FFFFFF">
<form name="qryForm" action="" method="post">
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
		<td background="../images/main_101.jpg" width="41" height="511">&nbsp;</td>
	  <td width="397" height="511" valign="top" background="../images/main_111.jpg">
		<table width="395" height="126" align="center" >
         <tr>
            <td height="91" align="center" valign="middle"><a href="sms.action?op=view&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_01.gif" width="81" height="89" border="0"></a></td>
			<td align="center" valign="middle"><img src="../images/sms/pic_02_link.gif" width="81" height="89" border="0"></td>
			<td align="center" valign="middle"><a href="../telbook/telbook.action?op=view&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_03.gif" width="81" height="89" border="0"></a></td>
			<td align="center" valign="middle"><a href="sms.action?op=history&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_04.gif" width="81" height="89" border="0"></a></td>
          </tr>
		  <tr>
		    <td height="27" align="center" valign="top" class="title">自编短信</td>
			<td align="center" valign="top" class="title">常用短信</td>
			<td align="center" valign="top" class="title">电话薄</td>
            <td align="center" valign="top" class="title">历史记录</td>
          </tr>
        </table>
		<table id="__01" width="100%" height="378" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center"><table id="__01" width="359" height="382" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="4">
			<img src="../images/sms/message_use_bg_01.gif" width="359" height="17" alt=""></td>
	</tr>
	<tr>
		<td width="93" height="337" align="right" valign="top" background="../images/sms/message_use_bg_02.gif"><table width="95%" height="100%">
          <tr>
            <td valign="top"><table id="__01" width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
		<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">信息分类</td>
		<td>
			<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
	</tr>
</table></td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" height="283">
              <ww:iterator value="classList" status="row">
              <tr>
                <td height="28" class="ban">
				<a href="sms.action?op=sms&user_msn=<ww:property value="['user_msn']"/>&smsclassid=<ww:property value="['CLASS_ID']"/>"><ww:property value="['CLASS_NAME']"/></a>
				</td>
              </tr>
              </ww:iterator>
              <tr>
                <td height="">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
         
        </table></td>
		<td background="../images/sms/message_use_bg_03.gif" width="13" height="337">
			</td>
		<td width="239" height="337" valign="top" background="../images/sms/message_use_bg_04.gif"><table width="100%" height="347">
          <tr>
            <td><table id="__01" width="90" height="23" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
		<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">所有短信</td>
		<td>
			<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
	</tr>
</table></td>
          </tr>
          <tr>
            <td height="280" align="center" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#F3F1F0">
  				<ww:iterator value="pageInfo.records" status="row">
			  <tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    *&nbsp;<a href="sms.action?op=view&user_msn=<ww:property value="['user_msn']"/>&mes_id=<ww:property value="['MES_ID']"/>"><ww:property value="['MES_CONTENT']"/></a>
			    </td>
			  </tr>
			  </ww:iterator>
			</table></td>
          </tr>      
        </table>
        </td>
		<td background="../images/sms/message_use_bg_05.gif" width="14" height="337">
		</td>
	</tr>
	<tr><td colspan=3 background="../images/sms/billbg_03.gif" valign=top>
	<%@ include file="../public/page.jsp" %>
	</td><td background="../images/sms/message_use_bg_05.gif" width="14"></tr>
	<tr>
		<td colspan="4" background="../images/sms/message_use_bg_06.gif" width="359" height="28" align=right valign=middle>
			 </td>
	</tr>
</table>

</td>
	</tr>
	
</table>
		
	  </td>
	  <td background="../images/main_121.jpg" width="39" height="511">
			</td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" align="right" valign="top" background="../images/main_14.jpg"><table width="100%" height="39">
          <tr>
            <td width="94%" align="right" valign="top"><input name="button" type="button" class="input_button03" id="button" value="发送"></td>
            <td width="6%">&nbsp;</td>
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
</form>
</body>
</html>