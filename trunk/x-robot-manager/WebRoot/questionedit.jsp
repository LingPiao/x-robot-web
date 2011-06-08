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
	


	String table="";
	String fieldarraystr="";
	String condition="";
	String id="";
	String complain="";

	String question="";

	String answer="";

	String keyword1="";

	String keyword2="";

	String classes="";
	String state="";
	String state1="";
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	id=request.getParameter("questionid");
	 query.setRecordSet("select * from T_UNICOM_QUESTION where QUESTIONID="+id+"");
	 ResultSet rs3 = query.getResultSet();
	 if(rs3.next()){
		//id=rs3.getString("QUESTIONID");
		question=rs3.getString("QUESTION");
		
		answer=rs3.getString("ANSWER");
		
		keyword1=rs3.getString("KEYWORD1");
			if(keyword1==null||"null".equals(keyword1))
		keyword1="";
		keyword2=rs3.getString("KEYWORD2");
			if(keyword2==null||"null".equals(keyword2))
		keyword2="";
		classes=rs3.getString("QUESTION_CLASS");
		state=rs3.getString("STATE");
		state1=rs3.getString("NORMALSTATE");
		}
		
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
			window.location.href="question.jsp";
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
	            if (theForm.elements[j].checked==true && theForm.elements[j].name=="mesid"){
	                flag=flag+1;
	                break;
	            }
	        }
	        //alert(flag);
	        if (flag !=0){
	            if (confirm("删除将不能恢复，是否继续？"))  {
	                var url="questiondel.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editmes(mesid)
		{
	                var url="questionedit.jsp?questionid="+mesid;
	                window.location.href=url;
			
		
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

										
										<!-- 短信添加开始*************************************************************************************** -->
										<td width="79%" align="left" valign="top" id="add">
											<form name =addform method=post action = "questiondb.jsp" >
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														欢迎词语编辑
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	问题标题：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
															
																	<textarea name="question" id="question" cols="80" rows="6" onKeyDown="textCounter(this.form.question,this.form.remLen1,3000);"   onKeyUp="textCounter(this.form.question,this.form.remLen1,3000);"><%=question %></textarea>
																	<br>共可输入3000字，还剩<input   readonly   type=text   name=remLen1   size=4   maxlength=4   value="3000">字。

																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	问题答案：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="answer" id="answer" cols="80" rows="6" onKeyDown="textCounter(this.form.answer,this.form.remLen,3000);"   onKeyUp="textCounter(this.form.answer,this.form.remLen,3000);"><%=answer %></textarea>
																	<br>共可输入3000字，还剩<input   readonly   type=text   name=remLen   size=4   maxlength=4   value="3000">字。
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	词组：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text name="keyword1"  id="keyword1" value="<%=keyword1 %>" style="width:550px;"/>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	单词：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text name="keyword2" id="keyword2"  value="<%=keyword2 %>" style="width:550px;"/>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	分类：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																
																	<select name="classes">
<% 
																	
																	query.setRecordSet("select * from t_unicom_class where class_type='question' order by class_order");
																
																
																	ResultSet rsclass = query.getResultSet();
																	while(rsclass.next()){
																	
																	String classnum=rsclass.getString("CLASS_NUM");
																	%>
																		<option	value="<%=classnum %>"<%if(classnum.equals(classes)){out.print("selected");} %>><%=rsclass.getString("CLASS_NAME") %></option>
																		
																	<%} %>
																	</select>
																</td>
															</tr>
															
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	标注：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<select name="state">
																	
																		<option	value="0"  <%if("0".equals(state)){out.print("selected");} %>>显示</option>
																		<option	value="1"  <%if("1".equals(state)){out.print("selected");} %>>不显示</option>
																	
																	</select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	常用问题：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<select name="state1">
																		<option	value="3" <%if("3".equals(state1)){out.print("selected");} %>>常用</option>
																		<option	value="0" <%if("0".equals(state1)){out.print("selected");} %>>非常用</option>
																	
																	</select>
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=rr_action id=rr_action value="edit">
																	<input type = hidden name=mes_id id=mes_id value="<%=id %>">
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
	<%conn.close(); %>