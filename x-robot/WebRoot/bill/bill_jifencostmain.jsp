<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>积分消费清单查询</title>
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
		<td width="" height="28" colspan="3" align="center" background="../images/bill/icon_05.gif" class="fontStyle">积分消费清单查询</td>
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
            <td width="79%" class="titleblue">积分消费清单查询</td>
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
            <td align="right"><input name="button" type="submit" class="input_button02" id="button" value="返回" onClick="window.location.href='bill.action?op=jfxf&user_tel=<ww:property value="user_tel"/>';"></td>
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
	var pagecount=12;
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
		xmlHttp.open("POST", "domain_action.jsp?Bcode=100001000400002&AccCode=<ww:property value="user_tel"/>&Month=<ww:property value="month"/>&Password=", true); 
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
		var UseTime = null;
		var GiftName = null;
		var GiftCount = null;
		var Amount = null;
		var ChangeType = null;
		var SendType = null;
		
		var useUseTime = "";
		var useGiftName = "";
		var useGiftCount = 0;
		var useAmount = 0;
		var useChangeType ="";
		var useSendType= "";
		
		var innerStr="";
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
		innerStr +="        <td width=\"98%\"><span class=\"STYLE15\">尊敬的客户，您查询的积分消费详单结果如下：</span></td>";
		innerStr +="      </tr>";
		innerStr +="    </table></td>";
		innerStr +="  </tr>";
		innerStr +="  <tr>";
		innerStr +="    <td><table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="      <tr>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">手机号码：</td>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="user_tel"/></td>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">查询截止月份：</td>";
		innerStr +="        <td width=\"25%\" align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\"><ww:property value="month"/></td>";
		innerStr +="      </tr>";
		innerStr +="    </table></td>";
		innerStr +="  </tr>";
		innerStr +="<tr>";
		innerStr +="<td><table width=\"100%\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="<tr>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">积分消费时间</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">礼品名称</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">礼品数量</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">分值</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">兑换方式</td>";
		innerStr +="<td align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">配送方式</td>";
		innerStr +="</tr>";
		for(var i=begin;i <end;i++){ 
			UseTime = Itemroot[i].getElementsByTagName("UseTime");
			GiftName = Itemroot[i].getElementsByTagName("GiftName");
			GiftCount = Itemroot[i].getElementsByTagName("GiftCount");
			Amount = Itemroot[i].getElementsByTagName("Amount");
			ChangeType = Itemroot[i].getElementsByTagName("ChangeType");
			SendType = Itemroot[i].getElementsByTagName("SendType");
			if(UseTime[0].childNodes[0] !=null)
			{
				useUseTime = UseTime[0].childNodes[0].nodeValue;
			}
			if(GiftName[0].childNodes[0] !=null)
			{
				useGiftName = GiftName[0].childNodes[0].nodeValue;
			}	
			if(GiftCount[0].childNodes[0] !=null)
			{
				useGiftCount = GiftCount[0].childNodes[0].nodeValue;
			}
			if(Amount[0].childNodes[0] !=null)
			{
				useAmount = Amount[0].childNodes[0].nodeValue;
			}
			if(ChangeType[0].childNodes[0] !=null)
			{
				useChangeType = ChangeType[0].childNodes[0].nodeValue;
			}
			if(SendType[0].childNodes[0] !=null)
			{
				useSendType = SendType[0].childNodes[0].nodeValue;
			}
				innerStr +="       <tr>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useUseTime+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useGiftName+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useGiftCount+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useAmount+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useChangeType+"</td>";
				innerStr +="             <td align=\"center\" bgcolor=\"#F3F1F0\" class=\"STYLE14\">"+useSendType+"</td>";
				innerStr +="       </tr>";
			}
    
   	    innerStr +="    </table></td>";
   	    innerStr +="  </tr>";
   	 	innerStr +="  <tr>";
   		innerStr +="  <td align=\"center\" valign=\"top\" colspan=2><table width=\"100%\">";
   		innerStr +="  <tr>";
  		innerStr +="  <td class=\"font12 STYLE4\" colspan=2  align=right>当前第"+pagenum+"页&nbsp;共"+realpage+"页";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=jifen_costdetail&pageno=1&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  首  页</a>";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=jifen_costdetail&pageno="+pre+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  上一页</a>";
   		innerStr +="  <a id=\"down\" href=\"bill.action?op=jifen_costdetail&pageno="+next+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
   		innerStr +="  下一页</a>";
   		innerStr +="  <a id=\"tail\" href=\"bill.action?op=jifen_costdetail&pageno="+realpage+"&month=<ww:property value="month"/>&user_tel=<ww:property value="user_tel"/>\">";
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