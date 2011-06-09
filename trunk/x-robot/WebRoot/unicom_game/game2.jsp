<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>积分查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<STYLE type=text/css>BODY {
	FONT-SIZE: 12px; MARGIN: 0px; repeat-x: 
}
DIV {
	MARGIN-LEFT: auto; COLOR: #666666; LINE-HEIGHT: 24px; MARGIN-RIGHT: auto; FONT-FAMILY: "Verdana"
}
.clearfix:unknown {
	CLEAR: both; DISPLAY: block; VISIBILITY: hidden; HEIGHT: 0px; content: "."
}
.clearfix {
	
}
HTML .clearfix {
	HEIGHT: 1%
}
.STYLE1 {
	COLOR: #666666
}
#dazi {
	FONT-WEIGHT: bold; FONT-SIZE: 16px; COLOR: #f00
}
A {
	FONT-WEIGHT: bold; FONT-SIZE: 16px; COLOR: #f00
}
</STYLE>

<SCRIPT type=text/javascript>
isNS4 = (document.layers) ? true : false;
isIE4 = (document.all && !document.getElementById) ? true : false;
isIE5 = (document.all && document.getElementById) ? true : false;
isNS6 = (!document.all && document.getElementById) ? true : false;
var curX, curY, curX2, curY2, boxX, boxY, moving=0, touch=0;
var gametime=0, started=0, speed;
var starttime, endtime, finaltime=0; //pass finaltime to popup window to ask for initials
var enemyxdir = new Array(1,1,1,1);
var enemyydir = new Array(1,1,1,1);

if (isNS4 || isNS6){
document.captureEvents(Event.MOUSEUP|Event.MOUSEDOWN|Event.MOUSEMOVE);
}
document.onmousedown = start;
document.onmousemove = checkLocation;
document.onmouseup = stop;

function startclock() {var today = new Date(); starttime = today.getTime();}
function endclock() {var today = new Date(); endtime = today.getTime();}
function calctime() {var time = (endtime - starttime - 0)/1000;	return time;}

function giveposX(divname) {
	if (isNS4) var posLeft = document.layers[divname].left;
	else if (isIE4 || isIE5) var posLeft = document.all(divname).style.pixelLeft;
	else if (isNS6) var posLeft = parseInt(document.getElementById(divname).style.left + "");
	return posLeft;
}

function giveposY(divname) {
	if (isNS4) var posTop = document.layers[divname].top;
	else if (isIE4 || isIE5) var posTop = document.all(divname).style.pixelTop;
	else if (isNS6) var posTop = parseInt(document.getElementById(divname).style.top + "");
	return posTop;
}

function setposX(divname, xpos) {
	if (isNS4) document.layers[divname].left = xpos;
	else if (isIE4 || isIE5) document.all(divname).style.pixelLeft = xpos;
	else if (isNS6) document.getElementById(divname).style.left = xpos;
}

function setposY(divname, ypos) {
	if (isNS4) document.layers[divname].top = ypos;
	else if (isIE4 || isIE5) document.all(divname).style.pixelTop = ypos;
	else if (isNS6) document.getElementById(divname).style.top = ypos;
}

function givesize(divname, dimension) {
	var divsize = 0;
		if (dimension == 'y') {
			if (isNS4) divsize = document.layers[divname].clip.height;
			else if (isIE4 || isIE5) divsize = document.all(divname).style.pixelHeight;
			else if (isNS6) divsize = parseInt(document.getElementById(divname).style.height + "");
		}
		else if (dimension == 'x') {
			if (isNS4) divsize = document.layers[divname].clip.width;
			else if (isIE4 || isIE5) divsize = document.all(divname).style.pixelWidth;
			else if (isNS6) divsize = parseInt(document.getElementById(divname).style.width + "");
		}

	return divsize;
}


// check to see if 'box' is touching 'enemy1'
function checktouching(num) {

	var enemy = "enemy" + num + ""
	var difX = giveposX('box') - giveposX(enemy) - 0; // -0 converts to integer
	var difY = giveposY('box') - giveposY(enemy) - 0;

	// set touch = 1 if it is touching an enemy
	if (difX > (-1 * givesize('box', 'x')) && difX < givesize(enemy, 'x') && difY > (-1 * givesize('box', 'y')) && difY < givesize(enemy, 'y')) {
		touch = 1;
	}
	else touch = 0;

}

