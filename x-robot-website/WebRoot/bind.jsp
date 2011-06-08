<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link rel="stylesheet" href="Style/main.css" type="text/css" />
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
		xmlHttp.open("POST", "getcode.jsp?Bcode=100002000100001&"+stra, true); 
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
				 document.getElementById("errortext1").innerText="��֤���Ѿ����͵������ֻ��ϣ��밴���ֻ�����ʾ���������룡";
				 document.getElementById("errortext2").style.display="none";
			}
			else
			{
				 document.getElementById("errortext1").innerText="��֤�뷢��ʧ�������»�ȡ��";
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
		var tel = document.getElementById("user_mobile").value;
	    if(tel == ""){
			document.getElementById("errortext2").innerHTML="<font color=red>������󶨵ĵ绰���룡</font>";
			return false;
		}
		var v=tel.substring(0,3);
		
		if(v!="130" && v!="131"&& v!="132" && v!="156" && v!="186")
        {
       
           	document.getElementById("errortext2").innerText="*��������ͨ�ֻ����룡";
           	document.getElementById("errortext2").style.display="block";
            document.getElementById("user_mobile").focus();
            return false;
        }
		if(document.getElementById("logincode").value == "")
		{
			document.getElementById("errortext2").innerText="*��������֤�룡";
			document.getElementById("errortext2").style.display="block";
			document.getElementById("logincode").focus();
            return false;
		}
		if(document.getElementById("logincode").value != document.getElementById("tempcode").value)
		{
			document.getElementById("errortext2").innerText="*��֤�����";
			document.getElementById("errortext2").style.display="block";
			document.getElementById("logincode").focus();
			return false;
		}
		bindform.action="bindmobile.action?op=bindok";
		bindform.submit();
		
	 }
	 
	 function validteCode1()
	 {
		var user_mobile = document.getElementById("user_mobile").value;	
	    if(user_mobile == ""){
			document.getElementById("errortext2").innerHTML="<font color=red>������󶨵ĵ绰���룡</font>";
			return false;
		}
		var sixrand=generateMixed(6);
		document.getElementById('tempcode').value=sixrand;
		document.getElementById("errortext2").innerText=sixrand;	
		//���˶���.......................    
		startRequest(user_mobile,sixrand);
	 }
</script>
<title></title>
<body>
<form name=bindform method=post>
<table>
<tr>
			    <td height="20"> <input name="userid" id="userid" type="hidden" class="input_login1" value=<ww:property value="userid"/>></td>
                <td class="font15">�ֻ����룺</td>
                <td class="font15">
                  <input name="user_mobile" id="user_mobile" type="text" class="input_login1" value=<ww:property value="user_mobile"/>>
                </td>
				<td>&nbsp;</td>
              </tr>
 <tr>
    <td height="20">&nbsp;</td>
             <td class="font15">��֤�룺</td>
             <td class="font15">
             <input name="logincode" type="text" class="input_login2" id="logincode">
             <input name="tempcode" id="tempcode" type="hidden" size="15"class="input_login2"  />
             &nbsp;<a href ="#" onClick="validteCode1();">��ȡ��֤��</a></td>
	<td>&nbsp;</td>
           </tr>
           <tr>
    <td height="90">&nbsp;</td>
             <td colspan="2" valign="top" class="fontStyle">
	 <div id=errortext1></div>
     <div id=errortext2 align="left"><font color=red>��ʾ��Ϊ�˱�֤�û����ʻ���ȫ������ͨ���������ö�̬��֤���¼��ÿ�ε�¼����Ҫ������֤�룬����ÿ����֤�붼��һ����</font></div>
	</td>
	<td>&nbsp;</td>
           </tr>
           <tr>
    <td>&nbsp;</td>
             <td>&nbsp;</td>
             <td align="right">
             <input name="button" type="button" class="input_button2" id="button" value="��" onClick="return validteCode();">&nbsp;
             <!-- input name="button" type="submit" class="input_button2" id="button" value="����"--></td>
	<td>&nbsp;</td>
 </tr>
</table>
</form>
</body>
</html>