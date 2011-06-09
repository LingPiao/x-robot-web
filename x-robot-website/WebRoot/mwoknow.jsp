<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK"><LINK 
href="css-jp/main1.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="js/page.js"></SCRIPT>

<STYLE type=text/css>BODY {
	MARGIN-LEFT: 0px; MARGIN-RIGHT: 0px
}
</STYLE>

<META content="MSHTML 6.00.6001.18565" name=GENERATOR></HEAD>
<BODY class="bg">
<FORM id=fom name=fom action="" method=post>
<table width="100%" border="0" align="center" >
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      <TBODY>
        <TR>
          <TD><TABLE id=subtree1 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR>
                  <TD><TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
                      <TBODY>
                        <TR>
                          <TD height=40><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 class="border">
                              <TBODY>
                                <TR>
                                  <TD width="2%" class="ll"><img src="images-jp/corner1.jpg" width="23" height="16"></TD>
                                  <TD width="96%"  class="top">&nbsp;</TD>
                                  <TD width="2%" class="rightline"><img src="images-jp/corner3.jpg" width="23" height="17"></TD>
                                </TR>
                                <TR>
                                  <TD  class="ll"></TD>
                                  <TD width="98%"><table cellspacing="2" cellpadding="2" width="100%" border="0" class="border">
                                      <tbody>
                                        <tr>
                                          <td height="30"><TABLE cellSpacing=0 cellPadding=0 width="100%" align=right border=0>
  <TBODY>
  <TR>
    <TD align=""><a href="woknow.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>"><img src="images-jp/q1.jpg" border="0" alt="网友问题"></A>
    <ww:if test="userid!=null && !userid.equals(\"\")">
		
		    <a href="woknowmine.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>"><img src="images-jp/q2.jpg" border="0" align="我的问题"></A>
	</ww:if>	    
		    <ww:if test="vip==\"1\"">
	
		    <a href="woknowvip.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>"><img src="images-jp/q3.jpg" border="0" align="VIP问题"></A>
		    </ww:if></TD>
  </TR></TBODY></TABLE></td>
                                        </tr>
                   <ww:iterator value="pageInfo.records" status="row">
                                        <tr>
                                          <td width="96%"  class="line"><a href="woanswer.action?q_id=<ww:property value="['Q_ID']"/>&userid=<ww:property value="['userid']"/>&op=brows&chanel=other&from=<ww:property value="from"/>"><font style="font-size:15px"  face="微软雅黑"><ww:if test="Q_CONTENT.length()>20"><ww:property value="['Q_CONTENT'].substring(0,20)"/>......</ww:if><ww:else><ww:property value="['Q_CONTENT']"/></ww:else></font></a><br>
                                           <br/> <ww:if test="Q_STATE==\"1\"">已完结</ww:if><ww:else><FONT color=red>未完结</FONT></ww:else>&nbsp;&nbsp;访问：<ww:if test="BROWS==null">0</ww:if><ww:else><ww:property value="['BROWS']"/></ww:else>&nbsp;&nbsp;回复：<ww:if test="ANSWERS==null">0</ww:if><ww:else><ww:property value="['ANSWERS']"/></ww:else><br />
                                            提问时间：<ww:property value="['Q_DATE'].toString().substring(0,16)"/></td>
                                        </tr>
                                     
                                        </ww:iterator>
                                      
                                        <tr>
                                          <td></td>
                                        </tr>
                                      </tbody>
                                  </table></TD>
                                  <TD  class="rightline">&nbsp;</TD>
                                </TR>
                                <TR>
                                  <TD class="ll"><img src="images-jp/corner2.jpg" width="23" height="18"></TD>
                                  <TD class="bottom">&nbsp;</TD>
                                  <TD class="rightline"><img src="images-jp/corner4.jpg" width="23" height="18"></TD>
                                </TR>
                                <TR>
                                  <TD></TD>
                                  <TD></TD>
                                  <TD></TD>
                                </TR>
                              </TBODY>
                          </TABLE></TD>
                        </TR>
                      </TBODY>
                  </TABLE></TD>
                </TR>
              </TBODY>
          </TABLE>
              <TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
                <TBODY>
                  <TR>
                    <TD height=6></TD>
                  </TR>
                  <TR>
                    <TD height=33 align="center"><%@ include file="utils/page.jsp" %></TD>
                  </TR>
                </TBODY>
              </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
</table>
</FORM></BODY></HTML>
