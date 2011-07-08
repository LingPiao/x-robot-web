<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*,java.text.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	
<link rel="stylesheet" type="text/css" href="css/bbcss.css">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet" type="text/css" href="css/business.css">
</head>
<script type="text/javascript" src="js/clock.js"></script>
<script>
function qry()
{
	var begin=document.getElementById("BIRTH1").value;
	var end=document.getElementById("BIRTH2").value;
	if(begin>end)
	{
		alert("开始时间不能晚于结束时间！")
		return false;
	}
	var temp=new Date(Date.parse((end.replace("-","/")).replace("-","/")))-new Date(Date.parse((begin.replace("-","/")).replace("-","/")));
	var temp1=temp/(1000*3600*24);
	if(temp1>30)
	{
		alert("开始时间与结束时间相差不能超过30天！")
		return false;
	}
	theFrom.action="robot_log.jsp?action=qry";
	theFrom.submit();
}
</script>	
	<body>
	 
<%
	 	SimpleDateFormat dateFormatStart = new SimpleDateFormat("yyyyMMdd");
	 	SimpleDateFormat dateFormatStart1 = new SimpleDateFormat(
	 			"yyyy-MM-dd");
	 	java.util.Date dateCurrStart = new java.util.Date();
	 	String startTime = dateFormatStart.format(dateCurrStart);
	 	String startTime1 = dateFormatStart1.format(dateCurrStart);
	 	String action = request.getParameter("action");
	 	String data1 = request.getParameter("BIRTH1");
	 	if (data1 == null || "".equals(data1) || "null".equals(data1)) {
	 		data1 = startTime1;
	 	} else {
	 		//data1=data1;
	 	}
	 	String data2 = request.getParameter("BIRTH2");
	 	if (data2 == null || "".equals(data2) || "null".equals(data2)) {
	 		data2 = startTime1;
	 	} else {
	 		//data2=data2;
	 	}
	 	String usercode = request.getParameter("usercode");
	 	DataConn conn = new DataConn();
	 	QueryData query = new QueryData(conn);
	 	String con="";
	 	if(action!=null)
	 	{
		 	if(action.equals("qry"))
		 	{
		 		String sql="select tl.contactemail,tl.robotemail,tl.content,tl.createdate,tlr.content as response from t_log tl,t_log_response tlr where ";
		 		con=con +"  tl.logid=tlr.logid ";
		 		con=con +" and tl.createdate between to_date('"+data1+"','yyyy-mm-dd') and to_date('"+data2+"','yyyy-mm-dd')";
		 		if(usercode!=null && !usercode.equals(""))
		 			con=con +" and tl.contactemail like '%"+usercode+"%' ";
		 		sql=sql + con +" order by tl.createdate desc";
		 		query.setRecordSet(sql);
		 		System.out.println(sql);
		 	}
	 	}

	 %>
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
											<p>&nbsp;
												
											</p>
											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												
												
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															查看日志
														</td>
													</tr>
													<tr>
														<td height="1" align="center" valign="top"></td>
													</tr>
													<tr>
														<td align="center" valign="top">
														
															<table width="100%" border="0" cellpadding="3"
																cellspacing="1" bgcolor="#666666">
																<form name="theFrom" action="#" method="post">
																<tr>
																	<td colspan=4 align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		起始日期：<input type="text" runat="server" onclick="fPopCalendar(BIRTH1,BIRTH1); return false"  id="BIRTH1" class="input-text" style="width:150px;" name="BIRTH1" value="<%=data1%>" />
																		
																		截止日期：<input type="text" runat="server" onclick="fPopCalendar(BIRTH2,BIRTH2); return false"  id="BIRTH2" class="input-text" style="width:150px;" name="BIRTH2" value="<%=data2%>" />
																	
																		用户帐号：<input type="text" id="usercode" class="input-text" style="width:150px;" name="usercode" />
																		<input type="button" name="button" class="button" value="查询" onclick="return qry()"/>
																	</td>
																	
																</tr>
																</form>
																<%
																	String table="t_log tl,t_log_response tlr ";								
																	String fieldarraystr="*";
																	int count = 0;
																	if(action!=null)
																 	{
																	 	if(action.equals("qry"))
																	 	{
																			query.setRecordCount(table,con);
																			count = query.getRecordCount();
																			System.out.println(count);
																	 	}
																 	}
																	%>
																<page:pager total='<%=count%>' defaultPageSize="10">
																<tr>
																	
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		用户帐号
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=35%>
																		用户说
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		机器人帐号
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=35%>
																		机器人回复
																	</td>
																	
																</tr>
																<%
																int indexs=1;
																int i=0;
																if(action!=null)
															 	{
																 	if(action.equals("qry"))
																 	{
																		ResultSet rs3 = query.getResultSet();
																		while(rs3.next())
																		{
																			i++;
																			if((i+1)>index.intValue() && i< (index.intValue()+pageSize.intValue()))
																			{ 
																%>
																<tr>
																	
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		<%=rs3.getString("contactemail") %>
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=35%>
																		<%=rs3.getString("content") %>
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		<%=rs3.getString("robotemail") %>
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=35%>
																		<%=rs3.getString("response") %>
																	</td>
																	
																</tr>
																<%
																			}
																			indexs++;
																	}
																 	}
															 	}
																
																%>
																<tr>
														<td height=25 colspan="8" align="right" class="zm_txt">
															<page:navigator type='SIMPLETEXT' />
														</td>
													</tr>
												</page:pager>
															</table>
														</td>
													</tr>
													
													
												<tr>
													<td width="100%" align="center" valign="middle">
			
													</td>
												</tr>
											</table>
										</td>
									
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
		
	</body><%
	conn.close();
	%>
