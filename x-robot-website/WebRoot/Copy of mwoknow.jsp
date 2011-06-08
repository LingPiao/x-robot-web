<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title></title>
<link rel="stylesheet" href="Style/main.css" type="text/css" />
<script language="JavaScript" src="js/page.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-right: 0px;
}
-->
</style>
</head>
<body>
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="right">
     <tr>
  		<td>
		    <a href="woknow.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">网友问题</a>&nbsp;|&nbsp;
		
		<ww:if test="userid!=null && !userid.equals(\"\")">
		
		    <a href="woknowmine.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">我的问题</a>&nbsp;|&nbsp;
		
		</ww:if>
			
		<ww:if test="vip==\"1\"">
	
		    <a href="woknowvip.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">VIP问题</a>&nbsp;|&nbsp;
		
		</ww:if>	
  </tr>
</table><br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table id="subtree1"  width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="40" >
                <table width="100%" border="0" cellpadding="0" cellspacing="1"  >
                   <ww:iterator value="pageInfo.records" status="row">
                  <tr>
                    <td height="50" bgcolor="#FFFFFF"><a href="woanswer.action?q_id=<ww:property value="['Q_ID']"/>&userid=<ww:property value="['userid']"/>&op=brows&chanel=other&from=<ww:property value="from"/>"><ww:if test="Q_CONTENT.length()>20"><ww:property value="['Q_CONTENT'].substring(0,20)"/>......</ww:if><ww:else><ww:property value="['Q_CONTENT']"/></ww:else></a>
					<br/>
                    <ww:if test="Q_STATE==\"1\"">已完结</ww:if><ww:else><FONT color=red>未完结</FONT></ww:else>&nbsp;&nbsp;访问：<ww:if test="BROWS==null">0</ww:if><ww:else><ww:property value="['BROWS']"/></ww:else>&nbsp;&nbsp;回复：<ww:if test="ANSWERS==null">0</ww:if><ww:else><ww:property value="['ANSWERS']"/></ww:else>
                    <br/>
                    	提问时间：<ww:property value="['Q_DATE'].toString().substring(0,10)"/></td>
                  </tr>
                  <tr>
                    <td>
                  <hr style="border : 1px dashed blue;" /></td></tr>
                  </ww:iterator>
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="../images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33">
		   <%@ include file="utils/page.jsp" %>
		 </td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
