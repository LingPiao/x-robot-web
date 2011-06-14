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
	ConvertDate cd = new ConvertDate();
	String timeid = "",contactemail="",notifytime="",	period="",content="",email="",notify_type="",group_send="";
	int ntyope=0;
	timeid = request.getParameter("timerid");
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	String table = "t_timer";
	String fieldarraystr = "*";
	String condition = "timerid='"+timeid+"'";
	query.setRecordSet(table,fieldarraystr,condition);
	ResultSet rs = query.getResultSet();
if(rs.next())
{
	contactemail = rs.getString("contactemail");
	notifytime = cd.dateToString(rs.getTimestamp("notifytime"));
	period = rs.getString("period");
	content = rs.getString("content");
	email = rs.getString("email");
	if(email == null)
		email="";
	ntyope=rs.getInt("notify_type");
	group_send= rs.getString("group_send");
}
int temp1=0;
int temp11=0;
	temp1=ntyope/4;
	temp11=ntyope%4;
int temp2=0;
int temp22=0;
	temp2=temp11/2;
	temp22=temp11%2;

rs.close();
conn.close();
%>

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
	<script type="text/javascript" src="clock.js"></script>
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
														主动服务信息<input type=hidden  name=timerid   size=30 value=<%=timeid%>>
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	用户email：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text   name=contactemail   size=30 value=<%=contactemail%>>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	开始时间：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type="text" readonly  onclick="fPopCalendar(begin,begin); return false"  id="begin" class="input-text" style="width:100px;" name="begin" value="<%=notifytime.substring(0,10)%>" />
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
														        <option value=<%=temp%> <% if((notifytime.substring(11,13)).equals(temp)){ %>selected<% } %> ><%=temp%>&nbsp;</option>
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
														        <option value=<%=temp%> <% if((notifytime.substring(14,16)).equals(temp)){ %>selected<% } %>><%=temp%>&nbsp;</option>
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
																	<option value = "o" <%if(period.equals("o")) out.print("selected");%>>只提醒一次</option>
																	<option value = "d" <%if(period.equals("d")) out.print("selected");%>>每天提醒一次</option>
																	<option value = "w" <%if(period.equals("w")) out.print("selected");%>>每周提醒一次</option>
																	<option value = "m" <%if(period.equals("m")) out.print("selected");%>>每月醒一次</option>
																	</select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	提醒内容：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="content" cols="50" rows="6" ><%=content%></textarea>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	提醒类型：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=checkbox   name=NOTIFY_TYPE value="001" <%if(temp22==1) out.print("checked");%> size=30>短信
																	<input type=checkbox   name=NOTIFY_TYPE value="010" <%if(temp2==1) out.print("checked");%> size=30>EMAIL
																	<input type=checkbox   name=NOTIFY_TYPE value="100" <%if(temp1==1) out.print("checked");%>  size=30>系统消息
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	是否群发：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=checkbox   name=group_send value="1"  size=30 <%if(group_send.equals("1")) out.print("checked");%>>是
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	发送邮件的邮箱：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text   name=email   size=30 value=<%=email%>>
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="edit">
																	
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
