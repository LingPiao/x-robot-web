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
	String timeid = "",contactemail="",notifytime="",	period="",content="",email="";
%>
<script>

function setuset()
{
	if(addform.auser.checked)
		addform.contactemail.value=".*";
	else
		addform.contactemail.value="";
}
</script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	
	</head>
	<script type="text/javascript">
		function formCheck()
		{
			if(addform.contactemail.value=="")
			{
				alert("请填写用户email！");
				addform.contactemail.focus();
				return false;
			}
			if(addform.content.value=="")
			{
				alert("请填写提醒内容");
				addform.content.focus();
				return false;
			}
			return true;
		}
		function canceladd()
		{
			window.location.href = "service_mind.jsp";
		}
	</script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
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
										<td width="79%" align="left" valign="top" style="display:n2one" id="add">
											<form name =addform method=post action = "service_mind_db.jsp" onSubmit=return(formCheck())>
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														主动服务信息
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	用户email：<br>（多个用户请用英文半角分号";"隔开）
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name=contactemail rows=5 cols=50></textarea><input type=checkbox value=1 name=auser onclick=setuset();>所有用户
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	开始时间：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type="text" readonly onClick="WdatePicker()"  id="begin" class="input-text" style="width:100px;" name="begin" value="" />
																	<select name="Hours" class="search" style="width:40">
														      <% 
														      		int i=0;
														      		String temp="";
														      		for(i=0; i<24; i++) {
														          if (i<10) {
														              temp = "0" +Integer.toString(i);
														          }
														          else {
														              temp = Integer.toString(i);
														          }
														      %>
														        <option value=<%=temp%> <% if(i==12){ %>selected<% } %> ><%=temp%>&nbsp;</option>
														      <% } %>
														      </select>
														      <select name="Minutes" class="search"  style="width:40" >
														      <% for(i=0; i<60; i=i+1) {
														          if (i<10) {
														              temp = "0" +Integer.toString(i);
														          }
														          else {
														              temp = Integer.toString(i);
														          }
														      %>
														        <option value=<%=temp%>><%=temp%>&nbsp;</option>
														      <% } %>
														      </select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	提醒间隔：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<select name="period">
																	<option value = "o">只提醒一次</option>
																	<option value = "d">每天提醒一次</option>
																	<option value = "w">每周提醒一次</option>
																	<option value = "m">每月醒一次</option>
																	</select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	提醒内容：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="content" cols="50" rows="6" ></textarea>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	提醒类型：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=checkbox   name=NOTIFY_TYPE value="001"  size=30>短信
																	<input type=checkbox   name=NOTIFY_TYPE value="010"  size=30>EMAIL
																	<input type=checkbox   name=NOTIFY_TYPE value="100"  size=30>系统消息
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	是否群发：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=checkbox   name=group_send value="1"  size=30>是
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	发送邮件的邮箱：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text   name=email   size=30>
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="add">
																	
																	<input name="save" type="submit" class="button"
																		value="保  存">
																	&nbsp;
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
</html>