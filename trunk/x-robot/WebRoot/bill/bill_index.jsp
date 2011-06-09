<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>账单查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--

a:link img{
	background:url(../images/buttom_preview01.png);
}
a:visited img{
	background:url(../images/buttom_preview02.png);
	
}
.STYLE1 {
	color: #1982B0;
	font-size: 15px;
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
		<td background="../images/main_101.jpg" width="41" height="511">
			</td>
	  <td width="397" height="511" align="center" valign="middle" background="../images/main_111.jpg"><table id="__01" width="369" height="504" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/bgbg_01.gif" width="24" height="53" alt=""></td>
		<td background="../images/bgbg_021.gif" width="217" height="53">			</td>
		<td colspan="2" width="117" height="53">
		    <table id="__01" width="100%" height="53" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/bill/icon_01.gif" width="5" height="8" alt=""></td>
		<td colspan="3" background="../images/bill/icon_02.gif" width="106" height="8">
			</td>
		<td>
			<img src="../images/bill/icon_03.gif" width="6" height="8" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/bill/icon_04.gif" width="5" height="28" alt=""></td>
		<td width="" height="28" colspan="3" align="center" background="../images/bill/icon_05.gif" class="fontStyle">账单查询</td>
		<td>
			<img src="../images/bill/icon_06.gif" width="6" height="28" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/bill/icon_07.gif" width="5" height="17" alt=""></td>
		<td background="../images/bill/icon_08.gif" width="46" height="17">
			</td>
		<td>
			<img src="../images/bill/icon_09.gif" width="14" height="17" alt=""></td>
		<td background="../images/bill/icon_10.gif" width="46" height="17">			</td>
		<td>
			<img src="../images/bill/icon_11.gif" width="6" height="17" alt=""></td>
	</tr>
</table>
		  </td>
		<td>
			<img src="../images/bgbg_04.gif" width="11" height="53" alt=""></td>
	</tr>
	<tr>
		<td background="../images/bgbg_051.gif" width="24" height="426">			</td>
		<td width="326" height="426" colspan="2" align="center" valign="top" background="../images/bgbg_061.gif">
		<table width="100%">
          <tr>
            <td><table width="100%">
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="8%"><img src="../images/bill/bill_arrow.png" width="14" height="14"></td>
            <td width="79%" class="titleblue">账单查询</td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table></td>
          </tr>
          <tr>
            <td height="15" align="center" valign="middle"><img src="../images/bill/blueline.gif" width="294" height="3"></td>
          </tr>
          <tr>
            <td align="center" valign="top">

		   <table width="95%">
	          <tr>
	            <td class="line1">
	            <table width="100%">
	                <tr>
	                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;账户查询</td>
	                </tr>
	                <tr>
	                  <td width="25%" align="center"><img src="../images/bill/indexicon01.jpg" width="59" height="60"></td>
	                  <td valign="top">
	                  	<table width="100%" cellpadding="3">
	     					<tr>
		                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=remain&user_tel=<ww:property value="user_tel"/>">-实时余额</a></td>
		                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=fam&user_tel=<ww:property value="user_tel"/>">-亲友号码查询</a></td> 
	                      </tr>
	                      <tr>
	                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=service&user_tel=<ww:property value="user_tel"/>">-业务查询</a></td>
	                        <td width="50%" align="left" class="fontlink"></td> 
	                      </tr>
	                  </table>
	                  </td>
	                </tr>
            	</table>           
              	</td>
             </tr>	 
	      </table>
	      <table width="95%">
	          <tr>
	            <td class="line1">
	            <table width="100%">
	                <tr>
	                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;账单查询</td>
	                </tr>
	                <tr>
	                  <td width="25%" align="center"><img src="../images/bill/indexicon02.jpg" width="59" height="60"></td>
	                  <td valign="top">
	                  	<table width="100%" cellpadding="3">
     					<tr>
                        <td colspan="2" class="font15">为您提供历史账单等相关信息咨询服务。</td>
                      </tr>
                      <tr>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=history&user_tel=<ww:property value="user_tel"/>">-历史账单</a></td>
                        <td width="50%" align="left" class="fontlink"></td>
                      </tr>
	                  </table>
	                  </td>
	                </tr>
            	</table>           
              	</td>
             </tr>	 
	      </table>
	      <table width="95%">
	          <tr>
	            <td class="line1">
	            <table width="100%">
	                <tr>
	                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;详单查询</td>
	                </tr>
	                <tr>
	                  <td width="25%" align="center"><img src="../images/bill/indexicon03.jpg" width="59" height="60"></td>
	                  <td valign="top">
	                  	<table width="100%" cellpadding="3">
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
	                  </table>
	                  </td>
	                </tr>
            	</table>           
              	</td>
             </tr>	 
	      </table>
	      <table width="95%">
	          <tr>
	            <td class="line1">
	            <table width="100%">
	                <tr>
	                  <td colspan="2" class="STYLE1"><img src="../images/bill/bill_arrow.png" width="14" height="14">&nbsp;积分查询</td>
	                </tr>
	                <tr>
	                  <td width="25%" align="center"><img src="../images/bill/indexicon04.jpg" width="59" height="60"></td>
	                  <td valign="top">
	                  	<table width="100%" cellpadding="3">
     					<tr>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=jf&user_tel=<ww:property value="user_tel"/>">-积分查询</a></td>
                        <td width="50%" align="left" class="fontlink"><a href="bill.action?op=jfyf&user_tel=<ww:property value="user_tel"/>">-月度积分查询</a></td>
                      </tr>
                      <tr>
                        <td width="90%" align="left" class="fontlink" colspan=2><a href="bill.action?op=jfxf&user_tel=<ww:property value="user_tel"/>">-积分消费清单查询</a></td>
                      </tr>
	                  </table>
	                  </td>
	                </tr>
            	</table>           
              	</td>
             </tr>	 
	      </table>
	      
            </td>
          </tr>
        </table>
		</td>
		<td colspan="2" background="../images/bgbg_071.gif" width="19" height="426">		  </td>
	</tr>
	<tr>
		<td>
			<img src="../images/bgbg_08.gif" width="24" height="24" alt=""></td>
		<td colspan="2">
			<img src="../images/bgbg_09.gif" width="326" height="24" alt=""></td>
		<td colspan="2">
			<img src="../images/bgbg_10.gif" width="19" height="24" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/分隔符.gif" width="24" height="1" alt=""></td>
		<td>
			<img src="../images/分隔符.gif" width="217" height="1" alt=""></td>
		<td>
			<img src="../images/分隔符.gif" width="109" height="1" alt=""></td>
		<td>
			<img src="../images/分隔符.gif" width="8" height="1" alt=""></td>
		<td>
			<img src="../images/分隔符.gif" width="11" height="1" alt=""></td>
	</tr>
</table></td>
		<td background="../images/main_121.jpg" width="39" height="511">
			</td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_14.jpg"><table width="95%">
          <tr>
            <td align="right"></td>
          </tr>
        </table></td>
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
</body>
</html>