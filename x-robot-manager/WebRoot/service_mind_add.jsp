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
				alert("����д�û�email��");
				addform.contactemail.focus();
				return false;
			}
			if(addform.content.value=="")
			{
				alert("����д��������");
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
										<!-- ������ӿ�ʼ*************************************************************************************** -->
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
														����������Ϣ
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	�û�email��<br>������û�����Ӣ�İ�Ƿֺ�";"������
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name=contactemail rows=5 cols=50></textarea><input type=checkbox value=1 name=auser onclick=setuset();>�����û�
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	��ʼʱ�䣺
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
																	���Ѽ����
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<select name="period">
																	<option value = "o">ֻ����һ��</option>
																	<option value = "d">ÿ������һ��</option>
																	<option value = "w">ÿ������һ��</option>
																	<option value = "m">ÿ����һ��</option>
																	</select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	�������ݣ�
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="content" cols="50" rows="6" ></textarea>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	�������ͣ�
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=checkbox   name=NOTIFY_TYPE value="001"  size=30>����
																	<input type=checkbox   name=NOTIFY_TYPE value="010"  size=30>EMAIL
																	<input type=checkbox   name=NOTIFY_TYPE value="100"  size=30>ϵͳ��Ϣ
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	�Ƿ�Ⱥ����
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=checkbox   name=group_send value="1"  size=30>��
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	�����ʼ������䣺
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text   name=email   size=30>
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="add">
																	
																	<input name="save" type="submit" class="button"
																		value="��  ��">
																	&nbsp;
																	<input name="cancel" type="button" class="button"
																		value="ȡ  ��" onClick="javascript:canceladd()">
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