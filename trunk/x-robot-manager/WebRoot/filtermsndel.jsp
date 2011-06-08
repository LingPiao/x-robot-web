<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
 
    <%
    		String url="filtermsn.jsp";
			String table="";
			String conditionstr="";

			DataConn conn=new DataConn();
			DeleteData delete=new DeleteData(conn);
    		String[] ids=request.getParameterValues("mesid");
    		table="T_FORBIDDENEMAIL";
    		
    		for(int i=0;i<ids.length;i++){
    		conditionstr="FORBIDDENEMAIL='"+ids[i]+"'";    		
    		System.out.println(conditionstr);
	    		delete.delete(table,conditionstr);
    		}
    		
    		conn.close();
    		response.sendRedirect(url);
     %>