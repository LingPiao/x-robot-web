<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<title>炫铃</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	
}
body,td,th {
	font-size: 8px;
	font-family: Arial, Helvetica, sans-serif;
}
.STYLE8 {
	color: #666666;
	font-size: 9px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
}
.STYLE9 {
	color: #666666;
	font-size: 9px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
}
.STYLE13 {
	font-size: 10px;
	color: #FFFFFF;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #FFFFFF;
}
.STYLE14 {
	font-size: 10px;
	color: #FFFFFF;
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
.STYLE17 {font-size: 14px}
.STYLE18 {
	color: #EA5F4F;
	font-size: 12px;
}
.STYLE18 a:link,
   .STYLE18 a:visited{
	color:#EA5F4F;
	font-size: 12px;
}
.STYLE18 a:hover,
   .STYLE18 a:active{
	color:#EA5F4F;
	font-size: 12px;
}
-->
</style>
<script language="JavaScript" src="../js/page.js"></script>
<script type="text/javascript">
function switchtable()
{
	document.getElementById("table1").style.display="none";
	document.getElementById("table2").style.display="block";
	document.getElementById("table3").style.display="none";
	document.getElementById("table4").style.display="none";
	document.getElementById("td1").style.display="none";
}
function switchtable1()
{
	document.getElementById("table1").style.display="none";
	document.getElementById("table2").style.display="none";
	document.getElementById("table3").style.display="block";
	document.getElementById("table4").style.display="none";
	document.getElementById("td1").style.display="none";
}
function switchtable2()
{
	document.getElementById("table1").style.display="none";
	document.getElementById("table2").style.display="none";
	document.getElementById("table3").style.display="none";
	document.getElementById("table4").style.display="block";
	document.getElementById("td1").style.display="none";
}
</script>
</head>
<body bgcolor="#FFFFFF">
<form name="qryForm" method="post">
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
	  <td width="397" height="511" align="center" valign="middle" background="../images/main_11.jpg">
		<table id="__01" width="366" height="499" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="366" height="84" colspan="3" align="right" valign="top" background="../images/top_01.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="281" height="65" align="center"><iframe width="265" height="65" name="player" frameborder="0" src="player.jsp"></iframe></td>
            <td width="85">&nbsp;</td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td rowspan="6">
			<img src="../images/top_02.gif" width="9" height="415" alt=""></td>
		<td background="../images/top_03.png" width="338" height="40"><table width="100%">
          <tr>
            <td width="34%" align="center"><select name="t_type" id="t_type" style="width:100px">
              <option value="全部">全部</option>
            <option value="歌曲">歌曲</option>
            <option value="歌手">歌手</option>
                  </select></td>
            <td width="44%" align="center"><input name="t_key" type="text" class="input_login1" id="t_key"></td>
            <td width="22%"><input name="button" type="submit" class="input_button3" id="button" value="搜索"></td>
          </tr>
        </table>			</td>
		<td rowspan="6">
		  <img src="../images/top_04.gif" width="19" height="415" alt=""></td>
	</tr>
	<tr>
		<td background="../images/top_05.png" width="338" height="25"><table width="100%">
          <tr>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('0');"><ww:if test="type.equals(\"\")"><b>全部音乐</b></ww:if><ww:else>全部音乐</ww:else></a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('1');"><ww:if test="type.equals(\"流行音乐\")"><b>流行音乐</b></ww:if><ww:else>流行音乐</ww:else></a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('2');"><ww:if test="type.equals(\"幽默诙谐\")"><b>幽默诙谐</b></ww:if><ww:else>幽默诙谐</ww:else></a></td>
			<td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('3');"><ww:if test="type.equals(\"影视动漫\")"><b>影视动漫</b></ww:if><ww:else>影视动漫</ww:else></a></td>
			<td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('4');"><ww:if test="type.equals(\"其他流行\")"><b>其他流行</b></ww:if><ww:else>其他流行</ww:else></a></td>
          </tr>
           <tr>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="http://www.10155.com" target=_blank>炫铃</a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="#" onClick="switchtable()">炫铃排行榜</a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="#" onClick="switchtable1()">炫铃推荐</a></td>
			<td width="20%" align="center" valign="middle" class="STYLE18"><a href="#" onClick="switchtable2()">炫铃计费</a></td>
			<td width="20%" align="center" valign="middle" class="STYLE18"></td>
          </tr>
        </table>			</td>
	</tr>
	
	<tr>
		<td>
			<img src="../images/top_06.png" width="338" height="8" alt=""></td>
	</tr>
	<tr>
		<td width="338" height="280" align="center" valign="top" background="../images/top_07.png">
		  <table width="85%" border="0" cellspacing="0" cellpadding="4" bgcolor="#4F534E" id="table1">
         <ww:iterator value="musicList" status="row"> 
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14"><ww:property value="['ROW_NUM']"/></span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="<ww:property value="['SONGS']"/>">
    <ww:if test="['SONGS'].length() >= 8"><ww:property value="['SONGS'].substring(0,7)+\"...\""/></ww:if><ww:else><ww:property value="['SONGS']"/></ww:else></span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="<ww:property value="['SINGER']"/>">
    <ww:if test="['SINGER'].length() >= 4"><ww:property value="['SINGER'].substring(0,3)+\"...\""/></ww:if><ww:else><ww:property value="['SINGER']"/></ww:else></span></td>
	<td width="10%" height="22" colspan="3" align="center" class="STYLE13"><a href="javascript:setPlayer('<ww:property value="['ID']"/>');" title="试听"><img src="../images/listen.gif" width="12" height="10" border="0"></a></td>
	<td width="10%" height="22" colspan="3" align="center" class="STYLE13"><a href="<%=basePath%>Download?fileName=<ww:property value="['ID']"/>.asf" title="下载"><img src="../images/down.gif" width="12" height="10" border="0"></a></td>
  </tr>
  </ww:iterator>
</table>

<table width="85%" border="0" cellspacing="0" cellpadding="4" bgcolor="#4F534E" id="table2" style="display:none">
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">1</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">忐忑</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">龚琳娜</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">2</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">听海(演唱会版)</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">张学友</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">3</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">分手后还可以做朋友</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">朱咸甜</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">4</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱很简单</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">陶喆</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">5</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱情买卖</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">慕容晓晓</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">6</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">男人就是累</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">陈玉建</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">7</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">想象之中</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">许嵩</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">8</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">桃花源</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">羽泉</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">9</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">荷塘月色</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">凤凰传奇</span></td>
 </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">10</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱的供养</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">杨幂</span></td>
 </tr>
 
</table>
<table width="85%" border="0" cellspacing="0" cellpadding="4" bgcolor="#4F534E" id="table3" style="display:none">
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">1</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">亚特兰提斯</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">飞儿乐团</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">2</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">习惯了寂寞</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">牛奶咖啡</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">3</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱笑的眼睛</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">林俊杰</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">4</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱很简单</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">陶喆</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">5</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱情买卖</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">慕容晓晓</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">6</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">男人就是累</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">陈玉建</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">7</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">想象之中</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">许嵩</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">8</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">桃花源</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">羽泉</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">9</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">荷塘月色</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">凤凰传奇</span></td>
 </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">10</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱的供养</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">杨幂</span></td>
 </tr>
</table>
<table width="85%" border="0" cellspacing="0" cellpadding="4" bgcolor="#4F534E" id="table4" style="display:none">
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">1</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱的供养</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****2734</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
   <tr>
        <td align="center"><span class="STYLE14">2</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">爱的供养</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1544</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
   <tr>
        <td align="center"><span class="STYLE14">3</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">听海</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****9430</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">4</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">末班车</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1122</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">5</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">今生缘</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1098</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	  <tr>
        <td align="center"><span class="STYLE14">6</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">今生缘</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1548</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	  <tr>
        <td align="center"><span class="STYLE14">7</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">来生缘</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1098</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	  <tr>
        <td align="center"><span class="STYLE14">8</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">Lidia</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1008</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">9</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">女人到底想什么</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****2508</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">10</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">独角戏</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3元</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1008</td>
	  </tr>
</table>
		  </td>
	</tr>
	<tr  id="td1">
		<td background="../images/top_08.png" align="center" width="338" height="20"><%@ include file="../public/page.jsp" %></td>
	</tr>
	<tr>
		<td>
			<img src="../images/top_09.gif" width="338" height="19" alt=""></td>
	</tr>
</table>
	  </td>
	  <td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" align="right" valign="top" background="../images/main_14.jpg">&nbsp;</td>
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
<input name="type" type="hidden">
<script>
function setType(val){
	qryForm.t_type.value = '全部';
	qryForm.t_key.value = '';
	qryForm.type.value = val;
	qryForm.submit();
}
function setPlayer(id){
	var url = "player.jsp?songsID="+id;
	window.document.getElementById("player").src = url;
}
var t_type = '<ww:property value="t_type"/>';
var t_key = '<ww:property value="t_key"/>';
var type = '<ww:property value="type"/>';
qryForm.t_type.value = t_type;
qryForm.t_key.value = t_key;
qryForm.type.value = type;
</script>
</form>
</body>
</html>