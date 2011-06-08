<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%@ page import = "com.catic.tool.*"%>

<html>


  <body>
    <%
    		String action=request.getParameter("action");
    		
    		String url="complaints.jsp";
			String table="";
			String updatestr="";
			String conditionstr="";
			//System.out.println(action);
			DataConn conn=new DataConn();
			UpdateData updata=new UpdateData(conn);
			//DeleteData delete=new DeleteData(conn);
    		String[] ids=request.getParameterValues("mmsid");
    		String id=request.getParameter("id");
    		table="SMS_TOUSU";
    		
    		if("deleteall".equals(action)&&ids!=null){
	    		updatestr="STATE='1'";
	    		for(int i=0;i<ids.length;i++){
	    		conditionstr="TOUSU_ID="+ids[i]+" AND STATE!='2'";    		
	    		//System.out.println(conditionstr);
	    			int s=updata.update(table,updatestr,conditionstr);
		    		//delete.delete(table,conditionstr);
	    		}
    		}

			
    		if("audit".equals(action)){
	    		updatestr="STATE='2'";
	    		
	    		conditionstr="TOUSU_ID="+id+" AND STATE!='1'";    		
	    		//System.out.println(conditionstr);
	    			int s=updata.update(table,updatestr,conditionstr);
		    		//delete.delete(table,conditionstr);
	    			//System.out.println(s);
    		}
    		
    		
    		if("delete".equals(action)){
	    		updatestr="STATE='1'";

	    		conditionstr="TOUSU_ID="+id+" AND STATE!='2'";    		
	    		//System.out.println(conditionstr);
	    			int s=updata.update(table,updatestr,conditionstr);
		    		//delete.delete(table,conditionstr);

    		}
    		conn.close();
    		response.sendRedirect(url);
     %>
  </body>
</html>
