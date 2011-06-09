<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html>
<head>
<title>联通机器人贝贝</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<!-- 打开新窗口，背景变灰开始 -->
<style type="text/css">
.STYLE1 {font-size: 11px}

#massage_box {
	position: absolute;
	left: expression((body.clientWidth-350)/ 2 );
	top: expression((body.clientHeight-200)/ 2 );
	width: 380px;
	height: 50px;
	filter: dropshadow(color = #666666, offx = 3, offy = 3,positive = 2);
	z-index: 2;
	visibility: hidden
}

#mask {
	position: absolute;
	top: 0;
	left: 0;
	width: expression(body.scrollWidth);
	height: expression(body.scrollHeight);
	background: #d3ddea;
	filter: ALPHA(opacity =60);
	z-index: 1;
	visibility: hidden
}

.massage {
	border: orange solid;
	border-width: 1 1 3 1;
	height: 200px;
	overflow-y: auto;
	background: #fff;
	color: #036;
	font-size: 12px;
	line-height: 150%
}

.header {
	background: rgb(89,2,11);
	height: 24px;
	padding: 3 5 0 5;
	color: #fff;
	cursor: move;
}
</style>
<script type="text/javascript" language="javascript">

function sAlert(str,dingzhi1,tuiding1){
	var msgw,msgh,bordercolor;
	msgw=400;//提示窗口的宽度
	msgh=100;//提示窗口的高度
	titleheight=25 //提示窗口标题高度
	bordercolor="rgb(89,2,11)";//提示窗口的边框颜色
	titlecolor="#59B3F0";//提示窗口的标题颜色

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
	msgObj.style.textAlign = "left";
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
	title.innerHTML="关闭";
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
			
			}
			tuiding=document.getElementById("tuiding");
			tuiding.onclick=function(){
			
			document.body.removeChild(bgObj);
			document.getElementById("msgDiv").removeChild(title);
			document.body.removeChild(msgObj);
			
			}
		}
	}

</script>
<script>
//变大
function max(id){
eval(id+".style.pixelWidth=65");
eval(id+".style.pixelHeight=65");
}
//变小
function min(id){
eval(id+".style.pixelWidth=60");
eval(id+".style.pixelHeight=60");
}
</script>
<!--实现层移动-->
<script language="javascript">
	var Obj=''
	//document.onmouseup=MUp
	//document.onmousemove=MMove
	var isIe=(document.all)?true:false;
	
	function centerLayer( obj ) {
	    var ocw = obj.clientWidth;
	    var och = obj.clientHeight;
	    var bsl = document.body.scrollLeft || document.documentElement.scrollLeft;
	    var bst = document.body.scrollTop || document.documentElement.scrollTop;
	    var bcw = document.body.clientWidth || document.documentElement.clientWidth;
	    var bch = document.body.clientHeight || document.documentElement.clientHeight;
	    var osl = bsl + Math.floor( ( bcw - ocw ) / 2 );
	        osl = Math.max( bsl , osl );
	    var ost = bst + Math.floor( ( bch - och ) / 2 );
	        ost = Math.max( bst , ost );
	    obj.style.left  = osl + 'px';
	    //obj.style.top   = ost + 'px';
	    obj.style.top   = 120 + 'px';
	}

	function closeLayer(){
		massage_box.style.visibility='hidden'; 
		mask.style.visibility='hidden';//关闭子窗口
		if(isIe)
			setSelectState('');		
	}
   
	function openLayer(){
		mask.style.visibility='visible';
		massage_box.style.visibility='visible';
		var obj = document.getElementById('massage_box');
		centerLayer( obj );
		if(isIe)
			setSelectState('hidden');
	}
	function setSelectState(state)
	{
		var objl=document.getElementsByTagName('select');
		for(var i=0;i<objl.length;i++)
		{
			objl[i].style.visibility=state;
		}
	}
</script>
<!-- 打开新窗口，背景变灰结束 -->
</head>
<body bgcolor="#FFFFFF" onload="openLayer()" id=body>
<div id="massage_box">
			<div class="header" >
				<table height="24" border="0" cellpadding="0" cellspacing="0"
					width="100%"
					style="color: #fff; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px;">
					<tr>
						<td>友情提示</td>
						<td align="right">
							
							<span onClick="closeLayer();" style="cursor: hand">【关闭】</span>
						</td>
					</tr>
				</table>
			</div>
			<div class="massage">
				&nbsp;&nbsp;&nbsp;&nbsp;尊敬的用户您好：<br/>

				&nbsp;&nbsp;&nbsp;&nbsp;欢迎使用联通机器人服务，本服务目前只针对四川联通的客户提供全面的业务服务，对于其他省份的用户暂时无法提供全面的支持。如果您是四川联通的手机用户，请您将您的MSN帐号与手机号码绑定，这样我们会给您提供全面的业务服务。
				
			</div>
