<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>沃知道</title>
<link href="css/sa.css" rel="stylesheet" type="text/css" />
<link href="css/alink.css" rel="stylesheet" type="text/css" />
</head>
<script language="JavaScript" src="js/page.js"></script>
<body>
<form name="fom" id="fom" method="post" action="">
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" background="images/bg3.jpg"><table width="1001" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="759" align="center" valign="top" background="images/bg2.jpg" style="background-repeat:no-repeat;"><table width="850" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="110">&nbsp;</td>
          </tr>
        </table>
              <table width="850" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="250" align="left" valign="top">
                  	<%@ include file="add_left.jsp" %>
                  <table width="230" border="0" cellspacing="0" cellpadding="0">
                  <ww:if test="userid!=null && !userid.equals(\"\")">
                      <tr>
                        <td><a href="woknowmine.action?userid=<ww:property value="userid"/>&chanel=mine&from=web" class="heiLink" >我的问题</a></td>
                      </tr>
                  </ww:if>
                      <tr>
                        <td><a href="woknow.action?userid=<ww:property value="userid"/>&chanel=other&from=web" class="heiLink" >网友问题</a></td>
                      </tr>
                  <ww:if test="vip==\"1\"">
                      <tr>
                        <td><a href="woknowvip.action?userid=<ww:property value="userid"/>&chanel=vip&from=web" class="heiLink" >vip问题</a></td>
                      </tr>
                  </ww:if>
                  </table>
                  
                  </td>
                  <td width="600" height="600" align="center" valign="top" background="images/erbg.jpg" style="background-repeat:no-repeat;"><table width="580" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="22" height="34" align="left" valign="top"><img src="images/er-01.jpg" width="17" height="29" /></td>
                      <td width="558" align="left" valign="bottom" class="nierong"><strong>“沃”知道</strong>
                      <ww:if test="chanel==\"other\"">【网友问题】</ww:if>
                      <ww:if test="chanel==\"mine\"">【我的问题】</ww:if>
                      <ww:if test="chanel==\"vip\"">【VIP问题】</ww:if></td>
                    </tr>
                    <tr>
                      <td height="40" colspan="2" align="center" valign="top"><br />
                      
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
						
                         <ww:iterator value="pageInfo.records" status="row">
			                  <tr>
			                    <td height="20" align=left>☆&nbsp;&nbsp;<a href="woanswer.action?q_id=<ww:property value="['Q_ID']"/>&userid=<ww:property value="['userid']"/>&op=brows&chanel=<ww:property value="['chanel']"/>&from=<ww:property value="from"/>" class="heiLink" >
			                    <ww:if test="Q_CONTENT.length()>20"><ww:property value="['Q_CONTENT'].substring(0,20)"/>......</ww:if><ww:else><ww:property value="['Q_CONTENT']"/></ww:else></a></td>
			                    <td width="180px">访问：<ww:if test="BROWS==null">0</ww:if><ww:else><ww:property value="['BROWS']"/></ww:else>&nbsp;&nbsp;回复：<ww:if test="ANSWERS==null">0</ww:if><ww:else><ww:property value="['ANSWERS']"/></ww:else>&nbsp;&nbsp;<ww:if test="Q_STATE==\"1\"">【已完结】</ww:if><ww:else><FONT color=red>【未完结】</FONT></ww:else></td>
			                    <td width="70px"><ww:property value="['Q_DATE'].toString().substring(0,10)"/></td>
			                  </tr>
			             </ww:iterator>
                      </table>
                      <%@ include file="utils/page1.jsp" %>
                     </td>
                      
                    </tr>
                  </table></td>
                  
                </tr>
              </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/bg4.jpg" width="1001" height="16" /></td>
  </tr>
</table>
 <%@ include file="buttom.jsp" %>
<p>&nbsp;</p>
<p>&nbsp;</p>
</form>
</body>
</html>
