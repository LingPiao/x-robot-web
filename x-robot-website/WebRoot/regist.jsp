<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>ע��</title>
<link href="css/sa.css" rel="stylesheet" type="text/css" />
<link href="css/alink.css" rel="stylesheet" type="text/css" />
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
                      <td width="558" align="left" valign="bottom" class="nierong"><strong>ע��</strong></td>
                    </tr>
                    <tr>
                      <td height="34" colspan="2" align="center" valign="top">
                      <form action = "#" method=post name="logform">
                      <table width="580" border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" >
                        <tbody>
                          
                          <tr>
                            <td width="120" height="30" align="right" valign="middle" nowrap="nowrap"><span class="hshiert">*</span>��¼����</td>
                            <td width="54" align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="username" size="25" name="username" /></span> 
                            </td>
                            <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error1"></span>
                            </td>
                            </tr>
                          <tr>
                            <td height="30" align="right" valign="middle" nowrap="nowrap"><span class="hshiert">*</span>�ǳƣ�</td>
                            <td  align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="nickname" size="25" name="nickname" /></td>
                            <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error2"></span>
                            </tr>
                          <tr>
                            <td height="30" align="right" valign="middle" nowrap="nowrap">���룺</td>
                            <td align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="userpwd" size="25" name="userpwd"  type="password" /></td>
                            <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error3"></span>
                            </tr>
                        
                          <tr>
                          <tr>
                            <td height="30" align="right" valign="middle" nowrap="nowrap">�ٴ��������룺</td>
                            <td align="left" valign="middle" style="padding:4px 0 4px 6px;"><input id="userpwd1" size="25" name="userpwd1" type="password" /></td>
                           <td width="400" align="left" valign="middle" style="padding:4px 0 4px 6px;"><span id="error4"></span>
                            </tr>
                        
                          <tr>
                            <td height="50" align="right" nowrap="nowrap">&nbsp;</td>
                            <td colspan="2" align="left" valign="middle" style="padding:7px 0 7px 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label>
                                <input type="submit" name="Submit2" value="�ύ" onclick="return reg()"/>
                                </label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label>
                                <input type="reset" name="reset" value="����" />
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
	document.getElementById("error1").innerHTML="<font color=red>��¼���ظ������������룡</font>";
</ww:if>
</script>
</body>
</html>
