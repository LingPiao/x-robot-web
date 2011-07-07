<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
<title>信息查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="cssjp/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
	color: #cccccc;
}
a:visited {
	text-decoration: none;
	color: #ce8965;
}
a:hover {
	text-decoration: none;
	color: #ECE9D8;
}
a:active {
	text-decoration: none;
}
a:link img{
	background:url(imagesmsn/buttom_preview01.png);
}
a:visited img{
	background:url(imagesmsn/buttom_preview02.png);
	
}
-->
</style>
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
</head>
<body bgcolor="#FFFFFF">
<FORM  name=fom action="" method=post id="fom">
<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="imagesmsn/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="imagesmsn/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="imagesmsn/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<tr>
		<td width="397" height="52">
			<img src="imagesmsn/main_04.jpg" width="41" height="52" alt=""></td>
		<td background="imagesmsn/main_05_bg.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="52"><br>
            <img src="imagesmsn/nav_left.gif" width="33" height="23"></td>
            <td align="center" valign="top"><img src="imagesmsn/banner_unicom.gif" width="208" height="44"></td>
            <td width="33"><br>
            <img src="imagesmsn/nav_right.gif" width="33" height="23"></td>
          </tr>
        </table></td>
<td>
			<img src="imagesmsn/main_06.jpg" width="39" height="52" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="imagesmsn/main_07.jpg" width="41" height="41" alt=""></td>
		<td width="397" height="41" class="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="41">&nbsp;</td>
            <td><a href="http://www.x-robot.cn/unicom//index.jsp"><img src="imagesmsn/index.gif" width="38" height="15" border="0" onMouseOver="this.src='imagesmsn/index_link.gif'" onMouseOut="this.src='imagesmsn/index.gif'"></a></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/robotweb/woknow.action?userid=<ww:property value="user_msn"/>&chanel=other&from=msn">“沃”知道 </a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/unicom//index.jsp">业务定制和使用</a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/index.html?msn=<ww:property value="user_msn"/>&refer=www.x-robot.cn/unicom/index.jsp">休闲广场</a></td>
              </tr>
            </table></td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" class="ban">
              <tr>
                <td width="20" height="41" align="center" valign="middle"><img src="imagesmsn/dot.gif" width="11" height="10"></td>
                <td valign="middle"><a href="http://www.x-robot.cn/unicom/invitebuddy/index.jsp">邀请好友</a></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