</div>
<div id="mask"></div>
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
	  <td width="397" height="511" valign="top" background="../images/main_1101.jpg">
		<table width="395" height="120" align="center" background="../images/bg_01.jpg">
          <tr>
            <td align="center" valign="middle">
			<%@ include file="../ad.jsp"%>
			</td>
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
            
            <img id=img1 src="../images/index01.png" width="60" height="60" border="0"  style="cursor:pointer;FILTER: alpha(opacity=50)" >

            </td>
			<td width="22%" align="center">
			
			<img id=img2 src="../images/index02.png" width="60" height="60" border="0"  style="cursor:pointer;FILTER: alpha(opacity=50)"></td>
			<td width="22%" align="center">
			<a href="#" onClick="sAlert('<table bgcolor=\'#ffffff\'><tr><td align=center><img src=\'../images/game/indexicon_game.png\'/></td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;游戏说明：</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.鼠标移动到“贝贝”图像上；</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.点击后不松开拖动“贝贝”(蓝色方块会迅速移动)；</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.注意躲避蓝色方块。不要碰到周围红色区域。 </td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果你第一次玩能坚持到18秒以上，你算得上是个天才；邀请你的朋友一块玩吧！看看他能坚持多久。</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本次活动自10月25日至12月26日，每周进行排名，第一名获得联通100元话费充值卡一张，第二名和第三名各获得50元话费充值卡一张，前三名还可获得中国联通冲印我世界20元体验卡一张；排名前十名的其他人员可获得中国联通冲印我世界10元体验卡一张。</td></tr><tr><td class=STYLE1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;以上奖品在下一周第二个工作日通过短信方式将电子码发送到获奖者的联通手机号码当中。</td></tr><tr><td align=center><input id=\'begin\'  class=input_button2  type=\'button\' value=\'开始\'/>&nbsp;&nbsp;<input id=\'end\'  class=input_button2  type=\'button\' value=\'退出\'/></td></tr></table>','','');">
							<img id=img21 src="../images/game/indexicon_game.png" width="60" height="60" border="0"  style="cursor:pointer;" onMouseOut="min(this.id)" onMouseOver="max(this.id)" >
            	</a>
			</td>
			<td width="22%" align="center">
			<a href="login.action?op=bind&user_msn=<ww:property value="user_msn"/>">
			<img id=img4 src="../images/index04.png" width="60" height="60" border="0"  style="cursor:pointer;" >
			</a></td>
			<td width="6%" align="center"></td>
          </tr>
          <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">话费查询</td>
			<td width="22%" align="center" class="ban">发送彩信</td>
			<td width="22%" align="center" class="ban">坚持多久</td>
			<td width="22%" align="center" class="ban">身份绑定</td>
			<td width="6%" align="center"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
            <td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="6%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center">
            <img id=img5  src="../images/index05.png" width="60" height="60" border="0"  style="cursor:pointer;FILTER: alpha(opacity=50)"></td>
			<td width="22%" align="center"><img id=img6 src="../images/index06.png" width="60" height="60" border="0"  style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img7 src="../images/index07.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img8 src="../images/index08.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="6%" align="center"></td>
          </tr>
          <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">发送短信</td>
			<td width="22%" align="center" class="ban">定制彩铃</td>
			<td width="22%" align="center" class="ban">手机报精华版</td>
			<td width="22%" align="center" class="ban">话费天天报</td>
			<td width="6%" align="center"></td>
          </tr> 
		    <tr>
		    <td width="6%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
            <td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="6%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
          </tr>
	      <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center"><img id=img9 src="../images/index09.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img10 src="../images/index10.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img11 src="../images/index11.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img12 src="../images/index12.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="6%" align="center"></td>
          </tr>
          <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">手机报财经版</td>
			<td width="22%" align="center" class="ban">漏话服务定制</td>
			<td width="22%" align="center" class="ban">交管信息定制</td>
			<td width="22%" align="center" class="ban">话费周周报</td>
			<td width="6%" align="center"></td>
          </tr> 
		    <tr>
		    <td width="6%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
            <td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="22%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
			<td width="6%" align="center"><img src="../images/touming.gif" width="1" height="7"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center"><img id=img13 src="../images/index13.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img14 src="../images/index14.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img15 src="../images/index15.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="22%" align="center"><img id=img16 src="../images/index16.png" width="60" height="60" border="0" style="cursor:pointer;FILTER: alpha(opacity=50)" ></td>
			<td width="6%" align="center"></td>
          </tr>
		  <tr>
		    <td width="6%" align="center"></td>
            <td width="22%" align="center" class="ban">如意杀毒定制</td>
			<td width="22%" align="center" class="ban">iphone知道</td>
			<td width="22%" align="center" class="ban">通讯录</td>
			<td width="22%" align="center" class="ban">炫铃定制</td>
			<td width="6%" align="center"></td>
          </tr> 
        </table>
	  </td>
		<td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_140.jpg"><table width="100%" height="100%">
          <tr>
            <td width="20%" align="center" valign="top">&nbsp;</td>
			<td width="20%" align="right" valign="top"><img src="../images/touming.gif" width="70" height="30"></td>
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
</html>
