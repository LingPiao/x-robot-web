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
	String condition="";
	

	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	

	</head>
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
			window.location.href="vip_add.jsp";
						
		}
		function canceladd()
		{
			window.location.href="vip.jsp";
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
	                var url="vip_db.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("���ڸ�ѡ����ѡ��Ҫɾ��������");  }
	   	}
		
	</script>
		<link href="../css/css1.css" rel="stylesheet" type="text/css">
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
											table="t_vip_customer";								
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
															VIP����/�ͻ���Ϣ
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
																		class="zl_huitxt" width=10%>
																		VIP����
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=20%>
																		�ͻ�
																	</td>
																	
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=8%>
																		ѡ&nbsp; ��
																	</td>
																</tr>
																<%
																query.setRecordSet("select c.* from t_vip_manager m,t_vip_customer c where m.m_mobile=c.m_mobile order by m.m_mobile");
																ResultSet rs3 = query.getResultSet();
																int indexs=1;
																String temp_period="";
																while(rs3.next()){
																	
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
																		<%=rs3.getString("m_mobile")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=rs3.getString("c_mobile") %>
																	</td>
																	
																	
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mesid"
																			value="<%=rs3.getString("m_mobile")%>-<%=rs3.getString("c_mobile")%>">
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
</html>