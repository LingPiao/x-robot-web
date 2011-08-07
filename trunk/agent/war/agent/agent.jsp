<%@ page pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
<%@ page import="net.sf.service.common.Constants"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	Object agent = request.getSession().getAttribute(
			Constants.AGENT_SESSSION_KEY);
	if (agent == null) {
		response.sendRedirect("./login.jsp");
	}
	String agentName = request.getParameter("agent");
	String agentType = request.getParameter("agentType");
	String mobileNo = request.getParameter("mobileNo");
	String agentTypeLable = "普通坐席";
	if (agentType != null && agentType.equals(Constants.VIP_MANAGER)) {
		agentTypeLable = "客户经理";
	}
%>
<html>
<title>联通贝贝坐席</title>
<head>
<script type="text/javascript" src="../js/cookie.js"></script>
<!-- >> EXT LIBS -->
<link rel="stylesheet" type="text/css" href="../js/ext/resources/css/ext-all.css" />
<link rel="stylesheet" type="text/css" href="../images/agent/help.css" />

<script type="text/javascript" src="../js/ext/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../js/ext/ext-core.js"></script>
<script type="text/javascript" src="../js/ext/ext-all.js"></script>
<!-- << EXT LIBS -->
<style type="text/css">
html,body {
	font: normal 12px verdana;
	margin: 0;
	padding: 0;
	border: 0 none;
	overflow: hidden;
	height: 100%;
}

p {
	margin: 5px;
}

.settings {
	background-image: url(../js/ext/shared/icons/fam/folder_wrench.png);
}

.nav {
	background-image: url(../js/ext/shared/icons/fam/folder_go.png);
}

.remove {
	background-image: url(../js/ext/shared/icons/fam/delete.gif) !important;
}

.add {
	background-image: url(../js/ext/shared/icons/fam/add.gif) !important;
}

.save {
	background-image: url(../js/ext/shared/icons/save.gif) !important;
}

.update {
	background-image: url(../js/ext/shared/icons/fam/table_refresh.png)
		!important;
}

.clean {
	background-image: url(../js/ext/shared/icons/fam/cross.gif) !important;
}

#appletContainer {
	visibility: hidden;
	visibility: true !important;
}

.x-date-middle {
	padding-top: 2px;
	padding-bottom: 2px;
	width: 130px; /* FF3 */
}

.hand {
	cursor: hand;
	cursor: pointer !important;
}
</style>
<script type="text/javascript">
agentName="<%=agentName%>";
questionRefReqDelay="<%=Constants.QUESTIONREF_REQUEST_DELAY%>";
isSearch = false;
function notify(){
	if(!isSearch){
		ds.reload();
	}
	if(document.getElementById("ring").value=="1"){
		document.getElementById('ringPlayer').src = "ring.wav";
	}
	if(isSearch){
		var c = window.confirm("系统有新咨询问题,查询状态无法显示,需要自动切换到问题列表吗?");
		if(c){
			cleanSearch();
		}
	}
}
function updateQuestion(qid,status){
	ds.getById(qid).set('q_state',status); 
}

function htmlConvert(value){
	var r="";
	if(value){
		r = Ext.util.Format.htmlEncode(value);
		var reg = new RegExp("\r\n", "g");
		r = r.replace(reg, "<br>");
	}
	return r;
}

function setRing() {
	var r = document.getElementById("ring");
	var rf = document.getElementById("ring-flag");
	if (r.value == "0") {
		r.value = "1";
		var d = new Date();
		rf.src = "../images/agent/c.png";
		d.setDate(d.getDate() + 365);
		Cookies.set("ring", r.value, d);
	} else {
		r.value = "0";
		var d = new Date();
		rf.src = "../images/agent/c_2.png";
		d.setDate(d.getDate() - 10);
		Cookies.set("ring", "", d);
	}
}

function MM_swapImgRestore() { //v3.0
	var i, x, a = document.MM_sr;
	for (i = 0; a && i < a.length && (x = a[i]) && x.oSrc; i++)
		x.src = x.oSrc;
}
function MM_preloadImages() { //v3.0
	var d = document;
	if (d.images) {
		if (!d.MM_p)
			d.MM_p = new Array();
		var i, j = d.MM_p.length, a = MM_preloadImages.arguments;
		for (i = 0; i < a.length; i++)
			if (a[i].indexOf("#") != 0) {
				d.MM_p[j] = new Image;
				d.MM_p[j++].src = a[i];
			}
	}
}

function MM_findObj(n, d) { //v4.01
	var p, i, x;
	if (!d)
		d = document;
	if ((p = n.indexOf("?")) > 0 && parent.frames.length) {
		d = parent.frames[n.substring(p + 1)].document;
		n = n.substring(0, p);
	}
	if (!(x = d[n]) && d.all)
		x = d.all[n];
	for (i = 0; !x && i < d.forms.length; i++)
		x = d.forms[i][n];
	for (i = 0; !x && d.layers && i < d.layers.length; i++)
		x = MM_findObj(n, d.layers[i].document);
	if (!x && d.getElementById)
		x = d.getElementById(n);
	return x;
}

