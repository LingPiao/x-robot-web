<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.bean.*"%>
<%@ page import="com.catic.tool.*"%>
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
	<script type="text/javascript">
	  <!--   Begin   
	  function   textCounter(field,   countfield,   maxlimit)   {   
	  	if   (field.value.length   >   maxlimit)     
	  		field.value   =   field.value.substring(0,maxlimit);   
	  	else     
	  		countfield.value   =   maxlimit   -   field.value.length;   
	  }   
	  //   End   --> 
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
			window.location.href="sms.jsp";
		}
		function formCheck()
		{
			if(addform.mes_content.value=="")
			{
				alert("请填写信息内容！");
				addform.mes_content.focus();
				return false;
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
	        //alert(flag);
	        if (flag !=0){
	            if (confirm("删除将不能恢复，是否继续？"))  {
	                var url="comdb.jsp?action=deleteall";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editmes(theForm,mesid,mescategoryid,mescontent)
		{
			document.getElementById("add").style.display = "block";
			document.getElementById("action").value = "edit";
			document.getElementById("listform").style.display="none";
			document.getElementById("mes_id").value=mesid;
			document.getElementById("mes_content").value=mescontent;
			document.getElementById("mes_category").value=mescategoryid; 
		
		}
		
		function updatestated(theForm)
		{
		    var url="complaints.jsp?states=1";
		    theForm.action=url;
		    theForm.submit();		
		}
		function updatestatea(theForm)
		{
		    var url="complaints.jsp?states=2";
		    theForm.action=url;
		    theForm.submit();		
		}	
		function updatestatew(theForm)
		{
		    var url="complaints.jsp?states=0";
		    theForm.action=url;
		    theForm.submit();		
		}
	</script>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
	<body>
<%
	String states=request.getParameter("states");
	if("".equals(states)||states==null||"null".equals(states)){
		states="0";
	}
	int i=0;
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
	String comtypecode="";
	String state="";

 %>
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
											table="SMS_TOUSU";
											
											condition="STATE='"+states+"'";
											fieldarraystr="*";
											query.setRecordCount(table,condition);
											
											int count = query.getRecordCount();
											//System.out.println(count);
											%>


											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												<page:pager total='<%=count%>' defaultPageSize="10">
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															投诉管理
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
																		投诉业务号码
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=20%>
																		状态
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		联系人
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=40%>
																		投诉主题
																	</td>

																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		查&nbsp;看
																	</td>

																</tr>
																<%
																query.setRecordSet(table,fieldarraystr,condition);
																ResultSet rs3 = query.getResultSet();
																while(rs3.next()){
																	id=rs3.getString("tousu_id");
																	complain=rs3.getString("complain");
																	email=rs3.getString("email");  
																		
																	contact= rs3.getString("contact");  
																	contactphone= rs3.getString("contactphone");  
																	subject= rs3.getString("subject"); 
																	int subjectlength=subject.length();
																		if(subjectlength<=20){
																			for(int l=0;l<(20-subjectlength);l++){
																			
																				subject=subject+"&nbsp;&nbsp;";
																				//System.out.println(subject);
																			}
																		}else{
																			
																			subject=subject.substring(0,18);
																			subject=subject+"..";
																		}
																	content= rs3.getString("content"); 
																	state= rs3.getString("state"); 
																	comtypecode= rs3.getString("comtypecode"); 
																	i++;
																	if((i+1)>index.intValue() && i< (index.intValue()+pageSize.intValue()))
																	{ 	  
																	%>
																		<tr>
																		<td align="center" valign="middle" bgcolor="#FFFFFF" class="logon_txt1">
																		<%=contactphone %>
																		</td>
																		<td align="center" valign="middle" bgcolor="#FFFFFF" class="logon_txt1">
																		<%if("9".equals(state)){out.print("已处理");}else{out.print("处理中");} %>
																		</td>
																		<td align="center" valign="middle" bgcolor="#FFFFFF" class="logon_txt1">
																		<%=contact %>
																		</td>
																		<td align="left" valign="middle" bgcolor="#FFFFFF" class="logon_txt1"><%=subject %></td>
																		<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="<%if(!"2".equals(state)){out.print("complaint.jsp?action=update&tousu_id="+id);}else{out.print("#");} %>" ><img src = "../images/edit.gif" border = 0>
																		</a>	
																		</td>
			
																		</tr>
																	<%
																	}
																	
																}
																rs3.close();
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
														<input name="select" type="hidden" class="button"
															value="全选/反选" onclick="javascript:cmd_AllSel(pager)">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="已审核" onclick="javascript:updatestatea(pager);">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="已删除" onclick="javascript:updatestated(pager);">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="未审核" onclick="javascript:updatestatew(pager);">
														&nbsp;
														<input name="Submit32" type="hidden" class="button"
															value="删  除" onclick="javaScript:delmes(pager);">
													</td>
												</tr>
											</table>
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
	<%
	conn.close();
	
	 %>