<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html>
<head>
<title>��ͨ�����˱���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css">
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
	background:url(images/buttom_preview01.png);
}
a:visited img{
	background:url(images/buttom_preview02.png);
	
}
.STYLE1 {font-size: 11px}
-->
</style>
<script type="text/javascript" language="javascript">
function sAlert(str,dingzhi1,tuiding1){
var msgw,msgh,bordercolor;
msgw=400;//��ʾ���ڵĿ��
msgh=100;//��ʾ���ڵĸ߶�
titleheight=25 //��ʾ���ڱ���߶�
bordercolor="#E1E0FC";//��ʾ���ڵı߿���ɫ
titlecolor="#59B3F0";//��ʾ���ڵı�����ɫ

var sWidth,sHeight,lefttemp,cWidth;
sWidth=screen.width;
sHeight=screen.height;
cWidth = body.clientWidth;
lefttemp = cWidth-477;
if(lefttemp<0)
	lefttemp=0;
else
	lefttemp=lefttemp/2;
//alert(lefttemp);

var bgObj=document.createElement("div");
bgObj.setAttribute('id','bgDiv');
bgObj.style.position="absolute";
bgObj.style.top="0";
bgObj.style.background="#000000";
bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
bgObj.style.opacity="0.6";
bgObj.style.left=lefttemp;
bgObj.style.width="470px";
bgObj.style.height="860px";
bgObj.style.zIndex = "10000";
document.body.appendChild(bgObj);

var msgObj=document.createElement("div")
msgObj.setAttribute("id","msgDiv");
msgObj.setAttribute("align","center");
msgObj.style.background="white";
msgObj.style.border="1px solid " + bordercolor;
msgObj.style.position = "absolute";
msgObj.style.left = "50%";
msgObj.style.top = "50%";
msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
msgObj.style.marginLeft = "-200px" ;
msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px";
msgObj.style.width = msgw + "px";
msgObj.style.height =msgh + "px";
msgObj.style.textAlign = "center";
msgObj.style.lineHeight ="25px";
msgObj.style.zIndex = "10001";

var title=document.createElement("h4");
title.setAttribute("id","msgTitle");
title.setAttribute("align","right");
title.style.margin="0";
title.style.padding="3px";
title.style.background=bordercolor;
title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
title.style.opacity="0.75";
title.style.border="1px solid " + bordercolor;
title.style.height="18px";
title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
title.style.color="red";
title.style.cursor="pointer";
title.innerHTML="�ر�";
title.onclick=function(){
document.body.removeChild(bgObj);
document.getElementById("msgDiv").removeChild(title);
document.body.removeChild(msgObj);
}
document.body.appendChild(msgObj);
document.getElementById("msgDiv").appendChild(title);
var txt=document.createElement("p");
txt.style.margin="1em 0"
txt.setAttribute("id","msgTxt");
txt.innerHTML=str;
document.getElementById("msgDiv").appendChild(txt);

	var dingzhi=document.getElementById("dingzhi");
	dingzhi.onclick=function(){
	
	document.body.removeChild(bgObj);
	document.getElementById("msgDiv").removeChild(title);
	document.body.removeChild(msgObj);
test(dingzhi1);	
	}
var tuiding=document.getElementById("tuiding");
	tuiding.onclick=function(){
	
	document.body.removeChild(bgObj);
	document.getElementById("msgDiv").removeChild(title);
	document.body.removeChild(msgObj);
test1(tuiding1);	
	}
}

