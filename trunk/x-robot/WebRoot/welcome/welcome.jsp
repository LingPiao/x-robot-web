<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>��ͨ�����˱���</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {font-size: 11px}
-->
</style>
<style>
.page{
        position:absolute;
        width:397px;
        border:1px solid #999;
        
        BACKGROUND-COLOR: rgb(89,2,11);
        left:425px;
        margin-left:0px;
        cursor:default;
        z-index:0;
}
ul{
        height:377px;
        list-style:none;
        margin:30px 0px 0px;
        padding:0px;
        text-align:center;
}
li{
        width:360px;
        height:20px;
        line-height:30px;
       
}
.tip{
        display:block;
        width:100%;
        font-size:12px;
        color:#999;
        text-align:center;
        margin:10px 0px 20px;
}
</style>
<script type="text/javascript" language="javascript">

function sAlert(str,dingzhi1,tuiding1){
	var msgw,msgh,bordercolor;
	msgw=400;//��ʾ���ڵĿ��
	msgh=100;//��ʾ���ڵĸ߶�
	titleheight=25 //��ʾ���ڱ���߶�
	bordercolor="rgb(89,2,11)";//��ʾ���ڵı߿���ɫ
	titlecolor="rgb(89,2,11)";//��ʾ���ڵı�����ɫ

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
	bgObj.style.height="760px";
	bgObj.style.zIndex = "10000";
	document.body.appendChild(bgObj);

	var msgObj=document.createElement("div")
	msgObj.setAttribute("id","msgDiv");
	msgObj.setAttribute("align","center");
	msgObj.style.background="white";
	msgObj.style.border="1px solid " + bordercolor;
	msgObj.style.position = "absolute";
	msgObj.style.left = "50%";
	msgObj.style.top = "30%";
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
	//title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
	title.style.opacity="0.75";
	title.style.border="1px solid " + bordercolor;
	title.style.height="18px";
	title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
	title.style.color="#ffffff";
	title.style.cursor="pointer";
	title.innerHTML="���رա�";
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

		var begin,end,dingzhi,tuiding;
		if(dingzhi1 =="" && tuiding1=="")
		{
			begin=document.getElementById("begin");
			
			begin.onclick=function()
			{
				document.body.removeChild(bgObj);
				document.getElementById("msgDiv").removeChild(title);
				document.body.removeChild(msgObj);
				window.location.href="../unicom_game/game.action?op=game1&user_msn=<ww:property value="user_msn"/>";
			}
			end=document.getElementById("end");
			
			end.onclick=function()
			{
				document.body.removeChild(bgObj);
				document.getElementById("msgDiv").removeChild(title);
				document.body.removeChild(msgObj);
			}
		}
		else
		{
			dingzhi=document.getElementById("dingzhi");
			dingzhi.onclick=function(){
			
			document.body.removeChild(bgObj);
			document.getElementById("msgDiv").removeChild(title);
			document.body.removeChild(msgObj);
			test(dingzhi1);	
			}
			tuiding=document.getElementById("tuiding");
			tuiding.onclick=function(){
			
			document.body.removeChild(bgObj);
			document.getElementById("msgDiv").removeChild(title);
			document.body.removeChild(msgObj);
			test1(tuiding1);	
			}
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
	function startRequest(msg){
		createXMLHttpRequest();
		var stra = "FromCode=18608033066&Msg="+msg+"&msnid=<ww:property value="user_msn"/>";
		xmlHttp.open("POST", "domain_action.jsp?"+stra, true); 
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
		//alert(root); 
		var allProvs = root.getElementsByTagName("flag"); 
		//alert(allProvs.length); 
		outputList(allProvs); 
	} 

	function outputList(provs){ 
		var currentProv = null; 
		for(var i=0;i <provs.length;i++){ 
			currentProv = provs[i];
			//alert(currentProv.childNodes[0].nodeValue); 
			if(currentProv.childNodes[0].nodeValue == "1")
			{
				//document.getElementById("message").innerHTML="<font color=red>©�����ƣ������ɹ�����,������ֻ�����ȷ�ϡ�</font>";
			}
			else
			{
				//document.getElementById("message").innerHTML="<font color=red>©�����ƣ���������ʧ�ܣ����ٴν��ж��ơ�</font>";
			}
			
		}
	}	
	//ajax-----------------------------------------end	
</script>
<script>
//���
function max(id){
eval("contentform."+id+".style.pixelWidth=65");
eval("contentform."+id+".style.pixelHeight=65");
}
//��С
function min(id){
eval("contentform."+id+".style.pixelWidth=60");
eval("contentform."+id+".style.pixelHeight=60");
}
</script>
</head>
<body onselectstart="return false;" id=body>
<script>
function id(obj){
        return document.getElementById(obj);
}

var page;
var lm,mx;
var md=false;
var sh=0;
var en=false;
var cWidth=0;
var tabletemp=0;
var lefttemp=0;
function adjust(obj){
	window.location.href=window.location.href;
}
window.onload=function(){
	window.onresize = adjust;
	cWidth = body.clientWidth;
	tabletemp = contenttable.clientWidth;
	lefttemp = cWidth-tabletemp;
	if(lefttemp<0)
		lefttemp=0;
	else
		lefttemp=lefttemp/2;
        page=contentform.getElementsByTagName("div");
        if(page.length>0){
                page[0].style.zIndex=2;
        }
        for(i=0;i<page.length;i++){
        		page[i].style.left=lefttemp;
                page[i].className="page";
                page[i].innerHTML+="<span class=tip>�� "+(i+1)+"/"+page.length+" ҳ ��ʾ��������ק��ҳ</span>";
                page[i].id="page"+i;
                page[i].i=i;
                page[i].onmousedown=function(e){
                	if (window.event.srcElement.tagName == 'IMG')
                	{
                		return;
                	}           	
                        if(!en){
                                if(!e){e=e||window.event;}
                                lm=this.offsetLeft;
                                mx=(e.pageX)?e.pageX:e.x;
                                this.style.cursor="w-resize";
                                md=true;
                                if(document.all){
                                        this.setCapture();
                                }else{
                                        window.captureEvents(Event.MOUSEMOVE|Event.MOUSEUP);
                                }
                        }
                }
                page[i].onmousemove=function(e){
                        if(md){
                                en=true;
                                if(!e){e=e||window.event;}
                                var ex=(e.pageX)?e.pageX:e.x;
                                this.style.left=ex-(mx-lm);                            
                                if(this.offsetLeft<425){
                                        var cu=(this.i==0)?page.length-1:this.i-1;
                                        page[sh].style.zIndex=0;
                                        page[cu].style.zIndex=1;
                                        this.style.zIndex=2;
                                        sh=cu;
                                }
                                if(this.offsetLeft>425){
                                        var cu=(this.i==page.length-1)?0:this.i+1;
                                        page[sh].style.zIndex=0;
                                        page[cu].style.zIndex=1;
                                        this.style.zIndex=2;
                                        sh=cu;
                                }
                     
                        }
                }
                page[i].onmouseup=function(){
                	if (window.event.srcElement.tagName == 'IMG')
                	{
                		return;
                	}
                        this.style.cursor="default";
                        md=false;
                        if(document.all){
                                this.releaseCapture();
                        }else{
                                window.releaseEvents(Event.MOUSEMOVE|Event.MOUSEUP);
                       }
                        //alert(lefttemp);
                        //alert(this.offsetLeft);
                       //if(this.offsetLeft>=lefttemp+1)
                       // flyout(this);
                       //if(this.offsetLeft<=lefttemp-1)
                           flyout(this);
                }
        }
}
function flyout(obj){
		//alert(obj.offsetLeft);
        if(obj.offsetLeft<lefttemp){
                if(                (obj.offsetLeft  - 20)        >        28        ){
                        obj.style.left=obj.offsetLeft  - 20;
                        window.setTimeout("flyout(id('"+obj.id+"'));",0);
                }else{
                        obj.style.left=28;
                        obj.style.zIndex=0;
                        flyin(id(obj.id));
                }
        }
        if(obj.offsetLeft>lefttemp){
                if(                (obj.offsetLeft  + 20)        <        822        ){
                        obj.style.left=obj.offsetLeft  + 20;
                        window.setTimeout("flyout(id('"+obj.id+"'));",0);
                }else{
                        obj.style.left=822;
                        obj.style.zIndex=0;
                        flyin(id(obj.id));
                }
        }
}
function flyin(obj){
		
        if(obj.offsetLeft<lefttemp){
                if(                (obj.offsetLeft  + 20)        <        lefttemp                ){
                        obj.style.left=obj.offsetLeft  + 20;
                        window.setTimeout("flyin(id('"+obj.id+"'));",0);
                }else{
                        obj.style.left=lefttemp;
                        en=false;
                }
        }
        if(obj.offsetLeft>lefttemp){
                if(                (obj.offsetLeft  - 20)        >        lefttemp                ){
                        obj.style.left=obj.offsetLeft  - 20;
                        window.setTimeout("flyin(id('"+obj.id+"'));",0);
                }else{
                        obj.style.left=lefttemp;
                        en=false;
                }
        }
}
</script>

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
	  <td width="397" height="511" valign="top" >
		<table width="395" height="100" align="center" background="../images/bg_01.jpg">
          <tr>
            <td align="center" valign="middle">
            <%@ include file="../ad.jsp"%>
            </td>
          </tr>
        </table>
        
		<table width="100%" id=contenttable><form name=contentform id=contentform>
		<div id=content>
        <ul>
                <li>
				<a href="../bill/bill.action?op=view&user_msn=<ww:property value="user_msn"/>">
            	<img id=img1 src="../images/index01.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)" >
            	</a>&nbsp;&nbsp;
            	<a href="../mms/mms.action?op=mms&user_msn=<ww:property value="user_msn"/>">
				<img id=img2 src="../images/index02.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="../sms/sms.action?op=view&user_msn=<ww:property value="user_msn"/>">
	            <img id=img5  src="../images/index05.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
	            </a>&nbsp;&nbsp;
				<a href="login.action?op=bind&user_msn=<ww:property value="user_msn"/>">
				<img id=img4 src="../images/index04.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>	
				</li>
                <li class=ban>
                	���Ѳ�ѯ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	���Ͳ���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	���Ͷ���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	���°�
                </li>
                <li>
				<a href="http://www.wo116114.com/" target=_blank><img id=img23 src="../images/116114.jpg" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/indexicon07.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr><tr><td align=center><input id=\'dingzhi\'  class=input_button2  type=\'button\' value=\'����\'/>&nbsp;&nbsp;<input id=\'tuiding\'  class=input_button2  type=\'button\' value=\'�˶�\'/></td></tr></table>','DGXWZWB','TDXWZWB');"><img id=img24 src="../images/news-new.jpg" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/indexicon07.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ֻ���������,�ʷ�Ϊ3Ԫ/�£��ֻ�����һ����Ѷ��ҵ��ָ��ý�����������ͨ���ֻ�Ϊ�û��ṩ������Ѷ��Ϣ�ķ���</td></tr><tr><td align=center><input id=\'dingzhi\' class=input_button2  type=\'button\' value=\'����\'/>&nbsp;&nbsp;<input id=\'tuiding\' class=input_button2  type=\'button\' value=\'�˶�\'/></td></tr></table>','','');">
				<img id=img7 src="../images/index07.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="login.action?op=bind&user_msn=<ww:property value="user_msn"/>">
				<img id=img8 src="../images/index10.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>
				</li>
                <li  class=ban>
                	116114&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					��������&nbsp;&nbsp;&nbsp;&nbsp;
                	�ֻ���������&nbsp;&nbsp;&nbsp;&nbsp;
                	ȡ����
                </li>
                <li>
				<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/indexicon09.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ֻ����ƾ���,�ʷ�Ϊ5Ԫ/�£��ֻ�����һ����Ѷ��ҵ��ָ��ý�����������ͨ���ֻ�Ϊ�û��ṩ������Ѷ��Ϣ�ķ���</td></tr><tr><td align=center><input id=\'dingzhi\'  class=input_button2  type=\'button\' value=\'����\'/>&nbsp;&nbsp;<input id=\'tuiding\'  class=input_button2  type=\'button\' value=\'�˶�\'/></td></tr></table>','','');">
	            <img id=img9 src="../images/index09.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
	            </a>&nbsp;&nbsp;
	            <a href="#"  onclick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/indexicon08.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������챨���������û�ÿ���Զ�����һ����ǰ���������ܶ�͵�ǰԤ�������Ķ��ţ�Ԥ����������15Ԫʱ�������û���ʱ��ֵ��</td></tr><tr><td align=center><input id=\'dingzhi\'  class=input_button2  type=\'button\' value=\'����\'/>&nbsp;&nbsp;<input id=\'tuiding\'  class=input_button2  type=\'button\' value=\'�˶�\'/></td></tr></table>','','');">
				<img id=img10 src="../images/index08.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/indexicon11.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ϣ����,�ʷ�Ϊ4Ԫ/�£�ͨ�������ֻ����ſ����˽⵽��ͨΥ����¼�����·���ۺ���Ϣ��</td></tr><tr><td align=center><input id=\'dingzhi\'  class=input_button2  type=\'button\' value=\'����\'/>&nbsp;&nbsp;<input id=\'tuiding\'  class=input_button2  type=\'button\' value=\'�˶�\'/></td></tr></table>','','');">
				<img id=img11 src="../images/index11.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/indexicon12.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ܱ����������û�ÿ��7���Զ�����һ����ǰ����������ϸ�Ķ��š�</td></tr><tr><td align=center><input id=\'dingzhi\'  class=input_button2  type=\'button\' value=\'����\'/>&nbsp;&nbsp;<input id=\'tuiding\'  class=input_button2  type=\'button\' value=\'�˶�\'/></td></tr></table>','','');">
				<img id=img12 src="../images/index12.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>
	            </li>
                <li class=ban>
                	�ֻ����ƾ���&nbsp;&nbsp;&nbsp;
                	�������챨&nbsp;&nbsp;
                	������Ϣ����&nbsp;&nbsp;
                	�������ܱ�
                </li>
                <li>
				<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/indexicon13.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ɱ������,�ʷ�Ϊ8Ԫ/��,����ͨѶ�ѣ�����ɱ��ҵ����McAfee��˾���й���ͨ������ҵ���ǻ����й���ͨ��������ƽ̨�ϵĹ�����ֵ��ҵ��</td></tr><tr><td align=center><input id=\'dingzhi\'  class=input_button2  type=\'button\' value=\'����\'/>&nbsp;&nbsp;<input id=\'tuiding\'  class=input_button2  type=\'button\' value=\'�˶�\'/></td></tr></table>','','');">
				<img id=img13 src="../images/index13.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)"></a></td>
				</a>&nbsp;&nbsp;
				<a href="../telbook/telbook.action?op=view&user_msn=<ww:property value="user_msn"/>"><img id=img15 src="../images/index15.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="../music/music.action?op=music&user_msn=<ww:property value="user_msn"/>"><img id=img16 src="../images/index16.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				<a href="../club/index.jsp"><img id=img14 src="../images/teseclub.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>
				</li>
                <li class=ban>����ɱ������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	ͨѶ¼&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	���嶨��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	��ɫ���ֲ�
                	</li>
        </ul>
		</div>
		<div id=content>
        <ul>
                <li>
				
				<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/game/indexicon_game3.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ϸ˵����</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.����ƶ�����������ͼ���ϣ�</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.������ɿ��϶���������(��ɫ�����Ѹ���ƶ�)��</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.ע������ɫ���顣��Ҫ������Χ��ɫ���� </td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������һ�����ܼ�ֵ�18�����ϣ���������Ǹ���ţ������������һ����ɣ��������ܼ�ֶ�á�</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���λ��10��25����12��26�գ�ÿ�ܽ�����������һ�������ͨ100Ԫ���ѳ�ֵ��һ�ţ��ڶ����͵����������50Ԫ���ѳ�ֵ��һ�ţ�ǰ�������ɻ���й���ͨ��ӡ������20Ԫ���鿨һ�ţ�����ǰʮ����������Ա�ɻ���й���ͨ��ӡ������10Ԫ���鿨һ�š�</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ͻ�Ʒ����һ�ܵڶ���������ͨ�����ŷ�ʽ�������뷢�͵����ߵ���ͨ�ֻ����뵱�С�</td></tr><tr><td align=center><input id=\'begin\'  class=input_button2  type=\'button\' value=\'��ʼ\'/>&nbsp;&nbsp;<input id=\'end\'  class=input_button2  type=\'button\' value=\'�˳�\'/></td></tr></table>','','');">
				
            	<img id=img21 src="../images/game/indexicon_game.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)" >
            	</a>&nbsp;&nbsp;
				<a href="http://www.x-robot.cn/?msn=<ww:property value="user_msn"/>&refer=www.x-robot.cn/unicom/index.jsp#name"><img id=img22 src="../images/nametest.png" width="60" height="60" border="0" style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)">
				</a>&nbsp;&nbsp;
				
				</li>
                <li class=ban>
                	��ֶ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					��������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
                </li>     
        </ul>
		</div>
		  <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban"></td>
			<td width="22%" align="center" class="ban"></td>
			<td width="22%" align="center" class="ban"></td>
			<td width="22%" align="center" class="ban"></td>
			<td width="6%" align="center"></td>
          </tr> </form>
        </table>
        
	  </td>
		<td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" ></td>
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
