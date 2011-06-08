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
	
	SmsManagerAction smAction = new SmsManagerAction();
	String mes_id = request.getParameter("mes_id");
	String mes_category = request.getParameter("mes_category");
	String mes_content = request.getParameter("mes_content");
	String action = request.getParameter("action");
	if(action!= null)
	{
		
		if (action.equals("add"))
		{
			if(smAction.insert(mes_category,mes_content))
			{
				out.println("<script>alert('保存成功！');window.location.href='sms.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('保存失败！');window.location.href='sms.jsp';</script>");			
			}
		}
		if (action.equals("edit"))
		{
			if(smAction.update(mes_id,mes_category,mes_content))
			{
				out.println("<script>alert('修改成功！');window.location.href='sms.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('修改失败！');window.location.href='sms.jsp';</script>");
			}
		}
		if (action.equals("del"))
		{
			String mesidArray[] = request.getParameterValues("mesid");
			if(smAction.delete(mesidArray))
			{
				out.println("<script>alert('删除成功！');window.location.href='sms.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('删除失败！');window.location.href='sms.jsp';</script>");
			}
		}
	}

%>