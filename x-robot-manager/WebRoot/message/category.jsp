<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312" import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<%@ include file="../session.jsp"%>

<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 

	UserManagerAction umAction = new UserManagerAction();
	String userrealname = umAction.getRealNameByname(username);
	MessageCategoryAction mcAction = new MessageCategoryAction();
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	</head>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
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
		function addcate()
		{
			
			document.getElementById("action").value = "add";
			document.getElementById("add").style.display = "block";
			document.getElementById("list").style.display="none";
			
		}
		function canceladd()
		{
			window.location.href="category.jsp";
		}
		function formCheck()
		{
			if(addform.catename.value=="")
			{
				alert("信息类别名称不能为空！");
				addform.catename.focus();
				return false;
			}
			return true;
		}
	   function delcate(theForm)
	   {
	        flag=0;
	        for (j=0;j<theForm.elements.length;j++)   {
	            if (theForm.elements[j].checked==true && theForm.elements[j].name=="CLASS_ID"){
	                flag=flag+1;
	                break;
	            }
	        }
	        if (flag !=0){
	            if (confirm("删除将不能恢复，是否继续？"))  {
	                var url="categorydb.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editcate(cateid,catename)
		{
			document.getElementById("add").style.display = "block";
			document.getElementById("action").value = "edit";
			document.getElementById("list").style.display="none";
			document.getElementById("catename").value=catename;
			document.getElementById("cateid").value=cateid;

		
		}
	</script>
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
										<td width="79%" align="left" valign="top" id=list>
											<p>&nbsp;
												
											</p>
											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0" >
												<form name="listform" action="" method=post>
												<tr>
													<td width="100%" align="left" valign="middle"
														bgcolor="#666666" class="zm_txt" height=25>
														信息分类
													</td>
												</tr>
												<tr>
													<td height="1" align="center" valign="top"></td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<%
																java.util.List catelist = mcAction.getAllCategory();
																for (int i = 0; i < catelist.size(); i++) {
																	Map map = (Map) catelist.get(i);
																	if((i+1)%5 == 1) { 
															%>
																<tr>
																	<td align="left" bgcolor="#FFFFFF" class="zl_huitxt">
																		<input type="checkbox" name="CLASS_ID"
																			value="<%=map.get("CLASS_ID")%>">
																		&nbsp;&nbsp;
																		<a
																			href="javascript:editcate('<%=map.get("CLASS_ID")%>','<%=map.get("CLASS_NAME")%>')"><%=map.get("CLASS_NAME")%>
																		</a>
																	</td>
															<%
																	}
																	if((i+1)%5==0){
											            	%>
																	<td align="left" bgcolor="#FFFFFF" class="zl_huitxt">
																		<input type="checkbox" name="CLASS_ID"
																			value="<%=map.get("CLASS_ID")%>">
																		&nbsp;&nbsp;
																		<a
																			href="javascript:editcate('<%=map.get("CLASS_ID")%>','<%=map.get("CLASS_NAME")%>')"><%=map.get("CLASS_NAME")%>
																		</a>
																	</td>
																</tr>
															<%		
																	} 
																	if((i+1)%5!=0 && ((i+1)%5!=1))
																	{
															%>
																	<td align="left" bgcolor="#FFFFFF" class="zl_huitxt">
																		<input type="checkbox" name="CLASS_ID"
																			value="<%=map.get("CLASS_ID")%>">
																		&nbsp;&nbsp;
																		<a
																				href="javascript:editcate('<%=map.get("CLASS_ID")%>','<%=map.get("CLASS_NAME")%>')"><%=map.get("CLASS_NAME")%>
																			</a>
																	</td>
															<%			
																	}
																}
																int block=(5-(catelist.size()%5));
																for(int j=0;j<block;j++)
																{
															%>
																	<td align="left" bgcolor="#FFFFFF" class="zl_huitxt">
																	</td>
															<%	
																}
															%>
														</table>
													</td>
												</tr>
												<tr>
													<td align="center" valign="middle">&nbsp;
														
													</td>
												</tr>
												</form>
												<tr>
													<td width="100%" align="center" valign="middle">
														<input name="select" type="button" class="button"
															value="全选/反选" onclick="javascript:cmd_AllSel(listform)">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="新  增" onclick="javascript:addcate();">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="删  除" onclick="javaScript:delcate(listform);">
													</td>
												</tr>
											</table>
										</td>
										<!-- 短信分类添加开始*************************************************************************************** -->
										<td width="79%" align="left" valign="top" style="display:none" id="add">
											<form name =addform method=post action = "categorydb.jsp">
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														信息分类
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	信息类别名称：
																</td>
																<td width="80%" bgcolor="#FFFFFF" class="zl_huitxt" align="left">
																	<input type="text" name="catename" id="catename" value=""/>
																	
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="">
																	<input type="hidden" name="cateid" id="cateid" value=""/>
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
										<!-- 短信分类添加结束***************************************************************************************** -->
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
	</body>