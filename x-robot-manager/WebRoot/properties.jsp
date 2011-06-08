<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>

<%

	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
	String value="";
	 
	String action = request.getParameter("action");
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	UpdateData update=new UpdateData(conn);
	if("edit".equals(action)){
		value=request.getParameter("answer");
		value=new String(value.getBytes("8859_1"));
		update.update("t_properties","VALUE='"+value+"'","NAME='UNKNOW_UNICOM'");
	}
	

	
	query.setRecordSet("select * from t_properties where NAME='UNKNOW_UNICOM'");
	ResultSet rs3 = query.getResultSet();
	if(rs3.next()){
		value=rs3.getString("VALUE");
	}
		
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	

	</head>
	<script type="text/javascript">

	  function   textCounter(field,   countfield,   maxlimit)   {   
	  	if   (field.value.length   >   maxlimit)     
	  		field.value   =   field.value.substring(0,maxlimit);   
	  	else     
	  		countfield.value   =   maxlimit   -   field.value.length;   
	  }   

		
	</script>
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

										
										<!-- 短信添加开始*************************************************************************************** -->
										<td width="79%" align="left" valign="top" id="add">
											<form name =addform method=post action = "properties.jsp" >
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														无法回答问题提示编辑
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	提示：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="answer" id="answer" cols="80" rows="6" onKeyDown="textCounter(this.form.answer,this.form.remLen,100);"   onKeyUp="textCounter(this.form.answer,this.form.remLen,100);"><%=value %></textarea>
																	<br>共可输入100字，还剩<input   readonly   type=text   name=remLen   size=3   maxlength=3   value="100">字。
																</td>
															</tr>
															
															
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="edit">
																	
																	<input name="save" type="Submit" class="button"
																		value="保  存">
																	&nbsp;
																	<input name="cancel" type="Reset" class="button"
																		value="重  置" >
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
	<%conn.close(); %>