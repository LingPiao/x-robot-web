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
	
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	

	</head>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">



		function deletes(theForm)
		{
		    var url="comdb.jsp?action=delete";
		    theForm.action=url;
		    theForm.submit();		
		}
		function audit(theForm)
		{
		    var url="comdb.jsp?action=audit";
		    theForm.action=url;
		    theForm.submit();		
		}
		
	</script>
<%
String action=request.getParameter("action");
	String url="";
	String table="";
	String fieldarraystr="";
	String condition="";
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	String id="";
	String complain="";

	String email="";

	String contact="";

	String contactphone="";

	String subject="";

	String content="";
	String state="";
if("update".equals(action)){
	String tousu_id=request.getParameter("tousu_id");
	table="SMS_TOUSU";
	fieldarraystr="*";
	condition="tousu_id="+tousu_id;
	query.setRecordSet(table,fieldarraystr,condition);
	ResultSet rs3 = query.getResultSet();
	while(rs3.next()){
		id=rs3.getString("tousu_id");
		complain=rs3.getString("complain");
		email=rs3.getString("email");  
			
		contact= rs3.getString("contact");  
		contactphone= rs3.getString("contactphone");  
		subject= rs3.getString("subject"); 

		content= rs3.getString("content"); 
		state= rs3.getString("state");
		if("2".equals(state)){
			response.sendRedirect("complaints_lists.jsp");
		}
	}
	rs3.close();
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
										

										<!-- ������ӿ�ʼ*************************************************************************************** -->
										<td width="79%" align="left" valign="top"  id="add">
											<form name =addform method=post action = "comdb.jsp" onSubmit=return(formCheck())>
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
												<input type="hidden" name="id" value="<%=id %>"/>
												<input type="hidden" name="state" value="<%=state %>"/>
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														�û��༭
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	Ͷ��ҵ�����:
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=complain %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	E-mail:
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=email %>
																</td>
															</tr>	
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	��ϵ��:
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=contact %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	��ϵ�绰:
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=contactphone %>
																</td>
															</tr>	
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	Ͷ������:
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=subject %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	Ͷ������:
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea rows="5" cols="28"><%=content %></textarea>
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																
																	
																	<input name="save" type="button" class="button"
																		value="ͨ  ��" onClick="audit(addform);">
																	&nbsp;
																	<input name="cancel" type="button" class="button"
																		value="ɾ  ��" onClick="deletes(addform);">
																</td>
															</tr>
														</table>															
													</td>
												</tr>											
											</table>
											</form>
										</td>
										<!-- ������ӽ���***************************************************************************************** -->
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
		<%
		conn.close();
		
		 %>
	</body>