function MM_swapImage() { //v3.0
	var i, j = 0, x, a = MM_swapImage.arguments;
	document.MM_sr = new Array;
	for (i = 0; i < (a.length - 2); i += 3)
		if ((x = MM_findObj(a[i])) != null) {
			document.MM_sr[j++] = x;
			if (!x.oSrc)
				x.oSrc = x.src;
			x.src = a[i + 2];
		}
}
</script>
</head>
<body
	onload="MM_preloadImages('images/a_1.png','images/b_1.png','images/e_1.png','images/c_1.png','images/d_1.png','images/k_1.png')">

<script type="text/javascript" src="./questions.js"></script>

<div id="north">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="top_bg">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td width="7%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/agent/logo.png" width="92" height="52" /></td>
				<td width="63%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎 <%=agentName%> [<span class="red"><%=agentTypeLable%></span>]
				</td>
				<td width="30%" align="right">
				<table width="100%" border="0" cellspacing="2" cellpadding="2">
					<tr>
						<td><img src="../images/agent/a.png" name="Image2" width="66" height="65" border="0" id="Image2" alt="状态:在线"
							title="状态:在线" /></td>
						<td><span id="showAgents" class="hand" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image3','','../images/agent/b_1.png',1)"><img src="../images/agent/b.png" name="Image3"
							width="66" height="65" border="0" id="Image3" alt="坐席查看" title="坐席查看" /></span></td>
						<td><span id="shortcutAnswerMan" class="hand" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image7','','../images/agent/k_1.png',1)"><img src="../images/agent/k.png" name="Image7"
							width="66" height="65" border="0" id="Image7" alt="快捷回复管理" title="快捷回复管理" /></span></td>
						<%
							if (agentType != null && agentType.equals(Constants.VIP_MANAGER)) {
						%>
						<td><span id="customerMan" class="hand" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image4','','../images/agent/e_1.png',1)"><img src="../images/agent/e.png" name="Image4"
							width="66" height="65" border="0" id="Image4" alt="用户管理" title="用户管理" /></span></td>
						<%
							}
						%>
						<td><input id="ring" name="ring" type="hidden" value="1" /><span class="hand" onclick="setRing()"><img
							id="ring-flag" src="../images/agent/c.png" name="Image5" width="66" height="65" border="0" id="Image5" alt="声音提示"
							title="声音提示" /></span></td>
						<td><a href="./agentServer?act=logout" onmouseout="MM_swapImgRestore()"
							onmouseover="MM_swapImage('Image6','','../images/agent/d_1.png',1)"><img src="../images/agent/d.png" name="Image6"
							width="66" height="65" border="0" id="Image6" alt="注销" title="注销" /></a></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<script type="text/javascript">
if(Cookies.get("ring")!="1"){
	document.getElementById("ring").value="0";
	var rf = document.getElementById("ring-flag");
	rf.src = "../images/agent/c_2.png";
}
</script></div>
<div id="history"></div>
<div id="response"><textarea id="resContent" name="resContent" rows="6" style="width: 100%; height: 100%"></textarea></div>
<div id="question-grid" style="width: 200px; height: 200px;"></div>
<div id="west-north"></div>
<div id="west-center"></div>

<div id="appletContainer"><object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" width="0px" height="0px"
	style="border-width: 0;" id="agent" name="agent"
	codebase="http://java.sun.com/products/plugin/autodl/jinstall-1_5_0-windows-i586.cab#Version=1,5,0,0">
	<PARAM NAME="ARCHIVE" VALUE="AgentClient.jar" />
	<PARAM NAME="CODE" VALUE="net.sf.service.agent.client.Agent" />
	<param NAME="type" VALUE="application/x-java-applet;jpi-version=1.5.0">
	<PARAM NAME="CODEBASE" VALUE=".">
	<param NAME="scriptable" VALUE="true">
	<param NAME="agent" VALUE="<%=agentName%>">
	<param NAME="agentType" VALUE="<%=agentType%>">
	<param NAME="mobileNo" VALUE="<%=mobileNo%>">

	<comment> <embed type="application/x-java-applet;version=1.5.0" code="net.sf.service.agent.client.Agent"
		ARCHIVE="AgentClient.jar" codebase="." pluginspage="http://java.sun.com/j2se/1.5.0/download.html" scriptable="true"
		agent="<%=agentName%>" agentType="<%=agentType%>" mobileNo="<%=mobileNo%>">
	<noembed> 浏览器没不支持JAVA环境 </noembed>
	</embed> </comment> </object></div>


<script type="text/javascript" src="./agentsWin.js"></script>
<script type="text/javascript" src="./customersWin.js"></script>
<script type="text/javascript" src="./shortcutAnswersWin.js"></script>
<bgsound id="ringPlayer" name="ringPlayer" src="" loop="0" />

<iframe src="./keepAlive.jsp" width="0" height="0" style="visibility: hidden;"></iframe>
</body>
</html>