<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>

<% 
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
	int name=1;
	KeyWordAction mcAction = new KeyWordAction();
	String cate_id = request.getParameter("mes_id");
	String cate_name = request.getParameter("mes_content");
	String action = request.getParameter("action");
	if(action!= null)
	{
		//System.out.println("-----" + cate_name);
		if (action.equals("add"))
		{	
			name=mcAction.getCategoryNameById(cate_name);
			if(name==0){
				if(mcAction.insert(cate_name))
				{
					out.println("<script>alert('����ɹ���');window.location.href='keyword.jsp';</script>");
				}
				else
				{
					out.println("<script>alert('����ʧ�ܣ�');window.location.href='keyword.jsp';</script>");			
				}
			}else
			{
			out.println("<script>alert('�����ظ���');window.location.href='keyword.jsp';</script>");		
			}
		}
		if (action.equals("edit"))
		{
			name=mcAction.getCategoryNameById(cate_name);
			if(name==0){
				if(mcAction.update(cate_id,cate_name))
				{
					out.println("<script>alert('�޸ĳɹ���');window.location.href='keyword.jsp';</script>");
				}
				else
				{
					out.println("<script>alert('�޸�ʧ�ܣ�');window.location.href='keyword.jsp';</script>");
				}
			}else
			{
			out.println("<script>alert('�����ظ���');window.location.href='keyword.jsp';</script>");		
			}
		}
		if (action.equals("del"))
		{
			String cateidArray[] = request.getParameterValues("mesid");
			if(mcAction.delete(cateidArray))
			{
				out.println("<script>alert('ɾ���ɹ���');window.location.href='keyword.jsp';</script>");
			}
			else
			{
				out.println("<script>alert('ɾ��ʧ�ܣ�');window.location.href='keyword.jsp';</script>");
			}
		}
	}
mcAction.close();
%>