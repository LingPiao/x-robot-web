<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>积分查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="../js/page.js"></script>
<style type="text/css">
<!--
a:link {
	text-decoration: none;
	color: #cccccc;
}
a:visited {
	text-decoration: none;
	color: #ce8965;
}
a:hover {
	text-decoration: none;
	color: #ECE9D8;
}
a:active {
	text-decoration: none;
}
a:link img{
	background:url(../images/buttom_preview01.png);
}
a:visited img{
	background:url(../images/buttom_preview02.png);
	
}
.STYLE9 {
	font-size: 12px;
	color: #cccccc;
	
	border-bottom-color: #666666;
}
.STYLE19 {
	font-size: 12px;
	color: #000000;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #666666;
}
-->
</style></head>
<body bgcolor="#FFFFFF">
<form name="qryForm" action="" method="post">
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
		<td width="" height="28" colspan="3" align="center" background="../images/bill/icon_05.gif" class="fontStyle">游戏排名</td>
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
		<td width="326" height="426" colspan="2" align="center" valign="top" background="../images/bgbg_061.gif"><table width="100%">
          <tr>
            <td><table width="100%">
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="8%"><img src="../images/bill/bill_arrow.png" width="14" height="14"></td>
            <td width="79%" class="titleblue"><span class="fontStyle">游戏排名</span></td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table></td>
          </tr>
          <tr>
            <td height="15" align="left" valign="middle">
            	<span class="fontStyle">您的最新排名：第<font color=red><b><ww:property value="['now_paiming']"/></b></font>名!</span><br/>
            	<span class="fontStyle">您本次游戏成绩：<font color=red><b><ww:property value="['game_results']"/></b></font></span>,<span class="fontStyle">您本周最好成绩：<font color=red><b><ww:property value="['his_game_results']"/></b></font></span><br/>
            	
            	
            </td>
          </tr>
          <tr>
            <td align="center" valign="top"><table width="100%">
  <tr>
    <td>
    
    <table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#B6DDEE">
      <tr>
        <td height=25 width="30" align="center" bgcolor="#179CBD" class="STYLE9">排名</td>
        <td width="80" align="center" bgcolor="#179CBD" class="STYLE9">帐号</td>
		<td width="50" align="center" bgcolor="#179CBD" class="STYLE9">最好成绩</td>
		<td width="50" align="center" bgcolor="#179CBD" class="STYLE9">创造时间</td>
		<td width="50" align="center" bgcolor="#179CBD" class="STYLE9">认证用户</td>
      </tr>
	  <ww:iterator value="pageInfo.records" status="row">
	  <ww:set name="bg_colors" value="'#ffffff'"/>
	 	<ww:if test="['PAINUM']==1">
        		<ww:set name="bg_colors" value="'gold'"/>
        </ww:if>
        <ww:if test="['PAINUM']==2">
        		<ww:set name="bg_colors" value="'gold'"/>
        </ww:if>
        <ww:if test="['PAINUM']==3">
        		<ww:set name="bg_colors" value="'gold'"/>
        </ww:if> 
		<tr>
		<td height=25  bgcolor="<ww:property value="#bg_colors"/>" class="STYLE19" align=center><ww:property value="['PAINUM']"/></td>
		<td bgcolor="<ww:property value="#bg_colors"/>" class="STYLE19">
		<ww:if test="['USER_MSN'].length()>16">
		<ww:property value="['USER_MSN'].substring(0,16)"/>
		</ww:if>
		<ww:else>
		<ww:property value="['USER_MSN']"/>
		</ww:else>
		</td>
		<td bgcolor="<ww:property value="#bg_colors"/>" class="STYLE19"><ww:property value="['GAME_RESULTS']"/></td>
		<td bgcolor="<ww:property value="#bg_colors"/>" class="STYLE19"><ww:property value="['COMMIT_DATE']"/></td>
		<td bgcolor="<ww:property value="#bg_colors"/>" class="STYLE19"><ww:if test="['USER_TEL']==null">否</ww:if><ww:else>是</ww:else></td>
		</tr>
		</ww:iterator>
		
    </table>
    <%@ include file="../public/page.jsp" %>
    </td>
  </tr>
  <tr>
	<td><input type=button class="input_button02" value="再玩一次" onclick="window.location.href='game.action?op=game1&user_msn=<ww:property value="user_msn"/>'"></td>
	</tr>
</table></td>
          </tr>
        </table></td>
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
</table></form>
</body>
</html>