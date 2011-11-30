
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
	Encryption encryption = new Encryption();
	UserManagerAction umAction = new UserManagerAction();
	String userrealname = umAction.getRealNameByname(username);
	
%>

<script type="text/javascript">
		function cmd_AllSel(objform){
			for (i=0; i<objform.elements.length; i++){
				if (objform.elements[i].type == "checkbox"){ 
					if(objform.elements[i].checked == true){
						objform.elements[i].checked = false;
					}
					else{
						objform.elements[i].checked = true;
					}
				}
			}
		}
		function addmes()
		{
			
			document.getElementById("action").value = "add";
			document.getElementById("add").style.display = "block";
			document.getElementById("listform").style.display="none";
			
		}
		function canceladd()
		{
			window.location.href="user.jsp";
		}
		function formCheck()
		{
			if(addform.username.value=="")
			{
				alert("请填写登陆名！");
				addform.username.focus();
				return false;
			}
			if(addform.realname.value=="")
			{
				alert("请填写真实姓名！");
				addform.realname.focus();
				return false;
			}
			if(addform.pwd.value=="")
			{
				alert("请填写密码！");
				addform.pwd.focus();
				return false;
			}
			if(addform.pwd1.value=="")
			{
				alert("请再次填写密码！");
				addform.pwd1.focus();
				return false;
			}
			if(addform.pwd.value!=addform.pwd1.value)
			{
				alert("两次输入的密码不一致，请重新输入！");
			
				return false;
			}
			var num;
			var flag;
			num=document.addform.user_role.length;
			flag=0;
			for (j=0;j<num;j++)
			{
				
   				if(document.addform.user_role[j].checked)
   				{
   					flag=1;
   				}
   			}
   			if(flag == 0)
			{
				alert("请选择用户角色！");
			
				return false;
			}
			return true;
		}
	   function delmes(theForm)
	   {
	        flag=0;
	        for (j=0;j<theForm.elements.length;j++)   {
	            if (theForm.elements[j].checked==true && theForm.elements[j].name=="mesid"){
	                flag=flag+1;
	                break;
	            }
	        }
	        //alert(flag);
	        if (flag !=0){
	            if (confirm("删除将不能恢复，是否继续？"))  {
	                var url="userdb.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editmes(theForm,str1,str2,str3,str4,str5)
		{
			
			document.getElementById("add").style.display = "block";
			document.getElementById("action").value = "edit";
			document.getElementById("listform").style.display="none";
			document.getElementById("user_id").value=str1;
			document.getElementById("username").value=str2;
			document.getElementById("pwd").value=str3; 
			document.getElementById("pwd1").value=str3; 
			document.getElementById("realname").value=str4;
			
			var num;
			num=document.addform.user_role.length;
			for (j=0;j<num;j++)
			{
				//alert(document.addform.user_role[j].value);
   				if(document.addform.user_role[j].value==str5)
   				{
   					document.addform.user_role[j].checked = true;
   				}
   			}
		}
	</script>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	
		
	</head>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
	
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
										
										<td width="79%" align="left" valign="top" id="listform">
											<p>
												&nbsp;
											</p>
											<%
												umAction = new UserManagerAction();
												java.util.List list = umAction.getAllUser();
												int count = list.size();
												//System.out.println(count);
											%>

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												<page:pager total='<%=count%>' defaultPageSize="10">
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															用户管理
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
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		登陆名
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=75%>
																		真实姓名
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		编&nbsp;辑
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		选&nbsp; 择
																	</td>
																</tr>
																<%
																	int step=0;
																	for (int i = 0; i < list.size(); i++) {
																		Map map = (Map) list.get(i);
																		step++;
																		if ((step + 1) > index.intValue() && step < (index.intValue() + pageSize.intValue())) {						
																%>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("USERNAME")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("USERREALNAME")%>
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="#" onclick="javaScript:editmes(pager,<%=map.get("USERID")%>,'<%=map.get("USERNAME")%>','<%=encryption.getDecrypt(map.get("USERPWD").toString())%>','<%=map.get("USERREALNAME")%>','<%=map.get("USERROLE")%>');"><img src = "../images/edit.gif" border = 0>
																		</a>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mesid"
																			value="<%=map.get("USERID")%>">
																	</td>
																</tr>
																<%
																	}
																	
																}
																%>
															</table>
														</td>
													</tr>

													<tr>
														<td height=25 colspan="8" align="right" class="zm_txt">
															<page:navigator type='SIMPLETEXT' />
														</td>
													</tr>
												</page:pager>
												<tr>
													<td width="100%" align="center" valign="middle">
														<input name="select" type="button" class="button"
															value="全选/反选" onclick="javascript:cmd_AllSel(pager)">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="新  增" onclick="javascript:addmes();">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="删  除" onclick="javaScript:delmes(pager);">
													</td>
												</tr>
											</table>
										</td>
										<!-- 短信添加开始*************************************************************************************** -->
										<td width="79%" align="left" valign="top" style="display:none" id="add">
											<form name =addform method=post action = "userdb.jsp" onSubmit=return(formCheck())>
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														用户编辑
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	登陆名：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input name = username type=text value="">
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	真实姓名：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input name = realname type=text value="">
																</td>
															</tr>	
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	密码：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input name = pwd type=password value="">
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	再次输入密码：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input name = pwd1 type=password value="">
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	用户角色：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left"><input name='user_role' type="hidden" class="" value="all">&nbsp;&nbsp;
																<%
																	String strrole="";
																	String sTable="t_private";
																	String sField="DISTINCT role_id, role_name";
																	String sCondition="1=1";
															    	DataConn dataConn = new DataConn();
															    	QueryData queryData = new QueryData(dataConn);
																 	queryData.setRecordSet(sTable,sField, sCondition);
																 	ResultSet rolers = queryData.getResultSet();
																 	while(rolers.next())
																 	{		 
																	%>
															        	<input name='user_role' type="radio" class="" value="<%=rolers.getString("role_id") %>"><%=rolers.getString("role_name")%>&nbsp;&nbsp;
																  	<%
																  	}rolers.close(); %>	
																	
																</td>
															</tr>														
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="">
																	<input type = hidden name=user_id id=user_id value="">
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