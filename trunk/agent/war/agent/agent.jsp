<%@ page pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
<%@ page import="net.sf.service.common.Constants"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	Object agent = request.getSession().getAttribute(Constants.AGENT_SESSSION_KEY);
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

#appletContainer {
	visibility: hidden;
	visibility: true !important;
}

.x-date-middle {
	padding-top: 2px;
	padding-bottom: 2px;
	width: 130px; /* FF3 */
}
</style>
<script type="text/javascript">
agentName="<%=agentName%>";
questionRefReqDelay="<%=Constants.QUESTIONREF_REQUEST_DELAY%>";
isSearch = false;
function notify(){
	if(!isSearch){
		ds.reload();
		if(document.getElementById("ring").value=="1"){
			document.ringPlayer.play();
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
		rf.src = "../images/agent/ring.png";
		d.setDate(d.getDate() + 365);
		Cookies.set("ring", r.value, d);
	} else {
		r.value = "0";
		var d = new Date();
		rf.src = "../images/agent/ring-disabled.png";
		d.setDate(d.getDate() - 10);
		Cookies.set("ring", "", d);
	}
}

</script>
</head>
<body>

<script type="text/javascript" src="./questions.js"></script>
<div id="north" style="background: url(../images/login/banner.jpg) no-repeat">
<div style="float: right; margin-top: 25px">
<p>欢迎:<%=agentName%>&nbsp;[<%=agentTypeLable%>]&nbsp;&nbsp;<img src="../images/agent/online.png" alt="在线" title="在线" /> <span
	id="showAgents" style="cursor: hand"><img src="../images/agent/view_agents.png" alt="坐席查看" title="坐席查看" /></span> <%
 	if (agentType != null && agentType.equals(Constants.VIP_MANAGER)) {
 %><span id="customerMan" style="cursor: hand"><img src="../images/agent/user_mng.png" alt="用户管理" title="用户管理" /></span> <%
 	}
 %><input id="ring" name="ring" type="hidden" value="1" /><span style="cursor: hand" onclick="setRing()"><img
	id="ring-flag" src="../images/agent/ring.png" alt="声音提示" title="声音提示" /></span> <a href="./agentServer?act=logout"><img
	src="../images/agent/logout.png" alt="注销" title="注销" /></a></p>
</div>
<script type="text/javascript">
if(Cookies.get("ring")!="1"){
	document.getElementById("ring").value="0";
	var rf = document.getElementById("ring-flag");
	rf.src = "../images/agent/ring-disabled.png";
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
<embed id="ringPlayer" name="ringPlayer" src="ring.wav" autostart="false" loop="false" hidden="true" />
</body>
</html>