function movenemy(num,step_x,step_y){

	var enemy = "enemy" + num + ""
	var enemyx = givesize(enemy, 'x');
	var enemyy = givesize(enemy, 'y');

	if (giveposX(enemy) >= (450 - enemyx) || giveposX(enemy) <= 0) {
		enemyxdir[num] = -1 * enemyxdir[num];
		}
	if (giveposY(enemy) >= (450 - enemyy) || giveposY(enemy) <= 0) {
		enemyydir[num] = -1 * enemyydir[num];
		}

	var newposx = giveposX(enemy) + (step_x*enemyxdir[num]) + 0;
	var newposy = giveposY(enemy) + (step_y*enemyydir[num]) + 0;

	setposX(enemy, newposx);
	setposY(enemy, newposy);

	checktouching(num + "");
	if (touch == 1) {
		stop(); reset();
		}
}

function movenemies() {

	gametime = gametime + 1

	if (gametime >= 0 && gametime < 100) speed = 80;
	else if (gametime >= 100 &&  gametime < 200) speed = 60;
	else if (gametime >= 200 &&  gametime < 300) speed = 40;
	else if (gametime >= 300 &&  gametime < 400) speed = 30;
	else if (gametime >= 400 &&  gametime < 500) speed = 20;
	else speed = 10;
	// window.status = "speed:  " + speed + "   gametime: " + gametime;

	movenemy(0,-10,12);
	movenemy(1,-12,-20);
	movenemy(2,15,-13);
	movenemy(3,17,11);

	setTimeout(movenemies,speed);
}

function start(e) {

	if (started == 0) {	movenemies(); 	startclock(); 	started = 1;	}

	curX = (isNS4 || isNS6) ? e.pageX : window.event.x ;
    curY = (isNS4 || isNS6) ? e.pageY : window.event.y ;

	curX2 = eval(curX - 40);
	curY2 = eval(curY - 40);

	boxX = eval(curX - 20);
	boxY = eval(curY - 20);

	var boxleft = giveposX('box');
	var boxtop = giveposY('box');

	if (curX > boxleft && curX2 < boxleft && curY > boxtop && curY2 < boxtop) {

		moving = 1;
		setposX('box', boxX);
		setposY('box', boxY);

		if (isNS4 || isNS6){
		document.captureEvents(Event.MOUSEMOVE);
		}
	}
}

function stop(e){
    moving=0;
	if (isNS4 || isNS6){
	document.releaseEvents(Event.MOUSEMOVE);
	}
}

function reset(e){
    endclock();
	moving=0;
	if (isNS4 || isNS6){
		document.releaseEvents(Event.MOUSEMOVE);
		}
	if (finaltime == 0) {
		finaltime = calctime();
		//window.location.href="game.action?op=game1view&user_msn=<ww:property value="user_msn"/>&game_results="+finaltime;
		window.alert('你坚持了 ' + finaltime + ' 秒.. ');
		//document.getElementById("txt").innerHTML = "<font color=white>你坚持了[" + finaltime + "] 秒.. </font>";
		document.location.reload();
		}
}

function checkLocation(e){

		curX = (isNS4 || isNS6) ? e.pageX : window.event.x ;
        curY = (isNS4 || isNS6) ? e.pageY : window.event.y ;

		boxX = eval(curX - 20);
		boxY = eval(curY - 20);

	checktouching('1');

	if (moving == 1 && touch == 0){

			setposX('box',boxX);
			setposY('box',boxY);

			if (curY > 69 && curX > 69 && curY < 381 && curX < 381) return false;
			else stop(); reset();
	}

	else if (touch == 1){
	stop(); reset();
	}

}

</SCRIPT></head>
<body bgcolor="#FFFFFF">
<table width="477" height="735" border="0" align="left" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="../images/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="../images/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="../images/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<tr>
		<td width="397" height="52">
			<img src="../images/main_04.jpg" width="41" height="52" alt=""></td>
		<td background="../images/main_05_bg.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="52"><br>
            <img src="../images/nav_left.gif" width="33" height="23"></td>
            <td align="center" valign="top"><img src="../images/banner_unicom.gif" width="208" height="44"></td>
            <td width="33"><br>
            <img src="../images/nav_right.gif" width="33" height="23"></td>
          </tr>
        </table></td>
