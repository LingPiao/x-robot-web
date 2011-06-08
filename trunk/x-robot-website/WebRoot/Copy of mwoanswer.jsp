
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title></title>
<link rel="stylesheet" href="Style/main.css" type="text/css" />

<script language="JavaScript" type="text/javascript">
function   textCounter(field,   countfield,   maxlimit)   {   
	  	if   (field.value.length   >   maxlimit)     
	  		field.value   =   field.value.substring(0,maxlimit);   
	  	else     
	  		countfield.value   =   maxlimit   -   field.value.length;   
	  }
function link(){
	if(fom.textarea.value.length<10)
	{
		document.getElementById("error").innerHTML = "<font color=red>[错误提示]：回复的内容必须大于10个字！</font>"
		return;
	}
    document.getElementById("fom").action="woanswer.action?&userid=<ww:property value="['userid']"/>&chanel=<ww:property value="['chanel']"/>&op=answer&from=<ww:property value="from"/>";
    document.getElementById("fom").submit();
}

function over(){
    document.getElementById("fom").action="woanswer.action?&userid=<ww:property value="['userid']"/>&op=over&from=<ww:property value="from"/>&chanel=<ww:property value="['chanel']"/>";
    document.getElementById("fom").submit();
}

</script>

</head>

<body class="ContentBody">
<form action="" method="post" name="fom" id="fom" >
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="right">
     <tr>
  		<td>
		    <a href="woknow.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">网友问题</a>&nbsp;|&nbsp;
		
		<ww:if test="userid!=null && !userid.equals(\"\")">
		
		    <a href="woknowmine.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">我的问题</a>&nbsp;|&nbsp;
		
		</ww:if>
			
		<ww:if test="vip==\"1\"">
	
		    <a href="woknowvip.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">VIP问题</a>&nbsp;|&nbsp;
		
		</ww:if>

  </tr>
</table><br>
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  
  <tr>
    <td class="CPanel">	
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
			<fieldset style="height:100%;width:95%;">
				<legend> 问题描述  </legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 	<tr>
					    	<td colspan="1">
					    	<ww:property value="['content']"/>
					    	</td>
					    </tr>
					   <tr>
					    	<td colspan="1" align=right>
					    	提问时间：<ww:property value="['q_date'].toString().substring(0,19)"/>
					    	</td>
					    </tr>
					  </table>
				</fieldset>			
			</TD>
		</TR>
		<ww:iterator value="ansList" status="row">
		<TR>
			<TD width="100%">
			<fieldset style="height:100%;width:95%;">
				<legend><ww:property value="['A_USER']"/>
				<ww:if test="A_LEVELS==\"1\"">【最佳答案】</ww:if></legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 	<tr>
					    	<td colspan="1">
					    	<ww:if test="A_DEL==\"0\"">
								<ww:property value="['A_CONTENT']"/>
							</ww:if>
							<ww:else>
								<FONT COLOR=RED>该条回复内容由于涉及到不文明词语已经被管理员删除，如果带来不便请谅解！</FONT>
							</ww:else>
					    	</td>
					    </tr>
					    <tr>
					    	<td  align=right>
								回复时间：<ww:property value="['A_DATE'].toString().substring(0,19)"/>
								<br/>
								<ww:if test="state ==\"0\"">
									<ww:if test="bestflag==\"0\" && userid!=\"\" ">
										<a href="woanswer.action?&userid=<ww:property value="['userid']"/>&op=best&q_id=<ww:property value="['q_id']"/>&a_id=<ww:property value="['A_ID']"/>&from=<ww:property value="from"/>">设为最佳答案</a>
									</ww:if>
								</ww:if>
					    	</td>
					    </tr>
					  </table>
				</fieldset>			
			</TD>
		</TR>
		</ww:iterator>
		<ww:if test="state ==\"0\"">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;width:95%;">
				<legend> 我来回答问题 </legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 	<tr>
					    	<td colspan="1"><textarea  id="textarea" name="A_CONTENT"  onKeyDown="textCounter(this.form.textarea,this.form.remLen,2000);"   onKeyUp="textCounter(this.form.textarea,this.form.remLen,2000);" style="width:100%;" rows="5"></textarea>
					    <br/><span>当前还可以录入<input   readonly   type=text   name=remLen   size=3   maxlength=3   value="2000">个字！</span>
					    <br/><span id=error></span>
					    <input type="hidden" name="q_id" value=<ww:property value="['q_id']"/>>
					    </td>
					    </tr>
					  </table>
			 <br />
				</fieldset>			
			</TD>
		</TR>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="button" name="Submit" value="回复" class="button" onclick="return link();"/>
			<ww:if test="(chanel==\"other\" && vip==\"1\") || (chanel==\"other\" &&type==\"SERVICE\")">
			<input type="button" name="Submit" value="结束问题" class="button" onclick="return over();"/>
			</ww:if>
			<ww:else>
				<ww:if test="chanel==\"vip\" || chanel==\"mine\" || vip==\"1\" || type==\"SERVICE\"">
				<input type="button" name="Submit" value="结束问题" class="button" onclick="return over();"/>
				</ww:if>
			</ww:else>
		</TD>
		</TR></ww:if>
		</TABLE>	
	 </td>
  </tr>	
</table>
</form>
</body>
</html>
