<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %>  
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="top" align="left" valign="bottom">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <%@ include file="top.jsp" %>  
    </table></td>
  </tr>
  <tr>
    <td align="center"><table width="600" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="logo2" align="center"><img src="images/logo2.jpg" width="281" height="156" /></td>
      </tr>
      <tr>
        <td align="center"><table width="590" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20" align="left"><img src="images/left.jpg" width="20" height="103" /></td>
            <td width="546" class="search" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="2" align="center"><a href="#" class="a2 curr">资费资费</a> | <a href="#" class="a1">3g手机</a> | <a href="#" class="a1">3g上网</a> | <a href="#" class="a1">网上购号</a> | <a href="#" class="a1">合约计划</a> | <a href="#" class="a1">其它业务</a></td>
              </tr>
              <form method="post" name="qryform" action="woknow_qry.action">
              <tr>
                <td width="91%" align="center"><label>
                  <input name="woknow_qry" type="text" size="60" class="a1input"/>
                </label></td>
                <td width="9%" align="center" valign="bottom" style="padding-top:6px;"><label>
                  <input type="image" name="Submit" value="提交" src="images/button.jpg" />
                </label></td>
              </tr>
              </form>
              <tr>
                  <td>
                	<ww:if test="userid!=null && !userid.equals(\"\")">
                       	&nbsp;&nbsp;&nbsp;&nbsp;<a href="woknow_main.action?chanel=mine" class="a3" >我的问题</a>
                  	</ww:if>
                   　       			&nbsp;&nbsp;&nbsp;&nbsp;<a href="woknow_main.action?chanel=other" class="a3" >网友问题</a>
                   	<ww:if test="vip==\"1\"">
                      	&nbsp;&nbsp;&nbsp;&nbsp;<a href="woknow_main.action?chanel=vip" class="a3" >vip问题</a>
                  	</ww:if>
                  </td>
              </tr>
            </table></td>
            <td width="24" align="right"><img src="images/right.jpg" width="24" height="103" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="88">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <%@ include file="buttom.jsp" %>
</table>
</body>
</html>
