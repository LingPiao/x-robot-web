<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>增值业务及代收费详细查询</title>
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
.STYLE4 {font-size: 10px}
.STYLE13 {
	font-size: 10px;
	color: #FFFFFF;
}
.STYLE14 {font-size: 10px}
.STYLE24 {font-size: 12px}
.STYLE15 {font-size: 10px}
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
		<td width="363" height="85" colspan="3" align="right" background="../images/bill/bill_bg_01.gif">
		&nbsp;</td>
	</tr>
	<tr>
		<td rowspan="3">
			<img src="../images/bill/bill_bg_02.gif" width="7" height="401" alt=""></td>
		<td background="../images/bill/bill_bg_03.png" width="338" height="33"><table width="100%">
          <tr>
            <td width="8%">&nbsp;</td>
            <td width="8%"><img src="../images/bill/bill_arrow.png" width="14" height="14"></td>
            <td width="79%" class="STYLE1">增值业务及代收费详细查询</td>
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
		   <table width="100%" height="100%">
             <tr>
              <td height="316" align="center" valign="top" id="detailinfo" style="display:none"></td>
              <td height="316" align="center" valign="middle" id="login_wait" class="STYLE24">
              <IMG src="../images/bill/17.gif"><br><br>正在读取数据，请稍后...</br>
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
            <td align="right"><input name="button" type="submit" class="input_button02" id="button" value="返回" onClick="window.location.href='bill.action?op=sp&user_tel=<ww:property value="user_tel"/>';"></td>
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
<script type="text/javascript">
	//ajax---------------------------------------begin
	document.getElementById("login_wait").style.display="block";
	startRequest();
	var pagecount=8;
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
		xmlHttp.open("POST", "domain_action.jsp?Bcode=100001000300005&AccCode=<ww:property value="user_tel"/>&Month=<ww:property value="month"/>&Password=", true); 
		//xmlHttp.open("POST", "response1.xml", true);
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
		//alert(xmlHttp.responseText);
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
			var Itemroot = xmlDoc.getElementsByTagName("Item");  
		
			outputList(Itemroot); 
		}
	} 

	function outputList(Itemroot){ 
		var ServiceType = null;
		var ServiceName = null;
		var BeginTime = null;
		var TimeLong = null;
		var CallCode = null;
		var ServiceCode = null;
		var SpName = null;
		var CostType = null;
		var Costs = null;
		var innerStr="";
		var useServiceType = "";
		var useServiceName = "";
		var useBeginTime = "";
		var useTimeLong = "";
		var useCallCode = "";
		var useServiceCode = "";
		var useSpName = "";
		var useCostType = "";
		var useCosts = 0;
		
		var count = Itemroot.length;//获取所有数据的总数
		var realpage = Math.ceil(count/pagecount);//返回>=参数的最小整数,获取总共的页数
		var pagenum = <ww:property value="pageno"/>;//获取当前页数
    	if(realpage<pagenum)
    		pagenum = realpage;
    	if(pagenum<=1)
    		pagenum=1;
    	var end = pagecount * (parseInt(pagenum));//获取应该取得的数据集
		var begin = end-pagecount;//获得应该从那条开始取数据
		if(end>count)
    		end = count;
    	var pre=parseInt(<ww:property value="pageno"/>)-1;//上一页
    	if(pre<=1)
    		pre=1;
    	var next=parseInt(<ww:property value="pageno"/>)+1;//下一页
    	if(next>realpage)
    		next = realpage;
    	innerStr +="<table width=\"100%\">";
   		innerStr +="  <tr>";
		innerStr +="    <td><table width=\"100%\">";
		innerStr +="      <tr>";
		innerStr +="        <td width=\"2%\"><img src=\"../images/bill/bill_icon01.png\" width=\"11\" height=\"11\"></td>";
		innerStr +="        <td width=\"98%\"><span class=\"STYLE15\">尊敬的客户，您查询的通话详单结果如下：</span></td>";
		innerStr +="      </tr>";
		innerStr +="    </table></td>";
		innerStr +="  </tr>";
		innerStr +="  <tr>";
		innerStr +="    <td><table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="      <tr>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">手机号码：</td>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="user_tel"/></td>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">查询月份：</td>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="month"/></td>";
		innerStr +="      </tr>";
		innerStr +="    </table></td>";
		innerStr +="  </tr>";
		innerStr +="<tr>";
		innerStr +="<td><table width=\"100%\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="<tr>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">业务名称</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">业务类型</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">开始时间</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">时长</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">对方号码</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">服务代码</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">SP名称</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">费用类别</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">费用</td>";
		innerStr +="</tr>";
			for(var i=begin;i <end;i++){ 
				ServiceName = Itemroot[i].getElementsByTagName("ServiceName");
				ServiceType = Itemroot[i].getElementsByTagName("ServiceType");
				BeginTime = Itemroot[i].getElementsByTagName("BeginTime");
				TimeLong = Itemroot[i].getElementsByTagName("TimeLong");
				CallCode = Itemroot[i].getElementsByTagName("CallCode");
				ServiceCode = Itemroot[i].getElementsByTagName("ServiceCode");
				SpName = Itemroot[i].getElementsByTagName("SpName");
				CostType = Itemroot[i].getElementsByTagName("CostType");
				Costs = Itemroot[i].getElementsByTagName("Costs");
				if(ServiceName[0].childNodes[0] !=null)
				{
					useServiceName = ServiceName[0].childNodes[0].nodeValue;
				}
				if(ServiceType[0].childNodes[0] !=null)
				{
					useServiceType = ServiceType[0].childNodes[0].nodeValue;
				}
				if(BeginTime[0].childNodes[0] !=null)
				{
					useBeginTime = BeginTime[0].childNodes[0].nodeValue;
				}
				if(TimeLong[0].childNodes[0] !=null)
				{
					useTimeLong = TimeLong[0].childNodes[0].nodeValue;
				}
				if(CallCode[0].childNodes[0] !=null)
				{
					useCallCode = CallCode[0].childNodes[0].nodeValue;
				}
				if(ServiceCode[0].childNodes[0] !=null)
				{
					useServiceCode = ServiceCode[0].childNodes[0].nodeValue;
				}
				if(SpName[0].childNodes[0] !=null)
				{
					useSpName = SpName[0].childNodes[0].nodeValue;
				}
				if(CostType[0].childNodes[0] !=null)
				{
					useCostType = CostType[0].childNodes[0].nodeValue;
				}
				if(Costs[0].childNodes[0] !=null)
				{
					useCosts = Costs[0].childNodes[0].nodeValue;
				}	
				innerStr +="       <tr>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useServiceName+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useServiceType+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useBeginTime+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useTimeLong+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useCallCode+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useServiceCode+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useSpName+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useCostType+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useCosts+"</td>";
				innerStr +="       </tr>";
			}
    
   	    innerStr +="    </table></td>";
   	    innerStr +="  </tr>";
   	 	innerStr +="  <tr>";
   		innerStr +="  <td align=\"center\" valign=\"top\" colspan=2><table width=\"100%\">";
   		innerStr +="  <tr>";
  		innerStr +="  <td class=\"font12 STYLE4\" colspan=2>每页"+pagecount+"条,当前第"+pagenum+"页&nbsp;共"+realpage+"页";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=sp_detail&pageno=1&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  <img src=\"../images/bill/page_first.png\" width=\"42\" height=\"16\" border=0></a>";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=sp_detail&pageno="+pre+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  <img src=\"../images/bill/page_pre.png\" width=\"42\" height=\"16\" border=0></a>";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=sp_detail&pageno="+next+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  <img src=\"../images/bill/page_next.png\" width=\"42\" height=\"16\" border=0></a>";
   		innerStr +="  <a id=\"tail\" href=\"bill.action?op=sp_detail&pageno="+realpage+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  <img src=\"../images/bill/page_end.png\" width=\"42\" height=\"16\" border=0></a></td>";
   		innerStr +="  </tr>";
   		innerStr +="  </table></td>";
		innerStr +="  </tr>	";
    	innerStr +="</table>";
    	    		
		document.getElementById("detailinfo").innerHTML = innerStr;
	}
	document.getElementById("detailinfo").style.display="block";
	//ajax-----------------------------------------end
</script>
</body>
</html>