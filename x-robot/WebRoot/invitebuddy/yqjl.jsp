<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String msnid = request.getParameter("msnid");
%>
<html>
<head>
<title>邀请记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css">
<style>
.STYLE1 {
	font-size: 11px;
	font-family: Arial, Helvetica, sans-serif;
	color: #990000;
	line-height: 25px;
}
</style>
<script>
function setNum(TotalNum,SuccessNum,UnicomNum){
	var memo = document.getElementById('memo');    
    memo.innerHTML='&nbsp;&nbsp;&nbsp;&nbsp;共邀请用户'+TotalNum+'个，邀请成功'+SuccessNum+'个，其中绑定四川联通号码好友'+UnicomNum+'个。';
}
</script>
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
              <img src="images/nav_left.gif" width="33" height="23" border="0"></td>
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
            <td width="95" align="center" valign="middle"><img src="images/yqjl_but2.png" width="95" height="95" border="0"></td>
            <td width="95" align="center" valign="middle"></td>
            <td width="95" align="center" valign="middle"></td>
          </tr>
          <tr class="font14">
            <td height="22" align="center" valign="top">邀请好友</td>
            <td width="25%" align="center" valign="top">邀请记录</td>
            <td width="25%" align="center" valign="top"></td>
            <td width="25%" align="center" valign="top"></td>
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
              <td width="328" height="352" align="center" valign="top" background="images/memo_bj.png">
                  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="90" align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="224" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td valign="bottom"><span class="STYLE1" id="memo"></span></td>
                            </tr>
                          </table></td>
                          <td width="88"><img src="images/pop_yqjl.png" width="88" height="88"></td>
                        </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td align="center"><table id="__2" width="304" height="199" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td><img src="images/yaoqing_01.png" width="15" height="20" alt=""></td>
                          <td><img src="images/yaoqing_02.png" width="282" height="20" alt=""></td>
                          <td><img src="images/yaoqing_03.png" width="7" height="20" alt=""></td>
                        </tr>
                        <tr>
                          <td><img src="images/yaoqing_04.png" width="15" height="220" alt=""></td>
                          <td width="282" height="168" bgcolor="#FFFFFF"><iframe src="yqjl_memo.jsp?msnid=<%=msnid%>" width="282" height="220" frameborder="0" scrolling="yes"></iframe></td>
                          <td><img src="images/yaoqing_06.png" width="7" height="220" alt=""></td>
                        </tr>
                        <tr>
                          <td><img src="images/yaoqing_07.png" width="15" height="11" alt=""></td>
                          <td><img src="images/yaoqing_08.png" width="282" height="11" alt=""></td>
                          <td><img src="images/yaoqing_09.png" width="7" height="11" alt=""></td>
                        </tr>
                      </table></td>
                    </tr>
                  </table>              </td>
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
		<td width="397" height="59" background="images/main_14.jpg">&nbsp;</td>
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