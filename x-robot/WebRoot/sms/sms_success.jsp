<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>短信发送成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--

.STYLE12 {font-size: 18px}
-->
</style>
</head>
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
	  <td width="397" height="511" valign="top" background="../images/main_11.jpg">
		<table width="395" height="126" align="center" >
          <tr>
            <td height="91" align="center" valign="middle"><img src="../images/sms/pic_01_link.gif" width="81" height="89" border="0"></td>
			<td align="center" valign="middle"><a href="sms.action?op=sms&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_02.gif" width="81" height="89" border="0"></a></td>
			<td align="center" valign="middle"><a href="../connectbook/connectbook.action?ac=default&msnacc=<ww:property value="user_msn"/>"><img src="../images/sms/pic_03.gif" width="81" height="89" border="0"></a></td>
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
		<td align="center"><table width="100%">
		  <tr>
		    <td align="center">&nbsp;</td>
          </tr>
          <tr>
		    <td height="330" align="center" valign="top"><form>
			<table width="363" height="209" background="../images/phone_success.gif" cellpadding="5">
              <tr>
			    <td width="31" height="40">&nbsp;</td>
                <td width="68">&nbsp;</td>
                <td width="167">&nbsp;</td>
				<td width="45">&nbsp;</td>
              </tr>
              <tr>
			    <td height="78">&nbsp;</td>
                <td class="font15"><img src="../images/sms/smile.png" width="68" height="68"></td>
                <td class="fontStyle STYLE12">恭喜您，发送成功！</td>
				<td>&nbsp;</td>
              </tr>
              <tr>
			    <td height="20">&nbsp;</td>
                <td class="font15">&nbsp;</td>
                <td align="right" valign="top" class="font15"><input name="button" type="button" class="input_button3" id="button" value="确定" onclick="window.location.href='sms.action?op=view&user_msn=<ww:property value="user_msn"/>'"></td>
				<td>&nbsp;</td>
              </tr>
			   <tr>
			    <td>&nbsp;</td>
                <td class="font15">&nbsp;</td>
                <td class="font15">&nbsp;</td>
				<td>&nbsp;</td>
              </tr>
            </table>
		    </form></td>
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