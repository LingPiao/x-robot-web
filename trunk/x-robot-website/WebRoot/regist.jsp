<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
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
<table width="100%" border="0" cellspacing="0" cellpadding="0"><tr><td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="top" align="left" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <%@ include file="top.jsp" %>
    </table></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><table width="50%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="100" align="center">&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><table width="90%" border="0" cellspacing="5" cellpadding="5" class="lineborder">
                  <tr>
                    <td valign="bottom" align="center">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="left">&nbsp;</td>
                  </tr>
                  <form action = "#" method=post name="logform">
                  <tr>
                    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span>用户名:
                      <label>
                        <input type="text" name="username" id="username" class="in" />
                        <span id="error1"></span></label></td>
                  </tr>
                  <tr>
                    <td width="52%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span>昵　称:
                      <label>
                        <input type="text" name="nickname" id="nickname" class="in" />
                        <span id="error2">
                      </label></td>
                  </tr>
                  <tr>
                    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span> 密　码:
                      <input type="password" name="userpwd" id="userpwd" class="in" />
                       <span id="error3"></span></td>
                  </tr>
                  <tr>
                    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span> 重复密码:
                      <input type="password" name="userpwd1" id="userpwd1" class="in" />
                      <span id="error4"></span></td>
                  </tr>
                  <!-- tr>
                    <td align="left"> 　　<span class="red">　</span>&nbsp;&nbsp;邮　箱:
                      <input type="text" name="textfield6" id="textfield6" class="in" />
                        <span class="yanzheng">请输入有效的邮箱地址</span></td>
                  </tr>
                  <tr>
                    <td align="left">　　 　 手机号:
                      <input type="text" name="textfield7" id="textfield7" class="in" /></td>
                  </tr>
                  <tr>
                    <td align="left">　　　<span class="red">*</span> 验证码:
                      <input name="textfield3" type="text" class="in" id="textfield3" size="12" />
                      <img src="images/3-1.jpg" width="53" height="16" /></td>
                  </tr-->
                  <tr>
                    <td align="left" valign="top"><label> 　　　　　　　
                      
                        <input type="submit" name="button" id="button" value="注册" class="buttonbg" onclick="return reg()"/>
                      
                      <input type="reset" name="button2" id="button2" value="重置" class="buttonbg" />
                    </label></td>
                  </tr>
                  </form>
                  <tr>
                    <td height="50"></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="60" align="center" class="a1"><br />
              <br /></td>
        </tr>
        <%@ include file="buttom.jsp" %>
    </table></td>
  </tr>

</table></td>
  </tr>
</table>
</body>
</html>
