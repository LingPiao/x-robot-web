<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html>
<head>
<title>沃知道</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="cssjp/css.css" rel="stylesheet" type="text/css">
<SCRIPT language=JavaScript src="js/page.js"></SCRIPT>
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
	background:url(imagesmsn/buttom_preview01.png);
}
a:visited img{
	background:url(imagesmsn/buttom_preview02.png);
	
}
-->
</style></head>
<body bgcolor="#FFFFFF">
<FORM id=fom name=fom action="" method=post>
<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="imagesmsn/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="imagesmsn/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="imagesmsn/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<tr>
		<td width="397" height="52">
			<img src="imagesmsn/main_04.jpg" width="41" height="52" alt=""></td>
		<td background="imagesmsn/main_05_bg.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="52"><br>
            <img src="imagesmsn/nav_left.gif" width="33" height="23"></td>
            <td align="left" valign="top"><img src="imagesmsn/banner_unicom.gif" width="275" height="46"></td>
            <td width="33"><br>
            <img src="imagesmsn/nav_right.gif" width="33" height="23"></td>
          </tr>
        </table></td>
<td>
			<img src="imagesmsn/main_06.jpg" width="39" height="52" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="imagesmsn/main_07.jpg" width="41" height="41" alt=""></td>
		<td width="397" height="41" class="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="41">&nbsp;</td>
            <td><a href="http://www.x-robot.cn/unicom/index.jsp"><img src="imagesmsn/index.gif" width="35" height="20" border="0" onMouseOver="this.src='imagesmsn/index_link.gif'" onMouseOut="this.src='imagesmsn/index.gif'"></a></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/robotweb/woknow.action?userid=<ww:property value="user_msn"/>&chanel=other&from=msn">“沃”知道 </a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/unicom/index.jsp">沃商城</a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/index.html?msn=<ww:property value="user_msn"/>&refer=www.x-robot.cn/unicom/index.jsp">休闲广场</a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/unicom/invitebuddy/index.jsp">邀请好友</a></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
<td>
			<img src="imagesmsn/main_09.jpg" width="39" height="41" alt=""></td>
	</tr>
	<tr>
		<td class="left_02">&nbsp;</td>
	  <td width="397" height="511" valign="middle" class="redbg">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" >
          <tr>
            <td class="button_01" align="center" valign="middle"><a class="black_01" href="woknow.action?userid=<ww:property value="userid"/>&chanel=other&from=<ww:property value="from"/>">网友问题</a></td>
            <ww:if test="userid!=null && !userid.equals(\"\")">
            <td class="button_02" align="center" valign="middle"><a class="black_01" href="woknowmine.action?userid=<ww:property value="userid"/>&chanel=mine&from=<ww:property value="from"/>">我的问题</a></td>
            </ww:if>
             <ww:if test="vip==\"1\"">
            <td class="button_02" align="center" valign="middle"><a class="black_01" href="woknowvip.action?userid=<ww:property value="userid"/>&chanel=vip&from=<ww:property value="from"/>">VIP问题</a></td>
          	</ww:if>
          </tr>
        </table>
		<table width="100%" height="100%" align="center" cellpadding="6" cellspacing="6">
          <tr>
            <td height="43" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="whitebg">
              <tr>
                <td width="5%" class="top_01"><img src="imagesmsn/corner1.jpg" width="18" height="18"></td>
                <td width="90%" class="top_01">&nbsp;</td>
                <td width="5%" align="right" class="top_01"><img src="imagesmsn/corner2.jpg" width="18" height="18"></td>
              </tr>
              <tr>
                <td class="left_01">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <ww:iterator value="pageInfo.records" status="row">
                  <tr>
                    <td><table width="100%" border="0" cellspacing="1" cellpadding="1" class="grey_01">
                      <tr>
                        <td colspan="4" class="content"> <a class="black_01" href="woanswer.action?q_id=<ww:property value="['Q_ID']"/>&userid=<ww:property value="['userid']"/>&op=brows&chanel=<ww:property value="chanel"/>&from=<ww:property value="from"/>"><font style="font-size:15px"  face="微软雅黑"><ww:if test="Q_CONTENT.length()>20"><ww:property value="['Q_CONTENT'].substring(0,20)"/>......</ww:if><ww:else><ww:property value="['Q_CONTENT']"/></ww:else></font></a></td>
                      </tr>
                      <tr>
                    <td>&nbsp;</td>
                  </tr>
                      <tr>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="orange"></td>
                        <td align="right" class="black_01" colspan=2>提问人：<ww:if test="USER_TEL==null">未绑定手机</ww:if><ww:else><ww:property value="['USER_TEL'].substring(0,3)"/>****<ww:property value="['USER_TEL'].substring(7,11)"/></ww:else>&nbsp;&nbsp;<ww:if test="Q_STATE==\"1\"">【已完结】</ww:if><ww:else><FONT color=red>【未完结】</FONT></ww:else></td>
                      </tr>
                      <tr>
                        <td align="right">&nbsp;</td>
                        <td align="right" class="orange"></td>
                        <td align="right" class="black_01" colspan=2>访问：<ww:if test="BROWS==null">0</ww:if><ww:else><ww:property value="['BROWS']"/></ww:else>&nbsp;回复：<ww:if test="ANSWERS==null">0</ww:if><ww:else><ww:property value="['ANSWERS']"/></ww:else>&nbsp;提问时间：<ww:property value="['Q_DATE'].toString().substring(0,16)"/></td>
                      </tr>
                    </table></td>
                  </tr>
                  
                  </ww:iterator>
                </table></td>
                <td class="right_01">&nbsp;</td>
              </tr>
              <tr>
                <td class="bottom_01"><img src="imagesmsn/corner3.jpg" width="18" height="18"></td>
                <td class="bottom_01">&nbsp;</td>
                <td align="right" class="bottom_01"><img src="imagesmsn/corner4.jpg" width="18" height="18"></td>
              </tr>
            </table><%@ include file="utils/page.jsp" %></td>
          </tr>
        </table></td>
	  <td class="right_02">&nbsp;</td>
	</tr>
	<tr>
		<td>
			<img src="imagesmsn/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="imagesmsn/main_1401.jpg"><table width="100%" height="100%">
          <tr>
            <td width="20%" align="center" valign="top">&nbsp;</td>
            <td width="60%" align="center" valign="top" class="ban"></td>
            <td width="20%" align="center" valign="top"><img src="imagesmsn/touming.gif" width="70" height="30"></td>
          </tr>
        </table></td>
<td>
			<img src="imagesmsn/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="imagesmsn/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="imagesmsn/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="imagesmsn/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</FORM>
</body>
</html>