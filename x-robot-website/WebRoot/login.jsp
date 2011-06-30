<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
</head>

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
        <td align="center"><table width="50%" border="0" cellspacing="6" cellpadding="6">
          <tr>
            <td colspan="2" height="120" valign="bottom" align="left"><img src="images/re_top.jpg" width="600" height="70" /></td>
          </tr>
          <tr>
            <td width="35%" rowspan="6" valign="top"><img src="images/register.jpg" width="234" height="260" /></td>
            <td align="left">&nbsp;</td>
          </tr>
          <form action = "login.action?op=logindo" method=post>
          <tr>
            <td width="65%" align="left"> 　用户名:
              <label>
              <input type="text" name="username" id="username" class="in" />
              </label></td>
          </tr>
          <tr>
            <td align="left">　密　码:              
              <input type="password" name="userpwd" id="userpwd" class="in" /></td>
          </tr>
          <!-- tr>
            <td align="left">　验证码:
              <input type="text" name="textfield3" id="textfield3" class="in" /></td>
          </tr>
          <tr>
            <td align="left">保存登录:
              <label>
              <select name="select" id="select">
                <option>一小时</option>
                <option>一天</option>
                <option>一月</option>
                <option>一年</option>
              </select>
              </label>   
              <img src="images/3-1.jpg" width="53" height="16" />　 <a href="12.html" class="a7">找回密码</a></td>
          </tr -->
          <tr>
            <td align="left" valign="top"><label>
              　　　　
                  <input type="submit" name="button" id="button" value="登录" class="buttonbg" />
            </label></td>
          </tr>
         </form>	
          <tr>
            <td colspan="2" height="100"></td>
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
