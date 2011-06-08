<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">

<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=GBK"><LINK 
href="css-jp/main1.css" type=text/css rel=stylesheet>

<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; MARGIN-RIGHT: 0px
}
</STYLE>
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
<META content="MSHTML 6.00.6001.18565" name=GENERATOR></HEAD>
<BODY class="bg">
<FORM id=fom name=fom action="" method=post>
<table width="100%" border="0" align="center" >
  <tr>
    <td><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
      <TBODY>
        <TR>
          <TD><TABLE id=subtree1 cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
                <TR>
                  <TD><TABLE cellSpacing=0 cellPadding=0 width="100%" align=center 
            border=0>
                      <TBODY>
                        <TR>
                          <TD height=40><TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 class="border">
                              <TBODY>
                                <TR>
                                  <TD width="2%" class="ll"><img src="images-jp/corner1.jpg" width="23" height="16"></TD>
                                  <TD width="96%"  class="top">&nbsp;</TD>
                                  <TD width="2%" class="rightline"><img src="images-jp/corner3.jpg" width="23" height="17"></TD>
                                </TR>
                                <TR>
                                  <TD  class="ll"></TD>
                                  <TD width="98%"><table cellspacing="2" cellpadding="2" width="100%" border="0" class="border">
                                      <tbody>
                                        <tr>
                                          <td width="96%" height="30"><TABLE cellSpacing=0 cellPadding=0 width="100%" align=right border=0>
  <TBODY>
  <TR>
    <TD align=""><a href="woknow.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>"><img src="images-jp/q1.jpg" border="0" alt="网友问题"></A>
    <ww:if test="userid!=null && !userid.equals(\"\")">
		
		    <a href="woknowmine.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>"><img src="images-jp/q2.jpg" border="0" align="我的问题"></A>
	</ww:if>	    
		    <ww:if test="vip==\"1\"">
	
		    <a href="woknowvip.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>"><img src="images-jp/q3.jpg" border="0" align="VIP问题"></A>
		    </ww:if></TD>
  </TR></TBODY></TABLE></td>
                                        </tr>
                                        
                                        
                                        <tr>
                                          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="gb">
                                            <tr>
                                              <td colspan="2" class="al"><img src="images-jp/qe1.jpg" width="10" height="10">&nbsp;问题描述</td>
                                              </tr>
                                            <tr>
                                              <td colspan="2" class="d">&nbsp;<ww:property value="['q_date'].toString().substring(0,19)"/></td>
                                              </tr>
                                            <tr>
                                              <td colspan="2">&nbsp;<ww:property value="['content']"/></td>
                                              </tr>
                                            <tr>
                                              <td align="left"><img src="images-jp/ic.jpg" width="15" ></td>
                                              <td colspan="2" align="right"></td>
                                              </tr>
                                          </table></td>
                                        </tr>
                                        <ww:iterator value="ansList" status="row">
                                        <tr>
                                          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="gb">
                                            <tr>
                                              <td colspan="2" class="al"><img src="images-jp/qe1.jpg" width="10" height="10">&nbsp;<ww:property value="['A_USER']"/>
				<ww:if test="A_LEVELS==\"1\"">【最佳答案】</ww:if></td>
                                            </tr>
                                            <tr>
                                              <td colspan="2" class="d">&nbsp;回复时间：<ww:property value="['A_DATE'].toString().substring(0,19)"/></td>
                                            </tr>
                                            <tr>
                                              <td colspan="2">&nbsp;<ww:if test="A_DEL==\"0\"">
																<ww:property value="['A_CONTENT']"/>
																</ww:if>
																<ww:else>
																	<FONT COLOR=RED>该条回复内容由于涉及到不文明词语已经被管理员删除，如果带来不便请谅解！</FONT>
																</ww:else>
												</td>
                                            </tr>
                                            <tr>
                                              <td align="left"><img src="images-jp/ic.jpg" width="15" ></td>
                                              <td align="right">
											  <ww:if test="state ==\"0\"">
													<ww:if test="bestflag==\"0\" && userid!=\"\" ">
														<a href="woanswer.action?&userid=<ww:property value="['userid']"/>&op=best&q_id=<ww:property value="['q_id']"/>&a_id=<ww:property value="['A_ID']"/>&from=<ww:property value="from"/>">设为最佳答案</a>
													</ww:if>
											  </ww:if>
											  </td>
                                            </tr>
                                          </table></td>
                                        </tr></ww:iterator>
                                        <ww:if test="state ==\"0\"">
                                        <tr>
                                          <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="gb">
                                            <tr>
                                              <td colspan="2" class="al"><img src="images-jp/qe1.jpg" width="10" height="10">&nbsp;我来回答问题</td>
                                            </tr>
                                           <tr>
										    <td colspan="2"><textarea  id="textarea" name="A_CONTENT"  onKeyDown="textCounter(this.form.textarea,this.form.remLen,2000);"   onKeyUp="textCounter(this.form.textarea,this.form.remLen,2000);" style="width:100%;" rows="5"></textarea>
										    <br/><span>当前还可以录入<input   readonly   type=text   name=remLen   size=3   maxlength=3   value="2000">个字！</span>
										    <br/><span id=error></span>
										    <input type="hidden" name="q_id" value=<ww:property value="['q_id']"/>>
										    </td>
										    </tr>
                                            <tr>
                                              <td align="left"><img src="images-jp/ic2.jpg" width="15" height="30"></td>
                                              <td align="left">
                                              <INPUT class=button onClick="return link();" type="image" src="images-jp/but1.jpg" value=回复 name=Submit>
							                                                　<ww:if test="(chanel==\"other\" && vip==\"1\") || (chanel==\"other\" &&type==\"SERVICE\")">
												<input class=button type="image" src="images-jp/but2.jpg" name="Submit" value="结束问题" class="button" onclick="return over();"/>
												</ww:if>
												<ww:else>
													<ww:if test="chanel==\"vip\" || chanel==\"mine\" || vip==\"1\" || type==\"SERVICE\"">
													<input class=button type="image" src="images-jp/but2.jpg" name="Submit" value="结束问题" class="button" onclick="return over();"/>
													</ww:if>
												</ww:else>
                                                </td>
                                            </tr>
                                            
                                          </table></td>
                                        </tr>
                                        </ww:if>
    
                                        <tr>
                                          <td></td>
                                        </tr>
                                      </tbody>
                                  </table></TD>
                                  <TD  class="rightline">&nbsp;</TD>
                                </TR>
                                <TR>
                                  <TD class="ll"><img src="images-jp/corner2.jpg" width="23" height="18"></TD>
                                  <TD class="bottom">&nbsp;</TD>
                                  <TD class="rightline"><img src="images-jp/corner4.jpg" width="23" height="18"></TD>
                                </TR>
                                <TR>
                                  <TD></TD>
                                  <TD></TD>
                                  <TD></TD>
                                </TR>
                              </TBODY>
                          </TABLE></TD>
                        </TR>
                      </TBODY>
                  </TABLE></TD>
                </TR>
              </TBODY>
          </TABLE>
              </TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
</table>
</FORM></BODY></HTML>
