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
			document.getElementById("uploadornot").value=1;
			
		}
		function canceladd()
		{
			window.location.href="mms.jsp";
		}
		function formCheck()
		{
			if(document.getElementById("uploadornot").value==1)
			{
				if(addform.mms_title.value=="")
				{
					alert("请填写信息内容！");
					addform.mms_title.focus();
					return false;
				}
				if(addform.mms_content.value=="")
				{
					alert("请选择图片！");
					addform.mms_content.focus();
					return false;
				}
			}
			return true;
		}
	   function delmes(theForm)
	   {
	        flag=0;
	        for (j=0;j<theForm.elements.length;j++)   {
	            if (theForm.elements[j].checked==true && theForm.elements[j].name=="mmsid"){
	                flag=flag+1;
	                break;
	            }
	        }
	        if (flag !=0){
	            if (confirm("删除将不能恢复，是否继续？"))  {
	                var url="mmsdel.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editmes(theForm,mesid,mescategoryid,mmstitle,mmpic)
		{
			document.getElementById("add").style.display = "block";
			document.getElementById("action").value = "edit";
			document.getElementById("listform").style.display="none";
			document.getElementById("mms_id").value=mesid;
			document.getElementById("mms_title").value=mmstitle;
			document.getElementById("mms_category").value=mescategoryid; 
			document.getElementById("picdiv").style.display="block";
			document.getElementById("mms_content").style.display="none";
			document.getElementById("imgpic").src = "../../"+mmpic;	
		}
		function fileupload()
		{
			//uploadornot判断是否重新上传文件，重新上传则uploadornot值为1，否则为0
			document.getElementById("mms_content").style.display="block";
			document.getElementById("cancel").style.display="block";
			document.getElementById("picdiv").style.display="none";
			document.getElementById("uploadornot").value="1";
		}
		function filedisplay(){
			document.getElementById("mms_content").style.display="none";
			document.getElementById("picdiv").style.display="block";
			document.getElementById("uploadornot").value="0";
			document.getElementById("cancel").style.display="none";
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
										<td width="79%" align="left" valign="top" id="listform">
											<p>
												&nbsp;
											</p>
											<%
												java.util.List list = mmAction.getAllMms();
												int count = list.size();
												//System.out.println(count);
											%>

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												<page:pager total='<%=count%>' defaultPageSize="5">
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															彩信管理
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
																		信息分类
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=50%>
																		信息标题
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=25%>
																		图&nbsp;片
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
																		<%=map.get("CLASS_NAME")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("MMS_TITLE")%>
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<img src="../../<%=map.get("MMS_PICURL")%>" border = 0 width=100 height=100>
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="#" onclick="javaScript:editmes(pager,<%=map.get("MMS_ID")%>,'<%=map.get("CLASS_ID")%>','<%=map.get("MMS_TITLE")%>','<%=map.get("MMS_PICURL")%>');"><img src = "../images/edit.gif" border = 0>
																		</a>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mmsid"
																			value="<%=map.get("MMS_ID")%>">
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
														彩信编辑
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	信息类别：
																</td>
																<td width="80%" bgcolor="#FFFFFF" class="zl_huitxt" align="left">
																	<select name="mms_category" class="btn_2k3" style="width:150px">
																	<%
																		MessageCategoryAction mcAction = new MessageCategoryAction();
																		java.util.List listCategory = mcAction.getAllCategory();
																		for (int i = 0; i < listCategory.size(); i++) {
																			Map map = (Map) listCategory.get(i);
																	%>
																	<option value="<%=map.get("CLASS_ID")%>"><%=map.get("CLASS_NAME")%></option>
																	<%} %>
																	</select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	标题：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input name="mms_title" type="text" size="15" class="input_txt" style="width:310px;"/>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	图片：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<div id=picdiv style="display:none"><img src="" width=100 height=100 border=0 id=imgpic><a href="#" onClick="javascript:fileupload()">重新上传</a></div>
																	<input name="mms_content" id = "mms_content" type="file" size="15" class="input_txt" style="width:270px;" contentEditable="false"/><input type = button id=cancel name=cancel value="取消上传" style="display:none" onClick="javascript:filedisplay()">
																	<input type = hidden name=uploadornot id=uploadornot value="0">
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="">
																	<input type = hidden name=mms_id id=mms_id value="">
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