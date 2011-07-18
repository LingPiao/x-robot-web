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
<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
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
	 	int i = 0;
	 	String table = "";
	 	String fieldarraystr = "";
	 	String condition = "";
	 	String id = "";
	 	String complain = "";

	 	DataConn conn = new DataConn();
	 	QueryData query = new QueryData(conn);
	 %>
	<form name="theFrom" action="itemdata.jsp" >
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
											<%
												//table="unicom.t_item";

												//fieldarraystr="*";
												//query.setRecordCount(table,condition);

												//int count = query.getRecordCount();
												//System.out.println(count);
											%>

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															用户统计
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
																	<td colspan=2 align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		起始日期：<input type="text" onClick="WdatePicker()" id="BIRTH1" class="input-text" style="width:150px;" name="BIRTH1" value="<%=data1%>" />
																	
																	
																		
																		截止日期：<input type="text"  onClick="WdatePicker()"   id="BIRTH2" class="input-text" style="width:150px;" name="BIRTH2" value="<%=data2%>" />
																	
																		
																		<input type="submit" name="button" class="button" value="查询"/>
																	</td>
																	
																</tr>
																<tr>
																	
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=75%>
																		地  区
																	</td>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		数  量
																	</td>
																	
																</tr>
																<%
																	
																	String sql1 = "Select * from t_item  where 1=1 order by itemid ";
																	query.setRecordSet(sql1);
																	ResultSet rs3 = query.getResultSet();
																	int indexs = 1;
																	int numy = 0;
																	String numz = "";
																	String numk="";
																	//rs3.next();
																	rs3.next();

																	while (rs3.next()) {
																		String num = "";

																		id = rs3.getString("itemid");
																		complain = rs3.getString("itemname");

																		table = "t_item_data";
																		fieldarraystr = "*";

																		data1 = data1.replace("-", "");
																		data2 = data2.replace("-", "");
																		String sql = "select itemid, sum(itemvalue) itemnum from unicom.t_item_data t where itemid='"
																		+ id
																		+ "' and datavalue>='"
																		+ data1
																		+ "' and  datavalue<='" + data2 + "' group by itemid";
																		//System.out.println(sql);
																		query.setRecordSet(sql);
																		ResultSet rs5 = query.getResultSet();
																		if (rs5.next()) {
																			num = rs5.getString("itemnum");
																		if (!"0102".equals(id)&&!"0103".equals(id))
																		numy += Integer.parseInt(num);

																		} else{
																			num="0";
																		}
																		if("0102".equals(id)){
																			numz = num;
																		}
																		if("0103".equals(id)){
																			numk = num;
																		}
																		i++;
																		if (!"0102".equals(id)&&!"0103".equals(id)) {
																%>
																<tr>
																	
																	<td   align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=complain.replace("正式用户_","") %>
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=num %>	
																	</td>
																	
																</tr>
																<%
																		}

																		indexs++;
																	}
																%>
																<tr>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		当前日期合计
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=numy %>	
																	</td>
																	
																</tr>
																<tr><td colspan=2 bgcolor="#FFFFFF" style="height:10px;"></td></tr>
																
																<%
																String sql2 = "select t.*, t.rowid from unicom.t_item_data t where itemid='0102'";
																String sql3 = "select t.*, t.rowid from unicom.t_item_data t where itemid='0103'";
																query.setRecordSet(sql2);
																ResultSet rss = query.getResultSet();
																if(rss.next()){
																	numz=rss.getString("itemvalue");
																}
																query.setRecordSet(sql3);
																ResultSet rsss = query.getResultSet();
																if(rsss.next()){
																	numk=rsss.getString("itemvalue");
																}
																 %>
																
																
																<tr>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1" style="color:#ff0000">
																		绑定总计
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF" style="color:#ff0000">
																		<A href="bangding.jsp" ><%=numz %>	</A>
																	</td>
																	
																</tr>
																<tr>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1" style="color:#ff0000">
																		未绑定总计
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF" style="color:#ff0000">
																		<A href="weibangding.jsp" ><%=numk %>	</A>
																	</td>
																	
																</tr>
																<tr>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1" style="color:#ff0000">
																		总计
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF" style="color:#ff0000">
																		<A href="quanbu.jsp" ><%=Integer.parseInt(numk)+Integer.parseInt(numz) %>	</A>
																	</td>
																	
																</tr>
																
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
							<td class="login_di" colspan=2>&nbsp;
								
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
