<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
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
		document.getElementById("error").innerHTML = "<font color=red>[������ʾ]���ظ������ݱ������10���֣�</font>"
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
<table width="406" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="top1" align="left"><table width="98%" border="0" cellspacing="0" cellpadding="6">
                          <tr>
                          <ww:if test="userid!=null && !userid.equals(\"\")">
                            <td align="center"><a href="woknowmine.action?userid=<ww:property value="userid"/>&chanel=mine&from=web" class="a4"><ww:if test="chanel==\"mine\""><font color=red>�ҵ�����</font></ww:if><ww:else>�ҵ�����</ww:else></a></td></ww:if>
                            <td align="center"><a href="woknow.action?userid=<ww:property value="userid"/>&chanel=other&from=web" class="a4"><ww:if test="chanel==\"other\""><font color=red>��������</font></ww:if><ww:else>��������</ww:else></a></td>
                          <ww:if test="vip==\"1\"">
                            <td align="center"><a href="woknowvip.action?userid=<ww:property value="userid"/>&chanel=vip&from=web" class="a4"><ww:if test="chanel==\"vip\""><font color=red>VIP����</font></ww:if><ww:else>VIP����</ww:else></a></td></ww:if>
                            <!-- td align="center"><a href="#" class="a4">���ѷ���</a></td -->
                          </tr>
                        </table></td>
                      </tr>
					<tr>
                    	<td valign="top" class="q_border"><table width="405" border="0" cellspacing="4" cellpadding="4">
                    	 <tr>
                        	<td><table width="100%" border="0" cellspacing="1" cellpadding="1" class="grey_01">
			                      <tr>
			                        <td class="content" >
			                        <fieldset style="height:100%;width:95%;">
										<legend> ����������<ww:if test="user_tel==\"\"">δ���ֻ�</ww:if><ww:else><ww:property value="['user_tel'].substring(0,3)"/>****<ww:property value="['user_tel'].substring(7,11)"/></ww:else>��</legend>
										  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
										 	<tr>
										    	<td  align="left">
										    	&nbsp;&nbsp;<ww:property value="['content']"/>
										    	</td>
										    </tr>
			
										   <tr>
										    	<td  align=right>
										    	����ʱ�䣺<ww:property value="['q_date'].toString().substring(0,16)"/>
										    	</td>
										    </tr>
										  </table>
									</fieldset>		
									</td>
			                  </tr>
			                  <ww:iterator value="ansList" status="row">
			                  <tr>
			                        <td class="content" >
			                        <fieldset style="height:100%;width:95%;">
										<legend>&nbsp;
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
													��������
												</ww:else>
											</ww:else>
										</ww:else>
										<ww:if test="A_LEVELS==\"1\"">����Ѵ𰸡�</ww:if></legend>
											  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
											 	<tr>
											    	<td align="left">
											    	<ww:if test="A_DEL==\"0\"">
														&nbsp;&nbsp;<ww:property value="['A_CONTENT']"/>
													</ww:if>
													<ww:else>
														&nbsp;&nbsp;<FONT COLOR=RED>�����ظ����������漰�������������Ѿ�������Աɾ������������������½⣡</FONT>
													</ww:else>
											    	</td>
											    </tr>
											    <tr>
											    	<td  align=right>
														�ظ�ʱ�䣺<ww:property value="['A_DATE'].toString().substring(0,16)"/>
														<br/>
														<ww:if test="state ==\"0\"">
															<ww:if test="bestflag==\"0\" && userid==q_user ">
																<a href="woanswer.action?&userid=<ww:property value="['userid']"/>&op=best&q_id=<ww:property value="['q_id']"/>&a_id=<ww:property value="['A_ID']"/>&from=<ww:property value="from"/>">��Ϊ��Ѵ�</a>
															</ww:if>
														</ww:if>
											    	</td>
											    </tr>
											  </table>
										</fieldset>			
									</TD>
			                  </tr>
			                  </ww:iterator>
			                  <ww:if test="state ==\"0\"">
			                  <form action="" method="post" name="fom" id="fom" >
									<TR>
										<TD width="100%" class="content" >
											<fieldset style="height:100%;width:95%;">
											<legend> �����ش����� </legend>
												  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
												 	<tr>
												    	<td colspan="1"><textarea  id="textarea" name="A_CONTENT"  onKeyDown="textCounter(this.form.textarea,this.form.remLen,2000);"   onKeyUp="textCounter(this.form.textarea,this.form.remLen,2000);" style="width:100%;" rows="5"></textarea>
												    <br/><span>��ǰ������¼��<input   readonly   type=text   name=remLen   size=3   maxlength=3   value="2000">���֣�</span>
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
										<input type="button" name="Submit" value="�ظ�" class="button" onclick="return link();"/>
										
										<input type="button" name="Submit" value="����" class="button" onclick="back()"/>
										<ww:if test="(chanel==\"other\" && vip==\"1\") || (chanel==\"other\" &&type==\"SERVICE\")|| (chanel==\"other\" && userid==q_user )">
										<input type="button" name="Submit" value="��������" class="button" onclick="return over();"/>
										</ww:if>
										<ww:else>
											<ww:if test="chanel==\"vip\" || chanel==\"mine\" || vip==\"1\" || type==\"SERVICE\"">
											<input type="button" name="Submit" value="��������" class="button" onclick="return over();"/>
											</ww:if>
										</ww:else>
									</TD>
									</TR>
									</form>
								</ww:if>
								<ww:else>
								<form action="" method="post" name="fom" id="fom" >
									<TR>
										<TD colspan="2" align="center" height="50px">
										
										<input type="button" name="Submit" value="����" class="button" onclick="back()"/>
										
										</TD>
									</TR>
								</form>
								</ww:else>
							</table>
						</td>
					</tr>
					</table>
					</td>
					</tr>						
                </table>

