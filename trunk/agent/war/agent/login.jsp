<%@ page pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	String ckUser = null;
	String ckPwd = null;
	Cookie c[] = request.getCookies();
	for (int i = 0; i < c.length; i++) {
		if ("userName".equals(c[i].getName()))
			ckUser = c[i].getValue();
		if ("password".equals(c[i].getName()))
			ckPwd = c[i].getValue();
	}
	if (ckUser != null && ckPwd != null) {
		response.sendRedirect("./agentServer?act=login&userName=" + ckUser + "&password=" + ckPwd);
	}
%>

<html>
<head>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<LINK href="../images/main.css" type=text/css rel=stylesheet>

<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px;
	MARGIN-RIGHT: 0px
}
</STYLE>

<script type="text/javascript">
function login(){
      if(document.fmLogin.userName.value.length<1) { 
              alert( "请填写用户名! "); 
			  document.fmLogin.userName.focus();
              return false; 
      } 
	  if(document.fmLogin.password.value.length<1) { 
              alert( "请输入密码! "); 
			  document.fmLogin.password.focus();
              return false; 
      } 
      document.fmLogin.submit(); 
      return true;
}
 
</script>
</head>
<body class="bg">
<table width="100%" border="0" align="center">
	<tr>
		<td>
		<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
			<TBODY>
				<TR>
					<TD>
					<TABLE id=subtree1 cellSpacing=0 cellPadding=0 width="100%" border=0>
						<TBODY>
							<TR>
								<TD>
								<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
									<TBODY>
										<TR>
											<TD height=40>
											<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 class="border">
												<TBODY>
													<TR>
														<TD width="1%" class="ll"><img src="../images/corner1.jpg" width="13" height="13"></TD>
														<TD width="98%" class="top">&nbsp;</TD>
														<TD width="1%" class="rightline"><img src="../images/corner3.jpg" width="13" height="13"></TD>
													</TR>
													<TR>
														<TD class="ll"></TD>
														<TD width="98%" valign="top">
														<table cellspacing="0" cellpadding="0" width="100%" border="0" class="border">
															<tbody>

																<tr>
																	<td width="96%">
																	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="gb">
																		<tr>
																			<td width="1%" align="left" valign="top"><img src="../images/ict.jpg"></td>
																			<td width="99%">&nbsp;</td>
																		</tr>
																		<tr>
																			<td colspan="2" align="center">
																			<TABLE cellSpacing=0 cellPadding=3 width="94%">
																				<center>联通贝贝坐席</center>
																				<TBODY class="bill_b">
																					<form name="fmLogin" action="./agentServer?act=login" method="post" onsubmit="return login();">
																					<TR>
																						<TD>用户:</TD>
																						<TD align="left"><input type="text" name="userName" /></TD>
																					</TR>
																					<TR>
																						<TD>密码:</TD>
																						<TD align="left"><input type="password" name="password" /></TD>

																					</TR>
																					<TR>
																						<TD colspan="2"><input type="submit" value="登陆" /> <input id="rememberMe" name="rememberMe"
																							tabindex="3" type="checkbox" value="1" /><label for="rememberMe">下次自动登录</label></TD>
																					</TR>
																					</form>
																				</TBODY>
																			</TABLE>
																			</td>
																		</tr>

																		<tr>
																			<td align="left" valign="bottom"><img src="../images/icb.jpg"></td>
																			<td colspan="2" align="right">&nbsp;</td>
																		</tr>
																	</table>
																	</td>
																</tr>
																<tr>
																	<td>&nbsp;</td>
																</tr>

															</tbody>
														</table>
														</TD>
														<TD class="rightline">&nbsp;</TD>
													</TR>
													<TR>
														<TD class="ll"><img src="../images/corner2.jpg" width="13" height="14"></TD>
														<TD class="bottom">&nbsp;</TD>
														<TD class="rightline"><img src="../images/corner4.jpg" width="13" height="14"></TD>
													</TR>
													<TR>
														<TD></TD>
														<TD></TD>
														<TD></TD>
													</TR>
												</TBODY>
											</TABLE>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
		</td>
	</tr>
</table>
</body>
</html>
