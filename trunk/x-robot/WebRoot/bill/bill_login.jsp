<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>���Ѳ�ѯ</title>
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
-->
</style>
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
	function startRequest(acccode,pwd){
		createXMLHttpRequest(); 
		xmlHttp.open("POST", "domain_action.jsp?Bcode=100001000100001&AccCode="+acccode+"&Password="+pwd+"&Month=", true); 
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
				form1.action="bill.action?op=login&user_msn=<ww:property value="user_msn"/>";
				form1.submit();
			}
			else
			{
				document.getElementById("errortext1").innerText="������������������ʵ���������룡";
			}
		} 
	}
	
	//ajax-----------------------------------------end
	
	
	//ajax---------------sms------------------------begin
	var xmlHttp_sms; 
	function createXMLHttpRequest_sms(){ 
	if(window.ActiveXObject){ 
		xmlHttp_sms = new ActiveXObject("Microsoft.xmlHttp"); 
	}
	else 
		if(window.XMLHttpRequest){ 
			xmlHttp_sms = new XMLHttpRequest();
		} 
	}
	function startRequest_sms(tel,content){
		createXMLHttpRequest_sms();
		var stra = "ToCode="+tel+"&Msg="+content; 
		xmlHttp_sms.open("POST", "../public/getcode.jsp?Bcode=100002000100001&"+stra, true); 
		xmlHttp_sms.onreadystatechange = myCallback_sms; 
		xmlHttp_sms.send(null); 
	}
	function myCallback_sms(){ 
		if(xmlHttp_sms.readyState==4){ 
			if(xmlHttp_sms.status==200){ 
				listInfo_sms(); 
			} 
		} 
	}
	function listInfo_sms(){ 
		var xmlDoc = xmlHttp_sms.responseXML; 
		var root = xmlDoc.documentElement;   
		var allProvs = root.getElementsByTagName("flag"); 
		outputList_sms(allProvs); 
	} 

	function outputList_sms(provs){ 
		var currentProv = null; 
		for(var i=0;i <provs.length;i++){ 
			currentProv = provs[i];
			if(currentProv.childNodes[0].nodeValue == "1")
			{
				 document.getElementById("errortext1").innerText="��½�����Ѿ����͵������ֻ��ϣ��밴���ֻ�����ʾ���������룡";
			}
			else
			{
				 document.getElementById("errortext1").innerText="��½���뷢��ʧ�������»�ȡ��";
				 document.getElementById("errortext2").style.display="none";
			}
		} 
	}
	
	//ajax------------------sms-----------------------end
	function checkValue(){
		//////////////////
		var type = document.form1['loginInfo.identifyType'].value;
		if(type == "01"){
			if(document.form1['password'].value == ''){
				document.getElementById("errortext2").innerText="�Բ��𣬷������������д��";
				document.form1['password'].focus();
				return false;
			}
			
		}else if(type == "02"){
			if(document.form1['logincode'].value == ''){
				document.getElementById("errortext2").innerText="�Բ���������������д��";
				document.form1['logincode'].focus();
				return false;
			}
			 
			 if(document.getElementById("logincode").value != document.getElementById("tempcode").value){
				document.getElementById("errortext2").innerText="�Բ�������������";
				document.getElementById("logincode").focus();
				return false;
			 }
		}
		if(type == "01"){
			startRequest(document.form1['user_tel'].value,document.form1['password'].value);
		}else{
			form1.action="bill.action?op=login&user_msn=<ww:property value="user_msn"/>";
			form1.submit();
		}
	}
	
	function checkType(){
				var type = document.form1['loginInfo.identifyType'].value;
				if(type == "02"){
					document.getElementById("biz").style.display = "none";
					document.getElementById("sms").style.display = "";
					document.form1['password'].value = "";
					document.getElementById("errortext2").innerText="ѡ��������뷽ʽ��¼����������ʹ�ó��굥��ѯ����Ĺ��ܡ�";
				}else if(type == "01"){
					document.getElementById("biz").style.display = "";
					document.getElementById("sms").style.display = "none";
					document.form1['logincode'].value = "";
					document.getElementById("errortext2").innerText="ѡ��������뷽ʽ��¼��������ʹ��ȫ�����ܡ�";
				}
			}
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
		var user_tel = document.getElementById("user_tel").value;
		var sixrand=generateMixed(6);
		document.getElementById('tempcode').value=sixrand;
		//document.getElementById("errortext2").innerText=sixrand;
		
		//���˶���.......................
	    startRequest_sms(user_tel,sixrand);
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
		    <form method="post" name="form1" action="">
			<table width="355" height="330" background="../images/bill/moneyresearch.gif" cellpadding="5">
              <tr>
			    <td width="5%" height="80">&nbsp;</td>
                <td width="23%">&nbsp;</td>
                <td width="64%">&nbsp;</td>
				<td width="8%">&nbsp;</td>
              </tr>
              <tr>
			    <td height="23">&nbsp;</td>
                <td valign="middle" class="font15">�ֻ����룺</td>
                <td valign="bottom" class="font15"><input name="user_tel" id="user_tel" type="text" class="input_login" readonly value="<ww:property value="user_tel"/>"></td>
				<td>&nbsp;</td>
              </tr>
              <tr>
			    <td height="23">&nbsp;</td>
                <td class="font15">��¼��ʽ��</td>
                <td class="font15">
                  <select id="loginInfo.identifyType" 
				  onchange="checkType()" name="loginInfo.identifyType">
								  <option value="01" selected="selected">��������</option>
								  <option 
				  value="02">�������</option>
                    </select>
                </td>
				<td>&nbsp;</td>
              </tr>
              <tr id=biz>
			    <td height="23">&nbsp;</td>
                <td class="font15">�������룺</td>
                <td class="font15"><input name="password" type="password" class="input_login" id="password"></td>
				<td>&nbsp;</td>
              </tr>
              <tr id=sms style="DISPLAY: none">
              	<td height="23">&nbsp;</td>
                <td class="font15">������룺</td>
                <td class="font15"><input name="logincode" type="text" size="15"class="input_login"  style="width:80px;" />
                 <input name="tempcode" type="hidden" size="15" class="input_txt"  />
                 <a href ="#" onClick="validteCode();">��ȡ�������</a> 
				</td>
              </tr>
              <tr>
			    <td height="90">&nbsp;</td>
                <td colspan="2" valign="top" class="fontStyle">
                <div id=errortext1></div>
                <div id=errortext2 align="left">��ʾ��Ϊ�˱�֤�û����˻���ȫ������ͨ���������ö�̬��֤���¼��ÿ�ε�¼����Ҫ������֤�룬����ÿ����֤�붼��һ����</div></td>
				<td>&nbsp;</td>
              </tr>
              <tr>
			    <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td align="right"><input name="button" type="button" class="input_button2" id="button" value="��½" onClick="return checkValue();"></td>
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