<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="top" align="left" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <%@ include file="top.jsp" %>
    </table></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td align="center" class="bigbg"><table width="870" border="0" cellspacing="1" cellpadding="1">
              <tr>
                <td align="left" valign="top" width="444">
					<iframe 
style="BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; WIDTH: 435px; HEIGHT: 450px; BORDER-TOP: medium none; BORDER-RIGHT: medium none" 
id="ChatFrame" src="http://www.x-robot.cn/robot-web/" frameborder="0"></iframe>
				</td>
                <td width="425" rowspan="2" align="left" valign="top">
                    <iframe 
style="BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; WIDTH: 425px; HEIGHT: 560px; BORDER-TOP: medium none; BORDER-RIGHT: medium none" 
id="ChatFrame" src="<ww:if test="chanel==\"other\"">woknow</ww:if><ww:if test="chanel==\"mine\"">woknowmine</ww:if><ww:if test="chanel==\"vip\"">woknowvip</ww:if>.action?userid=<ww:property value="userid"/>&chanel=<ww:property value="['chanel']"/>&from=web" frameborder="0"></iframe>
                </td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="beibei">
                  <tr>
                    <td width="113" align="center"><img src="images/bebei.jpg" width="99" height="99" /></td>
                    <td width="323" align="left"><table width="100%" border="0" cellspacing="3" cellpadding="3">
                      <tr>
                        <td><a href="msnim:add?contact=www.10010.com@hotmail.com" target=_blank><img src="images/bebei1.jpg" border="0" /></a></td>
                      </tr>
                      <tr>
                        <td><a href="#"><img src="images/beibei2.jpg" border="0" /></a></td>
                      </tr>
                      <tr>
                        <td><a href="#"><img src="images/beibei3.jpg" border="0" /></a></td>
                      </tr>
                    </table></td>
                    </tr>
                  
                </table></td>
                </tr>
              
            </table></td>
          </tr>
          
        </table></td>
      </tr>
      
      <tr>
        <td align="center" class="a1"><br />
          <br /></td>
      </tr>
      <%@ include file="buttom.jsp" %>
    </table></td>
  </tr>
</table>
</body>
</html>
