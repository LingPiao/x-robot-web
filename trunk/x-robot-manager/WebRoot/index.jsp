<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=gb2312" import="java.sql.*"%>
<%@ page import="com.catic.tool.*" %>
<%@ page import="com.catic.bean.*" %>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 	
	StringUtil strUtil = new StringUtil();
	String username = request.getParameter("username");
	Encryption encryption = new Encryption();
	//System.out.println(username);
	if(username!= null)
	{
		if (strUtil.CheckInputStr(username))
		{
			out.print("<Script Language=javascript>alert('用户名中包含非法字符！');history.back(-1);</Script> ");
		}
		else
		{
			String rand = (String)session.getAttribute("rand");
			String vcode = request.getParameter("vcode");
			if(!rand.equals(vcode))
			{
				out.print("<script>alert('验证码输入错误！');javaScript:history.go(-1);</script>");
			}
			else
			{
				String userpwd1 =request.getParameter("password");
				if(userpwd1 == null)
					userpwd1 =  "";
				else
					userpwd1 = encryption.getEncrypt(userpwd1);
				UserManagerAction umAction = new UserManagerAction();
				if(umAction.IsLogin(username,userpwd1))
				{
					String stable = "sms_manager_user";
					String sfield = "userrole,USERPWD";
					String scon = "USERNAME='"+username+"'";
					DataConn dataConn = new DataConn();
					QueryData queryData = new QueryData(dataConn);
					queryData.setRecordSet(stable,sfield, scon);
				    ResultSet rs1 = queryData.getResultSet();
				    String userroleid="",userpwd2="";
				    if(rs1.next())
				    {
				    	userroleid= rs1.getString(1);
				    	userpwd2= rs1.getString(2);
				    }
				    
				    rs1.close();
				    queryData.close();
				    dataConn.close();
					session.setAttribute("username",username);
					session.setAttribute("userpwd",userpwd2);
					session.setAttribute("userrole",userroleid);
					response.sendRedirect("frame.jsp");
				}
				else
				{
					response.sendRedirect("index.jsp");
				}
			}
		}
	}
	else
	{
		session.setAttribute("username","");
		session.setAttribute("userrole","");
		
	}
	
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		
	</head>
	<link href="css/css.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
	function checklogin()
	{
		var inputname = loginform.username.value;
		if(inputname=="")
		{
			alert("请输入登陆名！");
			return false;
		}
		var vcode = loginform.vcode.value;
		if(vcode=="")
		{
			alert("请输入验证码！");
			return false;
		}
	}
	</script>
	<body>
		<table width="100%" height="100%" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td align="center" valign="middle">
					<table width="100%" height="100%" border="0" align="center"
						cellpadding="0" cellspacing="0">
						<tr>
							<td class="login_title" align=left>
								<img src="images/x.jpg" width="22" height="17"/>&nbsp;联通机器人短信管理平台
							</td>
						</tr>
						<tr>
							<td align="center" valign="middle" class="login_bg">
								<table width="500" height="100%" border="0" align="center"
									cellpadding="5" cellspacing="0">
									<form name="loginform" method="post" action="index.jsp" onsubmit="return checklogin();">
										<tr>
											<td colspan="3" align="center" height="118" >
												&nbsp;
											</td>
										</tr>									
										<tr>
											<td colspan="3" align="center">
												<img src="images/logo.png" width="369" height="118" />
											</td>
										</tr>
										<tr>
											<td align="right" valign="middle" class="logon_txt1">
												用户名：
											</td>
											<td width="67%" align="left" valign="middle">
												<input name="username" type="text" size="15"
													class="input_txt" style="width:200px;" />
											</td>
										</tr>
										<tr>
											<td align="right" valign="middle" class="logon_txt1">
												登陆密码：
											</td>
											<td width="67%" align="left" valign="middle">
												<input name="password" type="password" size="15"
													class="input_txt" style="width:200px;" />
											</td>
										</tr>
										<tr>
											<td align="right" valign="middle" class="logon_txt1">
												附加码：
											</td>
											<td width="67%" align="left" valign="middle">
												<input name="vcode" type="text" size="15" class="input_txt"
													style="width:150px;" />
												<span class="logon_txt"><img border=0 src="public/newimage.jsp"></span>
											</td>
										</tr>
	
										<tr>
											<td colspan="2" align="center" valign="middle">
												<input name="login" type="submit" class="button" value="登 陆">
												&nbsp;
												<input name="button" type="reset" class="button" value="取 消">
											</td>
										</tr>
										<tr>
											<td colspan="3" align="center" height="146" >
												&nbsp;
											</td>
										</tr>
									</form>
								</table>
							</td>
						</tr>
						<tr>
							<td height="1"></td>
						</tr>
						<tr>
							<td class="login_di">
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>