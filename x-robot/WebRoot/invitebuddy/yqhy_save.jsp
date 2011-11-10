<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<jsp:useBean id="buddy" scope="page" class="com.catic.bean.InviteBuddy" />
<%
String msnid = request.getParameter("msnid");
String FRIENDEMAILSTR1 = request.getParameter("FRIENDEMAILSTR1").toLowerCase().trim();
String Email1 = request.getParameter("Email1").toLowerCase().trim();
if(Email1.equals("")) Email1 = FRIENDEMAILSTR1;
if(!FRIENDEMAILSTR1.equals("")) FRIENDEMAILSTR1 = FRIENDEMAILSTR1 + ";" + Email1 + ",";
String FRIENDEMAILSTR2 = request.getParameter("FRIENDEMAILSTR2").toLowerCase().trim();
String Email2 = request.getParameter("Email2").toLowerCase().trim();
if(Email2.equals("")) Email2 = FRIENDEMAILSTR2;
if(!FRIENDEMAILSTR2.equals("")) FRIENDEMAILSTR2 = FRIENDEMAILSTR2 + ";" + Email2 + ",";
String FRIENDEMAILSTR3 = request.getParameter("FRIENDEMAILSTR3").toLowerCase().trim();
String Email3 = request.getParameter("Email3").toLowerCase().trim();
if(Email3.equals("")) Email3 = FRIENDEMAILSTR3;
if(!FRIENDEMAILSTR3.equals("")) FRIENDEMAILSTR3 = FRIENDEMAILSTR3 + ";" + Email3 + ",";
String FRIENDEMAILSTR4 = request.getParameter("FRIENDEMAILSTR4").toLowerCase().trim();
String Email4 = request.getParameter("Email4").toLowerCase().trim();
if(Email4.equals("")) Email4 = FRIENDEMAILSTR4;
if(!FRIENDEMAILSTR4.equals("")) FRIENDEMAILSTR4 = FRIENDEMAILSTR4 + ";" + Email4 + ",";
String FRIENDEMAILSTR5 = request.getParameter("FRIENDEMAILSTR5").toLowerCase().trim();
String Email5 = request.getParameter("Email5").toLowerCase().trim();
if(Email5.equals("")) Email5 = FRIENDEMAILSTR5;
if(!FRIENDEMAILSTR5.equals("")) FRIENDEMAILSTR5 = FRIENDEMAILSTR5 + ";" + Email5 + ",";

String FRIENDEMAILSTR = FRIENDEMAILSTR1+FRIENDEMAILSTR2+FRIENDEMAILSTR3+FRIENDEMAILSTR4+FRIENDEMAILSTR5;
FRIENDEMAILSTR = FRIENDEMAILSTR.substring(0, FRIENDEMAILSTR.length()-1);
String delay = request.getParameter("delay");
String strResult = buddy.addContact(FRIENDEMAILSTR,msnid,delay);
if(!strResult.equals("")) strResult = strResult.substring(0, strResult.length()-1);
%>
<html>
<head>
<title>邀请好友</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css">
<style>
.scol {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	SCROLLBAR-FACE-COLOR: #ffffff;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #cccccc;
	SCROLLBAR-3DLIGHT-COLOR: #cccccc;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
	SCROLLBAR-BASE-COLOR: #ffffff;
}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.STYLE1 {
	color: #CC3300;
	font-size: 12px;
}
</style>
</head>
<body bgcolor="#FFFFFF">
<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="images/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="images/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="images/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<tr>
		<td width="397" height="52">
			<img src="images/main_04.jpg" width="41" height="52" alt=""></td>
		<td background="images/main_05_bg.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="52"><br>
              <a href="../home/welcome.jsp?msnid=<%=msnid%>"><img src="images/nav_left.gif" width="33" height="23" border="0"></a></td>
            <td align="center" valign="top"><img src="images/banner_unicom.gif" width="208" height="44"></td>
            <td width="33"><br>
            <img src="images/nav_right.gif" width="33" height="23"></td>
          </tr>
        </table></td>
