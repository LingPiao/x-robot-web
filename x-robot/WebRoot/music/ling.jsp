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
<title>����</title>
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
              <option value="ȫ��">ȫ��</option>
            <option value="����">����</option>
            <option value="����">����</option>
                  </select></td>
            <td width="44%" align="center"><input name="t_key" type="text" class="input_login1" id="t_key"></td>
            <td width="22%"><input name="button" type="submit" class="input_button3" id="button" value="����"></td>
          </tr>
        </table>			</td>
		<td rowspan="6">
		  <img src="../images/top_04.gif" width="19" height="415" alt=""></td>
	</tr>
	<tr>
		<td background="../images/top_05.png" width="338" height="25"><table width="100%">
          <tr>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('0');"><ww:if test="type.equals(\"\")"><b>ȫ������</b></ww:if><ww:else>ȫ������</ww:else></a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('1');"><ww:if test="type.equals(\"��������\")"><b>��������</b></ww:if><ww:else>��������</ww:else></a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('2');"><ww:if test="type.equals(\"��Ĭڶг\")"><b>��Ĭڶг</b></ww:if><ww:else>��Ĭڶг</ww:else></a></td>
			<td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('3');"><ww:if test="type.equals(\"Ӱ�Ӷ���\")"><b>Ӱ�Ӷ���</b></ww:if><ww:else>Ӱ�Ӷ���</ww:else></a></td>
			<td width="20%" align="center" valign="middle" class="STYLE18"><a href="javascript:setType('4');"><ww:if test="type.equals(\"��������\")"><b>��������</b></ww:if><ww:else>��������</ww:else></a></td>
          </tr>
           <tr>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="http://www.10155.com" target=_blank>����</a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="#" onClick="switchtable()">�������а�</a></td>
            <td width="20%" align="center" valign="middle" class="STYLE18"><a href="#" onClick="switchtable1()">�����Ƽ�</a></td>
			<td width="20%" align="center" valign="middle" class="STYLE18"><a href="#" onClick="switchtable2()">����Ʒ�</a></td>
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
	<td width="10%" height="22" colspan="3" align="center" class="STYLE13"><a href="javascript:setPlayer('<ww:property value="['ID']"/>');" title="����"><img src="../images/listen.gif" width="12" height="10" border="0"></a></td>
	<td width="10%" height="22" colspan="3" align="center" class="STYLE13"><a href="<%=basePath%>Download?fileName=<ww:property value="['ID']"/>.asf" title="����"><img src="../images/down.gif" width="12" height="10" border="0"></a></td>
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
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">������</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">2</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����(�ݳ����)</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��ѧ��</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">3</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���ֺ󻹿���������</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">������</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">4</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���ܼ�</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">�Ն�</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">5</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��������</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">Ľ������</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">6</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���˾�����</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">7</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����֮��</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">8</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">�һ�Դ</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��Ȫ</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">9</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">������ɫ</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��˴���</span></td>
 </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">10</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���Ĺ���</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
 </tr>
 
</table>
<table width="85%" border="0" cellspacing="0" cellpadding="4" bgcolor="#4F534E" id="table3" style="display:none">
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">1</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��������˹</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">�ɶ�����</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">2</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">ϰ���˼�į</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">ţ�̿���</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">3</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��Ц���۾�</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">�ֿ���</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">4</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���ܼ�</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">�Ն�</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">5</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��������</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">Ľ������</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">6</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���˾�����</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
 </tr>
   <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">7</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����֮��</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
   </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">8</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">�һ�Դ</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��Ȫ</span></td>
  </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">9</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">������ɫ</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">��˴���</span></td>
 </tr>
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">10</span></td>
      </tr>
    </table></td>
    <td width="60%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���Ĺ���</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
 </tr>
</table>
<table width="85%" border="0" cellspacing="0" cellpadding="4" bgcolor="#4F534E" id="table4" style="display:none">
  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      <tr>
        <td align="center"><span class="STYLE14">1</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���Ĺ���</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****2734</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
   <tr>
        <td align="center"><span class="STYLE14">2</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">���Ĺ���</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1544</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
   <tr>
        <td align="center"><span class="STYLE14">3</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****9430</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">4</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">ĩ�೵</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1122</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">5</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����Ե</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1098</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	  <tr>
        <td align="center"><span class="STYLE14">6</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����Ե</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1548</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	  <tr>
        <td align="center"><span class="STYLE14">7</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����Ե</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1098</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	  <tr>
        <td align="center"><span class="STYLE14">8</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">Lidia</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****1008</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">9</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">Ů�˵�����ʲô</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
	<td width="20%" height="22" colspan="3" align="center" class="STYLE13">186****2508</td>
	  </tr>
	  <tr>
    <td width="20%" height="22" align="center" valign="top" class="STYLE13"><table width="18" bgcolor="#E72E19">
      
	   <tr>
        <td align="center"><span class="STYLE14">10</span></td>
      </tr>
    </table></td>
    <td width="40%" height="22" colspan="3" align="left" class="STYLE13"><span title="">����Ϸ</span></td>
	<td width="20%" height="22" colspan="3" align="left" class="STYLE13"><span title="">3Ԫ</span></td>
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
	qryForm.t_type.value = 'ȫ��';
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