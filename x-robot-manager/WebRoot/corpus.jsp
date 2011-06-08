<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312" import="java.sql.*,java.util.*"%>
<%@ page import = "com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
 
<%
	
	String num=request.getParameter("num");

	String content=request.getParameter("content");

	 
	String questionid="";
	String questioncontent="";
	String questionkeywords="";
	String answerid="";
	
	String answercontent="";
	System.out.println(num);
	List questionlist=new ArrayList();
	List answerlist=new ArrayList();
    net.sf.robot.util.SpringInstance.launch("spring_config.xml");
	ChatManage chatManage = new ChatManage();
	if(content!=null&&!"null".equals(content)&&!"".equals(content)){
		content =new String( content.getBytes("8859_1"));
		questionlist=chatManage.qryQuestion(content);
	}else{
		if("".equals(num)||num==null||"null".equals(num)){
		num="1";
		questionlist=chatManage.qryQuestion(Integer.parseInt(num));
		}else{
		questionlist=chatManage.qryQuestion(Integer.parseInt(num));
		}
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
		function canceladd(num)
		{
			window.location.href="corpus.jsp?num="+num;
		}
		function formCheck()
		{
			if(addform.question.value=="")
			{
				alert("请填写信息内容！");
				addform.question.focus();
				return false;
			}
			if(addform.answer.value=="")
			{
				alert("请填写信息内容！");
				addform.answer.focus();
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
	                var url="corpusdel.jsp?action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
 	   function del(id,num){
 	   		 if (confirm("删除将不能恢复，是否继续？"))  {
	                var url="corpusdel.jsp?questionid="+id+"&num="+num;
	                window.location.href=url;
	            }
 	   }
	   function editmes(id,content,num)
	   {
	
			document.getElementById("action").value = "edit";
			document.getElementById("add").style.display = "block";
			document.getElementById("listform").style.display="none";
			document.getElementById("questionid").value = id;
			
			document.getElementById("question").value = content;
			document.getElementById("nums").value = num;
	   	}
	   function edit(id,content,num,id1,content1)
	   {
	
			document.getElementById("action").value = "edits";
			document.getElementById("add").style.display = "block";
			document.getElementById("listform").style.display="none";
			document.getElementById("questionid").value = id;
			document.getElementById("question").value = content;
			document.getElementById("answerid").value = id1;
			document.getElementById("answer").value = content1;
			document.getElementById("nums").value = num;
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
				
										<form id=pager name=pager action="corpus.jsp" method=post >
											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">
										
													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															 语料库管理
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
																	<td colspan="3" align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" >
																		<input type="text" name="content" value="" />
																		<input type="submit" name="button"	value="查询" >
																	</td>
												
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=60>
																		
																	</td>
																</tr>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=80>
																		序号
																	</td>
																	<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt">
																		问题
																	</td>
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=60>
																		选&nbsp; 择
																	</td>
																</tr>
																<%
																int indexs=1;
							  										for(int i=0;i<questionlist.size();i++)
							  										{
							  											
							  											Question question=(Question)questionlist.get(i);
							  											questionid=question.getId().toString();
							  											questioncontent=question.getContent();
							  											
							  											questioncontent=questioncontent.replace("'","\\'");
							  											questionkeywords=question.getKeywords();
							  											
																%>
																<tr>
																	<td align="left" style="padding-left:20px;" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1"  style="color:red;">
																		
																		<%="问题"+indexs %>
																		
																	</td>
																	<td colspan="2" align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		
																		<a href="javascript:editmes('<%=questionid %>','<%=questioncontent %>','<%=num %>');" style="color:red;"><%=questionkeywords %></a>
																		
																	</td>
																		<%
							  											answerlist=chatManage.qryAnswer(question);
							  											
							  											if(answerlist.size()==0){
							  											
							  											%>
							  											
																	
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="javascript:del('<%=questionid %>','<%=num %>');" >删除</a>
																	</td>
																	<%}else{ %>
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="javascript:del('<%=questionid %>','<%=num %>');" >删除</a>
																	</td>
																	
																	
																	<%} %>
																</tr>

																	
							  											<%

							  											
							  											int index=1;
							  											for(int j=0;j<answerlist.size();j++){
							  												Answer answer=(Answer)answerlist.get(j);
							  												answerid=answer.getId().toString();
							  												answercontent=answer.getContent();
																	%>
																<tr>
																	<td align="left" style="padding-left:20px;" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<a href="javascript:edit('<%=questionid %>','<%=questioncontent %>','<%=num %>','<%=answerid %>','<%=answercontent %>');" style="color:red;"><%="问题"+indexs+"答案"+index %></a>
																	</td>
																	
																	<td  colspan="2" align="left" style="padding-left:30px;" valign="middle" bgcolor="#FFFFFF">
																		<%=answercontent %>
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mesid" value="<%=answerid %>">
																	</td>
																</tr>
																<%			index++;
																		}
																		indexs++;
																	}
																%>
															</table>
														</td>
													</tr>

													<tr>
														<td height=25 colspan="8" align="right" class="zm_txt">
														<%if(content==null||"null".equals(content)||"".equals(content)){ %>
															<a href="corpus.jsp?num=<%=Integer.parseInt(num)-1 %>" >上一页</a><input type="text" name="num" value="<%=Integer.parseInt(num) %>" style="width:30px" /><input type="submit" value="page"/> <a href="corpus.jsp?num=<%=Integer.parseInt(num)+1 %>" >下一页</a>
														<%} %>
														</td>
														
													</tr>
												
												<tr>
													<td width="100%" align="center" valign="middle">
														<input name="select" type="button" class="button"
															value="全选/反选" onclick="javascript:cmd_AllSel(pager)">
														&nbsp;
														<input name="Submit32" type="hidden" class="button"
															value="通  过" onclick="javascript:editmes(pager);">
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
										</form>
										<!-- 短信添加开始*************************************************************************************** -->
										<td width="79%" align="left" valign="top" style="display:none" id="add">
											<form name =addform id=addform me`thod=post action = "corpusdb.jsp" onSubmit=return(formCheck())>
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														语料库管理<input type=hidden  name=questionid  id=questionid size=30>
																 <input type=hidden  name=answerid  id=answerid size=30>
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	问题：
																</td>
														
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="question" id="question" cols="50" rows="6" onKeyDown="textCounter(this.form.question,this.form.remLen1,500);"   onKeyUp="textCounter(this.form.question,this.form.remLen1,500);"></textarea>
																	<br>共可输入500字，还剩<input   readonly   type=text   name=remLen1   size=3   maxlength=3   value="500">字。
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	答案：
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="answer" cols="50" rows="6" onKeyDown="textCounter(this.form.answer,this.form.remLen,500);"   onKeyUp="textCounter(this.form.answer,this.form.remLen,500);"></textarea>
																	<br>共可输入500字，还剩<input   readonly   type=text   name=remLen   size=3   maxlength=3   value="500">字。
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=action id=action value="">
																	<input type = hidden name=nums id=nums value="">
																	<input name="save" type="submit" class="button"
																		value="保  存">
																	&nbsp;
																	<input name="cancel" type="button" class="button"
																		value="取  消" onClick="javascript:canceladd('<%=num %>')">
																		
																	
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