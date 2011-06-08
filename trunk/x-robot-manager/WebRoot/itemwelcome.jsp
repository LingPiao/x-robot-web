<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<jsp:useBean id="mgr" scope="page" class="com.catic.tool.mgr.Manager" />
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        <script>
        function editmes(val){
			window.location.href = 'itemwelcomeSave.jsp?id='+val;
		}
        </script>	
	</head>
		<link href="css/css1.css" rel="stylesheet" type="text/css">
	<body>
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center" valign="middle">
					<table width="100%" height="100%" border="0" align="center"
						cellpadding="0" cellspacing="0">

						<tr>
							<td align="center" valign="top" class="login_bg" colspan=2
								height="570">
								<table width="100%" height="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>

										<td align="left" valign="top" id="listform">
											<p>&nbsp;											</p>
											

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">

													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															菜单项欢迎词语管理														</td>
													</tr>
													<tr>
														<td height="1" align="center" valign="top"></td>
													</tr>
													<tr>
														<td align="center" valign="top">
															<table width="100%" border="0" cellpadding="3"
																cellspacing="1" bgcolor="#666666">
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=20%>
																		菜单																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=65%>
																		欢 迎 词</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		编&nbsp;辑																	</td>
																</tr>
<%
ArrayList list;
if(!(list = mgr.getWelcome()).isEmpty()){
for(int i=0;i<list.size();i++){
%>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1"><%=((ArrayList)list.get(i)).get(1)%></td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1"><%=((ArrayList)list.get(i)).get(2)%></td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="#" onclick="javaScript:editmes('<%=((ArrayList)list.get(i)).get(0)%>');"><img src = "images/edit.gif" border = 0>																		</a>																	</td>
																</tr><%}}%>
															</table>														</td>
													</tr>

													<tr>
														<td height=25 colspan="8" align="right" class="zm_txt">&nbsp;</td>
													</tr>
											</table>										</td>
									</tr>
								</table>
						  </td>
						</tr>
						<tr>
							<td height="1"></td>
						</tr>
						<tr>
							<td class="login_di" colspan=2>&nbsp;
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
