<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%@ include file="header.jsp" %> 
<link href="css/style.css" type=text/css rel=stylesheet>
<script language="JavaScript" src="js/page.js"></script>
<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="question">
                  <tr>
                    <td align="center" valign="top"><table width="96%" border="0" cellspacing="4" cellpadding="4">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="1" cellpadding="1" class="grey_01">
                          <tr>
                          <ww:if test="userid!=null && !userid.equals(\"\")">
                            <td align="center"><a href="woknowmine.action?userid=<ww:property value="userid"/>&chanel=mine&from=web" class="a4"><ww:if test="chanel==\"mine\""><font color=red>我的问题</font></ww:if><ww:else>我的问题</ww:else></a></td></ww:if>
                            <td align="center"><a href="woknow.action?userid=<ww:property value="userid"/>&chanel=other&from=web" class="a4"><ww:if test="chanel==\"other\""><font color=red>网友问题</font></ww:if><ww:else>网友问题</ww:else></a></td>
                          <ww:if test="vip==\"1\"">
                            <td align="center"><a href="woknowvip.action?userid=<ww:property value="userid"/>&chanel=vip&from=web" class="a4"><ww:if test="chanel==\"vip\""><font color=red>VIP问题</font></ww:if><ww:else>VIP问题</ww:else></a></td></ww:if>
                            <td align="center"><a href="#" class="a4">话费分析</a></td>
                          </tr>
                        </table></td>
                      </tr>
                      <ww:iterator value="pageInfo.records" status="row">
                      <tr>
                        <td><table width="100%" border="0" cellspacing="0" cellpadding="1" class="grey_01">
                          <tr>
                            <td class="content" align="left">
                            	☆&nbsp;&nbsp;<a href="woanswer.action?q_id=<ww:property value="['Q_ID']"/>&userid=<ww:property value="['userid']"/>&op=brows&chanel=<ww:property value="['chanel']"/>&from=<ww:property value="from"/>" class="a4" >
			                    <ww:if test="Q_CONTENT.length()>20"><ww:property value="['Q_CONTENT'].substring(0,18)"/>......</ww:if><ww:else><ww:property value="['Q_CONTENT']"/></ww:else></a>
                            </td>
                          </tr>
                          <tr>
                            <td class="content3" align="right">提问人：<ww:if test="USER_TEL==null">未绑定手机</ww:if><ww:else><ww:property value="['USER_TEL'].substring(0,3)"/>****<ww:property value="['USER_TEL'].substring(7,11)"/></ww:else>&nbsp;&nbsp;<ww:if test="Q_STATE==\"1\"">【已完结】</ww:if><ww:else><FONT color=red>【未完结】</FONT></ww:else></td>
                            </tr>
                          <tr>
                            <td class="content3" align="right">访问：<ww:if test="BROWS==null">0</ww:if><ww:else><ww:property value="['BROWS']"/></ww:else>&nbsp;回复：<ww:if test="ANSWERS==null">0</ww:if><ww:else><ww:property value="['ANSWERS']"/></ww:else>&nbsp;提问时间：<ww:property value="['Q_DATE'].toString().substring(0,16)"/></td>
                            </tr>
                        </table></td>
                      </tr>
                      </ww:iterator>        
                    </table>
                    <%@ include file="utils/page1.jsp" %>
                    </td>
                  </tr>
                </table>
</form>