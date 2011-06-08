<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>联通客服</title>
<link href="css/sa.css" rel="stylesheet" type="text/css" />
<link href="css/alink.css" rel="stylesheet" type="text/css" />
</head>
<script>
function logindo()
{
	logform.action="login.action?op=logindo";
	logform.submit();
}
function reg()
{
	logform.action="login.action?op=reg";
	logform.submit();
}
</script>
<body>
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
                <td width="244" align="left" valign="top">
                 <%@ include file="add_left.jsp" %>
                </td>
                <td align="right" valign="middle"><table width="606" height="215" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="606" height="215"><script type="text/javascript">
imgUrl1="images/01.jpg";
imgtext1="01"
imgLink1=escape("#");
imgUrl2="images/02.jpg";
imgtext2="02"
imgLink2=escape("#");
imgUrl3="images/03.jpg";
imgtext3="03"
imgLink3=escape("#");
imgUrl4="images/04.jpg";
imgtext4="04"
imgLink4=escape("#");
imgUrl5="images/05.jpg";
imgtext5="05"
imgLink5=escape("#");

 var focus_width=606
 var focus_height=215
 var text_height=0
 var swf_height = focus_height+text_height
 
 var pics=imgUrl1+"|"+imgUrl2+"|"+imgUrl3+"|"+imgUrl4+"|"+imgUrl5
 var links=imgLink1+"|"+imgLink2+"|"+imgLink3+"|"+imgLink4+"|"+imgLink5
 var texts=imgtext1+"|"+imgtext2+"|"+imgtext3+"|"+imgtext4+"|"+imgtext5
 
 document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
 document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="images/focus2.swf"><param name="quality" value="high"><param name="bgcolor" value="#F0F0F0">');
 document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
 document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
 document.write('</object>');
      </script>                      </td>
                    </tr>
                </table></td>
              </tr>
            </table>
          <br />
            <table width="850" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="392" align="left" valign="top"><table width="371" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="215" align="center" valign="top" background="images/k2-1.jpg"><table width="350" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="80">&nbsp;</td>
                          </tr>
                          <tr>
                            <td align="left" valign="middle"><a href="faq.jsp#faq1" class="heiLink">∴ 联通贝贝是什么？</a> <br />
                                <a href="faq.jsp#faq2" class="heiLink">∴ 怎么使用联通贝贝的服务？</a> <br />
                                <a href="faq.jsp#faq3" class="heiLink">∴ 联通贝贝是机器人还是真人？</a> <br />
                                <a href="faq.jsp#faq4" class="heiLink">∴ “沃”知道是什么东西？ </a><br />
                                <a href="faq.jsp#faq5" class="heiLink">∴ 使用联通贝贝有什么费用吗？</a></td>
                          </tr>
                      </table></td>
                    </tr>
                  </table>
                    <br />
                    <table width="371" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="180" align="center" valign="top" background="images/k3-1.jpg"><table width="340" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="50" align="right" valign="middle"><a href="woknow.action?userid=<ww:property value="['userid']"/>&chanel=other&from=web" class="heiLink" target=_blank>更多&gt;&gt;</a></td>
                            </tr>
                            <ww:iterator value="woList" status="row">
                            <tr>
                              <td align="left" valign="middle">☆<a href="woanswer.action?q_id=<ww:property value="['Q_ID']"/>&userid=<ww:property value="['userid']"/>&op=brows&chanel=<ww:property value="['chanel']"/>&from=<ww:property value="from"/>" class="heiLink" >
			                    <ww:if test="Q_CONTENT.length()>18"><ww:property value="['Q_CONTENT'].substring(0,18)"/>......</ww:if><ww:else><ww:property value="['Q_CONTENT']"/></ww:else></a>
                              	&nbsp;<ww:if test="Q_STATE==\"1\"">[已完结]</ww:if><ww:else>[未完结]</ww:else>
                              </td>
                            </tr>
                            </ww:iterator>
                        </table></td>
                      </tr>
                  </table></td>
                <td width="458" align="left" valign="top"><table width="458" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="images/k4-4.jpg" width="14" height="266" /></td>
                      <td width="430" align="center" valign="center" background="images/k4-6.jpg"><iframe 
style="BORDER-BOTTOM: medium none; BORDER-LEFT: medium none; WIDTH: 420px; HEIGHT: 250px; BORDER-TOP: medium none; BORDER-RIGHT: medium none" 
id="ChatFrame" src="http://www.x-robot.cn/robot-web/" frameborder="0"></iframe></td>
                      <td><img src="images/k4-5.jpg" width="14" height="266" /></td>
                    </tr>
                  </table>
                    <br />
                    <table width="458" border="0" cellspacing="0" cellpadding="0">
                    <form action = "#" method=post name="logform">
                      <tr>
                        <td><img src="images/k5-1.jpg" width="148" height="114" /></td>
                        <td width="295" align="center" valign="middle" background="images/k5-2.jpg"><table width="280" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td width="70" height="24" align="left" valign="middle">用户名：</td>
                              <td width="130" align="left" valign="middle"><input name="username" id="username" type="text" size="16" /></td>
                              <td width="80" rowspan="3" align="center" valign="middle">
                                <table width="80" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td height="30" align="center" valign="middle"><a href="#" onclick="logindo()"><img src="images/k5-5.jpg" width="62" height="24" border="0" /></a></td>
                                  </tr>
                                  <tr>
                                    <td height="30" align="center" valign="middle"><a href="#" onclick="reg()"><img src="images/k5-6.jpg" width="62" height="24" border="0" /></a></td>
                                  </tr>
                                </table>                                
                               </td>
                            </tr>
                            <tr>
                              <td height="24" align="left" valign="middle">密&nbsp;&nbsp;码：</td>
                              <td align="left" valign="middle"><input name="userpwd" id="userpwd" type="password" size="16" /></td>
                            </tr>
                        </table></td>
                        <td><img src="images/k5-3.jpg" width="15" height="114" /></td>
                      </tr>
                  </form>
                  </table></td>
              </tr>
          </table></td>
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
</body>
</html>
