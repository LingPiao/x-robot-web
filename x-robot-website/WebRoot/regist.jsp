<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>注册</title>
<link href="css/sa.css" rel="stylesheet" type="text/css" />
<link href="css/alink.css" rel="stylesheet" type="text/css" />
</head>
<script>
function reg()
{
	if(document.getElementById("username").value=="")
	{
		document.getElementById("error1").innerHTML="<font color=red>登录名不能为空！</font>";
		return false;
	}
	if(document.getElementById("nickname").value=="")
	{
		document.getElementById("error2").innerHTML="<font color=red>昵称不能为空！</font>";
		return false;
	}
	if(document.getElementById("userpwd").value.length<6)
	{
		
		document.getElementById("error3").innerHTML="<font color=red>密码长度必须大于6！</font>";
		return false;
	}
	if(document.getElementById("userpwd").value!=document.getElementById("userpwd1").value)
	{
		document.getElementById("error4").innerHTML="<font color=red>两次输入的密码不一致！</font>";
		return false;
	}
	
	logform.action="login.action?op=regdo";
	logform.submit();
}
</script>
<body>
<table width="1001" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top" background="images/bg3.jpg"><table width="1001" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="759" align="center" valign="top" background="images/bg2.jpg" style="background-repeat:no-repeat;"><table width="850" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="110">&nbsp;</td>
          </tr>
        </table>
              <table width="850" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="250" align="left" valign="top">
                  <%@ include file="add_left.jsp" %></td>
                  <td width="600" height="600" align="center" valign="top" background="images/erbg.jpg" style="background-repeat:no-repeat;"><table width="580" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="22" height="34" align="left" valign="top"><img src="images/er-01.jpg" width="17" height="29" /></td>
                      <td width="558" align="left" valign="bottom" class="nierong"><strong>注册</strong></td>
                    </tr>
                    <tr>
                      <td height="34" colspan="2" align="center" valign="top">
                      <form action = "#" method=post name="logform">
                      <table width="580" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" >
                        <tbody>
                          
                          <tr>
                            <td width="120" height="30" align="right" valign="middle" nowrap="nowrap"><span class="hshiert">*</span>登录名：</td>
                            <td width="54" align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="username" size="25" name="username" /></span> 
                            </td>
                            <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error1"></span>
                            </td>
                            </tr>
                          <tr>
                            <td height="30" align="right" valign="middle" nowrap="nowrap"><span class="hshiert">*</span>昵称：</td>
                            <td  align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="nickname" size="25" name="nickname" /></td>
                            <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error2"></span>
                            </tr>
                          <tr>
                            <td height="30" align="right" valign="middle" nowrap="nowrap">密码：</td>
                            <td align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="userpwd" size="25" name="userpwd"  type="password" /></td>
                            <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error3"></span>
                            </tr>
                        
                          <tr>
                          <tr>
                            <td height="30" align="right" valign="middle" nowrap="nowrap">再次输入密码：</td>
                            <td align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="userpwd1" size="25" name="userpwd1" type="password" /></td>
                           <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error4"></span>
                            </tr>
                        
                          <tr>
                            <td height="50" align="right" nowrap="nowrap">&nbsp;</td>
                            <td colspan="2" align="left" valign="middle" style="padding:7px 0 7px 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label>
                                <input type="submit" name="Submit2" value="提交" onclick="return reg()"/>
                                </label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label>
                                <input type="reset" name="reset" value="重置" />
                              </label></td>
                          </tr>
                        </tbody>
                      </table>
                      </form>
                      </td>
                    </tr>
                  </table></td>
                </tr>
              </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/bg4.jpg" width="1001" height="16" /></td>
  </tr>
</table>
<%@ include file="buttom.jsp" %>
<p>&nbsp;</p>
<p>&nbsp;</p>
<script >
<ww:if test="flag == \"0\"">
	document.getElementById("error1").innerHTML="<font color=red>登录名重复，请重新输入！</font>";
</ww:if>
</script>
</body>
</html>
