<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*,java.text.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>

<%@ page import="com.catic.bean.*"%>

<%

	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
	
%>
<script type="text/javascript" src="../../js/clock.js"></script>
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
	            if (confirm("ɾ�������ָܻ����Ƿ������"))  {
	                var url="frienddel.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("���ڸ�ѡ����ѡ��Ҫɾ��������");  }
	   	}


	</script>
	
<%!


	String sCond = "";

	public List getAllMms(String cond) {

	ResultSet rs3 = null;
	DataConn dataConn = new DataConn();
	QueryData queryData = new QueryData(dataConn);
		java.util.List list = new ArrayList();
		try{


			//sCond =  "where 1=1 order by "+sKeyField+" desc";
			String sql="select * from t_friend_jiben ";
			if(!"".equals(cond))
			{
				sql+=" where "+cond;
			}
			System.out.println("555555555555555555555555555"+sql);
			queryData.setRecordSet(sql);
			rs3 = queryData.getResultSet();
			
			while (rs3.next())
			{
				Map map = new HashMap();
				map.put("MSNID",rs3.getString("MSNID"));
				map.put("TRUE_NAME",rs3.getString("TRUE_NAME"));
				map.put("PLACE",rs3.getString("PLACE"));
				map.put("NAME", rs3.getString("NAME"));
				map.put("HUNYIN", rs3.getString("HUNYIN"));
				list.add(map);
			}
			
			rs3.close();
			dataConn.close();	
		}  
		catch (java.sql.SQLException e) {
			System.out.println("����ԭ��:" + e.getMessage());
		}
		return list;
	}
 %>
	<%
	request.setCharacterEncoding("gb2312");
	String action=request.getParameter("r_action");
	
	String HUNYIN=request.getParameter("HUNYIN");
	String PLACE=request.getParameter("PLACE");
	String MONEY=request.getParameter("MONEY");
	String XUELI=request.getParameter("XUELI");	
	String 	SEX=request.getParameter("SEX");	
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	String url="";
	String table="";
	String fieldarraystr="";
	String condition="";
		String data1 = request.getParameter("BIRTH1");
		if("null".equals(data1)||data1==null)
			data1="";
	 	String data2 = request.getParameter("BIRTH2");
	 	if("null".equals(data2)||data2==null)
			data2="";
	 	if("search".equals(action)){
	 	sCond=" 1=1 ";
	 	if(!"".equals(SEX)){
		sCond+=" and SEX='"+SEX+"'";
		}
	 	if(!"".equals(PLACE)){
		sCond+=" and PLACE='"+PLACE+"'";
		}
		if(!"".equals(XUELI)){
		sCond+=" and XUELI='"+XUELI+"'";
		}
		if(!"".equals(MONEY)){
		sCond+=" and MONEY='"+MONEY+"'";
		}
		if(!"".equals(HUNYIN)){
		sCond+=" and HUNYIN='"+HUNYIN+"'";
		}
		if(!"".equals(data2)){
		sCond+=" and  to_char(DATE_ZHUCE,'yyyy-mm-dd')<='"+data2+"'";
		}
		if(!"".equals(data1)){
		sCond+=" and  to_char(DATE_ZHUCE,'yyyy-mm-dd')>='"+data1+"'";
		}
		}else{
		sCond="";
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
												java.util.List list = this.getAllMms(sCond);
												int count = list.size();
												//System.out.println(count);
											%>

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															���ѹ���
														</td>
													</tr>
													<tr>
														<td height="1" align="center" valign="top"></td>
													</tr>
													<tr>
														<td align="center" valign="top">
															<table width="100%" border="0" cellpadding="3"
																cellspacing="1" bgcolor="#666666">
														<form  name=suggest  action="friend.jsp?r_action=search"  method=post>
																<tr>
																<td colspan="7" align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=20%>
															 ����<select name="PLACE" style="width:80px;">
															 <option value="" >��ѡ��</option>
							                                   <%
							                                   	table="T_UNICOM_CITY";
																fieldarraystr="*";
																condition="FATHER='510000'";
																query.setRecordSet(table,fieldarraystr,condition);
																ResultSet rs3 = query.getResultSet();
																while(rs3.next()){
																String CITY=rs3.getString("CITY");
							                                    %>
							                                      <option value="<%=CITY %>" <%if(CITY.equals(PLACE))out.print("selected"); %>><%=CITY %></option>
							                                   <%} %>  
							                                      
							                                  </select>
																����<select name="HUNYIN"  style="width:80px;">
							                                      <option value="" >��ѡ��</option>
							                                      <option value="�ѻ�" <%if("�ѻ�".equals(HUNYIN))out.print("selected"); %>>�ѻ�</option>
							                                      <option value="δ��" <%if("δ��".equals(HUNYIN))out.print("selected"); %>>δ��</option>
							                                      <option value="����" <%if("����".equals(HUNYIN))out.print("selected"); %>>����</option>
							                                      <option value="ɥż" <%if("ɥż".equals(HUNYIN))out.print("selected"); %>>ɥż</option>
							                                      
							                                    </select>  
							                                    �Ա�<select name="SEX"  style="width:80px;">
							                                      <option value="" >��ѡ��</option>
							                                      <option value="1" <%if("1".equals(SEX))out.print("selected"); %>>��</option>
							                                      <option value="0" <%if("0".equals(SEX))out.print("selected"); %>>Ů</option>

							                                      
							                                    </select> 
							                                    ѧ��<select name="XUELI"  style="width:80px;">
							                                      <option value="" >��ѡ��</option>
							                                      <option value="ר��" <%if("ר��".equals(XUELI))out.print("selected"); %>>ר��</option>
							                                      <option value="����" <%if("����".equals(XUELI))out.print("selected"); %>>����</option>
							                                      <option value="˫˶ʿ" <%if("˫˶ʿ".equals(XUELI))out.print("selected"); %>>˫˶ʿ</option>
							                                      <option value="��ʿ"	<%if("��ʿ".equals(XUELI))out.print("selected"); %> >��ʿ</option>
							                                      
							                                    </select>
							                                    ��н<select name="MONEY"  style="width:80px;">
							                                     <option value="" >��ѡ��</option>
								                                      <option value="0-1000" <%if("0-1000".equals(MONEY))out.print("selected"); %> >1000����</option>
								                                      <option value="1000-3000" <%if("1000-3000".equals(MONEY))out.print("selected"); %> >1000-3000</option>
								                                      <option value="3000-5000" <%if("3000-5000".equals(MONEY))out.print("selected"); %> >3000-5000</option>
								                                      <option value="5000-8000" <%if("5000-8000".equals(MONEY))out.print("selected"); %> >5000-8000</option>
								                                      <option value="8000-10000" <%if("8000-10000".equals(MONEY))out.print("selected"); %> >8000-10000</option>
								                                      <option value="10000-0" <%if("10000-0".equals(MONEY))out.print("selected"); %> >10000����</option>
								                                    </select>
							                                    	��ʼ���ڣ�<input type="text" runat="server" onclick="fPopCalendar(BIRTH1,BIRTH1); return false"  id="BIRTH1" class="input-text" style="width:100px;" name="BIRTH1" value="<%=data1 %>" />
																	
																		
																		��ֹ���ڣ�<input type="text" runat="server" onclick="fPopCalendar(BIRTH2,BIRTH2); return false"  id="BIRTH2" class="input-text" style="width:100px;" name="BIRTH2" value="<%=data2 %>" />
																	
																		
																		<input type="submit" name="button" class="button" value="��ѯ"/>
																</td>
																</tr>
																</form>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=20%>
																		MSN
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=20%>
																		�ǳ�
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		����
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		����
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		��ʵ����
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		��&nbsp;��
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		ѡ&nbsp; ��
																	</td>
																	<page:pager total='<%=count%>' defaultPageSize="10">
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
																		<%=map.get("MSNID")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("NAME")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("HUNYIN")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("PLACE")%>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=map.get("TRUE_NAME")%>
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="friendview.jsp?MSNID=<%=map.get("MSNID")%>"><img src = "../images/edit.gif" border = 0>
																		</a>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mmsid"
																			value="<%=map.get("MSNID")%>">
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
															value="ȫѡ/��ѡ" onclick="javascript:cmd_AllSel(pager)">
														&nbsp;
														<input name="Submit32" type="hidden" class="button"
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