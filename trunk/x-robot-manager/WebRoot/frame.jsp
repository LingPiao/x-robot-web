<%@page contentType="text/html;charset=gb2312"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="session.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����ϵͳ</title>
</head>
<SCRIPT language=JavaScript>
<!-- 
function dis() { 
    window.status="������ƽ̨��ҵ����Ϣ����"
}
dis()
// -->
</SCRIPT>
<frameset rows="43,*" cols="*" frameborder="no">
  <frame src="top.jsp" scrolling="no" title="undefined" />
  <frameset id="zongFrame" rows="*" cols="202,11,*" framespacing="0" frameborder="no" border="0">
		<frame src="menu.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
		<frame src="main2.jsp"  scrolling="no" noresize="noresize" name="main1Frame" id="main1Frame"/>		
		<frame src="main.html" title="" name="mainFrame" id="mainFrame" />
  </frameset>

</frameset>
<noframes><body>
</body>
</noframes></html>
