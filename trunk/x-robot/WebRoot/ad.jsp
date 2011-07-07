<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<html>
<head>
<title>图片变换特效广告代码</title> 

</head>
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <script language=JavaScript> 
<!--
var bannerAD=new Array(); 
var bannerADlink=new Array(); 
var adNum=0; 


bannerAD[0]="../images/guanggao1.jpg"; 
bannerADlink[0]="http://www.x-robot.cn/robotweb/woknow.action?userid=<ww:property value="user_msn"/>&chanel=other&from=msn"

bannerAD[1]="../images/guanggao2.jpg"; 
bannerADlink[1]="../index.jsp"

bannerAD[2]="../images/guanggao3.jpg"; 
bannerADlink[2]="http://www.x-robot.cn/index.html?msn=<ww:property value="user_msn"/>&refer=www.x-robot.cn/unicom/index.jsp"

bannerAD[3]="../images/guanggao4.jpg"; 
bannerADlink[3]="../invitebuddy/index.jsp"

var preloadedimages=new Array(); 
for (i=1;i<bannerAD.length;i++){ 
preloadedimages[i]=new Image(); 
preloadedimages[i].src=bannerAD[i]; 
} 

function setTransition(){ 
if (document.all){ 
bannerADrotator.filters.revealTrans.Transition=Math.floor(Math.random()*23); 
bannerADrotator.filters.revealTrans.apply(); 
} 
} 

function playTransition(){ 
if (document.all) 
bannerADrotator.filters.revealTrans.play() 
} 

function nextAd(){ 
if(adNum<bannerAD.length-1)adNum++ ; 
else adNum=0; 
setTransition(); 
document.images.bannerADrotator.src=bannerAD[adNum]; 
playTransition(); 
theTimer=setTimeout("nextAd()", 4000); 
} 

function jump2url(){ 
jumpUrl=bannerADlink[adNum]; 
jumpTarget='_self'; 
if (jumpUrl != ''){ 
if (jumpTarget != '')window.open(jumpUrl,jumpTarget); 
else location.href=jumpUrl; 
} 
} 
function displayStatusMsg() { 
status=bannerADlink[adNum]; 
document.returnValue = true; 
} 

//--> 
</script>
      <tr>
        <td align="center">
        <table  border="0" cellpadding="1" cellspacing="6" bgcolor="#E8E8E8">
            <tr>
              <td bgcolor="#FFFFFF"><a onMouseOver="displayStatusMsg();return document.returnValue" href="javascript:jump2url()"><img src="search_banner.gif" 
name=bannerADrotator width=379 height=100 border=0 align="middle" 
style="FILTER: revealTrans(duration=2,transition=40)"></a>
                  <script language=JavaScript>nextAd()</script></td>
            </tr>
        </table></td>
      </tr>
    </table>
</body></html>