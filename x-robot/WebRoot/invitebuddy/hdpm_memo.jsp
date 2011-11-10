<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="pageBean" scope="page" class="com.catic.tool.page.copy.PageInfo" />
<jsp:useBean id="pageCtrl" scope="page" class="com.catic.tool.page.copy.PageCtrlImpl" />
<jsp:useBean id="invite" scope="page" class="com.catic.bean.InviteBuddy" />
<%
String msnid = request.getParameter("msnid");

int pageNo =0;
List list = new ArrayList();
String sql = "select * from (select ROWNUM as ROW_NUM,temp.* from (select TF.CONTACTEMAIL,sum(TF.SUCCESS) success_num,sum(NVL2(MC.USER_TEL,1,0)) unicom_num,sum(TF.SUCCESS) valid_num,max(TF.CREATEDATE) firstdate from T_FRIEND tf,MSN_CERTIFICATION mc where TF.FRIENDEMAIL = MC.USER_MSN(+) and TF.SUCCESS = 1 AND TF.CREATEDATE < TO_DATE(20110101, 'yyyymmdd') group by TF.CONTACTEMAIL order by sum(TF.SUCCESS) desc,max(TF.CREATEDATE) asc) temp)";

System.out.println(sql);
pageNo= request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
pageBean.setPage(pageNo);//分页bean

pageCtrl.setJdbcSql(sql);
pageCtrl.setSqlwhere(sql);
pageCtrl.setPageInfo(pageBean);
list = pageCtrl.getJdbcRecords();
int num = list.size();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>memo</title>
<script src="js/page.js" language="JavaScript"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	SCROLLBAR-FACE-COLOR: #ffffff;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #cccccc;
	SCROLLBAR-3DLIGHT-COLOR: #cccccc;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
	SCROLLBAR-BASE-COLOR: #ffffff;
}
body,td,th {
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
}
.STYLE1 {
	color: #990000;
	line-height: 25px;
}
.STYLE2 {
	font-size: 10px;
	font-family: Arial, Helvetica, sans-serif;
	color: #666666;
	}
-->
</style>
</head>

<body scroll=no>
<form name="pageForm" method="post">
<table width="260" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="25" height="20" align="center"><span class="STYLE1">排名</span></td>
    <td width="130" align="center" class="STYLE1">MSN帐号</td>
    <td width="35" align="center" class="STYLE1">成功</td>
    <td width="35" align="center" class="STYLE1">联通</td>
    <td width="35" align="center" class="STYLE1">分数</td>
  </tr>
  <tr>
    <td colspan="5" height="1" bgcolor="#CCCCCC"></td>
  </tr>
  <%
if(num!=0){
for(int i=0;i<num;i++){
%>
  <tr>
    <td height="20" align="center" bgcolor="#F7F7F7"><span class="STYLE2"><%=((ArrayList)list.get(i)).get(0)%></span></td>
    <td align="left" bgcolor="#F7F7F7">&nbsp;<span class="STYLE2"><%
	String msn = (String)((ArrayList)list.get(i)).get(1);
	if(msn.length() > 22) out.println(msn.substring(0, 20)+"...");
	else out.println(msn);
	%></span></td>
    <td align="center" bgcolor="#F7F7F7"><span class="STYLE2"><%=((ArrayList)list.get(i)).get(2)%></span></td>
    <td align="center" bgcolor="#F7F7F7"><span class="STYLE2"><%=((ArrayList)list.get(i)).get(3)%></span></td>
    <td align="center" bgcolor="#F7F7F7"><span class="STYLE2"><%=((ArrayList)list.get(i)).get(4)%></span></td>
  </tr>
<%}}else{%>
<tr>
    <td height="20" colspan="5" align="center"><span class="STYLE2">暂无记录</span></td>
  </tr>
<%}%>
<tr>
    <td colspan="5" height="1" bgcolor="#E4E4E4"></td>
  </tr>
  <tr>
    <td height="25" colspan="5" align="right"><%@ include file="page.jsp"%></td>
  </tr>
</table>
<input name="msnid" type="hidden" value="<%=msnid%>">
</form>
</body>
</html>