<td>
			<img src="../images/main_06.jpg" width="39" height="52" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_07.jpg" width="41" height="41" alt=""></td>
		<td width="397" height="41" background="../images/main_08.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="41">&nbsp;</td>
            <td><a href="../index.html"><img src="../images/index.gif" width="38" height="15" border="0" onMouseOver="this.src='../images/index_link.gif'" onMouseOut="this.src='../images/index.gif'"></a></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="../images/dot.gif" width="12" height="12"></td>
                <td valign="middle"><a href="#">业务咨询</a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="../images/dot.gif" width="12" height="12"></td>
                <td valign="middle"><a href="#">业务定制和使用</a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="../images/dot.gif" width="12" height="12"></td>
                <td valign="middle"><a href="#">特色俱乐部</a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="../images/dot.gif" width="12" height="12"></td>
                <td valign="middle"><a href="#">休闲广场</a></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
<td>
			<img src="../images/main_09.jpg" width="39" height="41" alt=""></td>
	</tr>
	<tr>
		<td background="../images/main_101.jpg" width="41" height="511">
	  </td>
<td width="397" height="511" align="center" valign="middle" background="../images/main_111.jpg">
<!-- 游戏正文开始 -->
<DIV id=box 
style="LEFT: 205px; WIDTH: 42px; POSITION: absolute; TOP: 205px; HEIGHT: 43px; background-image: url(../images/BB.jpg)">
<TABLE height=40 width=40>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<DIV id=enemy0 
style="LEFT: 270px; WIDTH: 60px; POSITION: absolute; TOP: 60px; HEIGHT: 50px; BACKGROUND-COLOR: rgb(0,0,153)">
<TABLE height=50 width=60>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<DIV id=enemy1 
style="LEFT: 300px; WIDTH: 100px; POSITION: absolute; TOP: 330px; HEIGHT: 20px; BACKGROUND-COLOR: rgb(0,0,153)">
<TABLE height=20 width=100>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<DIV id=enemy2 
style="LEFT: 70px; WIDTH: 30px; POSITION: absolute; TOP: 320px; HEIGHT: 60px; BACKGROUND-COLOR: rgb(0,0,153)">
<TABLE height=60 width=30>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<DIV id=enemy3 
style="LEFT: 70px; WIDTH: 60px; POSITION: absolute; TOP: 70px; HEIGHT: 60px; BACKGROUND-COLOR: rgb(0,0,153)">
<TABLE height=60 width=60>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD></TR></TBODY></TABLE></DIV>
<TABLE cellSpacing=0 cellPadding=0 align=left border=0><!-- row 1 -->
  <TBODY>
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 2 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 3 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 4 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 5 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 6 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 7 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 8 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR><!-- row 9 -->
  <TR>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD>
    <TD height=50 colspan="7" bgColor=#990000>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE>
      <TABLE>
        <TBODY>
          <TR>
          <TD></TD></TR></TBODY>
      </TABLE>
      你坚持了【<div id=txt></div>】秒！ 
      <TABLE>
        <TBODY>
          <TR>
          <TD></TD></TR></TBODY>
      </TABLE>
      <TABLE>
        <TBODY>
          <TR>
          <TD></TD></TR></TBODY>
      </TABLE>
      <TABLE>
        <TBODY>
          <TR>
          <TD></TD></TR></TBODY>
      </TABLE>
      <TABLE>
        <TBODY>
          <TR>
          <TD></TD></TR></TBODY>
      </TABLE>
      <TABLE>
        <TBODY>
          <TR>
          <TD></TD></TR></TBODY>
      </TABLE></TD>
    <TD width=50 bgColor=#990000 height=50>
      <TABLE>
        <TBODY>
        <TR>
          <TD></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=350 border=0>
  <TBODY>
  <TR>
    <TD>&nbsp;</TD></TR></TBODY></TABLE>
<DIV style="FLOAT: left; MARGIN-LEFT: 20px; WIDTH: 400px; TEXT-ALIGN: left">

</DIV>
<!-- 游戏正文结束 -->
</td>
	    <td background="../images/main_121.jpg" width="39" height="511">
	  </td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_14.jpg">&nbsp;</td>
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