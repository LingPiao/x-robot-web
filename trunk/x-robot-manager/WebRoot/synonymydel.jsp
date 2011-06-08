<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<%@ include file="session.jsp"%>
    <%
    		String url="synonymy.jsp";
			String table="";
			String conditionstr="";

			DataConn conn=new DataConn();
			DeleteData delete=new DeleteData(conn);
    		String[] ids=request.getParameterValues("mesid");
    		table="T_SYNONYMY";
    		
    		for(int i=0;i<ids.length;i++){
    		conditionstr="SYNONYMYID="+ids[i]+"";    		
    		//System.out.println(conditionstr);
	    		delete.delete(table,conditionstr);
    		}
    		
    		conn.close();
    		response.sendRedirect(url);
     %>