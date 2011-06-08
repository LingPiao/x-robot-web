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
	
	MessageCategoryAction mcAction = new MessageCategoryAction();
	String cate_id = request.getParameter("cateid");
	String cate_name = request.getParameter("catename");
	String action = request.getParameter("action");
	if(action!= null)
	{
		//System.out.println(action);
		if (action.equals("add"))
		{
			if(mcAction.insert(cate_name))
			{
				out.println("<script>alert('保存成功！');window.location.href='category.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('保存失败！');window.location.href='category.jsp';</script>");			
			}
		}
		if (action.equals("edit"))
		{
			if(mcAction.update(cate_id,cate_name))
			{
				out.println("<script>alert('修改成功！');window.location.href='category.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('修改失败！');window.location.href='category.jsp';</script>");
			}
		}
		if (action.equals("del"))
		{
			String cateidArray[] = request.getParameterValues("CLASS_ID");
			if(mcAction.delete(cateidArray))
			{
				out.println("<script>alert('删除成功！');window.location.href='category.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('删除失败！');window.location.href='category.jsp';</script>");
			}
		}
	}

%>