<td>
			<img src="images/main_06.jpg" width="39" height="52" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_07.jpg" width="41" height="41" alt=""></td>
		<td width="397" height="41" background="images/main_08.jpg">&nbsp;</td>
  <td>
			<img src="images/main_09.jpg" width="39" height="41" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_10.jpg" width="41" height="511" alt=""></td>
		<td width="397" height="511" valign="top" background="images/main_11.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="95" height="95" align="center" valign="middle"><a href="yqhy.jsp?msnid=<%=msnid%>"><img src="images/yqhy_but1.png" width="71" height="71" border="0"></a></td>
            <td width="95" align="center" valign="middle"><a href="yqjl.jsp?msnid=<%=msnid%>"><img src="images/yqjl_but1.png" width="71" height="71" border="0"></a></td>
            <td width="95" align="center" valign="middle"><a href="hdpm.jsp?msnid=<%=msnid%>"><img src="images/jfqk_but1.png" width="71" height="71" border="0"></a></td>
            <td width="95" align="center" valign="middle"><a href="lpdh.jsp?msnid=<%=msnid%>"><img src="images/lpdh_but1.png" width="71" height="71" border="0"></a></td>
          </tr>
          <tr class="font14">
            <td height="22" align="center" valign="top">邀请好友</td>
            <td width="25%" align="center" valign="top">邀请记录</td>
            <td width="25%" align="center" valign="top">活动排名</td>
            <td width="25%" align="center" valign="top">礼品兑换</td>
          </tr>
        </table>
		  <table width="377" height="389" border="0" align="center" cellpadding="0" cellspacing="0" id="__">
            <tr>
              <td><img src="images/memo_01.png" width="23" height="16" alt=""></td>
              <td><img src="images/memo_02.png" width="328" height="16" alt=""></td>
              <td><img src="images/memo_03.png" width="26" height="16" alt=""></td>
            </tr>
            <tr>
              <td><img src="images/memo_04.png" width="23" height="352" alt=""></td>
              <td width="328" height="352" align="center" valign="top" background="images/memo_bj.png"><br>
                <%if(!strResult.equals("")){
		String[] tmpStr = strResult.split(";");
		ArrayList list_0 = new ArrayList();
		ArrayList list_1 = new ArrayList();
		ArrayList list_2 = new ArrayList();
		int size = tmpStr.length;
		if (size > 0) {
			for (int i = 0; i < size; i++) {
				if (tmpStr[i].substring(tmpStr[i].indexOf(",") + 1,
						tmpStr[i].length()).equals("0")) {
					list_0.add(tmpStr[i].substring(0, tmpStr[i].indexOf(",")));
				}
				if (tmpStr[i].substring(tmpStr[i].indexOf(",") + 1,
						tmpStr[i].length()).equals("1")) {
					list_1.add(tmpStr[i].substring(0, tmpStr[i].indexOf(",")));
				}
				if (tmpStr[i].substring(tmpStr[i].indexOf(",") + 1,
						tmpStr[i].length()).equals("2")) {
					list_2.add(tmpStr[i].substring(0, tmpStr[i].indexOf(",")));
				}
			}
			if (list_0.size() > 0) {%>
			<table width="90%" border="0" align="center" cellpadding="5" cellspacing="0" class="STYLE1">
            <tr>
              <td><%if(delay.equals("0")) out.println("<b>·已发出邀请，邀请的好友为：</b>");
			  if(delay.equals("5")) out.println("<b>·5分钟后发出邀请，将邀请的好友为：</b>");
			  if(delay.equals("60")) out.println("<b>·1小时后发出邀请，将邀请的好友为：</b>");%></td>
            </tr>
            <tr>
              <td>
              <%for (int i = 0; i < list_0.size(); i++) {%>
                  <table width="90%" border="0" align="center" cellpadding="5" cellspacing="0">
                  <tr>
                    <td><p style="font-family:Arial, Helvetica, sans-serif; font-size:11px"><%=list_0.get(i)%></p></td>
                  </tr>
                </table>
                <%}%>              </td>
            </tr>
          </table>
		    <%}
			if (list_2.size() > 0) {%>
            <br>
		  <table width="90%" border="0" align="center" cellpadding="5" cellspacing="0" class="STYLE1">
            <tr>
              <td><b>·以下好友正在被邀请中，无法再次发出邀请。</b></td>
            </tr>
            <tr>
              <td>
              <%for (int i = 0; i < list_2.size(); i++) {%>
              <table width="90%" border="0" align="center" cellpadding="5" cellspacing="0">
                  <tr>
                    <td><p style="font-family:Arial, Helvetica, sans-serif; font-size:11px"><%=list_2.get(i)%></p>                    </td>
                  </tr>
              </table>
              <%}%>              </td>
            </tr>
          </table>
		  <%}
			if (list_1.size() > 0) {%>
          <br>
		  <table width="90%" border="0" align="center" cellpadding="5" cellspacing="0" class="STYLE1">
            <tr>
              <td><b>·以下好友已经邀请成功，不必再次邀请。</b></td>
            </tr>
            <tr>
              <td>
              <%for (int i = 0; i < list_1.size(); i++) {%>
              <table width="90%" border="0" align="center" cellpadding="5" cellspacing="0">
                  <tr>
                    <td><p style="font-family:Arial, Helvetica, sans-serif; font-size:11px"><%=list_1.get(i)%></p>                    </td>
                  </tr>
              </table>
              <%}%>              </td>
            </tr>
          </table>
		  <%}}}%>
              </td>
              <td><img src="images/memo_06.png" width="26" height="352" alt=""></td>
            </tr>
            <tr>
              <td><img src="images/memo_07.png" width="23" height="21" alt=""></td>
              <td><img src="images/memo_08.png" width="328" height="21" alt=""></td>
              <td><img src="images/memo_09.png" width="26" height="21" alt=""></td>
            </tr>
          </table></td>
<td>
			<img src="images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="images/main_14.jpg"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="50%"><a href="javascript:window.history.go(-1);"><img src="images/prev.png" width="46" height="28" border="0"></a></td>
            <td width="50%">&nbsp;</td>
          </tr>
        </table></td>
<td>
			<img src="images/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="images/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="images/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</body>
</html>