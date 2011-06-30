<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ page import="com.opensymphony.xwork.ActionContext"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
</head>
<script language="JavaScript" src="js/page.js"></script>
<script>
function qry()
{
	qryform.submit();
}
</script>
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
        <td ><table width="100%" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td colspan="3">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="3" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="a1">资费资费</a> | <a href="#" class="a1">3g手机</a> | <a href="#" class="a1">3g上网</a> | <a href="#" class="a1">网上购号</a> | <a href="#" class="a1">合约计划</a> | <a href="#" class="a1">其它业务</a>              <label></label></td>
            </tr>
          <tr>
            <td colspan="2" align="left" style="padding-top:6px;"><table width="60%" border="0" cellspacing="0" cellpadding="0">
            <form method="post" name="qryform" action="woknow_qry.action">
              <tr>
                <td width="63%">&nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="woknow_qry" type="text" size="60" class="a1input" value="<ww:property value="['woknow_qry']"/>"></td>
                <td width="15%"><input name="button1" type="button" class="but1" id="button" value="　搜索答案"  onclick="qry()"/></td>
                <td width="22%"><input name="button2" type="button" class="but2" id="button2" value="　我要提问" /></td>
              </tr>
             
            </table></td>
          </tr>
          
          <ww:iterator value="qrySortList" status="row">
          <tr>
            <td width="2%" align="left" style="padding-top:6px;">&nbsp;</td>
            <td width="98%" align="left" style="padding-top:6px;"><a href="woknow_qry_brows.action?op=view&questionid=<ww:property value="['questionid']"/>&ft=<ww:property value="['fromtable']"/>" class="a4" target=_blank><ww:property value="['question']"/></a></td>
          </tr>
          <tr>
            <td width="2%" align="left" style="padding-top:6px;">&nbsp;</td>
            <td width="98%" align="left" style="padding-top:6px;">来源：<ww:if test="fromtable.equals(\"t_unicom_question\")">知识库</ww:if><ww:else>沃知道</ww:else></td>
          </tr>
          </ww:iterator>
        </table>
       
        </td>
      </tr>
      <tr>
        <td align="right">

        <table width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
        	<td width="50%"><%@ include file="utils/page1.jsp" %></td>
        	<td width="50%"></td>
        </tr>
        </table>
        </td>
      </tr>
      </form>
      <tr>
        <td align="center" class="a1">&nbsp;</td>
      </tr>
      <%@ include file="buttom.jsp" %>
    </table></td>
  </tr>
</table>
</body>
</html>
