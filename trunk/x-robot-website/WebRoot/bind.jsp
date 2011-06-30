<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
</head>
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
		var tel = document.getElementById("usermobile").value;
	    if(tel == ""){
			document.getElementById("errortext2").innerHTML="<font color=red>������󶨵ĵ绰���룡</font>";
			return false;
		}
		var v=tel.substring(0,3);
		
		if(v!="130" && v!="131"&& v!="132" && v!="156" && v!="186")
        {
       
           	document.getElementById("errortext2").innerText="*��������ͨ�ֻ����룡";
           	document.getElementById("errortext2").style.display="block";
            document.getElementById("usermobile").focus();
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
		var user_mobile = document.getElementById("usermobile").value;	
	    if(user_mobile == ""){
			document.getElementById("errortext2").innerHTML="<font color=red>������󶨵ĵ绰���룡</font>";
			return false;
		}
		var sixrand=generateMixed(6);
		document.getElementById('tempcode').value=sixrand;
		//document.getElementById("errortext2").innerText=sixrand;	
		//���˶���.......................    
		startRequest(user_mobile,sixrand);
	 }
</script>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="top" align="left" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
     <%@ include file="top.jsp" %>
    </table></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><table width="50%" border="0" cellspacing="6" cellpadding="6">
          <tr>
            <td colspan="2" height="120" valign="bottom" align="left"><img src="images/re_top.jpg" width="600" height="70" /></td>
          </tr>
          <tr>
            <td width="35%" rowspan="6" valign="top"><img src="images/register.jpg" width="234" height="260" /></td>
            <td align="left">&nbsp;</td>
          </tr>
          <form name=bindform method=post>
          <tr>
            <td width="65%" align="left"> ��<input name="userid" id="userid" type="hidden" class="input_login1" value=<ww:property value="userid"/>>�ֻ�����:
              <label>
              <input name="usermobile" id="usermobile" type="text" class="in" value=<ww:property value="usermobile"/>>
              </label></td>
          </tr>
          <tr>
            <td align="left">����֤��:              
            	<input name="logincode" type="text" class="in" id="logincode">
             	<input name="tempcode" id="tempcode" type="hidden" size="15"class="in"  />
             &nbsp;<a href ="#" onClick="validteCode1();">��ȡ��֤��</a></td>  
			</td>
          </tr>
          <tr>
            <td align="left">
            	 <div id=errortext1></div>
     			<div id=errortext2 align="left"><font color=red>��ʾ��Ϊ�˱�֤�û����ʻ���ȫ������ͨ���������ö�̬��֤���¼��ÿ�ε�¼����Ҫ������֤�룬����ÿ����֤�붼��һ����</font></div>
            </td>
          </tr>
          
          <tr>
            <td align="left" valign="top"><label>
                  <input name="button" type="button" class="buttonbg" id="button" value="��" onClick="return validteCode();">
            </label></td>
          </tr>
         </form>	
          <tr>
            <td colspan="2" height="100"></td>
            </tr>
          
        </table></td>
      </tr>
      
      <tr>
        <td align="center" class="a1"><br />
          <br /></td>
      </tr>
      <%@ include file="buttom.jsp" %>
    </table></td>
  </tr>
</table>
</body>
</html>