<td>
			<img src="imagesmsn/main_09.jpg" width="39" height="41" alt=""></td>
	</tr>
	<tr>
		<td class="left_02">&nbsp;</td>
	  <td width="397" height="511" valign="top" class="redbg">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" >
           <tr>
            <td class="button_01" align="center" valign="middle"><a class="black_01" href="woknow.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">网友问题</a></td>
            <ww:if test="userid!=null && !userid.equals(\"\")">
            <td class="button_02" align="center" valign="middle"><a class="black_01" href="woknowmine.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">我的问题</a></td>
            </ww:if>
             <ww:if test="vip==\"1\"">
            <td class="button_02" align="center" valign="middle"><a class="black_01" href="woknowvip.action?userid=<ww:property value="userid"/>&from=<ww:property value="from"/>">VIP问题</a></td>
          	</ww:if>
          </tr>
        </table>
		<table width="100%" height="100%" align="center" cellpadding="6" cellspacing="6">
          <tr>
            <td height="43" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="whitebg">
              <tr>
                <td width="5%" class="top_01"><img src="imagesmsn/corner1.jpg" width="18" height="18"></td>
                <td width="90%" class="top_01">&nbsp;</td>
                <td width="5%" align="right" class="top_01"><img src="imagesmsn/corner2.jpg" width="18" height="18"></td>
              </tr>
              <tr>
                <td class="left_01">&nbsp;</td>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td colspan="2"><table width="100%" border="0" cellspacing="1" cellpadding="1" class="grey_01">
                      <tr>
                        <td class="content"><span class="red_02">&nbsp;【<ww:if test="user_tel==\"\"">未绑定手机</ww:if><ww:else><ww:property value="['user_tel'].substring(0,3)"/>****<ww:property value="['user_tel'].substring(7,11)"/></ww:else>】的问题</span></td>
                      </tr>
                      <tr>
                        <td class="content">&nbsp;&nbsp;<ww:property value="['content']"/></td>
                      </tr>
						<tr>
                        <td align="right">&nbsp;提问时间：<ww:property value="['q_date'].toString().substring(0,16)"/></td>
                      </tr>
                    </table></td>
                  </tr>
                  <ww:iterator value="ansList" status="row">
                  <tr>
                    <td colspan="2"><table width="100%" border="0" cellspacing="1" cellpadding="1" class="grey_01">
                      <tr>
                        <td class="content"><span class="red_02">&nbsp;
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
							</ww:else>
				<ww:if test="A_LEVELS==\"1\"">【最佳答案】</ww:if></td>
                      </tr>
                      <tr>
                        <td align="left">&nbsp;<ww:if test="A_DEL==\"0\"">
																<ww:property value="['A_CONTENT']"/>
																</ww:if>
																<ww:else>
																	<FONT COLOR=RED>该条回复内容由于涉及到不文明词语已经被管理员删除，如果带来不便请谅解！</FONT>
																</ww:else></td>
                      </tr>
						<tr>
                        <td align="right">&nbsp;回复时间：<ww:property value="['A_DATE'].toString().substring(0,16)"/></td>
                      </tr>
                      <tr>
                        <td align="right"><ww:if test="state ==\"0\"">
													<ww:if test="bestflag==\"0\" && userid==q_user">
														<a href="woanswer.action?&userid=<ww:property value="['userid']"/>&op=best&q_id=<ww:property value="['q_id']"/>&a_id=<ww:property value="['A_ID']"/>&from=<ww:property value="from"/>">设为最佳答案</a>
													</ww:if>
											  </ww:if></td>
                      </tr>
                    </table></td>
                  </tr>
                  </ww:iterator>
                  <ww:if test="state ==\"0\"">
                  <tr>
                    <td colspan="2" class="content"><br>
                      <img src="imagesmsn/emoticon_smile.png" width="16" height="16"> 我来回答问题：
                      <br></td>
                  </tr>
                  <tr>
                    <td colspan="2" class="inputbg_01"><textarea  id="textarea"  name="A_CONTENT" cols="38" rows="6"  onKeyDown="textCounter(this.form.textarea,this.form.remLen,2000);"   onKeyUp="textCounter(this.form.textarea,this.form.remLen,2000);"></textarea></td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td width="90%" class="content" colspan=2>您最多还可以输入
                    
                      <input   readonly   type=text   name=remLen   size=3   maxlength=3   value="2000"> 
                           字<br/><span id=error></td><input type="hidden" name="q_id" value=<ww:property value="['q_id']"/>>
                   </tr>
                   <TR>
										<TD colspan="2" align="center" height="50px">
										<input type="button" name="Submit" value="回复" class="button" onclick="link();"/>
										
										<input type="button" name="Submit" value="返回" class="button" onclick="back();"/>
										<ww:if test="(chanel==\"other\" && vip==\"1\") || (chanel==\"other\" &&type==\"SERVICE\")|| (chanel==\"other\" && userid==q_user )">
										<input type="button" name="button" value="结束问题" class="button" onclick="return over();"/>
										</ww:if>
										<ww:else>
											<ww:if test="chanel==\"vip\" || chanel==\"mine\" || vip==\"1\" || type==\"SERVICE\"">
											<input type="button" name="Submit" value="结束问题" class="button" onclick="return over();"/>
											</ww:if>
										</ww:else>
									</TD>
					</TR>
					
                  </ww:if>
                  <ww:else>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2" align=center><input type="button" name="Submit" value="返回" class="button" onclick="back();"/></td>
                  </tr>
                  </ww:else>
                  
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  
                  <tr>
                    <td colspan="2">&nbsp;</td>
                  </tr>
                  
                  
                </table></td>
                <td class="right_01">&nbsp;</td>
              </tr>
              <tr>
                <td class="bottom_01"><img src="imagesmsn/corner3.jpg" width="18" height="18"></td>
                <td class="bottom_01">&nbsp;</td>
                <td align="right" class="bottom_01"><img src="imagesmsn/corner4.jpg" width="18" height="18"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
	  <td class="right_02">&nbsp;</td>
	</tr>
	<tr>
		<td>
			<img src="imagesmsn/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="imagesmsn/main_1401.jpg"><table width="100%" height="100%">
          <tr>
            <td width="20%" align="center" valign="top">&nbsp;</td>
            <td width="60%" align="center" valign="top" class="ban"></td>
            <td width="20%" align="center" valign="top"><img src="imagesmsn/touming.gif" width="70" height="30"></td>
          </tr>
        </table></td>
<td>
			<img src="imagesmsn/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="imagesmsn/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="imagesmsn/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="imagesmsn/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</FORM>
</body>
</html>