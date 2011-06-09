<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>移动数据业务流量费查询</title>
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
.STYLE4 {font-size: 12px}
.STYLE13 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE14 {font-size: 12px}
.STYLE24 {font-size: 12px}
.STYLE15 {font-size: 12px}
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
		<td width="" height="28" colspan="3" align="center" background="../images/bill/icon_05.gif" class="fontStyle">数据流量费查询</td>
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
            <td width="79%" class="titleblue">移动数据业务流量费查询</td>
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
            <td align="right"><input name="button" type="submit" class="input_button02" id="button" value="返回" onClick="window.location.href='bill.action?op=gprs&user_tel=<ww:property value="user_tel"/>';"></td>
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
	var pagecount=14;
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
		xmlHttp.open("POST", "domain_action.jsp?Bcode=100001000300006&AccCode=<ww:property value="user_tel"/>&Month=<ww:property value="month"/>&Password=", true); 
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
		var BeginTime = null;
		var TimeLong = null;
		var ServiceCode = null;
		var DataLong = null;
		var Address = null;
		var Costs = null;
		var innerStr="";
		var useServiceType = "";
		var useBeginTime = "";
		var useTimeLong = "";
		var useServiceCode = "";
		var useDataLong = "";
		var useAddress = "";
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
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">业务类型</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">开始时间</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">时长</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">业务类别</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">流量</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">通讯地点</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">费用</td>";
		innerStr +="</tr>";
			for(var i=begin;i <end;i++){ 
				ServiceType = Itemroot[i].getElementsByTagName("ServiceType");
				BeginTime = Itemroot[i].getElementsByTagName("BeginTime");
				TimeLong = Itemroot[i].getElementsByTagName("TimeLong");		
				ServiceCode = Itemroot[i].getElementsByTagName("ServiceCode");
				DataLong = Itemroot[i].getElementsByTagName("DataLong");
				Address = Itemroot[i].getElementsByTagName("Address");
				Costs = Itemroot[i].getElementsByTagName("Costs");
				if(ServiceType[0].childNodes[0] !=null)
				{
					useServiceType = ServiceType[0].childNodes[0].nodeValue;
				}
				if(BeginTime[0].childNodes[0] !=null)
				{
					useBeginTime = BeginTime[0].childNodes[0].nodeValue.substring(0,9);
				}
				if(TimeLong[0].childNodes[0] !=null)
				{
					useTimeLong = TimeLong[0].childNodes[0].nodeValue;
				}
				if(ServiceCode[0].childNodes[0] !=null)
				{
					useServiceCode = ServiceCode[0].childNodes[0].nodeValue;
				}
				if(DataLong[0].childNodes[0] !=null)
				{
					useDataLong = DataLong[0].childNodes[0].nodeValue;
				}
				if(Address[0].childNodes[0] !=null)
				{
					useAddress = Address[0].childNodes[0].nodeValue;
				}
				if(Costs[0].childNodes[0] !=null)
				{
					useCosts = Costs[0].childNodes[0].nodeValue;
				}
				innerStr +="       <tr>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useServiceType+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useBeginTime+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useTimeLong+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useServiceCode+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useDataLong+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useAddress+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useCosts+"</td>";
				innerStr +="       </tr>";
			}
    
   	    innerStr +="    </table></td>";
   	    innerStr +="  </tr>";
   	 	innerStr +="  <tr>";
   		innerStr +="  <td align=\"center\" valign=\"top\" colspan=2><table width=\"100%\">";
   		innerStr +="  <tr>";
  		//innerStr +="  <td class=\"font12 STYLE4\" colspan=2>每页"+pagecount+"条,当前第"+pagenum+"页&nbsp;共"+realpage+"页";
  		innerStr +="  <td class=\"font12 STYLE4\" colspan=2 align=right>当前第"+pagenum+"页&nbsp;共"+realpage+"页";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=gprs_detail&pageno=1&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  首  页</a>";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=gprs_detail&pageno="+pre+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  上一页</a>";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=gprs_detail&pageno="+next+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  下一页</a>";
   		innerStr +="  <a id=\"tail\" href=\"bill.action?op=gprs_detail&pageno="+realpage+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  最后一页</a></td>";
   		innerStr +="  </tr>";
   		innerStr +="  </table></td>";
		innerStr +="  </tr>	";
    	innerStr +="</table>";
    	    		
		document.getElementById("detailinfo").innerHTML = innerStr;
	}
	document.getElementById("detailinfo").style.display="block";
	//ajax-----------------------------------------end
</script></html>