<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*,java.text.*"%>
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
int sum1=0;
int sum2=0;
int sum3=0;
int sum4=0;
int sum5=0;


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
	 	}
	 	String data2 = request.getParameter("BIRTH2");
	 	if (data2 == null || "".equals(data2) || "null".equals(data2)) {
	 		data2 = startTime1;
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
	<form name="theFrom" action="recordsdata.jsp" >
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
															
															query.setRecordCount("t_dict","dict_sort='BUSINESS'");
															int num=query.getRecordCount();
															long num1= 100/(num+2);
															String num2=num1+"%";
															String sql0="select * from t_dict t where dict_sort='BUSINESS' order by dict_order";
															query.setRecordSet(sql0);
															ResultSet rs0 = query.getResultSet();
											%>

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												
												
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															业务使用统计
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
																	<td colspan=<%=num+2 %> align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		起始日期：<input type="text" runat="server" onClick="WdatePicker()"  id="BIRTH1" class="input-text" style="width:150px;" name="BIRTH1" value="<%=data1%>" />
																	
																		
																		截止日期：<input type="text" runat="server" onClick="WdatePicker()"  id="BIRTH2" class="input-text" style="width:150px;" name="BIRTH2" value="<%=data2%>" />
																	
																		
																		<input type="submit" name="button" class="button" value="查询"/>
																	</td>
																	
																</tr>
																<tr>
																	
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=<%=num2 %>>
																		地  区
																	</td>
															<%
															while(rs0.next()){
															
															String dict_name=rs0.getString("DICT_NAME");
															 %>
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=<%=num2 %>>
																		<%=dict_name %>
																	</td>
																	
															<%
															}
															 %>
																	
																	
																	<td  align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=<%=num2 %>>
																		合	计
																	</td>
																	
																</tr>
																
																<%
																	
																	String sql1 = "Select * from t_item  where 1=1 order by itemid ";
																	query.setRecordSet(sql1);
																	ResultSet rs3 = query.getResultSet();
																	int indexs = 1;
																	int numy = 0;
																	int numd = 0;
																	
																	//rs3.next();
																	rs3.next();

																	while (rs3.next()) {
																		

																		id = rs3.getString("itemid");
																		complain = rs3.getString("itemname");

																		table = "t_item_data";
																		fieldarraystr = "*";

																		data1 = data1.replace("-", "");
																		data2 = data2.replace("-", "");
																		
																		//System.out.println(sql);
																		
																		
																		if(complain.indexOf("正式用户_")>=0){
																		numy = 0;
																		
																		
																		complain=complain.replace("正式用户_","");
																		
																%>
																<tr>
																	<td   align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=complain %>
																	</td>
																<%
																sql0="select * from t_dict t where dict_sort='BUSINESS' order by dict_order";
																query.setRecordSet(sql0);
															 	rs0 = query.getResultSet();
																		while(rs0.next()){
																		String dict_value=rs0.getString("dict_value");
																		String sql="select classes,user_area ,count(t.classes) num  from t_visit_record t ,msn_certification t1 where t.msnid=t1.user_msn and user_area='"+complain+"' and classes='"+dict_value+"' and to_char(rdate,'YYYYMMDD')>='"+data1+"' and to_char(rdate,'YYYYMMDD')<='"+data2+"' group by user_area ,classes order by classes";
																		query.setRecordSet(sql);
																		ResultSet rs5 = query.getResultSet();
																		if (rs5.next()) {
																			int numl = rs5.getInt("num");
																			String classes=rs5.getString("classes");
																			numy+=numl;
																			numd+=numl;
																				if("01".equals(classes))
																				sum1+=numl;
																				if("02".equals(classes))
																				sum2+=numl;
																				if("03".equals(classes))
																				sum3+=numl;
																				if("04".equals(classes))
																				sum4+=numl;
																				if("05".equals(classes))
																				sum5+=numl;
																%>
																	
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=numl %>	
																	</td>
																	
																
																<%

																		}
																		else{
																																						
																%>
																
																<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%="0" %>	
																	</td>
																	
																
																<%
																			
																			
																
																		}
																	}
%>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=numy %>	
																	</td>

</tr>
<%

																		indexs++;
																	}

																}
																%>
																<tr>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		未知地区
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%="0" %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%="0" %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%="0" %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																	<%
																	String sql9="select count(id) num from t_visit_record t where classes='04' and to_char(rdate,'YYYYMMDD')>='"+data1+"' and to_char(rdate,'YYYYMMDD')<='"+data2+"'";
																	query.setRecordSet(sql9);
																	ResultSet rs8 = query.getResultSet();
																	int numi=0;
																		if (rs8.next()) {
																		numi = rs8.getInt("num");
																		}
																	 %>
																		<%=numi-sum4 %>	
																		
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%="0" %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=numi-sum4 %>	
																	</td>
																</tr>
																<tr>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		总计
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=sum1 %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=sum2 %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=sum3 %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=numi %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=sum5 %>	
																	</td>
																	<td   align="center" valign="middle" bgcolor="#FFFFFF">
																		<%=sum1+sum2+sum3+numi+sum5 %>	
																	</td>
																</tr>
																<tr><td colspan=<%=num+2 %> bgcolor="#FFFFFF" style="height:10px;"></td></tr>
																
																
																
																
																
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
