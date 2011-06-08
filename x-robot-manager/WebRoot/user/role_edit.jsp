<%@page contentType="text/html;charset=gb2312"  import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.sino.doc.*" %>
<%@ page import="com.catic.tool.*" %>

<html><head><title>管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/default.css" rel="stylesheet" type="text/css">
<!--引入通用的CSS-->
<link href="../css/orchis.css" rel=stylesheet type="text/css">
<!--引入通用的JavaScript程序-->
<script language="javascript">

function checkInput(form){
	if (form.rolename.value=="")
	{
		alert("角色名称不能为空！");
		form.rolename.focus();
		return false;
	}
	return true;
}

function ondelete(form){
  if(confirm("确定要删除此角色吗？")){
    form.doMode.value="delete";
  }else{
    return false;
  }
  return true;
}
</script>


<%!
  String replaceNull(String rString) {
    if ((rString == null)) {
      rString = "";
    }
    return rString;
  }
%>

<%
request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
	String rolename="";
	String doMode = request.getParameter("doMode");
	String vrole_id="";		
	String sTable="";
	String sField="";
	String sCondition="";
	
	DataConn dataConn = new DataConn();
	QueryData queryData = new QueryData(dataConn);
	InsertData insertdata = new InsertData(dataConn);
	DeleteData deletedata = new DeleteData(dataConn);
    String[] a_back_private;
    String channelstr = "";
    
    if (doMode.equals("delete")) {
    	vrole_id= request.getParameter("role_id");
      
    	sTable="t_private";		
    	sCondition="role_id='"+vrole_id+"'";
    	deletedata.delete(sTable,sCondition);

%>   
		<script>parent.leftFrame1.location='role_list.jsp';</script>
        <script>parent.mainFrame1.location='role_edit.jsp?doMode=creat';</script>
      <%
      }

  
    if (doMode.equals("update")) {
    		vrole_id= request.getParameter("role_id");
    		rolename = (request.getParameter("rolename"));
	    	a_back_private=request.getParameterValues("back_private");
			 sTable="t_private";
			 sField="role_id,role_name,PRI_CHANNELID";
  	  		 String condiction = "";
  	  		 sCondition="role_id='"+vrole_id+"'";
  	  		 
  	  		deletedata.delete(sTable,sCondition);
  	  	//int roleid=queryData.KeyNextValue(sTable,"role_id");
  			if(a_back_private!=null){

   			 for(int i=0;i<a_back_private.length;i++){
   				condiction = "'"+vrole_id+"','"+rolename+"','"+a_back_private[i]+"'";
   				insertdata.insert(sTable,sField,condiction);   			
    		}
  			}	 
  		
  %>
        <script>parent.leftFrame1.location='role_list.jsp';</script>
        <script>parent.mainFrame1.location='role_edit.jsp?doMode=creat';</script>
  <%}
    if (doMode.equals("add")) {
    	a_back_private=request.getParameterValues("back_private");
    	rolename = (request.getParameter("rolename"));
    	sTable="t_private";
    	int roleid=queryData.KeyNextValue(sTable,"role_id");
	  	sField="role_id,role_name,PRI_CHANNELID";
	  	if(a_back_private!=null){

  		for(int i=0;i<a_back_private.length;i++){
  			sCondition = "'"+roleid+"','"+rolename+"','"+a_back_private[i]+"'";
  			insertdata.insert(sTable,sField,sCondition);   			
   		}
 		}
  %>
          <script>parent.leftFrame1.location='role_list.jsp';</script>
          <script>parent.mainFrame1.location='role_edit.jsp?doMode=creat';</script>
  <%}
  if (doMode.equals("edit")) {
     doMode = "update";
     vrole_id= request.getParameter("role_id");
	 sTable="t_private";
	 sField="PRI_CHANNELID,role_name";
	 sCondition="role_id='"+vrole_id+"'";
	 queryData.setRecordSet(sTable,sField, sCondition);
	 ResultSet rs = queryData.getResultSet();
     while (rs.next()){
    	 rolename=rs.getString("role_name");
    	channelstr = channelstr+replaceNull(rs.getString("pri_channelid"))+',';

    }
    rs.close();
  }
  if (doMode.equals("creat")) {
	    
	    doMode = "add";
  }
%><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<body leftmargin="0" topmargin="0">

<table class="table-line" width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#FFFFFF">
<form name="mainform" method="post" action="role_edit.jsp">
        <input type="hidden" name="doMode" value="<%=doMode%>" >
        <input type="hidden" name="role_id" value="<%=vrole_id%>" >
        
	<tr>
      <td height="25" colspan="2" align="center" class="table-bg-3">角色信息</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
    
      <td colspan=2>&nbsp;
     	角色名称：<input type=text name=rolename class=input size=40 value=<%=rolename %>>
      </td>
    </tr>
	
  
    
     <%
	 sTable="t_dict";
	 sField="SEQID,DICT_NAME";
	 sCondition="DICT_SORT='CHANNEL_PARENT' order by DICT_ORDER desc";
	 queryData.setRecordSet(sTable,sField, sCondition);
	 ResultSet rsquery = queryData.getResultSet();
	 ResultSet childquery=null;
	 String parentid="",channelname="";
    		while(rsquery.next()){
    			parentid = rsquery.getString("seqid");
    			channelname=rsquery.getString("DICT_NAME");
	%>
	<tr bgcolor="#FFFFFF">
    	<td colspan=2>&nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/icon5.gif" border=0/>&nbsp;&nbsp;<%=channelname %><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	<%
   	 		sField="SEQID,DICT_NAME";
   	 		sCondition="DICT_VALUE ='"+parentid+"' order by DICT_ORDER desc";
   	 		queryData.setRecordSet(sTable,sField, sCondition);
   	 		childquery = queryData.getResultSet();
   	 		String childid="",childname="";
       		while(childquery.next()){
       			childid=childquery.getString("SEQID");
       			childname=childquery.getString("DICT_NAME");
   				out.print("<input type='checkbox' name='back_private' value='"+childid+"' "); 
   				if(channelstr.indexOf(childid)>-1){
   					out.print("checked");
   				}
   				out.print(">");
   				out.print(childname);
   				out.print("&nbsp;&nbsp;&nbsp;&nbsp;");
       		}      		
    	%>
    	</td>
    </tr>
	<%
    		}
    		childquery.close();
    		rsquery.close();
     %>   
   	  
  
    <tr class="titlebg">
      <td colspan="2" bgcolor="#F0F2F7" class="table-bg-2">&nbsp;
&nbsp; 
	<input name="submit" type="submit" class="button_small" value="保存" onclick=" return checkInput(this.form);">
	&nbsp; 
	<input name="submit" type="submit" class="button_small" value="删除" onclick="return ondelete(this.form);">
	</td>
    </tr></form>
</table><%    dataConn.close();%>
</body></html>