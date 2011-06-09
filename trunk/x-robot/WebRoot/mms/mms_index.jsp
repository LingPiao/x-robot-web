<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	
%>
<html>
<head>
<title>自编短信</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<link rel="StyleSheet" href="../dtree/dtree.css" type="text/css" />
<script type="text/javascript" src="../dtree/dtree.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	SCROLLBAR-FACE-COLOR: #ffffff;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #cccccc;
	SCROLLBAR-3DLIGHT-COLOR: #cccccc;
	SCROLLBAR-ARROW-COLOR: #BAB7B6;
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
	SCROLLBAR-BASE-COLOR: #ffffff;
}

.STYLE1 {color: #666666;
		border:none;
		font-size:12px;}
.STYLE2 {color: #666666}
.STYLE8 {color: #747373}
.STYLE10 {font-size: 11px}
.STYLE11 {font-size: 12px}

-->
</style>

<script>
function seltel(){
		
		document.getElementById("writesms").style.display="none";
		document.getElementById("seltel").style.display="block";
}
function sendsms()
	{
        var mobilevalue = smsform.recmobile.value;
        if(mobilevalue=="")
		{
			document.getElementById("errortext").innerHTML = "<font color=red>[错误提示]<br>请输入手机号码！！</font>"
            return false;
		}
        var mvalue = mobilevalue.split(",");
        for(var i = 0 ;i<mvalue.length;i++)
        {
        	if(mvalue[i]!="" && mvalue[i].length!=11)
        	{
            	document.getElementById("errortext").innerHTML = "<font color=red>[错误提示]<br>请输入有效的手机号码，每个号码长度为11位！</font>"
            	return false;
        	}
        	if(mvalue[i]!="" && mvalue[i].substring(0,2)!="13" && mvalue[i].substring(0,2)!="15" && mvalue[i].substring(0,2)!="18")
	         {
	             document.getElementById("errortext").innerHTML = "<font color=red>[错误提示]<br>请输入合法的手机号码！</font>"
                 return false;
	         }
        }	
       	for (var i=0;i<mobilevalue.length;i++)
		{
			if(spchar_test(mobilevalue.charAt(i))==0)
			{
				document.getElementById("errortext").innerHTML = "<font color=red>[错误提示]<br>输入的手机号码包含非法字符！</font>";
            	return false;
			}
		}
       	smsform.action="send_mms.jsp";
       	smsform.submit();		
	}
	function spchar_test(chr)
	//数字和特殊字符检测函数
	{
		var i;
		var spch=",，0123456789";
		for (i=0;i<13;i++)
		  if(chr==spch.charAt(i))
		  return(1);
		return(0);
	}
	 
	  function   textCounter(field,   countfield,   maxlimit)   {   
	  	if   (field.value.length   >   maxlimit)     
	  		field.value   =   field.value.substring(0,maxlimit);   
	  	else     
	  		countfield.value   =   maxlimit   -   field.value.length;   
	  }   
</script>
</head>
<body bgcolor="#FFFFFF" >
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
		<td background="../images/main_10.jpg" width="41" height="511">
			</td>
	  <td width="397" height="511" valign="top" background="../images/main_11.jpg">
		<table width="395" height="133" align="center" >
          <tr>
            <td height="98" align="center" valign="middle"><img src="../images/mms/pic_zi01.gif" width="94" height="96" border="0"></td>
			<td align="center" valign="middle"><a href="mms.action?op=mms&&user_msn=<ww:property value="user_msn"/>"><img src="../images/mms/pic_tu.gif" width="94" height="96" border="0"></a></td>
			<td align="center" valign="middle"><img src="../images/mms/pic_ye.gif" width="94" height="96" border="0"></td>
			<td align="center" valign="middle"><img src="../images/mms/pic_bo.gif" width="94" height="96" border="0"></td>
          </tr>
		  <tr>
		    <td height="27" align="center" valign="top" class="title">文字</td>
			<td align="center" valign="top" class="title">图片</td>
			<td align="center" valign="top" class="title">音乐</td>
            <td align="center" valign="top" class="title">电话薄</td>
          </tr>
        </table>
        
		<table id="writesms" width="100%" height="378" border="0" cellpadding="0" cellspacing="0">
		<form name=smsform method=post action="" >
			<tr>
			<td align="center">
			<table id="__01" width="360" height="389" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td>
				<img src="../images/sms/writemg_01.gif" width="14" height="18" alt=""></td>
				<td colspan="3">
				<img src="../images/sms/writemg_02.gif" width="321" height="18" alt=""></td>
				<td>
				<img src="../images/sms/writemg_03.gif" width="25" height="18" alt=""></td>
				</tr>
				<tr>
				<td rowspan="3" background="../images/sms/writemg_04.gif" >
				</td>
				<td colspan="3" background="../images/sms/writemg_05.gif" width="321" height="28">
					<table width="100%" cellpadding="0" cellspacing="0">
          				<tr>
            			<td class="fontStyle" width="1%"></td>
            			<td>
            				<table id="__01" width="90" height="23" border="0" cellpadding="0" cellspacing="0">
								<tr>
								<td>
								<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
								<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle" onClick="seltel()" style="cursor:hand;" >选择联系人</td>
								<td>
								<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
								</tr>
							</table>
						</td>
            			<td>&nbsp;</td>
          				</tr>
        			</table>
        		</td>
				<td rowspan="3" background="../images/sms/writemg_06.gif">
					</td>
				</tr>
				<tr>
				<td width="127" height="318" rowspan="2" valign="top" background="../images/sms/writemg_07.gif">
					<table id="__01" width="105" height="279" border="0" cellpadding="0" cellspacing="0">
						<tr>
						<td colspan="3">
						<img src="../images/sms/memowrite_01.gif" width="105" height="7" alt=""></td>
						</tr>
						<tr>
						<td rowspan="2">
							<img src="../images/sms/memowrite_02.gif" width="6" height="272" alt=""></td>
						<td background="../images/sms/memowrite_03.gif" width="95" height="270">
						<textarea name="recmobile" cols="12" rows="18" class="STYLE1" style="overflow-x:hidden">在此输入接受人的手机号码，多个接受人用","分隔！</textarea></td></td>
						<td rowspan="2">
							<img src="../images/sms/memowrite_04.gif" width="2" height="272" alt=""></td>
						</tr>
						<tr>
							<td>
								<img src="../images/sms/memowrite_05.gif" width="95" height="2" alt=""></td>
						</tr>
					</table>
				</td>
				<td>
				<img src="../images/sms/writemg_08.gif" width="15" height="67" alt=""></td>
				<td width="179" height="318" rowspan="2" valign="top" background="../images/sms/writemg_09.gif">
					<table id="__01" width="198" height="279" border="0" cellpadding="0" cellspacing="0">
							
						<tr>
						<td colspan="3">
						<img src="../images/sms/writememo02_01.gif" width="198" height="8" alt=""></td>
						</tr>
						
						<tr>
							<td rowspan="2">
								<img src="../images/sms/writememo02_02.gif" width="6" height="271" alt=""></td>
							<td background="../images/sms/writememo02_03.gif" width="175" height="269">
							<div align=center>
							<input type="hidden" name="mms_picurl"   value="<ww:property value="mms_picurl"/>" />
							<input type="hidden" name="user_tel"   value="<ww:property value="user_tel"/>" />
							<input type="hidden" name="user_msn"   value="<ww:property value="user_msn"/>" />
							<img src="../<ww:property value="mms_picurl"/>" width="120" height="120" alt="" align=center></div>
							<textarea name="mms_title" cols="28" rows="8" class="STYLE1" onKeyDown="textCounter(this.form.mms_title,this.form.remLen,100);"   onKeyUp="textCounter(this.form.mms_title,this.form.remLen,100);"><ww:property value="mms_title"/></textarea> 
							<span class="style1">当前还可以录入<input   readonly   type=text   name=remLen   size=3   maxlength=3   value="100">个字！</span></td>
							<td rowspan="2">
								<img src="../images/sms/writememo02_04.gif" width="2" height="271" alt=""></td>
						</tr>
						<tr>
							<td>
								<img src="../images/sms/writememo02_05.gif" width="190" height="2" alt=""></td>
						</tr>
						  
					</table>
					<span id="errortext" class="style1"></span>
				</td>
				</tr>
				<tr>
					<td>
						<img src="../images/sms/writemg_10.gif" width="15" height="251" alt=""></td>
				</tr>
				<tr>
					<td>
						<img src="../images/sms/writemg_11.gif" width="14" height="25" alt=""></td>
					<td colspan="3">
						<img src="../images/sms/writemg_12.gif" width="321" height="25" alt=""></td>
					<td>
						<img src="../images/sms/writemg_13.gif" width="25" height="25" alt=""></td>
				</tr>
			</table>
			</td>
			</tr>	</form>
		</table>
		
		
		<table id="seltel" width="360" height="389" border="0" cellpadding="0" cellspacing="0" align="center" style="display:none">
			<tr>
				<td>
					<img src="../images/sms/writemg_01.gif" width="14" height="18" alt=""></td>
				<td>
					<img src="../images/sms/writemg_02.gif" width="321" height="18" alt=""></td>
				<td>
					<img src="../images/sms/writemg_03.gif" width="25" height="18" alt=""></td>
			</tr>
			<tr>
				<td rowspan="2"  background="../images/sms/writemg_04.gif" >
					</td>
				<td background="../images/sms/writemg_05.gif" width="321" height="28">
				<table width="100%" cellpadding="0" cellspacing="0">
		          	<tr>
		            <td class="fontStyle" width="1%"></td>
		            <td>
		            <table id="__01" width="90" height="23" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
							<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle"  onClick="submitForm()" style="cursor:hand;" >选择</td>
							<td>
								<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
						</tr>
					</table>
					</td>
            		<td>
					</td>
          			</tr>
        		</table>
        		</td>
				<td rowspan="2"  background="../images/sms/writemg_06.gif" ></td>
					
			</tr>
			<tr>
				<td height="318" valign="top" background="../images/sms/writemg_07.gif">
				
				<!--电话簿-->
                 <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                   <tr>
                     <td align="left" valign="top" >
					<div class="dtree">               			
						<script language="javascript">
						d = new dTree('d','../dtree','testForm');
						d.add('0','-1','我的通讯录');
						<ww:iterator value="telgroupList" status="row">
							<ww:set name="groupid" value="['SEQID']"/>
							d.add('<ww:property value="['SEQID']"/>','0','<font color=#006699><ww:property value="['GROUPNAME']"/></font>');
							<ww:iterator value="telList" status="row">
								<ww:if test="#groupid==['GROUP_ID']">
								d.add('<ww:property value="['CONTACT_TEL']"/>','<ww:property value="#groupid"/>','<font color=#666666><ww:property value="['CONTACT_NAME']"/></font>','');							
								</ww:if>							
							</ww:iterator>
						</ww:iterator>
						document.write(d);								
						
						function submitForm(){
							var ids = "";
							var form = document.getElementById("testForm");
							for (var i=0; i<form.elements.length; i++) {
								var element = form.elements[i];
								if (element.name == "id" && element.type=='checkbox'){
									if( element.checked == true ){
										if(element.value.length == 11){
											ids = ids + element.value + ",";
										}
									}
								}
							}
							
							ids = ids.substring(0,ids.length-1);	
							document.getElementById("recmobile").value = ids;
							document.getElementById("writesms").style.display="block";
							document.getElementById("seltel").style.display="none";
						}
						</script>
					</div>
				</td>
                </tr>
                <tr>
                  <td align="center" valign="top" class="mms_table_big"></td>
                </tr>
              
              </table>
            <!--电话簿-->
				
				</td>
			</tr>
	
			<tr>
				<td>
					<img src="../images/sms/writemg_11.gif" width="14" height="25" alt=""></td>
				<td>
					<img src="../images/sms/writemg_12.gif" width="321" height="25" alt=""></td>
				<td>
					<img src="../images/sms/writemg_13.gif" width="25" height="25" alt=""></td>
			</tr>
		</table>
		
	  </td>
	  <td background="../images/main_12.jpg" width="39" height="511">
			</td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" align="right" valign="top" background="../images/main_14.jpg"><table width="100%" height="39">
          <tr>
            <td width="94%" align="right" valign="top"><input name="button" type="button" class="input_button03" id="button" value="发送"  onClick="return sendsms();"></td>
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
</body>
</html>