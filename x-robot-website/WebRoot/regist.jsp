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
		document.getElementById("error1").innerHTML="<font color=red>��¼������Ϊ�գ�</font>";
		return false;
	}
	if(document.getElementById("nickname").value=="")
	{
		document.getElementById("error2").innerHTML="<font color=red>�ǳƲ���Ϊ�գ�</font>";
		return false;
	}
	if(document.getElementById("userpwd").value.length<6)
	{
		
		document.getElementById("error3").innerHTML="<font color=red>���볤�ȱ������6��</font>";
		return false;
	}
	if(document.getElementById("userpwd").value!=document.getElementById("userpwd1").value)
	{
		document.getElementById("error4").innerHTML="<font color=red>������������벻һ�£�</font>";
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
                    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span>�û���:
                      <label>
                        <input type="text" name="username" id="username" class="in" />
                        <span id="error1"></span></label></td>
                  </tr>
                  <tr>
                    <td width="52%" align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span>�ǡ���:
                      <label>
                        <input type="text" name="nickname" id="nickname" class="in" />
                        <span id="error2">
                      </label></td>
                  </tr>
                  <tr>
                    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span> �ܡ���:
                      <input type="password" name="userpwd" id="userpwd" class="in" />
                       <span id="error3"></span></td>
                  </tr>
                  <tr>
                    <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;<span class="red">* </span> �ظ�����:
                      <input type="password" name="userpwd1" id="userpwd1" class="in" />
                      <span id="error4"></span></td>
                  </tr>
                  <!-- tr>
                    <td align="left"> ����<span class="red">��</span>&nbsp;&nbsp;�ʡ���:
                      <input type="text" name="textfield6" id="textfield6" class="in" />
                        <span class="yanzheng">��������Ч�������ַ</span></td>
                  </tr>
                  <tr>
                    <td align="left">���� �� �ֻ���:
                      <input type="text" name="textfield7" id="textfield7" class="in" /></td>
                  </tr>
                  <tr>
                    <td align="left">������<span class="red">*</span> ��֤��:
                      <input name="textfield3" type="text" class="in" id="textfield3" size="12" />
                      <img src="images/3-1.jpg" width="53" height="16" /></td>
                  </tr-->
                  <tr>
                    <td align="left" valign="top"><label> ��������������
                      
                        <input type="submit" name="button" id="button" value="ע��" class="buttonbg" onclick="return reg()"/>
                      
                      <input type="reset" name="button2" id="button2" value="����" class="buttonbg" />
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
