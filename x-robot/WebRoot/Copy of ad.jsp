<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>

<script language=JavaScript>
var imgUrl=new Array();
var imgLink=new Array();
var imgtext=new Array();
var adNum=0;

imgUrl[1]="images/guanggao1.jpg";
imgtext[1]="沃知道！";
imgLink[1]="http://www.x-robot.cn/robotweb/woknow.action?userid=&chanel=other&from=mobile";
imgUrl[2]="images/guanggao2.jpg";
imgtext[2]="业务定制与使用！";
imgLink[2]="../index.jsp";
imgUrl[3]="images/guanggao3.jpg";
imgtext[3]="休闲广场！";
imgLink[3]="http://www.x-robot.cn/index.html?msn=&refer=www.x-robot.cn/unicom/index.jsp";
imgUrl[4]="images/guanggao4.jpg";
imgtext[4]="邀请好友赢奖品！";
imgLink[4]="../invitebuddy/index.jsp";

var imgPre=new Array();
var count=0;
for (i=1;i<=4;i++) {
	if( (imgUrl[i]!="") && (imgLink[i]!="") ) {
		count++;
	} else {
		break;
	}
}
function playTran(){
	if (document.all)
		imgInit.filters.revealTrans.play();
}
var key=0;
function nextAd(){
	alert(0);
	if(adNum<count)adNum++ ;
	else adNum=1;
	
	if( key==0 ){
		key=1;
	} else if (document.all){
		imgInit.filters.revealTrans.Transition=10;
		imgInit.filters.revealTrans.apply();
                   playTran();

	}
	document.images.imgInit.src="images/guanggao1.jpg";
        //focustext.innerHTML="<a href="+imgLink[adNum]+"  target=_blank>"+imgtext[adNum]+"</a>";
		setTimeout("nextAd()", 3000); //控制时间
}

function nextAd2(){
	if(adNum<count)adNum++ ;
	else adNum=1;
	
	if( key==0 ){
		key=1;
	} else if (document.all){
		imgInit.filters.revealTrans.Transition=10;
		imgInit.filters.revealTrans.apply();
                   playTran();

	}
	document.getElementById("imgInit").src=imgUrl[adNum];
        //focustext.innerHTML="<a href="+imgLink[adNum]+"   target=_blank>"+imgtext[adNum]+"</a>";
		
}
function prondAd(){
	if(adNum>1)adNum-- ;
	else adNum=4;
	
	if( key==0 ){
		key=1;
	} else if (document.all){
		imgInit.filters.revealTrans.Transition=10;
		imgInit.filters.revealTrans.apply();
                   playTran();

	}
	document.images.imgInit.src=imgUrl[adNum];
       // focustext.innerHTML="<a href="+imgLink[adNum]+"   target=_blank>"+imgtext[adNum]+"</a>";
		
}
function goUrl(){
window.open(imgLink[adNum],'_self');
}
</script>
</head>
<body>
<DIV align="center" >
<a href="javascript:goUrl()" _fcksavedurl="javascript:goUrl()">
<img style="FILTER: revealTrans(duration=1,transition=5);border-color:black;color:#000000" src="javascript:nextAd();" _fcksavedurl="javascript:nextAd()" width="376" height="100" border="0"  name="imgInit" id="imgInit"></a>
</div>
</body>
</html>
