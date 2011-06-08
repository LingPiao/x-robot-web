<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<%@ include file="../session.jsp"%>
<% 
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
    Encryption encryption = new Encryption();
    UserManagerAction umAction = new UserManagerAction();
	String userid = request.getParameter("user_id");
	String user_name = request.getParameter("username");
	String realname = request.getParameter("realname");
	String pwd = request.getParameter("pwd");
	pwd = encryption.getEncrypt(pwd);
	String user_role = request.getParameter("user_role");
	String action = request.getParameter("action");
	if(action!= null)
	{

		if (action.equals("add"))
		{
			if(umAction.insert(user_name,pwd,realname,user_role))
			{
				out.println("<script>alert('保存成功！');window.location.href='user.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('保存失败！');window.location.href='user.jsp';</script>");			
			}
		}
		if (action.equals("edit"))
		{
			if(umAction.update(userid,user_name,pwd,realname,user_role))
			{
				out.println("<script>alert('修改成功！');window.location.href='user.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('修改失败！');window.location.href='user.jsp';</script>");
			}
		}
		if (action.equals("del"))
		{
			String mesidArray[] = request.getParameterValues("mesid");
			if(umAction.delete(mesidArray))
			{
				out.println("<script>alert('删除成功！');window.location.href='user.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('删除失败！');window.location.href='user.jsp';</script>");
			}
		}
	}

%>