function test(s){

	startRequest(s);
}
function test1(s){

	startRequest(s);
}
</script>
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
	function startRequest(service_code){
		createXMLHttpRequest();
		//alert(service_code);
		document.getElementById("service_code").value = service_code;
		
		var stra = "AccCode=<ww:property value="user_tel"/>&msnid=<ww:property value="user_msn"/>";
		xmlHttp.open("POST", "domain_action.jsp?Bcode=" + service_code + "&"+stra, true); 
		xmlHttp.onreadystatechange = myCallback; 
		xmlHttp.send(null); 
	}
	function myCallback(){ 
		var service_code = document.getElementById("service_code").value;
		if(xmlHttp.readyState==4){ 
			if(xmlHttp.status==200){ 
		//alert(service_code);
				listInfo(service_code); 
			} 
		} 
	}
	function listInfo(service_code){ 
		var xmlDoc = xmlHttp.responseXML;
//alert(xmlDoc); 
		var root = xmlDoc.documentElement;   
		//alert(root); 
		var allProvs = root.getElementsByTagName("flag"); 
		//alert(allProvs.length); 
		outputList(allProvs,service_code); 
	} 

	function outputList(provs,service_code){ 
		var currentProv = null; 
		if(service_code == "100001000600001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>©�����ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>©�����ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}
		else if(service_code == "100001000700001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>�ֻ��������涨�ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>�ֻ��������涨�ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}
		else if(service_code == "100001000800001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>�ֻ��������涨�ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>�ֻ��������涨�ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}	
		else if(service_code == "100001000900001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>�ֻ����ƾ��涨�ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>�ֻ����ƾ��涨�ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}
		else if(service_code == "100001001000001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>����ɱ�����ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>����ɱ�����ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}
		else if(service_code == "100001001100001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>������Ϣ���ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>������Ϣ���ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}
		else if(service_code == "100001001200001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>�������챨���ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>�������챨���ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}
		else if(service_code == "100001001300001"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				//alert(currentProv); 
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>�������ܱ����ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>�������ܱ����ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
				}
			} 
		}	
		else if(service_code == "100001000600002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ��©������ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ��©������ʧ�ܡ�</font>";
				}
			} 
		}
		else if(service_code == "100001000700002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���ֻ������������ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���ֻ������������ʧ�ܡ�</font>";
				}
			} 
		}
		else if(service_code == "100001000800002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���ֻ������������ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���ֻ������������ʧ�ܡ�</font>";
				}
			} 
		}
		else if(service_code == "100001000900002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���ֻ����ƾ������ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���ֻ����ƾ������ʧ�ܡ�</font>";
				}
			} 
		}
		else if(service_code == "100001001000002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ������ɱ������ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ������ɱ������ʧ�ܡ�</font>";
				}
			} 
		}
		else if(service_code == "100001001100002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ��������Ϣ����ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ��������Ϣ����ʧ�ܡ�</font>";
				}
			} 
		}
		else if(service_code == "100001001200002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���������챨����ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���������챨����ʧ�ܡ�</font>";
				}
			} 
		}
		else if(service_code == "100001001300002"){
			for(var i=0;i <provs.length;i++){ 
				currentProv = provs[i];
				
				if(currentProv.childNodes[0].nodeValue == "1")
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���������ܱ�����ɹ���</font>";
				}
				else
				{
					document.getElementById("message").innerHTML="<font color=red>ȡ���������ܱ�����ʧ�ܡ�</font>";
				}
			} 
		}
	}	
	//ajax-----------------------------------------end	
	</script>
<script>
//���
function max(id){
eval(id+".style.pixelWidth=65");
eval(id+".style.pixelHeight=65");
}
//��С
function min(id){
eval(id+".style.pixelWidth=60");
eval(id+".style.pixelHeight=60");
}
</script>
</head>
<body id=body>

