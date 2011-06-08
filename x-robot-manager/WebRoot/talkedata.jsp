<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*,java.text.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	
<link rel="stylesheet" type="text/css" href="../css/bbcss.css">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/business.css">

	</head>
<script type="text/javascript" src="../../js/clock.js"></script>
	<script type="text/javascript">
	function canceladd(theForm)
		{
			window.location.href="mms.jsp";
		}
	
	</script>
	<body>
	 
<%

	 	SimpleDateFormat dateFormatStart1 = new SimpleDateFormat("yyyy-MM-dd");
	 	java.util.Date dateCurrStart = new java.util.Date();
	 	String startTime1 = dateFormatStart1.format(dateCurrStart);
	 	String action = request.getParameter("r_action");
	 	String data1 = request.getParameter("BIRTH1");
	 	String data2 = request.getParameter("BIRTH2");
	 	if(!"search".equals(action)){
	 	if (data1 == null || "".equals(data1) || "null".equals(data1)) {
	 		data1 = startTime1;
	 	} else {
	 		//data1=data1;
	 	}
	 	
	 	if (data2 == null || "".equals(data2) || "null".equals(data2)) {
	 		data2 = startTime1;
	 	} else {
	 		//data2=data2;
	 	}
	 	}else{
	 	if (data1 == null || "".equals(data1) || "null".equals(data1)) {
	 		data1 = "";
	 	} else {
	 		//data1=data1;
	 	}
	 	
	 	if (data2 == null || "".equals(data2) || "null".equals(data2)) {
	 		data2 = "";
	 	} else {
	 		//data2=data2;
	 	}
	 	}

	 	String num1 = "";
	 	String num2 = "";
		String t_date = "";
	 	DataConn conn = new DataConn();
	 	QueryData query = new QueryData(conn);
	 %>
	<form name="theFrom" action="talkedata.jsp" >
	<input type="hidden" name="r_action" value="search"/>
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
	
										<td width="79%" align="left" valign="top" id="listform">
											<p>
												&nbsp;
											</p>
										
											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												
												
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															数据统计
														</td>
													</tr>
													<tr>
														<td height="1" align="center" valign="top"></td>
													</tr>
													<tr>
														<td align="center" valign="top">
															<table width="100%" border="0" cellpadding="3"
																cellspacing="1" bgcolor="#666666">
																<tr>
																	<td colspan=3 align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		起始日期：<input type="text" runat="server" onclick="fPopCalendar(BIRTH1,BIRTH1); return false"  id="BIRTH1" class="input-text" style="width:150px;" name="BIRTH1" value="<%=data1%>" />
																	
																		
																		截止日期：<input type="text" runat="server" onclick="fPopCalendar(BIRTH2,BIRTH2); return false"  id="BIRTH2" class="input-text" style="width:150px;" name="BIRTH2" value="<%=data2%>" />
																	
																		
																		<input type="submit" name="button" class="button" value="查询"/>
																		<%if("search".equals(action)){ %>
																		<input type="button" name="button" class="button" value="查询曲线图" onclick="window.location.href='talkesdata.jsp?acion=search&BIRTH1=<%=data1 %>&BIRTH2=<%=data2 %>'";/>
																		<% }%>
																	
																	</td>
																	
																</tr>
																<tr>
																	
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=70%>
																		日  期
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		使用人数
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		对话次数
																	</td>
																</tr>
																<%
																	
																	String sql1 = "select count(contactemail) num1,to_char(createdate,'yyyy-mm-dd') t_date,sum(logtimes) num2 from unicom.t_logcontact t ";
																	sql1+=" where 1=1 ";
																	if(!"".equals(data1))
																	sql1+=" and to_char(createdate,'yyyy-mm-dd')>='"+data1+"' ";
																	if(!"".equals(data2))
																	sql1+=" and to_char(createdate,'yyyy-mm-dd')<='"+data2+"' ";
																	sql1+=" group by to_char(createdate,'yyyy-mm-dd') order by t_date";
																	System.out.println(sql1);
																	query.setRecordSet(sql1);
																	ResultSet rs3 = query.getResultSet();
																	int indexs = 1;
																	int numy = 0;
																	int numz = 0;
																	int numk=0;
																

																	while (rs3.next()) {
																		

																		num1 = rs3.getString("num1");
																		t_date=rs3.getString("t_date");
																		num2 = rs3.getString("num2");

																%>
																<tr>
																	
																	<td   align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=t_date %>
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=num1 %>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=num2 %>	
																	</td>
																</tr>
																<%
																		numz+=Integer.parseInt(num1);
																		numk+=Integer.parseInt(num2);
																		indexs++;
																	}
																%>
																<tr>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		当前合计
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=numz %>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=numk %>	
																	</td>
																</tr>
																<tr><td colspan=3 bgcolor="#FFFFFF" style="height:10px;"></td></tr>
																
																
																
																
																
																
																
																
															</table>
														</td>
													</tr>

													<tr>
														<td height=25 colspan="8" align="right" class="zm_txt">
															
														</td>
													</tr>
											
												<tr>
													<td width="100%" align="center" valign="middle">
			
													</td>
												</tr>
											</table>
										</td>
										<!-- 短信添加开始*************************************************************************************** -->
									
										<!-- 短信添加结束***************************************************************************************** -->
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="1"></td>
						</tr>
						<tr>
							<td class="login_di" colspan=2>
								&nbsp;
							</td>
						</tr>
						
					</table>
				</td>
			</tr>
		</table>
		
		</form>
	</body><%
	conn.close();
	%>
