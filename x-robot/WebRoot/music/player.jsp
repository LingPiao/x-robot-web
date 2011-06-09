<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script src="Scripts/AC_ActiveX.js" type="text/javascript"></script>
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>
<%
String songsID = request.getParameter("songsID");
String url = "";
if(songsID == null || songsID.equals("null")) url = "";
else  url = "copyring/"+songsID+".asf";
%>
<body>
<script type="text/javascript">
AC_AX_RunContent( 'codebase','http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701','type','application/x-oleobject','height','65','width','265','classid','CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6','viewastext','viewastext','url','<%=url%>','rate','1','balance','0','currentposition','-1','defaultframe','','playcount','1','autostart','-1','currentmarker','0','invokeurls','-1','baseurl','','volume','50','mute','0','uimode','full','stretchtofit','0','windowlessvideo','0','enabled','-1','enablecontextmenu','0','fullscreen','0','samistyle','','samilang','','samifilename','','captioningid','','enableerrordialogs','0','_cx','12885','_cy','1720' );
</script>
</body>
</html>
