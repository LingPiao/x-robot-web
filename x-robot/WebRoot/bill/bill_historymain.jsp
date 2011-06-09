<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>历史账单</title>
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
.STYLE4 {color: #666666}
.STYLE6 {font-size: 10px; padding-left:5px;}
.STYLE7 {
	color: #1982B0;
	font-size: 10px;
	padding-left:5px;
}
.STYLE13 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE14 {font-size: 12px}
.STYLE15 {
	font-size: 12px;
	color: #FFFFFF;
	padding-left:30px;
}
.STYLE18 {font-size: 12px; padding-left:10px; }
.STYLE19 {font-size: 12px; padding-left:30px; }
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
		<td width="" height="28" colspan="3" align="center" background="../images/bill/icon_05.gif" class="fontStyle">历史账单</td>
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
            <td width="79%" class="titleblue">历史账单</td>
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
            <td align="right"><input name="button" type="submit" class="input_button02" id="button" value="返回" onClick="window.location.href='bill.action?op=history&user_tel=<ww:property value="user_tel"/>';"></td>
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
	function adv_format(value,num)   //四舍五入
    {
    var a_str = formatnumber(value,num);
    var a_int = parseFloat(a_str);
    if (value.toString().length>a_str.length)
        {
        var b_str = value.toString().substring(a_str.length,a_str.length+1)
        var b_int = parseFloat(b_str);
        if (b_int<5)
            {
            return a_str
            }
        else
            {
            var bonus_str,bonus_int;
            if (num==0)
                {
                bonus_int = 1;
                }
            else
                {
                bonus_str = "0."
                for (var i=1; i<num; i++)
                    bonus_str+="0";
                bonus_str+="1";
                bonus_int = parseFloat(bonus_str);
                }
            a_str = formatnumber(a_int + bonus_int, num)
            }
        }
        return a_str
    }

	function formatnumber(value,num)    //直接去尾
    {
    var a,b,c,i
    a = value.toString();
    b = a.indexOf('.');
    c = a.length;
    if (num==0)
        {
        if (b!=-1)
            a = a.substring(0,b);
        }
    else
        {
        if (b==-1)
            {
            a = a + ".";
            for (i=1;i<=num;i++)
                a = a + "0";
            }
        else
            {
            a = a.substring(0,b+num+1);
            for (i=c;i<=b+num;i++)
                a = a + "0";
            }
        }
    return a
    }
	
	
	//ajax---------------------------------------begin
	startRequest();
	document.getElementById("login_wait").style.display="block";
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
		xmlHttp.open("POST", "domain_action.jsp?Bcode=100001000300002&AccCode=<ww:property value="user_tel"/>&Month=<ww:property value="month"/>&Password=", true); 
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
		var CostName = null;
		var CostAmt = null;
		var useCostName = "";
		var useCostAmt = 0;
		var Costs = 0;
		var innerStr="";
		innerStr +="<table width=\"100%\">";
		innerStr +="<tr><td><table width=\"100%\" border=\"0\" cellpadding=\"1\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="<tr><td width=\"25%\" align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">手机号码：</td>";
		innerStr +="<td width=\"25%\" align=\"center\" bgcolor=\"#F3F1F0\"><span class=\"STYLE14\"><ww:property value="user_tel"/></span></td>";
		innerStr +="<td width=\"25%\" align=\"center\" bgcolor=\"#179CBD\"><span class=\"STYLE13\">查询月份：</span></td>";
		innerStr +="<td width=\"25%\" align=\"center\" bgcolor=\"#F3F1F0\"><span class=\"STYLE14\"><ww:property value="month"/></span></td>";
		innerStr +="</tr></table></td></tr>";
		innerStr +="<tr><td><table width=\"100%\" cellpadding=\"2\" cellspacing=\"1\" bgcolor=\"#B6DDEE\">";
		innerStr +="<tr><td align=\"center\" bgcolor=\"#179CBD\" width=\"50%\"><span class=\"STYLE13\">费用名称</span></td>";
		innerStr +="<td align=\"left\" bgcolor=\"#179CBD\"><span class=\"STYLE15\">金额（元）</span></td></tr>";
   
		for(var i=0;i <Itemroot.length;i++){ 
			CostName = Itemroot[i].getElementsByTagName("CostName");
			CostAmt = Itemroot[i].getElementsByTagName("CostAmt");
			Costs =Costs+parseFloat(CostAmt[0].childNodes[0].nodeValue);
			if(CostName[0].childNodes[0] !=null)
			{
				useCostName = CostName[0].childNodes[0].nodeValue;
			}
			if(CostAmt[0].childNodes[0] !=null)
			{
				useCostAmt = CostAmt[0].childNodes[0].nodeValue;
			}
			innerStr +="<TR>";
			innerStr +="<td bgcolor=\"#F3F1F0\" class=\"STYLE18\">"+useCostName+"</TD>";
			innerStr +="<td bgcolor=\"#F3F1F0\" class=\"STYLE19\">"+useCostAmt+"</TD>";
			innerStr +="</TR>";
			//alert(Costs);		
		}
		//innerStr +="<TR>";
		//innerStr +="<td width=\"50%\" align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">费用合计</TD>";
		//innerStr +="<td width=\"50%\" align=\"center\" bgcolor=\"#179CBD\" class=\"STYLE13\">"+adv_format(Costs,2)+"</TD>";
		//innerStr +="</TR>";
		innerStr +="</TABLE></td></tr>";
		innerStr +="<tr>   <td><table width=\"100%\">";
		//innerStr +="<tr><td><span class=\"STYLE6 STYLE4\">注：本页面数据仅供参考使用，详细内容以当地营业厅查询内容为准。";	
		//innerStr +="</tr>";
		//innerStr +="<tr><td class=\"STYLE7\"></td></tr>"<tr><td class=\"STYLE7\">温馨提示：</td> </tr>";
		//innerStr +="						<TR>";
		//innerStr +="     						<td class=\"STYLE7\">1.目前仅向世界风用户提供此查询服务；如意通和新势力用户暂不支持此项查询业务</TD>";
		//innerStr +="    					</TR>";
		//innerStr +="    					<TR>";
		//innerStr +="    						<td class=\"STYLE7\">2.每月1日0点至8点为系统出帐期，暂时无法为您提供相关查询服务，请您于每月1日早8点以后查询，敬请谅解。</TD>";
		//innerStr +="    					</TR>";
		//innerStr +="    					<TR>";
		//innerStr +="    						<td class=\"STYLE7\">3.“当月话费”为您提供当月1日截至查询日的累计通信费用，如果可用余额显示为负值，说明您截至上月底仍有话费没有结清，请及时缴费，以免影响您的正常使用。查询结果仅供参考，最终以缴费发票上的金额为准。为了保证您的正常使用，请依据您的信用额度，适量预存话费。</TD>";
		//innerStr +="    					</TR>";
		innerStr +="				</TABLE>";
		innerStr +="			</TD>";
		innerStr +="		</TR>";
		innerStr +="</TABLE>";
		document.getElementById("detailinfo").innerHTML = innerStr;
	}
	//ajax-----------------------------------------end
	document.getElementById("detailinfo").style.display="block";
	</script></html>