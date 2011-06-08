<%@page contentType="text/html;charset=gb2312"  import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%@ page import="com.catic.tool.*" %>
<%@include file="session.jsp"%>
<%
	String sTable="";
	String sField="";
	String sCondition="";

	DataConn dataConn = new DataConn();
	UpdateData updateData = new UpdateData(dataConn);
	Encryption encryption = new Encryption();
  	String old = (request.getParameter("old"));
  	if(old==null)
  		old="";
  	else
  		old = encryption.getEncrypt(old);
  	String password1 = (request.getParameter("password1"));
  	if(password1==null)
  		password1="";
  	else
  		password1 = encryption.getEncrypt(password1);
  	String doMode = request.getParameter("domode");
  	if (doMode == null)
    	doMode = "";
  
  
  if (doMode.equals("update")) {
   
    if (!old.equals(userpwd)) {
      out.println("<br>&nbsp;&nbsp;&nbsp;<font color='red'>旧口令输入不正确，修改口令失败！</font>");
    }
    else {
      try { 
    	 sTable="sms_manager_user";
    	 sField="USERPWD ='"+password1+"'";
    	 sCondition="username ='"+username+"'";
    	 updateData.update(sTable,sField,sCondition);
    	 session.setAttribute("userpwd",password1);
      } 
      catch (Exception ex){
          out.println("<br>&nbsp;&nbsp;&nbsp;<font color='red' style='font-size:11pt'>修改失败，请联系系统管理员！</font>");
          return;
      }
      out.println("<br><br><center><font style='font-size:11pt'>修改口令成功！</font><br><br><a href=\"javascript:opener=null;close()\">关闭</a></center>");
      return;
    }
  }
%>
<html><head><title>管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
td {
	font-size: 14px;
	line-height: 23px;
	text-decoration: none;
}
.input_boder{ 
	background-color:#FFFFFF;
	border: solid #003399 1px;
	height:15px;
}

-->
</style>
</head>
<!--引入通用的CSS-->
<link href="sys/orchis.css" rel=stylesheet type="text/css">
<!--引入通用的JavaScript程序-->
<script src="js/common.js"></script>
<script>
function isEmpty(str) {
		if (str == null || str.length == 0) {
			  return true;
		} else {
			  return false;
		}
}

function check_passwd(form) {
  var p1 = form.password1.value;
  var p2 = form.password2.value;
	var old = form.old.value;

	if (isEmpty(old)) {
		 	 alert("旧口令不能为空，请重新输入！");
			 form.old.focus();
			 return false;
	}
	if (isEmpty(p1)) {
		 	 alert("新口令不能为空，请重新输入！");
			 form.password1.focus();
			 return false;
	}
	if (isEmpty(p2)) {
		 	 alert("确认口令不能为空，请重新输入！");
			 form.password2.focus();
			 return false;
	}
  if (p1.length!=p2.length){
		 	 alert("新口令不一致，请重新输入！");
			 form.password1.focus();
			 return false;
	}else{
      var mark=0;
		  for (i=0; i<p1.length; i++){
			  if ( p1.substr(i,1)!=p2.substr(i,1) ) {mark=1;  break;}
		  }
		  if (mark==1){
		 	 alert("新口令不一致，请重新输入！");
			 form.password1.focus();
			 return false;
		  }
	}
	return true;
}

function modification(form) {
	if ( !check_passwd(form) ) return false;
    return true;
}

function focus_passwd(){
  document.mainForm.old.focus();
}

</script>

<body>
<table width="500" height="278" border="0" align="center" cellspacing="1" bgcolor="#CCCCCC">
  <tr bgcolor="#ffffff" class="table-bg-1" height="20">
    <td height="26" align="left" valign="middle" background="images/Company_bj.jpg"><span class="wht"> &nbsp;<img src="images/20.gif" width="7" height="5"> <strong>修改密码</strong></span></td>
  </tr>
  <tr bgcolor="#ffffff" height="20">
    <td height="238" align="center" valign="top"><table width="90%" border="0" align="center" cellpadding="4" cellspacing="1">
     <form name="mainForm" method="post" action="change_pwd.jsp">
                        <INPUT type=hidden value="update" name=domode>
	  <tr>
        <td colspan="4" align="left" valign="middle">&nbsp;</td>
      </tr>
      
      <tr>
        <td width="12%" align="right"><div align="right"><img src="images/point.jpg" width="7" height="9">&nbsp; </div></td>
        <td width="21%">旧口令：</td>
        <td colspan="2"><input name="old" type="password" class="input_boder" id="old" style="width:150px;" size="20">        </td>
      </tr>
      <tr>
        <td align="right"><div align="right"><img src="images/point.jpg" width="7" height="9">&nbsp; </div></td>
        <td valign="middle">新口令：</td>
        <td colspan="2"><input style="width:150px;" class="input_boder" name="password1" type="password" id="password1" size="20">        </td>
      </tr>
      <tr>
        <td align="right"><div align="right"><img src="images/point.jpg" width="7" height="9">&nbsp; </div></td>
        <td valign="middle">新口令确认：</td>
        <td valign="middle"><input style="width:150px;" class="input_boder" name="password2" type="password" id="password2" size="20"></td>
        <td width="31%">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
		
		&nbsp;&nbsp;
        <td width="36%" valign="middle"><input class="button_small" name="Submit" value="确定" type="submit" onClick="return modification(this.form);">
              <input class="button_small" type=reset name="reset" value="重置"></td>
        <td width="31%" rowspan="2"><img src="images/password.jpg" width="130" height="92"></td>
      </tr>
	  </form>
      <tr>
        <td align="right">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
        </tr>
      
    </table>
    <p class="table-bg-3">&nbsp;</p></td>
  </tr>
  <tr height="20">
    <td height="10" align="left" background="images/bg_4.gif"></td>
  </tr>
</table><%
dataConn.close();
%>
</body></html>