<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
</head>
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
function back(){
	var chanel="<ww:property value="['chanel']"/>";
	if(chanel == "other")
		document.getElementById("fom").action="woknow.action?userid=<ww:property value="['userid']"/>&chanel=<ww:property value="['chanel']"/>&from=<ww:property value="from"/>";
	if(chanel == "mine")
		document.getElementById("fom").action="woknowmine.action?userid=<ww:property value="['userid']"/>&chanel=<ww:property value="['chanel']"/>&from=<ww:property value="from"/>";
	if(chanel == "vip")
		document.getElementById("fom").action="woknowvip.action?userid=<ww:property value="['userid']"/>&chanel=<ww:property value="['chanel']"/>&from=<ww:property value="from"/>";
	document.getElementById("fom").submit();
}
function over(){
    document.getElementById("fom").action="woanswer.action?&userid=<ww:property value="['userid']"/>&op=over&from=<ww:property value="from"/>&chanel=<ww:property value="['chanel']"/>";
    document.getElementById("fom").submit();
}

</script>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="top" align="left" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <%@ include file="top.jsp" %>
    </table></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><table width="80%" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td width="100%" height="40" align="center" valign="bottom">&nbsp;</td>
          </tr>
          
          
          <tr>
            <td align="center" valign="top"><table width="100%" cellpadding="0" cellspacing="0" width　border="0">
      
              <tr>
                <td valign="top"align="center" class="by_bg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> </tr>
                  <tr>
                    <td><table width="100%"  border="0" align="left" cellpadding="4" cellspacing="0">
                        <tr>
                          <td align="left">&nbsp;</td>
                        </tr>
                        <tr>
                          <td align="left" class="qbc">问题描述&nbsp;&nbsp;&nbsp;&nbsp;提问时间：<ww:property value="['q_date'].toString().substring(0,16)"/></td>
                        </tr>
                        <tr>
                          <td align="left" class="content2">&nbsp;&nbsp;&nbsp;&nbsp;<ww:property value="['content']"/></td>
                        </tr>
                        <ww:iterator value="ansList" status="row">
                        <tr>
                          <td align="left">&nbsp;</td>
                        </tr>
                        <tr>
                          	<td align="left" class="qbc">
								<ww:if test="USER_TEL!=null">
											<ww:property value="['USER_TEL']"/>
										</ww:if>
										<ww:else>
											<ww:if test="A_USER.indexOf('@')>1  && A_USER.indexOf('.')>1 ">
												<ww:property value="['A_USER']"/>
											</ww:if>
											<ww:else>
												<ww:if test="NICKNAME!=null">
													<ww:property value="['NICKNAME']"/>
												</ww:if>
												<ww:else>
													热心网友
												</ww:else>
											</ww:else>
										</ww:else>:回复&nbsp;&nbsp;<ww:if test="A_LEVELS==\"1\"">【最佳答案】</ww:if>
							</td>
                        </tr>
                        <tr>
                          <td align="left"><span class="content2"><ww:if test="A_DEL==\"0\"">
														&nbsp;&nbsp;&nbsp;&nbsp;<ww:property value="['A_CONTENT']"/>
													</ww:if>
													<ww:else>
														&nbsp;&nbsp;&nbsp;&nbsp;<FONT COLOR=RED>该条回复内容由于涉及到不文明词语已经被管理员删除，如果带来不便请谅解！</FONT>
													</ww:else></span></td>
                        </tr>
                        <tr>
											    	<td  align=right>
														回复时间：<ww:property value="['A_DATE'].toString().substring(0,16)"/>
														<br/>
														<ww:if test="state ==\"0\"">
															<ww:if test="bestflag==\"0\" && userid!=\"\" ">
																<a href="woanswer.action?&userid=<ww:property value="['userid']"/>&op=best&q_id=<ww:property value="['q_id']"/>&a_id=<ww:property value="['A_ID']"/>&from=<ww:property value="from"/>">设为最佳答案</a>
															</ww:if>
														</ww:if>
											    	</td>
											    </tr>
                        </ww:iterator>
                        <ww:if test="state ==\"0\"">
			                  <form action="" method="post" name="fom" id="fom" >
									<TR>
										<TD width="100%" class="content" >
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
										
										<input type="button" name="Submit" value="关闭" class="button" onclick="window.close();"/>
										<ww:if test="(chanel==\"other\" && vip==\"1\") || (chanel==\"other\" &&type==\"SERVICE\")">
										<input type="button" name="Submit" value="结束问题" class="button" onclick="return over();"/>
										</ww:if>
										<ww:else>
											<ww:if test="chanel==\"vip\" || chanel==\"mine\" || vip==\"1\" || type==\"SERVICE\"">
											<input type="button" name="Submit" value="结束问题" class="button" onclick="return over();"/>
											</ww:if>
										</ww:else>
									</TD>
									</TR>
									</form>
								</ww:if>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
          </tr>
          
          
        </table></td>
      </tr>
      
      <tr>
        <td align="center" class="a1"><br />
          <br /></td>
      </tr>
       <%@ include file="buttom.jsp" %>
    </table></td>
  </tr>
</table>
</body>
</html>
