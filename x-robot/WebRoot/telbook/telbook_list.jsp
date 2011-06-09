<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>历史记录</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--

.STYLE2 {font-size: 12px;color: #666666;}
.STYLE8 {
	color: #666666;
	font-size: 12px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
}
.STYLE9 {
	color: #666666;
	font-size: 12px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: none;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
}
.STYLE10 {
	color: #666666;
	font-size: 12px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
}
.STYLE12 {
	color: #666666;
	font-size: 12px;
	border-top-width: 2px;
	border-bottom-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
	border-top-color: #666666;
	border-right-color: #666666;
	border-bottom-color: #666666;
	border-left-color: #666666;
	border-right-width: 1px;
	border-left-width: 1px;
 }
-->
</style>
<script language="JavaScript" src="../js/page.js"></script>
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
		function addbook()
		{	
			document.getElementById("adtion").value = "add";
			document.getElementById("add").style.display = "block";
			document.getElementById("listform").style.display="none";
			document.getElementById("GROUP_ID").value=""; 
			
			document.getElementById("ID").value="";
			document.getElementById("CONTACT_NAME").value="";
			document.getElementById("CONTACT_TEL").value=""; 
		}
		function canceladd()
		{
			document.getElementById("listform").style.display="block";
			document.getElementById("add").style.display = "none";
		}
		function groupcc()
		{
			window.location.href="telbookgroup.action?op=view&user_msn=<ww:property value="user_msn"/>";
		}
		function formCheck()
		{
			
			if(pager.CONTACT_NAME.value=="")
			{
				document.getElementById("errbox").innerHTML = "<font color=red>请输入联系人！</font>";
				pager.CONTACT_NAME.focus();
				return false;
			}
			
			if(pager.CONTACT_TEL.value=="")
			{
				document.getElementById("errbox").innerHTML = "<font color=red>请输入手机号码!</font>";
				pager.CONTACT_TEL.focus();
				return false;
			}
			
			if(pager.CONTACT_TEL.value.length!=11)
        	{
            	document.getElementById("errbox").innerHTML = "<font color=red>请输入正确的手机号码!</font>";
            	pager.CONTACT_TEL.focus();
				return false;
        	}
        	
			//if(addform.CONTACT_TEL.value.substring(0,2)!="13" && addform.CONTACT_TEL.value.substring(0,2)!="15" && addform.CONTACT_TEL.value.substring(0,2)!="18")
	        //{
	            
			//	document.getElementById("errbox").innerHTML = "<font color=red>请输入正确的手机号码!</font>";
			//	return false;
	        //}
	        if(pager.GROUP_ID.value=="")
			{
				document.getElementById("errbox").innerHTML = "<font color=red>请选择分组!</font>";
				pager.GROUP_ID.focus();
				return false;
			}
			if(pager.adtion.value =="add")
			{
				pager.action="telbook.action?op=add&user_msn=<ww:property value="user_msn"/>";
			}
			if(pager.adtion.value == "edit")
			{
				pager.action="telbook.action?op=edit&user_msn=<ww:property value="user_msn"/>";
			}
			pager.submit();
		}
	   function delmes(theForm)
	   {
	        flag=0;
	        for (j=0;j<theForm.elements.length;j++)   {
	            if (theForm.elements[j].checked==true && theForm.elements[j].name=="delID"){
	                flag=flag+1;
	                break;
	            }
	        }
	        if (flag !=0){
	            if (confirm("删除将不能恢复，是否继续？"))  {
	                var url="telbook.action?op=del&user_msn=<ww:property value="user_msn"/>";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editbook(id,con,tel,groupid)
		{
			
			document.getElementById("GROUP_ID").value=groupid; 
			document.getElementById("add").style.display = "block";
			document.getElementById("adtion").value = "edit";
			document.getElementById("listform").style.display="none";
			pager.ID.value=id;
			document.getElementById("CONTACT_NAME").value=con;
			document.getElementById("CONTACT_TEL").value=tel; 
			
		}
	
	</script>
</head>
<body bgcolor="#FFFFFF">
<form name="pager" method=post id="pager">
<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="../images/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="../images/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="../images/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<%@ include file="../public/title.jsp"%>
	<tr>
		<td background="../images/main_101.jpg" width="41" height="511">&nbsp;</td>
	  <td width="397" height="511" valign="top" background="../images/main_111.jpg">
		<table width="395" height="126" align="center" >
         <tr>
            <td height="91" align="center" valign="middle"><a href="../sms/sms.action?op=view&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_01.gif" width="81" height="89" border="0"></a></td>
			<td align="center" valign="middle"><a href="../sms/sms.action?op=sms&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_02.gif" width="81" height="89" border="0"></td>
			<td align="center" valign="middle"><img src="../images/sms/pic_03_link.gif" width="81" height="89" border="0"></td>
			<td align="center" valign="middle"><a href="../sms/sms.action?op=history&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_04.gif" width="81" height="89" border="0"></a></td>
         </tr>
		  <tr>
		    <td height="27" align="center" valign="top" class="title">自编短信</td>
			<td align="center" valign="top" class="title">常用短信</td>
			<td align="center" valign="top" class="title">电话薄</td>
            <td align="center" valign="top" class="title">历史记录</td>
          </tr>
        </table>
		<table id="__01" width="100%" height="378" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center"><table id="__01" width="359" height="382" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="4">
			<img src="../images/sms/message_use_bg_01.gif" width="359" height="17" alt=""></td>
	</tr>
	<tr>
		<td width="93" height="337" align="right" valign="top" background="../images/sms/message_use_bg_02.gif"><table width="95%" height="100%">
          <tr>
            <td valign="top"><table id="__01" width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
		<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">分组列表</td>
		<td>
			<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
	</tr>
</table></td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" height="283">
             <ww:iterator value="telgroupList" status="row">
              <tr>
                <td height="28" class="ban">
				<a href="telbook.action?op=view&user_msn=<ww:property value="['user_msn']"/>&groupid=<ww:property value="['SEQID']"/>"><ww:property value="['GROUPNAME']"/></a>
				</td>
              </tr>
              </ww:iterator>
              <tr>
                <td height="28" class="ban">
				<input name="reset22"  class="input_button03" type="button" value="管理分组" onclick="groupcc();"/>
				</td>
              </tr>
            </table></td>
          </tr>
         
        </table></td>
		<td background="../images/sms/message_use_bg_03.gif" width="13" height="337">
			</td>
		<td width="239" height="337" valign="top" background="../images/sms/message_use_bg_04.gif">
		<!-- 电话簿列表 -->
		<table width="100%"  id="listform" >
		 
          <tr>
            <td><table id="__01" width="90" height="23" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
				<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">联系人列表</td>
				<td>
					<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
			</tr>
			</table></td>
          </tr>
          <tr>
            <td height="280" align="center" valign="top">
				<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#F3F1F0">
				  <tr>
				    <td width="15%" height="22" align="center" valign="middle" class="STYLE12" background="images/book_bg.jpg">选择</td>
				    <td width="30%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE12">姓名</td>
					<td width="35%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE12">电话</td>
					<td width="20%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE10">编辑</td>
				  </tr>
				  <ww:iterator value="pageInfo.records" status="row">
				  <tr>
				    <td height="22" align="center" valign="top" class="STYLE9"><label>
				      <input name="delID" type="checkbox" value="<ww:property value="['ID']"/>">
				    </label></td>
				    <td width="30%" height="22" colspan="3" align="center" class="STYLE9"><ww:property value="['CONTACT_NAME']"/> </td>
					<td width="35%" height="22" colspan="3" align="center" class="STYLE9"><ww:property value="['CONTACT_TEL']"/></td>
					<td width="20%" height="22" colspan="3" align="center" class="STYLE8"><a href="#" onclick="javaScript:editbook(<ww:property value="['ID']"/>,'<ww:property value="['CONTACT_NAME']"/>','<ww:property value="['CONTACT_TEL']"/>','<ww:property value="['GROUP_ID']"/>');"><img src="../images/bj.gif" width="15" height="13" border=0/></a></td>
				  </tr>
				</ww:iterator>
				
				</table>
			</td>
	     </tr>
	     <tr>
                      <td style="height:30px;" valign="bottom" align="center"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td align="center"><span class="btn-l">
                              <input name="selecttel" type="button" class="input_button03" value="全/反选" onclick="javascript:cmd_AllSel(pager)"/>
                              </span></td>
                            <td align="center"><span class="btn-l">
                              <input name="addtel" type="button" class="input_button03" value="添 加" onclick="javascript:addbook();"/>
                              </span></td>
                            <td><span class="btn-l">
                              <input name="deltel" type="button" class="input_button03" value="删 除" onclick="javaScript:delmes(pager);"/>
                              </span></td>
                          </tr>
                        </table></td>
                    </tr>
        </table>
         <!-- ---------- -->
                  <!-- 添加开始 -->
                  
                    <table style="display:none" id="add" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td class="STYLE2">&nbsp;<img src="../images/sj_1.gif" width="4" height="7" />                          
                              <table id="__01" width="90" height="23" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
				<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">联系人列表</td>
				<td>
					<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
			</tr>
			</table>
			</td>
                            </tr>
                            <tr>
                              <td align="center" valign="top"><table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#E6E6E6">
                                  <tr>
                                    <td align="right" valign="middle" bgcolor="#F6F6F6" class="STYLE2">姓 名 : </td>
                                    <td align="left" valign="middle" bgcolor="#FFFFFF" class="STYLE2">&nbsp;
                                      <input name="CONTACT_NAME" id="CONTACT_NAME" type="text" size="15" class="STYLE2" style="width:130px;"/></td>
                                  </tr>
                                  <tr>
                                    <td align="right" valign="middle" bgcolor="#F6F6F6" class="STYLE2">电话号 : </td>
                                    <td align="left" valign="middle" bgcolor="#FFFFFF" class="STYLE2">&nbsp;
                                      <input name="CONTACT_TEL" id="CONTACT_TEL" type="text" size="15" class="STYLE2" style="width:130px;"/></td>
                                  </tr>
                                  <tr>
                                    <td align="right" valign="middle" bgcolor="#F6F6F6" class="STYLE2">联系人分组 : </td>
                                    <td align="left" valign="middle" bgcolor="#FFFFFF" class="STYLE2">&nbsp;
                                      <select name="GROUP_ID" id="GROUP_ID" style="width:130px;">
                                       <ww:iterator value="telgroupList" status="row">
              							<option value=<ww:property value="['SEQID']"/> ><ww:property value="['GROUPNAME']"/></option>
              							</ww:iterator> 
                                      </select>
                                    </td>
                                  </tr>
                                  <input type = hidden name=adtion id=adtion value="">
                                  <input type = hidden name=ID id=ID value="">
                                </table></td>
                            </tr>
                            <tr>
                              <td style="height:30px;" valign="bottom" align="center"><table width="80%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td style="width:50px;" align="left">&nbsp;</td>
                                    <td style="width:80px;"  align="left"><span class="btn-l">
                                      <input name="adtest"  class="input_button03"  type="button" value="保 存" onclick="return formCheck();"/>
                                      </span></td>
                                    <td align="left"><span class="btn-l">
                                      <input name="reset22"  class="input_button03" type="button" value="取 消" onclick="canceladd();"/>
                                      </span></td>
                                  </tr>
                                </table>
								<span id="errbox" sthyle="width:40px;"></span>
								</td>
                            </tr>
                          </table></td>
                      </tr>
                    </table>
                  
                  <!-------------->
        </td>
		<td background="../images/sms/message_use_bg_05.gif" width="14" height="337">
			</td>
	</tr>
	<tr><td colspan=3 background="../images/sms/billbg_03.gif" valign=top>
	<%@ include file="../public/page.jsp" %>
	</td><td background="../images/sms/message_use_bg_05.gif" width="14"></tr>
	<tr>
		<td colspan="4">
			<img src="../images/sms/message_use_bg_06.gif" width="359" height="28" alt=""></td>
	</tr>
</table></td>
	</tr>
	
</table>
		
	  </td>
	  <td background="../images/main_121.jpg" width="39" height="511">
			</td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" align="right" valign="top" background="../images/main_14.jpg"><table width="100%" height="39">
          <tr>
            <td width="94%" align="right" valign="top"></td>
            <td width="6%">&nbsp;</td>
          </tr>
        </table></td>
		<td>
			<img src="../images/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="../images/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="../images/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</form>
</body>
</html>