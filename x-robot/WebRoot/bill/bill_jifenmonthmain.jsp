<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>月度积分查询</title>
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
	font-size: 16px;
}
.STYLE2 {font-size: 12px}
.STYLE13 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE14 {font-size: 12px; }
.STYLE22 {font-size: 16; }
.STYLE23 {font-size: 16; color: #FFFFFF; }
.STYLE26 {font-size: 12px;color:#179CBD; }
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
		<td width="" height="28" colspan="3" align="center" background="../images/bill/icon_05.gif" class="fontStyle">月度积分查询</td>
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
            <td width="79%" class="titleblue">月度积分查询</td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table></td>
          </tr>
          <tr>
            <td height="15" align="center" valign="middle"><img src="../images/bill/blueline.gif" width="294" height="3"></td>
          </tr>
          <tr>
            <td align="center" valign="top">
            <table width="100%" height="265">
            <tr>
              <td height="316" align="center" valign="top" id="detailinfo" style="display:none"></td>
              <td height="316" align="center" valign="middle" id="login_wait" class="STYLE24">
              <IMG src="../images/bill/17.gif"><br><br>正在读取数据，请稍后...</br>
              </td>				
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
            <td align="right"><input name="button" type="submit" class="input_button02" id="button" value="返回" onClick="window.location.href='bill.action?op=jfyf&user_tel=<ww:property value="user_tel"/>';"></td>
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
<script type="text/javascript">
	//ajax---------------------------------------begin
	document.getElementById("login_wait").style.display="block";
	startRequest();
	var xmlHttp; 
	function createXMLHttpRequest(){ 
	if(window.ActiveXObject){ 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	else 
		if(window.XMLHttpRequest){ 
			xmlHttp = new XMLHttpRequest();
		} 
	}
	function startRequest(){ 
		createXMLHttpRequest(); 
		xmlHttp.open("POST", "domain_action.jsp?Bcode=100001000400003&AccCode=<ww:property value="user_tel"/>&Month=<ww:property value="month"/>&Password=", true); 
		xmlHttp.onreadystatechange = myCallback; 
		xmlHttp.send(null); 
	}
	function myCallback(){ 
		if(xmlHttp.readyState==4){ 
			if(xmlHttp.status==200){ 
				listInfo();
				document.getElementById("login_wait").style.display="none";
			} 
		} 
	}
	function listInfo(){
		var xmlDoc = xmlHttp.responseXML; 
		var Itemflag = xmlDoc.getElementsByTagName("flag"); 
		var flagitem = Itemflag[0].childNodes[0].nodeValue;
		var Msgflag = xmlDoc.getElementsByTagName("msg");
		if(flagitem == 0)
		{
			document.getElementById("detailinfo").innerHTML = Msgflag[0].childNodes[0].nodeValue;
		}
		else
		{
			var Itemroot = xmlDoc.getElementsByTagName("Integral");  		
			outputList(Itemroot); 
		}
	} 

	function outputList(Itemroot){ 
		var Begin = null;
		var Base = null;
		var Award = null;
		var Other = null;
		var Used = null;
		var Invalied = null;
		var Adjusted = null;
		var End = null;
		var Communication = null;
		var OnLine = null;
		var Pay = null;
		
		var useBegin = null;
		var useBase = null;
		var useAward = null;
		var useOther = null;
		var useUsed = null;
		var useInvalied = null;
		var useAdjusted = null;
		var useEnd = null;
		var useCommunication = null;
		var useOnLine = null;
		var usePay = null;
		
		var innerStr="";

		Begin = Itemroot[0].getElementsByTagName("Begin");
		Base = Itemroot[0].getElementsByTagName("Base");
		Award = Itemroot[0].getElementsByTagName("Award");
		Other = Itemroot[0].getElementsByTagName("Other");
		Used = Itemroot[0].getElementsByTagName("Used");
		Invalied = Itemroot[0].getElementsByTagName("Invalied");
		Adjusted = Itemroot[0].getElementsByTagName("Adjusted");
		End = Itemroot[0].getElementsByTagName("End");
		Communication = Itemroot[0].getElementsByTagName("Communication");
		OnLine = Itemroot[0].getElementsByTagName("OnLine");
		Pay = Itemroot[0].getElementsByTagName("Pay");
		if(Begin[0].childNodes[0] !=null)
		{
			useBegin = Begin[0].childNodes[0].nodeValue;
		}
		if(Base[0].childNodes[0] !=null)
		{
			useBase = Base[0].childNodes[0].nodeValue;
		}	
		if(Award[0].childNodes[0] !=null)
		{
			useAward = Award[0].childNodes[0].nodeValue;
		}
		if(Other[0].childNodes[0] !=null)
		{
			useOther = Other[0].childNodes[0].nodeValue;
		}
		if(Used[0].childNodes[0] !=null)
		{
			useUsed = Used[0].childNodes[0].nodeValue;
		}
		if(Invalied[0].childNodes[0] !=null)
		{
			useInvalied = Invalied[0].childNodes[0].nodeValue;
		}	
		if(Adjusted[0].childNodes[0] !=null)
		{
			useAdjusted = Adjusted[0].childNodes[0].nodeValue;
		}
		if(End[0].childNodes[0] !=null)
		{
			useEnd = End[0].childNodes[0].nodeValue;
		}
		if(Communication[0].childNodes[0] !=null)
		{
			useCommunication = Communication[0].childNodes[0].nodeValue;
		}
		if(OnLine[0].childNodes[0] !=null)
		{
			useOnLine = OnLine[0].childNodes[0].nodeValue;
		}	
		if(Pay[0].childNodes[0] !=null)
		{
			usePay = Pay[0].childNodes[0].nodeValue;
		}
				
		innerStr +="<table width=\"100%\" height=\"158\">";
		innerStr +="	<tr><td><table width=\"100%\">";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"2%\"><img src=\"../images/bill/bill_icon01.png\" width=\"11\" height=\"11\"></td>";
		innerStr +="	<td width=\"98%\"><span class=\"STYLE14\">尊敬的客户，您好！</span></td>";		
		innerStr +="	</tr></table></td></tr>";
		innerStr +="	<tr><td><table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">手机号码：</td>";
		innerStr +="	<td  align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="user_tel"/></td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">查询月份：</td>";
		innerStr +="	<td  align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="month"/></td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"30%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">期初积分：</td>";
		innerStr +="	<td width=\"20%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useBegin+"</td>";
		innerStr +="	<td width=\"30%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">增加基本积分：</td>";
		innerStr +="	<td width=\"20%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useBase+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">增加奖励积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useAward+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">增加其他积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useOther+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">兑换积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useUsed+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">作废积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useInvalied+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">特殊调整积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useAdjusted+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">期末积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useEnd+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">基本通讯积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useCommunication+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">在线时间积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useOnLine+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">按时交费积分：</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+usePay+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\"></td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"></td>";
		innerStr +="	</tr>";
		innerStr +="	</table></td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td height=\"30\" class=\"STYLE14\">注：本页面数据仅供参考使用，详细内容以当地营业厅查询内容为准。</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td class=\"STYLE26\">温馨提示：</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td class=\"STYLE26\">1.如果您的联系方式等信息已变更，请及时到联通营业厅办理资料变更业务。</td>";
		innerStr +="	</tr>";
		innerStr +="</table>";
		document.getElementById("detailinfo").innerHTML = innerStr;
	}
	document.getElementById("detailinfo").style.display="block";
	//ajax-----------------------------------------end
	</script></html>