<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<%@ include file="../session.jsp"%>
<%

	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
	
	UserManagerAction umAction = new UserManagerAction();
	String userrealname = umAction.getRealNameByname(username);
	MmsManagerAction mmAction = new MmsManagerAction();
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
		
	</head>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
			function canceladd()
		{
			window.location.href="friend.jsp";
		}
	</script>
<%
	String msnid = request.getParameter("msnid");
	UserCertificationAction uc = new UserCertificationAction();
	String usertel = uc.getUserTelByusermsn(msnid);;
	
	DataConn conn=new DataConn();
	
	QueryData query=new QueryData(conn);
	UpdateData update=new UpdateData(conn);
	String MSNID=request.getParameter("MSNID");
	String url="";
	String table="";
	String field_str="";
	String value_str="";	
	String fieldarraystr="";
	String condition="";

table="t_friend_jiben";
field_str="NUM";
value_str="NUM+1";
int j=update.update(table,field_str,value_str,"MSNID","'"+MSNID+"'");

String sql="select * from T_FRIEND_JIBEN T left join sms_friends_img t1 on t.msnid=t1.msn_id where t.msnid='"+MSNID+"'";
System.out.println(sql);
query.setRecordSet(sql);
ResultSet rs = query.getResultSet();
								//String MSNID="";
								String TRUE_NAME="";
								String SEX="";
								String BIRTH="";
								String HIGHT="";
								String PLACE="";
								String XUELI="";
								String MONEY="";
								String NAME="";
								String GAOBAI="";	
								String HUNYIN="";	
								String PHONE="";
								String IMG_URL="";
								int i=0;
                                while(rs.next()){
                                	MSNID=rs.getString("MSNID");
                                	TRUE_NAME=rs.getString("TRUE_NAME");
                                	SEX=rs.getString("SEX");
                                	if("1".equals(SEX))
                                		SEX="男";
                                	if("0".equals(SEX))
                                		SEX="女";
                                	
                                	BIRTH=rs.getString("BIRTH");
                                	HIGHT=rs.getString("HIGHT");
                                	PLACE=rs.getString("PLACE");
                                	XUELI=rs.getString("XUELI");
                                	MONEY=rs.getString("MONEY");
                                	NAME=rs.getString("NAME");
                                	GAOBAI=rs.getString("GAOBAI");
                                	HUNYIN=rs.getString("HUNYIN");
                                	PHONE=rs.getString("PHONE");
                                	IMG_URL=rs.getString("IMG_URL");
                                	
                                }

 %>
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
										<!-- 短信添加开始*************************************************************************************** -->
										<td width="79%" align="left" valign="top" id="add">
											<form name =addform method=post action = "mmsdb.jsp" onSubmit=return(formCheck()) ENCTYPE="multipart/form-data">
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														好友查看
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	会员昵称:
																</td>
																<td colspan="2" width="80%" bgcolor="#FFFFFF" class="zl_huitxt" align="left">
																<%=NAME %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	照片:
																</td>
																<td colspan="2" width="80%" bgcolor="#FFFFFF" class="zl_huitxt" align="left">
																<img src="<%=request.getContextPath()+IMG_URL %>" class="img_border"  style="width:120px;" /> 
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	性　　别:
																</td>
																<td colspan="2" bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=SEX %>
																</td>
															
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	我的身高:
																</td>
																<td colspan="2"  bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=HIGHT %>cm
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	出生日期:
																</td>
																<td colspan="2"  bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=BIRTH %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	地　　区:
																</td>
																<td colspan="2" bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	 <%=PLACE %> 
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	婚姻状况:
																</td>
																<td colspan="2" bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=HUNYIN %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	学　　历:
																</td>
																<td colspan="2" bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	 <%=XUELI %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	月　　薪:
																</td>
																<td colspan="2" bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=MONEY %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	真实姓名:
																</td>
																<td colspan="2" bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=TRUE_NAME %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	真情独白:
																</td>
																<td colspan="2" bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea id="GAOBAI"  style="width:380px;" class="input_textarea" onpropertychange="if(value.length&gt;500) value=value.substr(0,500)" name="GAOBAI" rows="4" cols="58"><%=GAOBAI %></textarea>
																</td>
															</tr>
															<tr>
																<td colspan="3" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
<input name="cancel" type="button" class="button"
																		value="取  消" onClick="javascript:canceladd()">
																</td>
															</tr>
														</table>															
													</td>
												</tr>											
											</table>
											</form>
										</td>
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
	</body>