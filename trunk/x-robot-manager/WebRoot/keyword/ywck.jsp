<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=GBK"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<jsp:useBean id="mgr" scope="page" class="com.catic.tool.mgr.Manager" />
<%

response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0);
request.setCharacterEncoding("gb2312");
response.setCharacterEncoding("gb2312");
	String classesid=request.getParameter("classid");
	String text=request.getParameter("searchtext");
	String text1= request.getParameter("mes_content");
	
	String text2=request.getParameter("searchtext2");
	String text3=request.getParameter("searchtext3");
	String r_action=request.getParameter("r_action");
	
	System.out.println(r_action);
	if(r_action ==null)
		r_action="search";
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
	String t_count="";
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	//query.setRecordSet("select * from T_UNICOM_QUESTION");
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">	

	</head>
	<script type="text/javascript">
	var xmlHttpRequest;   
	function createXMLHttpRequest(){   
		try{
		 xmlHttpRequest= new ActiveXObject('Msxml2.XMLHTTP');
		}catch(e){
		 try{
		  xmlHttpRequest= new ActiveXObject('Microsoft.XMLHTTP');
		 }catch(e){
		  try{
		   xmlHttpRequest= new XMLHttpRequest();
		  }catch(e){}
		 }
		}
	}   
	//发送请求函数  get方式  
	function sendRequestGet(url,param){   
		createXMLHttpRequest();   
		xmlHttpRequest.open("GET",url+"?"+param,true);   
		xmlHttpRequest.onreadystatechange = processResponse; 
		xmlHttpRequest.send(null);    
	} 
	function processResponse(){
	if(xmlHttpRequest.readyState == 4){  
			if(xmlHttpRequest.status == 200 || xmlHttpRequest.status == 0){   
				var res = xmlHttpRequest.responseText;   
				window.alert(res);   
			}else{   
				window.alert("请求页面异常");   
			}   
		}   
	} 
	  function   textCounter(field,   countfield,   maxlimit)   {   
	  	if   (field.value.length   >   maxlimit)     
	  		field.value   =   field.value.substring(0,maxlimit);   
	  	else     
	  		countfield.value   =   maxlimit   -   field.value.length;   
	  }   
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
	                var url="questiondel.jsp?r_action=del";
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
				alert("请选择查重复的条件！");
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
			alert("请选择导入文件！");
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
	function changeValue(id){
			var t_count = document.getElementById('t_count_' + id).value;
if(confirm("确定修改？")){
				sendRequestGet("ywck_save.jsp","id="+id+"&count="+t_count);
			}
		}
	function clearNoNum(obj)
	{
		//先把非数字的都替换掉，除了数字和.
		obj.value = obj.value.replace(/[^\d.]/g,"");
		//必须保证第一个为数字而不是.
		obj.value = obj.value.replace(/^\./g,"");
		//保证只有出现一个.而没有多个.
		obj.value = obj.value.replace(/\.{2,}/g,".");
		//保证.只出现一次，而不能出现两次以上
		obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
	}
	</script>
		<link href="../css/css1.css" rel="stylesheet" type="text/css">
	<body>
		<table width="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center" valign="middle">
					<table width="100%" border="0" align="center"
						cellpadding="0" cellspacing="0" >

						<tr>
							<td align="center" valign="top" colspan=2>
								<table width="100%" height="100%" border="0" cellpadding="0"
									cellspacing="0">
									<tr>

										<td width="79%" align="left" valign="top" id="listform">
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
															if(!"".equals(text)&&!"null".equals(text)&&text!=null){
																text=new String(text.getBytes("8859_1"));
																condition+=" and QUESTION like '%"+text+"%'";
														
															}
															if(!"".equals(text1)&&!"null".equals(text1)&&text1!=null){
																//text1=new String(text1.getBytes("8859_1"));
																condition+=" and upper(KEYWORD1) like '%"+text1+"%'";
														
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
											condition+=" order by COUNT DESC";			
											fieldarraystr="*";
											query.setRecordCount(table,condition);
											
											int count = query.getRecordCount();
											//System.out.println(count);
											%>
											
											<table width="100%" border="0" align="center" cellpadding="2"
												cellspacing="0">
													<tr>
														<td height="1" align="center" valign="top"></td>
													</tr>
													<tr>
														<td align="center" valign="top">
														
															<table width="100%" border="0" cellpadding="3"
																cellspacing="1" bgcolor="#666666">
																<form action="" name="form1" method='post' >
																</form>
														<page:pager total='<%=count%>' defaultPageSize="20">
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=10%>
																		编&nbsp;码																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=55%>
																		问&nbsp;题																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt">数量</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="zl_huitxt" width=5%>
																		确定																	</td>
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
																condition+=" order by COUNT DESC";
																if("paixu".equals(r_action)){
																//fieldarraystr="*, length(KEYWORD1)-length(replace(KEYWORD1,'，','')) as ss";
																	//condition="1=1 and KEYWORD1!='null' where  order by ss desc";
																	sql="select t.*, length(KEYWORD1)-length(replace(KEYWORD1,'，','')) as ss from t_unicom_question t where 1=1 and KEYWORD1!='null' order by COUNT DESC";
																	if(!"".equals(classesid)&&!"null".equals(classesid)&&classesid!=null){
																		sql="select t.*, length(KEYWORD1)-length(replace(KEYWORD1,'，','')) as ss from t_unicom_question t where QUESTION_CLASS='"+classesid+"' and KEYWORD1!='null' COUNT DESC";
																		if("0".equals(classesid))
																		sql="select t.*, length(KEYWORD1)-length(replace(KEYWORD1,'，','')) as ss from t_unicom_question t where 1=1 and KEYWORD1!='null' order by COUNT DESC";
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
																	t_count=rs3.getString("COUNT");
																	i++;
																	if((i+1)>index.intValue() && i< (index.intValue()+pageSize.intValue()))
																	{ 	  
																	%>
																<tr>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=id %>																	</td>
																	<td align="left" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1">
																		<%=complain %>																	</td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF"
																		class="logon_txt1"><input type="text" name="t_count_<%=id%>" id="t_count_<%=id%>" value="<%=t_count%>" onKeyUp="clearNoNum(this)"></td>
																	<td align="center" valign="middle" bgcolor="#FFFFFF">
																		<a href="javascript:changeValue('<%=id%>');">√</a>																	</td>
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
											</table>
										</td>
										
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="1"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body><%conn.close(); %>