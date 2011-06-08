<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=GBK"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>

<jsp:useBean id="mgr" scope="page" class="com.catic.tool.mgr.Manager" />

<%
	String hot_keyword = mgr.getStr(request.getParameter("hot_keyword")).toUpperCase();
	if(hot_keyword == null || hot_keyword.equalsIgnoreCase("NULL")) hot_keyword = "";
	KeyWordAction smAction = new KeyWordAction();
	
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">	
	</head>
	<link href="../css/css.css" rel="stylesheet" type="text/css">
	<link href="../css/css1.css" rel="stylesheet" type="text/css">
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
			window.location.href="keyword.jsp";
		}
		function formCheck()
		{
			if(addform.mes_content.value=="")
			{
				alert("请填写内容！");
				addform.mes_content.focus();
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
	                var url="keyworddb.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editmes(theForm,mescategoryid,mescontent)
		{
			document.getElementById("add").style.display = "block";
			document.getElementById("action").value = "edit";
			document.getElementById("listform").style.display="none";
			document.getElementById("mes_id").value=mescategoryid;
			document.getElementById("mes_content").value=mescontent;
			
		
		}
		function hotSub(theForm)
	   {
	   		var hot_keyword = document.getElementById('hot_keyword').value;
	        theForm.action="keyword.jsp?hot_keyword="+hot_keyword;
	        theForm.submit();
	   	}
		function show_ywck(){
			if(formCheck()){
				var v = encodeURIComponent(addform.mes_content.value);
				document.getElementById('ywck').src="ywck.jsp?mes_content="+v;
			}
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
											<p>&nbsp;
												
											</p>
											<%
												java.util.List list = smAction.getAllCategory(hot_keyword);
												int count = list.size();
												//System.out.println(count);
											%>

											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
												<page:pager total='<%=count%>' defaultPageSize="20">
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															关键热词管理
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
																	<td height="25" colspan="2" align="left" bgcolor="#FFFFFF" class="zl_huitxt">关键热词查询：
																	  <input name="hot_keyword" type=text id="hot_keyword" value="<%=hot_keyword%>" />
                                                                      <input type="button" name="button" value="查询" onclick="hotSub(pager);"/></td>
															      </tr>
																<%
																	int step=0;
																	int indexs=1;
																	for (int i = 0; i < list.size(); i++) {
																		Map map = (Map) list.get(i);
																		step++;
																		if ((step + 1) > index.intValue() && step < (index.intValue() + pageSize.intValue())) {						
															%>
																<tr>
																	<td align="left" bgcolor="#FFFFFF" class="zl_huitxt">
																	<%=indexs %>																	</td>
																	<td align="left" bgcolor="#FFFFFF" class="zl_huitxt">
																		<input type="checkbox" name="mesid"
																			value="<%=map.get("KEYWORD_ID")%>">
																		&nbsp;&nbsp;
																		<a href="#" onclick="javaScript:editmes(pager,'<%=map.get("KEYWORD_ID")%>','<%=map.get("KEYWORD_NAME")%>');"><%=map.get("KEYWORD_NAME")%>																		</a>																	</td>
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
														<input name="select" type="hidden" class="button"
															value="全选/反选" onclick="javascript:cmd_AllSel(pager)">
														&nbsp;
														<input name="Submit32" type="button" class="button"
															value="新  增" onclick="javascript:addmes();">
														&nbsp;
														<input name="Submit321" type="button" class="button"
															value="删  除" onclick="javaScript:delmes(pager);">
													</td>
												</tr>
											</table>
										</td>
										<!-- 短信添加开始*************************************************************************************** -->
										<td width="79%" align="left" valign="top" style="display:none" id="add">
											<form name="addform" method="post" action = "keyworddb.jsp" onSubmit=return(formCheck())>
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														关键热词编辑
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	关键词内容：																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																<input type = text name=mes_content id=mes_content value="">
&nbsp;<input type="button" name="ywckbutton" value="显示业务词库" onclick="show_ywck();"/>															</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="">
																	<input type = hidden name=mes_id id=mes_id value="">
																	<input name="save" type="submit" class="button"
																		value="保  存">
																	&nbsp;
																	<input name="cancel" type="button" class="button"
																		value="取  消" onClick="javascript:canceladd()">																</td>
															</tr>
														</table>															
												  </td>
												</tr>											
											</table>
											<center>
										  <iframe name="ywck" frameborder="0" width="90%" height="400" id="ywck" scrolling="auto" src="blank.jsp"></iframe>
                                          </center>
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
							<td class="login_di" colspan=2>&nbsp;
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
	</html>