<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>

<%


	
	String classesid=request.getParameter("classid");
	String questionId = request.getParameter("questionId");

	String text=request.getParameter("searchtext");
	String text1=request.getParameter("searchtext1");
	String text2=request.getParameter("searchtext2");
	String text3=request.getParameter("searchtext3");
	String r_action=request.getParameter("r_action");
	
	System.out.println(r_action);
	if(r_action ==null)
		r_action="";
	int i=0;
	String table="";
	String fieldarraystr="";
	String condition="";
	String id="";
	String complain="";
	String sql="";
	String question="";

	String answer="";

	String keyword1="";

	String keyword2="";

	String classes="";
	String state="";
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	//query.setRecordSet("select * from T_UNICOM_QUESTION");
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
			
			document.getElementById("rr_action").value = "add";
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
				alert("����д��Ϣ���ݣ�");
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
	            if (confirm("ɾ�������ָܻ����Ƿ������"))  {
	                var url="questiondel.jsp?r_action=del";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("���ڸ�ѡ����ѡ��Ҫɾ��������");  }
	   	}
		function editmes(mesid)
		{
	                var url="questionedit.jsp?questionid="+mesid;
	                window.location.href=url;
			
		
		}
		
	   function classsubmit(value)
	   {
	    //alert(value);
		  	 var   id   =  value;
	   
			//var id=theForm.classes1.options[theForm.classes1.selectedIndex].value;
	        var url="question.jsp?classid="+id;
	        window.location.href=url;
	  
	   	}
	   function searchsubmit(value,theForm)
	   {
	    //alert(value);
		
	     var   text   =  value;
			//var id=theForm.classes1.options[theForm.classes1.selectedIndex].value;
	        var url="question.jsp?r_action=search";
	        theForm.action=url;
	        theForm.submit();
	  
	   	}
	   function pxsubmit(value,theForm)
	   {
	    //alert(value2);
		   var   text   =  value;
	   
			var id=theForm.classes1.options[theForm.classes1.selectedIndex].value;
			//alert(id);
	        var url="question.jsp?r_action="+text+"&classid="+id;
	        window.location.href=url;
	  
	   	}
	   function zlsubmit()
	   {
			var selectvalue;
			var num;
			var flag;
			num=document.form1.repeat_radio.length;
			flag=0;
			for (j=0;j<num;j++)
			{
				
   				if(document.form1.repeat_radio[j].checked)
   				{
   					flag=1;
   					selectvalue=document.form1.repeat_radio[j].value;
   					//alert(selectvalue);
   				}
   			}
   			if(flag == 0)
			{
				alert("��ѡ����ظ���������");
				return false;
			}
			else
			{
	        	var url="question.jsp?r_action="+selectvalue;
	        	window.location.href=url;
	        }
	  
	   	}
	   	function impinfo()
	   	{
	   		document.getElementById("listform").style.display="none";
	   		document.getElementById("infoimp").style.display="block";
	   	}
	   	function cancelimp()
	   	{
	   		document.getElementById("listform").style.display="block";
	   		document.getElementById("infoimp").style.display="none";
	   	}
	   	function submitForm(obj)
	{
		var val = obj.impfile.value;
		if(val.length < 4)
		{
			alert("��ѡ�����ļ���");
			return false;
		}
		
		obj.submit();
		return true;
	}
	function nokeysubmit()
	   {
	    
	        var url="question.jsp?r_action=nokey";
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
						cellpadding="0" cellspacing="0" >

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
											if(r_action.equals("repeat_question"))
											{
												table="VIEW_REPEAT_QUESTION";
												condition=" 1=1 ";
											}
											else
											{
												if(r_action.equals("repeat_mulkey"))
												{
													table="VIEW_REPEAT_MULKEYWORD";
													condition=" 1=1 ";
												}
												else
												{
													if(r_action.equals("nokey"))
													{
														table="T_UNICOM_QUESTION";
														condition=" (keyword1 is null and keyword2 is null) or (keyword1 is null and keyword2 ='null') or (keyword1 ='null' and keyword2 ='null') or (keyword1 ='null' and keyword2 is null) ";
													}
													else
													{
														table="T_UNICOM_QUESTION";
														condition=" 1=1 ";
													
														if(!"".equals(classesid)&&!"null".equals(classesid)&&classesid!=null){
															condition+=" and QUESTION_CLASS='"+classesid+"'";
															if("0".equals(classesid))
																condition=" 1=1 ";
														}
														if("search".equals(r_action)){
															if(!"".equals(questionId)&&!"null".equals(questionId)&&questionId!=null){
																questionId=new String(questionId.getBytes("8859_1"));
																condition+=" and QUESTIONID=" + questionId;
															}
															if(!"".equals(text)&&!"null".equals(text)&&text!=null){
																text=new String(text.getBytes("8859_1"));
																condition+=" and QUESTION like '%"+text+"%'";
														
															}
															if(!"".equals(text1)&&!"null".equals(text1)&&text1!=null){
																text1=new String(text1.getBytes("8859_1"));
																condition+=" and KEYWORD1 like '%"+text1+"%'";
														
															}
															if(!"".equals(text2)&&!"null".equals(text2)&&text2!=null){
																text2=new String(text2.getBytes("8859_1"));
																condition+=" and KEYWORD2 like '%"+text2+"%'";
														
															}
															if(!"".equals(text3)&&!"null".equals(text3)&&text3!=null){
																text3=new String(text3.getBytes("8859_1"));
																condition+=" and ANSWER like '%"+text3+"%'";
														
															}
														}
														
													}
												}
											}				
											condition+=" order by NORMALSTATE DESC, QUESTIONID desc";			
											fieldarraystr="*";
											query.setRecordCount(table,condition);
											
											int count = query.getRecordCount();
											//System.out.println(count);
											%>
											
											<table width="90%" border="0" align="center" cellpadding="2"
												cellspacing="0">

													<tr>
														<td width="100%" align="left" valign="middle"
															class="zm_txt" height=25>
															ҵ��ʿ����

														</td>
													</tr>
													<tr>
														<td height="1" align="center" valign="top"></td>
													</tr>
													<tr>
														<td align="center" valign="top">
														
															<table width="100%" border="0" cellpadding="3"
																cellspacing="1" bgcolor="#666666">
																<form action="" name="form1" method='post' >
																<tr>
																
																	<td align="right" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" >�������⣺</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" colspan="5">
																	<select name="classes1" id="classes1" onchange="classsubmit(this.options[selectedIndex].value);">
																	
																	<% 
																	
																	query.setRecordSet("select * from t_unicom_class where class_type='question' order by class_order");
																
																
																	ResultSet rsclass1 = query.getResultSet();
																	while(rsclass1.next()){
																	
																	String classnum=rsclass1.getString("CLASS_NUM");
																	%>
																		<option	value="<%=classnum %>"<%if(classnum.equals(classesid)){out.print("selected");} %>><%=rsclass1.getString("CLASS_NAME") %></option>
																		
																	<%} %>
																	
																	</select>
																	&nbsp;&nbsp;&nbsp;&nbsp;
																	<input type="button" name="button" value="���ؼ�������" onclick="pxsubmit('paixu',form1);" />
																	&nbsp;&nbsp;&nbsp;&nbsp;
																	<input type="button" name="button" value="�޹ؼ�������" onclick="nokeysubmit();" />
																	</td>
																</tr>
																<tr>
																	<td align="right" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" >�����ѯ��</td>
																	<td   align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" colspan="5">
																		ID��<input type=text name="questionId" id="questionId" value=""/>
																		���⣺<input type=text name="searchtext" id="searchtext" value=""/>
																		���飺<input type=text name="searchtext1" id="searchtext1" value=""/>
																		���ʣ�<input type=text name="searchtext2" id="searchtext2" value=""/>
																		�𰸣�<input type=text name="searchtext3" id="searchtext3" value=""/>
																		<input type="button" name="button" value="��ѯ" onclick="searchsubmit('search',form1);" /><br>
																	</td>
																	
																</tr>
																<tr>
																	<td align="right" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" >�ظ����⣺</td>
																	<td   align="left" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" colspan="5">
																		<input name='repeat_radio' type="radio" class="" value="repeat_question">������&nbsp;&nbsp;
																		<input name='repeat_radio' type="radio" class="" value="repeat_mulkey">������&nbsp;&nbsp;												
																		<input type="button" name="button" value="��ѯ�ظ�" onclick="zlsubmit();" />
																	</td>
																	
																</tr>
																</form>
														<page:pager total='<%=count%>' defaultPageSize="20">
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		��&nbsp;��
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=45%>
																		��&nbsp;��
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		��&nbsp;��
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=15%>
																		��&nbsp;��
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
																if(r_action.equals("repeat_question"))
																{
																	table="VIEW_REPEAT_QUESTION";
																	condition=" 1=1";
																}
																else
																{
																	if(r_action.equals("repeat_mulkey"))
																	{
																		table="VIEW_REPEAT_MULKEYWORD";
																		condition=" 1=1";
																	}
																	else
																	{
																		if(r_action.equals("nokey"))
																		{
																			table="T_UNICOM_QUESTION";
																			condition=" (keyword1 is null and keyword2 is null) or (keyword1 is null and keyword2 ='null') or (keyword1 ='null' and keyword2 ='null') or (keyword1 ='null' and keyword2 is null) ";
																		}
																		else
																		{
																			condition=" 1=1 ";
																			if(!"".equals(classesid)&&!"null".equals(classesid)&&classesid!=null){
																				condition+=" and QUESTION_CLASS='"+classesid+"'";
																				if("0".equals(classesid))
																					condition=" 1=1 ";
																				
																			}
																			if("search".equals(r_action)){
																			condition="1=1";
																			if(!"".equals(text3)&&!"null".equals(text3)&&text3!=null){
								
																				condition+=" and ANSWER like '%"+text3+"%'";
																				
																			}
																			
																			if(!"".equals(questionId)&&!"null".equals(questionId)&&questionId!=null){
																				condition+=" and QUESTIONID=" + questionId;
																				
																			}
																			if(!"".equals(text)&&!"null".equals(text)&&text!=null){
																				condition+=" and QUESTION like '%"+text+"%' ";
																				
																			}if(!"".equals(text1)&&!"null".equals(text1)&&text1!=null){
																				
																				condition+=" and KEYWORD1 like '%"+text1+"%'";
																				
																			}
																			if(!"".equals(text2)&&!"null".equals(text2)&&text2!=null){
																			
																				condition+=" and KEYWORD2 like '%"+text2+"%'";
																				
																				
																			}
																			if(!"".equals(text3)&&!"null".equals(text3)&&text3!=null){
																			
																				condition+=" and ANSWER like '%"+text3+"%'";
																		
																			}
																			}
																			
																		}
																	}
																}
																condition+=" order by NORMALSTATE DESC,QUESTIONID desc";
																if("paixu".equals(r_action)){
																//fieldarraystr="*, length(KEYWORD1)-length(replace(KEYWORD1,'��','')) as ss";
																	//condition="1=1 and KEYWORD1!='null' where  order by ss desc";
																	sql="select t.*, length(KEYWORD1)-length(replace(KEYWORD1,'��','')) as ss from t_unicom_question t where 1=1 and KEYWORD1!='null' order by NORMALSTATE DESC,ss desc";
																	if(!"".equals(classesid)&&!"null".equals(classesid)&&classesid!=null){
																		sql="select t.*, length(KEYWORD1)-length(replace(KEYWORD1,'��','')) as ss from t_unicom_question t where QUESTION_CLASS='"+classesid+"' and KEYWORD1!='null' order by NORMALSTATE DESC,ss desc";
																		if("0".equals(classesid))
																		sql="select t.*, length(KEYWORD1)-length(replace(KEYWORD1,'��','')) as ss from t_unicom_question t where 1=1 and KEYWORD1!='null' order by NORMALSTATE DESC,ss desc";
																	}
																	//System.out.println(fieldarraystr);
																}
																if("".equals(sql)){
																query.setRecordSet(table,fieldarraystr,condition);
																}else{
																query.setRecordSet(sql);
																
																}
																
																ResultSet rs3 = query.getResultSet();
																int indexs=1;
																while(rs3.next()){
																	id=rs3.getString("QUESTIONID");
																	complain=rs3.getString("QUESTION");
																	answer=rs3.getString("ANSWER");
																	//System.out.println(rs3.getString(4));
																	//answer.replace('\n','a');
																	keyword1=rs3.getString("KEYWORD1");
																	if(keyword1==null||"null".equals(keyword1))
																		keyword1="";
																	keyword2=rs3.getString("KEYWORD2");
																	if(keyword2==null||"null".equals(keyword2))
																		keyword2="";
																	classes=rs3.getString("QUESTION_CLASS");
																	
																	i++;
																	if((i+1)>index.intValue() && i< (index.intValue()+pageSize.intValue()))
																	{ 	  
																	%>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=id %>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=complain %>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=keyword1 %>
																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=keyword2 %>
																	</td>
																	
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="#" onclick="javaScript:editmes('<%=id %>');"><img src = "images/edit.gif" border = 0>
																		</a>	
																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<input type="checkbox" name="mesid"
																			value="<%=id %>">
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
															value="����ҵ����Ϣ" onclick="javaScript:impinfo();">
														&nbsp;
															<input name="Submit32" type="button" class="button"
															value="ɾ  ��" onclick="javaScript:delmes(pager);">
													</td>
												</tr>
											</table>
										</td>
										<!-- ������ӿ�ʼ*************************************************************************************** -->
										<td width="79%" align="left" valign="top" style="display:none" id="add">
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
														ҵ��ʿ����

													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	������⣺
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text name="question" value="" style="width:580px;"/>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	����𰸣�
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<textarea name="answer" rows="8" id="answer" style="width:580px" onKeyDown="textCounter(this.form.answer,this.form.remLen,3000);"   onKeyUp="textCounter(this.form.answer,this.form.remLen,3000);"></textarea>
                                                                    <br>��������3000�֣���ʣ<input   readonly   type=text   name=remLen   size=4   maxlength=4   value="3000">�֡�
<!--<iframe ID="Editor" name="Editor" src="HtmlEditor/index.html?ID=answer" frameBorder="0" marginHeight="0" marginWidth="0" scrolling="No" style="height:320px;width:580px"></iframe>-->
															  </td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	���飺
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text name="keyword1"  id="keyword1" value="" style="width:550px;"/>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	���ʣ�
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type=text name="keyword2" id="keyword2"  value="" style="width:550px;"/>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	���ࣺ
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<select name="classes">
																	
																	<% 
																	
																	query.setRecordSet("select * from t_unicom_class where class_type='question' order by class_order");
																
																
																	ResultSet rsclass = query.getResultSet();
																	while(rsclass.next()){
																	
																	String classnum=rsclass.getString("CLASS_NUM");
																	%>
																		<option	value="<%=classnum %>"<%if(classnum.equals(classesid)){out.print("selected");} %>><%=rsclass.getString("CLASS_NAME") %></option>
																		
																	<%} %>
																	</select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	��ע��
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<select name="state">
																		<option	value="0">��ʾ</option>
																		<option	value="1">����ʾ</option>
																	
																	</select>
																</td>
															</tr>
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	�������⣺
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<select name="state1">
																		<option	value="3">����</option>
																		<option	value="0">�ǳ���</option>
																	
																	</select>
																</td>
															</tr>
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type = hidden name=rr_action id=rr_action value="">
																	<input type = hidden name=mes_id id=mes_id value="">
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
										
										
										<!-- ��Ϣ���뿪ʼ*************************************************************************************** -->
										<td width="79%" align="left" valign="top" style="display:none" id="infoimp">
											<form action="question_template_upload.jsp" method="post" name="formSaveimp" ENCTYPE="multipart/form-data">
											<table width="90%" border="0" align="center" cellpadding="6"
												cellspacing="0">
												<tr>
													<td align="right" valign="top" class="logon_txt1" colspan=2 height=25>	
													</td>
												</tr>
												<tr>
													<td width="100%" align="left" valign="middle"
														class="zm_txt" height=25 colspan=2>
														ҵ����Ϣ����
													</td>
												</tr>
												<tr>
													<td align="center" valign="top">
														<table width="100%" border="0" cellpadding="3"
															cellspacing="1" bgcolor="#666666">
															<tr>
																<td align="right" valign="top" bgcolor="#FFFFFF" class="zl_huitxt">
																	ѡ���ļ���
																</td>
																<td bgcolor="#FFFFFF" class="zl_huitxt"  align="left">
																	<input type="file" name="impfile">
																</td>
															</tr>
															
															<tr>
																<td colspan="2" align="center" valign="middle" bgcolor="#FFFFFF" class="zl_huitxt">
																	<input type="button" onclick='javascript:submitForm(this.form);' type="button" class="button" value="��  ��">
																	&nbsp;
																	<input name="cancel" type="button" class="button"	value="ȡ  ��" onClick="javascript:cancelimp()">
																</td>
															</tr>
														</table>															
													</td>
												</tr>											
											</table>
											</form>
										</td>
										<!-- ��Ϣ�������***************************************************************************************** -->
										
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
	</body><%conn.close(); %>