<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="images/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="images/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="images/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<%@ include file="public/title1.jsp"%>
	<tr>
		<td>
			<img src="images/main_10.jpg" width="41" height="511" alt=""></td>
	  <td width="397" height="511" valign="top" background="images/main_1101.jpg">
		<table width="395" height="120" align="center" background="images/bg_01.jpg">
          <tr>
            <td align="center" valign="middle">
			<img src="images/mms_pic01.jpg" width="96" height="95"><img src="images/mms_pic02.jpg" width="96" height="95"><img src="images/mms_pic03.jpg" width="78" height="95"><img src="images/mms_pic04.jpg" width="96" height="95"></td>
          </tr>
        </table>
		<table width="100%">
		
		<tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center">&nbsp;</td>
			<td width="22%" align="center">&nbsp;</td>
			<td width="22%" align="center">&nbsp;</td>
			<td width="22%" align="center">&nbsp;</td>
			<td width="6%" align="center">&nbsp;</td>
          </tr>
          <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" id="id_01">
            <a href="bill/bill.action?op=view&user_msn=<ww:property value="user_msn"/>">
            <img id=img1 src="images/index01.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)" >
            </a>
            </td>
			<td width="22%" align="center">
			<a href="mms/mms.action?op=mms&user_msn=<ww:property value="user_msn"/>">
			<img id=img2 src="images/index02.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center">
			<a href="#" onclick="sAlert('<img src=\'images/indexicon03.png\'/><br>�ֻ���������,�ʷ�Ϊ3Ԫ/��<br>�ֻ�����һ����Ѷ��ҵ��ָ��ý�����������ͨ���ֻ�Ϊ�û��ṩ������Ѷ��Ϣ�ķ���<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001000800001','100001000800002');">
			<img id=img3 src="images/index03.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center">
			<a href="login.action?op=bind&user_msn=<ww:property value="user_msn"/>">
			<img id=img4 src="images/index04.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="6%" align="center"></td>
          </tr>
          <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">���Ѳ�ѯ</td>
			<td width="22%" align="center" class="ban">���Ͳ���</td>
			<td width="22%" align="center" class="ban">�ֻ���������</td>
			<td width="22%" align="center" class="ban">���°�</td>
			<td width="6%" align="center"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
            <td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="6%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center"><a href="sms/sms.action?op=view&user_msn=<ww:property value="user_msn"/>">
            <img id=img5  src="images/index05.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center"><a href="#"><img id=img6 src="images/index06.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center">
			<a href="#" onClick="sAlert('<img src=\'images/indexicon07.png\'/><br>�ֻ���������,�ʷ�Ϊ3Ԫ/��<br>�ֻ�����һ����Ѷ��ҵ��ָ��ý�����������ͨ���ֻ�Ϊ�û��ṩ������Ѷ��Ϣ�ķ���<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001000700001','100001000700002');">
			<img id=img7 src="images/index07.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center"><a href="#" onClick="sAlert('<img src=\'images/indexicon08.png\'/><br>�������챨<br>�������û�ÿ���Զ�����һ����ǰ���������ܶ�͵�ǰԤ�������Ķ��ţ�Ԥ����������15Ԫʱ�������û���ʱ��ֵ��<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001001200001','100001001200002');">
			<img id=img8 src="images/index08.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="6%" align="center"></td>
          </tr>
          <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">���Ͷ���</td>
			<td width="22%" align="center" class="ban">���Ʋ���</td>
			<td width="22%" align="center" class="ban">�ֻ���������</td>
			<td width="22%" align="center" class="ban">�������챨</td>
			<td width="6%" align="center"></td>
          </tr> 
		    <tr>
		    <td width="6%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
            <td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="6%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
          </tr>
	      <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center"><a href="#" onClick="sAlert('<img src=\'images/indexicon09.png\'/><br>�ֻ����ƾ���,�ʷ�Ϊ5Ԫ/��<br>�ֻ�����һ����Ѷ��ҵ��ָ��ý�����������ͨ���ֻ�Ϊ�û��ṩ������Ѷ��Ϣ�ķ���<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001000900001','100001000900002');">
            <img id=img9 src="images/index09.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center">
			<a href="#"  onclick="sAlert('<img src=\'images/indexicon10.png\'/><br>©��������,�ʷ�Ϊ1Ԫ/��<br>����ֻ��ػ����źŲ��õȣ���ͨ���û�����ͨ������©���Զ����ŵķ�ʽ�����Щδ�����硣<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001000600001','100001000600002');">
			<img id=img10 src="images/index10.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center">
			<a href="#" onClick="sAlert('<img src=\'images/indexicon11.png\'/><br>������Ϣ����,�ʷ�Ϊ4Ԫ/��<br>ͨ�������ֻ����ſ����˽⵽��ͨΥ����¼�����·���ۺ���Ϣ��<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001001100001','100001001100002');">
			<img id=img11 src="images/index11.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center">
			<a href="#" onClick="sAlert('<img src=\'images/indexicon12.png\'/><br>�������ܱ�<br>�������û�ÿ��7���Զ�����һ����ǰ����������ϸ�Ķ��š�<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001001300001','100001001300002');">
			<img id=img12 src="images/index12.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="6%" align="center"></td>
          </tr>
          <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">�ֻ����ƾ���</td>
			<td width="22%" align="center" class="ban">©��������</td>
			<td width="22%" align="center" class="ban">������Ϣ����</td>
			<td width="22%" align="center" class="ban">�������ܱ�</td>
			<td width="6%" align="center"></td>
          </tr> 
		    <tr>
		    <td width="6%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
            <td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
			<td width="6%" align="center"><img src="images/touming.gif" width="1" height="7"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center">
			<a href="#" onClick="sAlert('<img src=\'images/indexicon13.png\'/><br>����ɱ������,�ʷ�Ϊ8Ԫ/��,����ͨѶ��<br>����ɱ��ҵ����McAfee��˾���й���ͨ������ҵ���ǻ����й���ͨ��������ƽ̨�ϵĹ�����ֵ��ҵ��<br><span class=\'btn-l\'><input id=\'dingzhi\'  type=\'button\' value=\'����\'/></span>&nbsp;&nbsp;<span class=\'btn-l\'><input id=\'tuiding\'  type=\'button\' value=\'�˶�\'/></span>','100001001000001','100001001000002');">
			<img id=img13 src="images/index13.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			</a>
			<td width="22%" align="center"><a href="connectbook/connectbook.action?ac=default&msnacc=<ww:property value="user_msn"/>"><img id=img15 src="images/index15.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center"><a href="ling/ling_hot.html"><img id=img16 src="images/index16.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
			<td width="22%" align="center" id="message"></td>
			<td width="6%" align="center"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">����ɱ������</td>
			<td width="22%" align="center" class="ban">ͨѶ¼</td>
			<td width="22%" align="center" class="ban">���嶨��</td>
			<td width="22%" align="center" class="ban"><input type ="hidden" name="service_code" id="service_code"/> </td>
			<td width="6%" align="center"></td>
          </tr> 
        </table>
	  </td>
		<td>
			<img src="images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="images/main_140.jpg"><table width="100%" height="100%">
          <tr>
            <td width="20%" align="center" valign="top">&nbsp;</td>
			<td width="20%" align="right" valign="top"><img src="images/touming.gif" width="70" height="30"></td>
          </tr>
      </table></td>
<td>
			<img src="images/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="images/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="images/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</body>
</html>
