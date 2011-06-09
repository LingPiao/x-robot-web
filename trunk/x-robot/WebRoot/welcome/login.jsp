<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>联通机器人贝贝</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
	//ajax---------------------------------------begin
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
	function startRequest(tel,content){
		createXMLHttpRequest();
		var stra = "ToCode="+tel+"&Msg="+content;
		xmlHttp.open("POST", "../public/getcode.jsp?Bcode=100002000100001&"+stra, true); 
		//alert(stra); 
		xmlHttp.onreadystatechange = myCallback; 
		xmlHttp.send(null); 
	}
	function myCallback(){ 
		if(xmlHttp.readyState==4){ 
			if(xmlHttp.status==200){ 
				listInfo(); 
			} 
		} 
	}
	function listInfo(){ 
		var xmlDoc = xmlHttp.responseXML; 
		var root = xmlDoc.documentElement;   
		var allProvs = root.getElementsByTagName("flag"); 
		outputList(allProvs); 
	} 

	function outputList(provs){ 
		var currentProv = null; 
		for(var i=0;i <provs.length;i++){ 
			currentProv = provs[i];
			if(currentProv.childNodes[0].nodeValue == "1")
			{
				 document.getElementById("errortext1").innerText="验证码已经发送到您的手机上，请按照手机上显示的内容输入！";
				 document.getElementById("errortext2").style.display="none";
			}
			else
			{
				 document.getElementById("errortext1").innerText="验证码发送失败请重新获取！";
				 document.getElementById("errortext2").style.display="none";
			}
		} 
	}
	
	//ajax-----------------------------------------end
</script>
<script language="javascript">
	function generateMixed(n) {
		var chars = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
	    var res = "";
	    for(var i = 0; i < n ; i ++) {
	        var id = Math.ceil(Math.random()*35);
	        res += chars[id];
	    }
	    return res;
	} 
	function validteCode()
	{
		var tel = document.getElementById("user_tel").value;
	    if(tel == ""){
			document.getElementById("errortext2").innerHTML="<font color=red>请输入绑定的电话号码！</font>";
			return false;
		}
		var v=tel.substring(0,3);
		if(v!="130" && v!="131"&& v!="132" && v!="156" && v!="186")
        {
           document.getElementById("errortext2").innerText="*请输入联通手机号码！";
            document.getElementById("user_tel").focus();
            return false;
        }
		if(document.getElementById("logincode").value == "")
		{
			document.getElementById("errortext2").innerText="*请输入验证码！";
			document.getElementById("logincode").focus();
            return false;
		}
		if(document.getElementById("logincode").value != document.getElementById("tempcode").value)
		{
			document.getElementById("errortext2").innerText="*验证码错误！";
			document.getElementById("logincode").focus();
			return false;
		}
		ucform.action="login.action?op=add";
		ucform.submit();
		
	 }
	 
	 function validteCode1()
	 {
		var user_tel = document.getElementById("user_tel").value;	
	    if(user_tel == ""){
			document.getElementById("errortext2").innerHTML="<font color=red>请输入绑定的电话号码！</font>";
			return false;
		}
		var sixrand=generateMixed(6);
		document.getElementById('tempcode').value=sixrand;
		document.getElementById("errortext2").innerText=sixrand;	
		//发端短信.......................    
		startRequest(user_tel,sixrand);
	 }
	 function unbind()
	 {
		
		 if(document.getElementById("logincode").value == "")
			{
			 
				document.getElementById("errortext2").innerText="*请输入验证码！";
				document.getElementById("logincode").focus();
	            return false;
			}
			if(document.getElementById("logincode").value != document.getElementById("tempcode").value)
			{
				
				document.getElementById("errortext2").innerText="*验证码错误！";
				document.getElementById("logincode").focus();
				return false;
			}
		 ucform.action="login.action?op=unbind";
		 ucform.submit();
	 }
</script>
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
	  <td width="397" height="511" valign="top" background="../images/main_11.jpg">
		<table width="395" height="120" align="center" background="../images/bg_01.jpg">
          <tr>
            <td align="center" valign="middle">
			<%@ include file="../ad.jsp"%>
			</td>
          </tr>
        </table>
		<table width="100%">
		  <tr>
		    <td align="center">&nbsp;</td>
          </tr>
          <tr>
		    <td height="330" align="center">
		    <form name="ucform" method="post" >
			<table width="355" height="330" background="../images/phone_login.gif" cellpadding="5">
              <tr>
			    <td width="5%" height="80">&nbsp;</td>
                <td width="23%">&nbsp;</td>
                <td width="64%">&nbsp;</td>
				<td width="8%">&nbsp;</td>
              </tr>
              <tr>
			    <td height="20">&nbsp;</td>
                <td valign="middle" class="font15">MSN账号：</td>
                <td valign="bottom" class="font15">
                <input name="user_msn" type="text" class="input_login1" id="user_msn" value="<ww:property value="user_msn"/>" readonly>
                </td>
				<td>&nbsp;</td>
              </tr>
              <tr>
			    <td height="20">&nbsp;</td>
                <td class="font15">手机号码：</td>
                <td class="font15">
                  <input name="user_tel" type="text" class="input_login1" id="user_tel" value="<ww:property value="user_tel"/>">
                </td>
				<td>&nbsp;</td>
              </tr>
              <tr>
			    <td height="20">&nbsp;</td>
                <td class="font15">验证码：</td>
                <td class="font15">
                <input name="logincode" type="text" class="input_login2" id="logincode">
                <input name="tempcode" type="hidden" size="15"class="input_login2"  />
                &nbsp;<a href ="#" onClick="validteCode1();">获取验证码</a></td>
				<td>&nbsp;</td>
              </tr>
              <tr>
			    <td height="90">&nbsp;</td>
                <td colspan="2" valign="top" class="fontStyle">
				 <div id=errortext1></div>
			     <div id=errortext2 align="left"><font color=red>提示：为了保证用户的帐户安全，“联通贝贝”采用动态验证码登录，每次登录都需要申请验证码，而且每次验证码都不一样。</font></div>
				</td>
				<td>&nbsp;</td>
              </tr>
              <tr>
			    <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td align="right">
                <input name="button" type="button" class="input_button2" id="button" value="绑定" onClick="return validteCode();">&nbsp;
                <input name="button" type="button" class="input_button2" id="button" value="取消绑定 " onClick="return unbind()"></td>
				<td>&nbsp;</td>
              </tr>
            </table></form></td>
          </tr>      
        </table>
	  </td>
		<td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_14.jpg"></td>
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
</html>