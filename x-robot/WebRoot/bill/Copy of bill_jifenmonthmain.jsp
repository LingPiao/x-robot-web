<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>�¶Ȼ��ֲ�ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
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
</style>

</head>
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
	  <td width="397" height="511" align="center" valign="middle" background="../images/main_11.jpg">
	     <table id="__01" width="363" height="486" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="363" height="85" colspan="3" align="right" background="../images/bill/bill_bg_01_zhanghu.gif">&nbsp;</td>
	</tr>
	<tr>
		<td rowspan="3">
			<img src="../images/bill/bill_bg_02.gif" width="7" height="401" alt=""></td>
		<td background="../images/bill/bill_bg_03.png" width="338" height="33"><table width="100%">
          <tr>
            <td width="8%">&nbsp;</td>
            <td width="8%"><img src="../images/bill/bill_arrow.png" width="14" height="14"></td>
            <td width="79%"><span class="STYLE1">�¶Ȼ��ֲ�ѯ</span></td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table>			</td>
		<td rowspan="3">
			<img src="../images/bill/bill_bg_04.gif" width="18" height="401" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/bill/bill_bg_05.png" width="338" height="4" alt=""></td>
	</tr>
	<tr>
		<td width="338" height="364" align="center" valign="top" background="../images/bill/bill_bg_06.gif">
		   <table width="100%" height="265">
             <tr>
              <td height="316" align="center" valign="top" id="detailinfo" style="display:none"></td>
              <td height="316" align="center" valign="middle" id="login_wait" class="STYLE24">
              <IMG src="../images/bill/17.gif"><br><br>���ڶ�ȡ���ݣ����Ժ�...</br>
              </td>				
			  </td>
             </tr>		 
	      </table></td>
	</tr>
</table></td>
		<td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_14.jpg"><table width="95%">
          <tr>
            <td align="right"><input name="button" type="submit" class="input_button02" id="button" value="����" onClick="window.location.href='bill.action?op=jfyf&user_tel=<ww:property value="user_tel"/>';"></td>
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
		innerStr +="	<td width=\"98%\"><span class=\"STYLE14\">�𾴵Ŀͻ������ã�</span></td>";		
		innerStr +="	</tr></table></td></tr>";
		innerStr +="	<tr><td><table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">�ֻ����룺</td>";
		innerStr +="	<td  align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="user_tel"/></td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">��ѯ�·ݣ�</td>";
		innerStr +="	<td  align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="month"/></td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"30%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">�ڳ����֣�</td>";
		innerStr +="	<td width=\"20%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useBegin+"</td>";
		innerStr +="	<td width=\"30%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">���ӻ������֣�</td>";
		innerStr +="	<td width=\"20%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useBase+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">���ӽ������֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useAward+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">�����������֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useOther+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">�һ����֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useUsed+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">���ϻ��֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useInvalied+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">����������֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useAdjusted+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">��ĩ���֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useEnd+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">����ͨѶ���֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useCommunication+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">����ʱ����֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useOnLine+"</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\">��ʱ���ѻ��֣�</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+usePay+"</td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#179CBD\" class=\"STYLE13\"></td>";
		innerStr +="	<td width=\"25%\" align=\"left\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"></td>";
		innerStr +="	</tr>";
		innerStr +="	</table></td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td height=\"30\" class=\"STYLE14\">ע����ҳ�����ݽ����ο�ʹ�ã���ϸ�����Ե���Ӫҵ����ѯ����Ϊ׼��</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td class=\"STYLE26\">��ܰ��ʾ��</td>";
		innerStr +="	</tr>";
		innerStr +="	<tr>";
		innerStr +="	<td class=\"STYLE26\">1.���������ϵ��ʽ����Ϣ�ѱ�����뼰ʱ����ͨӪҵ���������ϱ��ҵ��</td>";
		innerStr +="	</tr>";
		innerStr +="</table>";
		document.getElementById("detailinfo").innerHTML = innerStr;
	}
	document.getElementById("detailinfo").style.display="block";
	//ajax-----------------------------------------end
	</script>
</html>