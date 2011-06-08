<%@page contentType="text/html;charset=gb2312" import="java.sql.*"%>
<%@ include file="session.jsp"%>
<%@ page import="com.catic.tool.*" %>
<%@ page import="com.catic.bean.*" %>
<html>
<head>
<title>menu</title>
<%
String sTable="";
String sField="";
String sCondition="";
DataConn dataConn = new DataConn();
QueryData queryData = new QueryData(dataConn);

sTable="t_dict";
sField="seqid,dict_name";
sCondition="dict_sort ='CHANNEL_PARENT' order by dict_order";

queryData.setRecordSet(sTable,sField, sCondition);
ResultSet rs = queryData.getResultSet();
ResultSet rschild=null;
String par_id="";
%>
<STYLE ID="JoustStyles" TYPE="text/css">
<!--
	.scrollbar {
		scrollbar-face-color: #cccccc; 
		scrollbar-highlight-color: #ffffff; 
		scrollbar-shadow-color: #ffffff; 
		scrollbar-3dlight-color: #ececec; 
		scrollbar-arrow-color: #000000; 
		scrollbar-track-color: #ffffff; 
		scrollbar-darkshadow-color: #ececec;
		font-size: 12px;
		border: 1px inset #ffffff;
		position: absolute;
	}
	
	A:link { color: #666666; text-decoration: none; }
	A:visited { color: #666666; text-decoration: none; }
	A:active { color: #ff9900; text-decoration: none; }
	A:hover { color: #ff9900; text-decoration: none; }

-->
</STYLE>
<script src=js/list_nav.js></script>
<script language="JavaScript">

//**********************************************
//菜单参数
	var node = new Array();
	node[0] = -1;
	var delaultTitle;		//默认展开的标题
	var delaultTarget;		//默认打开页面的位置,不定义则弹出新窗口
	<%
		int childcount=0;
		while (rs.next()){
			par_id=rs.getString("seqid");
			if(!userrole.equals("0"))
			{
				sTable="USER_ROLE_VIEW";
				sField="*";
				sCondition="userrole ='"+userrole+"' and dict_value='"+par_id+"' and username='"+username+"'";
			}
			else
			{
				sTable="t_dict";
				sField="*";
				sCondition="dict_sort ='CHANNEL_CHILD' and dict_value='"+par_id+"'";
			}
			queryData.setRecordCount(sTable,sCondition);
			childcount=queryData.getRecordCount();
			
			if(childcount!=0)
			{
		%>
			node[<%=par_id%>]=outlookbar.addtitle("<%=rs.getString("dict_name")%>");
		<%
			rschild=null;		
			if(userrole.equals("0"))
			{
				sTable="t_dict";
				sField="seqid,dict_name,dict_url";
				sCondition="dict_sort ='CHANNEL_CHILD' and dict_value='"+par_id+"' order by dict_order";
			}
			else
			{
				sTable="USER_ROLE_VIEW";
				sField="seqid,dict_name,dict_url";
				sCondition="userrole ='"+userrole+"' and dict_value='"+par_id+"' and username='"+username+"' order by dict_order";
			}
			queryData.setRecordSet(sTable,sField, sCondition);
			rschild = queryData.getResultSet();
			while(rschild.next())
			{
	 	%>
			node[<%=rschild.getString("seqid")%>]=outlookbar.additem("<img src=images/23.gif border='0'><br>", node[<%=par_id%>], '<%=rschild.getString("dict_url")%>', '<%=rschild.getString("dict_name")%>');	 
	 	<%		
			}
			}
		}
		rschild.close();
		rs.close();
		queryData.close();
		dataConn.close();
	%>
	delaultTitle = "机器人平台及业务系统管理"	//默认展开的标题
	delaultTarget = "mainFrame"		//默认打开页面的位置	
//**************************************************
</script>
<body bgcolor="#f6f6f6" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="scrollbar">
<TABLE align="center" class="scrollbar" id=mnuList style="WIDTH: 202px; HEIGHT: 100% ;border: 3px solid #CCCCCC; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr='#000000', endColorStr='#ececec', gradientType='0')" cellSpacing=0 cellPadding=0 border=0 > 
<TBODY>
  <TR> 
	<TD id=outLookBarShow style="HEIGHT: 100%" vAlign=top align=middle name="outLookBarShow"> 
	  <SCRIPT>
		//默认展开项目
		locatefold(delaultTitle, delaultTarget);
		outlookbar.show();
	  </SCRIPT> </TD>
  </TR>
</TBODY></TABLE>
</body>