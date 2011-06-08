<%@page contentType="text/html;charset=gb2312" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<style type="text/css">
<!--
#Layer1 {
	position:absolute; 
	top:45%; 
	left:45%; 
	margin:-100px 0px 0px -100px; 
	width:273px;
	height:203px;
}
-->
</style>
</head>
<link href="../css/business.css" rel="stylesheet" type="text/css" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<%		String msnid = request.getParameter("msnid"); %>
<body>
&nbsp;
<div id="Layer1">
  <table width="100%" border="0" cellpadding="0" cellspacing="3" bgcolor="#990000">
    <tr>
      <td align="left" valign="top" class="fs_ok"><table width="270" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="162">&nbsp;</td>
            <td width="108">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td align="left" valign="top"><p>&nbsp;</p>
              <p>&nbsp;</p>
              <p>&nbsp;</p>
              <table class="button_x" width="60" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td id="left">&nbsp;</td>
                  <td align="center" valign="middle" id="center"><a href="index.jsp?msnid=<%=msnid %>" id="txt">返&nbsp; 回</a></td>
                  <td id="right">&nbsp;</td>
                </tr>
              </table>              <p>&nbsp;</p></td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
</body>
</html>
