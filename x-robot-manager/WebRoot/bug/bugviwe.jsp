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
	<%
		
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
														BUG查看
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	BUG标题:
																</td>
																<td width="80%" bgcolor="#FFFFFF" class="zl_huitxt" align="left">
																	<input id=subject  type="text" class="input-text" style="width:355px;" name="complaintSuggestInfo.subject" value="<%=new String(request.getParameter("SUBJECT").getBytes("iso-8859-1")) %>" />
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	BUG内容:
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<%=new String(request.getParameter("CONTENT").getBytes("iso-8859-1")) %>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	附件：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																<%if(request.getParameter("FILEURL").equals("null")) {%>
																无附件
																<%}else{ %>
																	<a href="../../<%=request.getParameter("FILEURL") %>" target=_blank>下载</a>
																	<%} %>
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
									
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