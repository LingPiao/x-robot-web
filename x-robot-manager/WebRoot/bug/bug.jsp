<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ include file="../session.jsp"%>
<%

	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
	
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
	                var url="bugdel.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}


	</script>
	
<%!
	private final String sKeyField = "BUG_ID";

	private final String sTable = "SMS_BUG";

	private final String sField = "BUG_ID,SUBJECT,CONTENT,FILEURL";

	String sCond = "";

	public List getAllMms() {

	ResultSet rs3 = null;
	DataConn dataConn = new DataConn();
	QueryData queryData = new QueryData(dataConn);
		java.util.List list = new ArrayList();
		try{


			//sCond =  "where 1=1 order by "+sKeyField+" desc";
			String sql="select * from sms_bug order by bug_id";
			queryData.setRecordSet(sql);
			rs3 = queryData.getResultSet();
			
			while (rs3.next())
			{
				Map map = new HashMap();
				map.put("BUG_ID",rs3.getString("BUG_ID"));
				map.put("SUBJECT",rs3.getString("SUBJECT"));
				map.put("CONTENT",rs3.getString("CONTENT"));
				map.put("FILEURL", rs3.getString("FILEURL"));
				
				list.add(map);
			}
			
			rs3.close();
			dataConn.close();	
		}  
		catch (java.sql.SQLException e) {
			System.out.println("错误原因:" + e.getMessage());
		}
		return list;
	}
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
										<td width="79%" align="left" valign="top" id="listform">
											<p>
												&nbsp;
											</p>
											<%
												java.util.List list = this.getAllMms();
												int count = list.size();
												//System.out.println(count);
											%>

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												<page:pager total='<%=count%>' defaultPageSize="5">
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															BUG管理
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
																		BUG标题
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=50%>
																		BUG内容
																	</td>
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		查&nbsp;看
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
																		System.out.println(map.get("FILEURL"));
																%>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("SUBJECT")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("CONTENT")%>
																	</td>
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="bugviwe.jsp?SUBJECT=<%=map.get("SUBJECT")%>&CONTENT=<%=map.get("CONTENT")%>&FILEURL=<%=map.get("FILEURL")%>"><img src = "../images/edit.gif" border = 0>
																		</a>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mmsid"
																			value="<%=map.get("BUG_ID")%>">
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
														<input name="Submit32" type="hidden" class="button"
															value="新  增" onclick="javascript:addmes();">
														&nbsp;
														<input name="Submit32" type="button" class="button"
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