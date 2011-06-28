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
<!-- >> EXT LIBS -->
<link rel="stylesheet" type="text/css" href="../js/ext/resources/css/ext-all.css" />
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

#appletContainer {
	visibility: hidden;
	visibility: true !important;
}
</style>
<script type="text/javascript">
agentName="<%=agentName%>";
function notify(){
	ds.reload();
}
function updateQuestion(qid,status){
	ds.getById(qid).set('q_state',status); 
}
</script>
</head>
<body>

<script type="text/javascript" src="./questions.js"></script>
<div id="north">
<p>用户:<%=agentName%>&nbsp;&nbsp;类型:<%=agentTypeLable%>&nbsp;&nbsp;状态:在线&nbsp;&nbsp; <a href="javascript:void(0);"
	id="showAgents">坐席查看</a></p>
</div>
<div id="history"></div>
<div id="response"><textarea id="resContent" name="resContent" rows="6" style="width: 100%; height: 100%"></textarea></div>
<div id="question-grid" style="width: 200px; height: 200px;"></div>

<div id="appletContainer"><object classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93" width="0px" height="0px"
	style="border-width: 0;" id="agent" name="agent"
	codebase="http://java.sun.com/update/1.6.0/jinstall-6u16-windows-i586.cab#Version=1,6,0,16">
	<PARAM NAME="ARCHIVE" VALUE="AgentClient.jar" />
	<PARAM NAME="CODE" VALUE="net.sf.service.agent.client.Agent" />
	<param NAME="type" VALUE="application/x-java-applet;jpi-version=1.6">
	<PARAM NAME="CODEBASE" VALUE=".">
	<param NAME="scriptable" VALUE="true">
	<param NAME="agent" VALUE="<%=agentName%>">
	<param NAME="agentType" VALUE="<%=agentType%>">
	<param NAME="mobileNo" VALUE="<%=mobileNo%>">

	<comment> <embed type="application/x-java-applet;version=1.5" code="net.sf.service.agent.client.Agent"
		ARCHIVE="AgentClient.jar" codebase="." pluginspage="http://java.sun.com/products/plugin/index.html#download" scriptable="true"
		agent="<%=agentName%>" agentType="<%=agentType%>" mobileNo="<%=mobileNo%>">
	<noembed> 浏览器没不支持JAVA环境 </noembed>
	</embed> </comment> </object></div>

<script type="text/javascript" src="./agentsWin.js"></script>

</body>
</html>