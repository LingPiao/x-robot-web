<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>话费查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {
	color: #1982B0;
	font-size: 15px;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style></head>
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
	  <td width="397" height="511" align="center" valign="top" background="../images/main_11.jpg"><table id="__01" width="362" height="500" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="362" height="87" colspan="3" align="right" background="../images/bill/bill_index_01.gif">&nbsp;</td>
	</tr>
	<tr>
		<td rowspan="2">
			<img src="../images/bill/bill_index_02.gif" width="8" height="413" alt=""></td>
		<td background="../images/bill/bill_index_03.png" width="338" height="392">
			<table width="95%">
          <tr>
            <td class="line1"><table width="100%">
                <tr>
                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;账户查询</td>
                </tr>
                <tr>
                  <td width="25%" align="center"><img src="../images/bill/indexicon01.jpg" width="59" height="60"></td>
                  <td valign="top"><table width="100%" cellpadding="3">
     
                      <tr>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=remain&user_tel=<ww:property value="user_tel"/>">-实时余额</a></td>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=fam&user_tel=<ww:property value="user_tel"/>">-亲友号码查询</a></td> 
                      </tr>
                      <tr>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=service&user_tel=<ww:property value="user_tel"/>">-业务查询</a></td>
                        <td width="50%" align="left" class="fontlink"></td> 
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td class="line1"><table width="100%">
                <tr>
                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;账单查询</td>
                </tr>
                <tr>
                  <td width="25%" align="center"><img src="../images/bill/indexicon02.jpg" width="59" height="60"></td>
                  <td valign="top"><table width="100%" cellpadding="3">
                      <tr>
                        <td colspan="2" class="font15">为您提供历史账单等相关信息咨询服务。</td>
                      </tr>
                      <tr>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=history&user_tel=<ww:property value="user_tel"/>">-历史账单</a></td>
                        <td width="50%" align="left" class="fontlink"></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td class="line1"><table width="100%">
                <tr>
                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;详单查询</td>
                </tr>
                <tr>
                  <td width="25%" align="center"><img src="../images/bill/indexicon03.jpg" width="59" height="60"></td>
                  <td valign="top"><table width="100%" cellpadding="3">
                     
                      <tr>
                        <td width="50%" align=""left"" class="fontlink"><a href="bill.action?op=tel&user_tel=<ww:property value="user_tel"/>">-通话详单</a></td>
                        <td align=""left"" class="fontlink"><a href="bill.action?op=sms&user_tel=<ww:property value="user_tel"/>">-短信详单</td>
                      </tr>
                      <tr>
                        <td colspan=2 width="90%" align="left" class="fontlink"><a href="bill.action?op=sp&user_tel=<ww:property value="user_tel"/>">-增值业务及代收费详细查询</a></td>
                      </tr>
                      <tr>
                        <td colspan=2 width="90%"  align="left" class="fontlink"><a href="bill.action?op=gprs&user_tel=<ww:property value="user_tel"/>">-移动数据业务流量费查询</td>
                      </tr>
                      
                  </table></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%">
                <tr>
                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;积分查询</td>
                </tr>
                <tr>
                  <td width="25%" align="center"><img src="../images/bill/indexicon04.jpg" width="59" height="60"></td>
                  <td valign="top"><table width="100%" cellpadding="3">
  
                      <tr>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=jf&user_tel=<ww:property value="user_tel"/>">-积分查询</a></td>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=jfyf&user_tel=<ww:property value="user_tel"/>">-月度积分查询</a></td>
                      </tr>
                      <tr>
                        <td width="90%" align="left" class="fontlink" colspan=2><a href="bill.action?op=jfxf&user_tel=<ww:property value="user_tel"/>">-积分消费清单查询</a></td>
                      </tr>
                  </table></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
		<td rowspan="2">
			<img src="../images/bill/bill_index_04.gif" width="16" height="413" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/bill/bill_index_05.gif" width="338" height="21" alt=""></td>
	</tr>
</table>
	  </td>
		<td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_14.jpg"></td>
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