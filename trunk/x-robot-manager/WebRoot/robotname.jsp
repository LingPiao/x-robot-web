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
	

		int i=0;
	String table="";
	String fieldarraystr="";
	String condition="MANAGEMENTID=2";
	String Seqid="";
	String DISPLAYNAME="";
	String PERSONALMESSAGE="";
	String RANK="";

	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	query.setRecordSet("select * from T_ROBOTDISPLAY where MANAGEMENTID=2 ");
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
			window.location.href="robotname.jsp";
		}
		function formCheck()
		{
			if(addform.DISPLAYNAME.value=="")
			{
				alert("����д��Ϣ���ݣ�");
				addform.DISPLAYNAME.focus();
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
	            if (confirm("ɾ�������ָܻ����Ƿ������"))  {
	                var url="robotnamedel.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("���ڸ�ѡ����ѡ��Ҫɾ��������");  }
	   	}
		function editmes(theForm,seqid,name,mescontent)
		{
			//alert(mescontent);
			document.getElementById("add").style.display = "block";
			document.getElementById("action").value = "edit";
			document.getElementById("listform").style.display="none";
			document.getElementById("Seqid").value=seqid;
			document.getElementById("DISPLAYNAME").value=name;
			document.getElementById("mes_content").value=mescontent; 
		
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

										<td width="79%" align="left" valign="top" id="listform">
											<p>
												&nbsp;
											</p>
											<%
											table="T_ROBOTDISPLAY";								
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
															���������Ƽ�ǩ������
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
																		��  ��
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=35%>
																		����������
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=40%>
																		������ǩ��
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		��&nbsp;��
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		ѡ&nbsp; ��
																	</td>
																</tr>
																<%
																condition="MANAGEMENTID=2 order by rank";
																query.setRecordSet(table,fieldarraystr,condition);
																ResultSet rs3 = query.getResultSet();
																int indexs=1;
																while(rs3.next()){
																	Seqid = rs3.getString("seqid");
																	DISPLAYNAME=rs3.getString("DISPLAYNAME");
																	PERSONALMESSAGE=rs3.getString("PERSONALMESSAGE");
																	
																	i++;
																	if((i+1)>index.intValue() && i< (index.intValue()+pageSize.intValue()))
																	{ 	  
																	%>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=indexs %>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=DISPLAYNAME %>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=PERSONALMESSAGE %>
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="#" onclick="javaScript:editmes(pager,'<%=Seqid %>','<%=DISPLAYNAME %>','<%=PERSONALMESSAGE%>');">
																		<img src = "images/edit.gif" border = 0>
																		</a>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mesid"
																			value="<%=Seqid %>">
																	</td>
																</tr>
																<%
																	
																	}
																	indexs++;
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
															value="ȫѡ/��ѡ" onclick="javascript:cmd_AllSel(pager)">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="��  ��" onclick="javascript:addmes();">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="ɾ  ��" onclick="javaScript:delmes(pager);">
													</td>
												</tr>
											</table>
										</td>
										<!-- ������ӿ�ʼ*************************************************************************************** -->
										<td width="79%" align="left" valign="top" style="display:none" id="add">
											<form name =addform method=post action = "robotnamedb.jsp" onSubmit=return(formCheck())>
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														���������Ƽ�ǩ��<input type=hidden  name=seqid  id=seqid   size=30>
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	���������ƣ�
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text   name=DISPLAYNAME  id=DISPLAYNAME   size=30>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	������ǩ����
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="mes_content" id="mes_content" cols="50" rows="6" onKeyDown="textCounter(this.form.mes_content,this.form.remLen,200);"   onKeyUp="textCounter(this.form.mes_content,this.form.remLen,200);"></textarea>
																	<br>��������200�֣���ʣ<input   readonly   type=text   name=remLen   size=3   maxlength=3   value="200">�֡�
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="">
																	
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
	</body>
	<%conn.close(); %>