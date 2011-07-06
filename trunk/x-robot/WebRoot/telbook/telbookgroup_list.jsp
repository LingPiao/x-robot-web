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
			document.getElementById("GROUPID").value=""; 
			
			document.getElementById("NAME").value="";
		
		}
		function canceladd()
		{
			document.getElementById("listform").style.display="block";
			document.getElementById("add").style.display = "none";
		}
		function groupcc()
		{
			window.location.href="telbook.action?op=view&user_msn=<ww:property value="user_msn"/>";
		}
		function formCheck()
		{
			
			if(pager.NAME.value=="")
			{
				document.getElementById("errbox").innerHTML = "<font color=red>请输入组名称！</font>";
				pager.NAME.focus();
				return false;
			}
			
			if(pager.adtion.value =="add")
			{
				pager.action="telbookgroup.action?op=add&user_msn=<ww:property value="user_msn"/>";
			}
			if(pager.adtion.value == "edit")
			{
				pager.action="telbookgroup.action?op=edit&user_msn=<ww:property value="user_msn"/>";
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
	                var url="telbookgroup.action?op=del&user_msn=<ww:property value="user_msn"/>";
	                theForm.action=url;
	                theForm.submit();
	            }
	        }
	        else
	        {   alert("请在复选框内选择要删除的数据");  }
	   	}
		function editbook(id,con)
		{
			
			document.getElementById("NAME").value=con; 
			document.getElementById("add").style.display = "block";
			document.getElementById("adtion").value = "edit";
			document.getElementById("listform").style.display="none";
			pager.GROUPID.value=id;
						
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
		<td align="center"><table id="__01" width="359"  border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="4">
			<img src="../images/sms/message_use_bg_01.gif" width="359" height="17" alt=""></td>
	</tr>
	<tr>
		<td width="93" height="337" align="right" valign="top" background="../images/sms/message_use_bg_02.gif"><table width="95%">
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
            <td valign="top"><table width="100%" >
            <tr>
                <td  class="ban">
				<a href="telbook.action?op=view&user_msn=<ww:property value="['user_msn']"/>">所有联系人</a>
				</td>
              </tr>
             <ww:iterator value="telgroupList" status="row">
              <tr>
                <td  class="ban">
				<a href="telbook.action?op=view&user_msn=<ww:property value="['user_msn']"/>&groupid=<ww:property value="['GROUPID']"/>"><ww:property value="['NAME']"/></a>
				</td>
              </tr>
              </ww:iterator>
              <tr>
                <td height="28" class="ban">
				<input name="reset22"  class="input_button03" type="button" value="联系人" onclick="groupcc();"/>
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
				<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">分组列表</td>
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
				    <td width="30%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE12">组名称</td>					
					<td width="20%" height="22" colspan="3" align="center" background="images/book_bg.jpg" class="STYLE10">编辑</td>
				  </tr>
				  <ww:iterator value="pageInfo.records" status="row">
				  <tr>
				    <td height="22" align="center" valign="top" class="STYLE9"><label>
				      <input name="delID" type="checkbox" value="<ww:property value="['GROUPID']"/>">
				    </label></td>
				    <td width="30%" height="22" colspan="3" align="center" class="STYLE9"><ww:property value="['NAME']"/> </td>
					
					<td width="20%" height="22" colspan="3" align="center" class="STYLE8"><a href="#" onclick="javaScript:editbook(<ww:property value="['GROUPID']"/>,'<ww:property value="['NAME']"/>');"><img src="../images/bj.gif" width="15" height="13" border=0/></a></td>
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
				<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">组管理</td>
				<td>
					<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
			</tr>
			</table>
			</td>
                            </tr>
                            <tr>
                              <td align="center" valign="top"><table width="100%" border="0" cellpadding="1" cellspacing="1" bordercolor="#CCCCCC" bgcolor="#E6E6E6">
                                  <tr>
                                    <td align="right" valign="middle" bgcolor="#F6F6F6" class="STYLE2">组名称 : </td>
                                    <td align="left" valign="middle" bgcolor="#FFFFFF" class="STYLE2">&nbsp;
                                      <input name="mtelbook_group.NAME" id="NAME" type="text" size="15" class="STYLE2" style="width:130px;"/></td>
                                  </tr>
                                 
                                  <input type = hidden name=adtion id=adtion value="">
                                  <input type = hidden name=mtelbook_group.GROUPID id=GROUPID value="">
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