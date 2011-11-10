<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="pageBean" scope="page" class="com.catic.tool.page.copy.PageInfo" />
<jsp:useBean id="pageCtrl" scope="page" class="com.catic.tool.page.copy.PageCtrlImpl" />
<jsp:useBean id="invite" scope="page" class="com.catic.bean.InviteBuddy" />
<%
String msnid = request.getParameter("msnid");

int pageNo =0;
List list = new ArrayList();
String sql = "select * from (select temp.*,ROWNUM as ROW_NUM from (select TF.FRIENDEMAIL,NVL2(MC.USER_TEL,1,0) USER_TEL,TF.SUCCESS,TF.CREATEDATE from T_FRIEND tf,MSN_CERTIFICATION mc where TF.FRIENDEMAIL = MC.USER_MSN(+) and TF.CONTACTEMAIL = '"+msnid+"' AND TF.CREATEDATE < TO_DATE(20110101, 'yyyymmdd') order by USER_TEL desc,SUCCESS desc,CREATEDATE desc) temp)";

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
    <td width="145" height="20" align="center"><span class="STYLE1">好友ID</span></td>
    <td width="50" align="center" class="STYLE1">状态</td>
    <td width="65" align="center" class="STYLE1">联通用户</td>
  </tr>
  <tr>
    <td colspan="3" height="1" bgcolor="#CCCCCC"></td>
  </tr>
  <%
if(num!=0){
for(int i=0;i<num;i++){
%>
  <tr>
    <td height="20" bgcolor="#F7F7F7"><span class="STYLE2">&nbsp;&nbsp;<%=((ArrayList)list.get(i)).get(0)%></span></td>
    <td align="center" bgcolor="#F7F7F7"><span class="STYLE2">
      <%
	String success = (String)((ArrayList)list.get(i)).get(2);
	if(success.equals("0")) success = "邀请中";
	if(success.equals("1")) success = "成功";
	out.println(success);
	%></span></td>
    <td align="center" bgcolor="#F7F7F7"><span class="STYLE2">
      <%
	String unicom = (String)((ArrayList)list.get(i)).get(1);
	if(unicom.equals("0")) unicom = "";
	if(unicom.equals("1")) unicom = "已绑定";
	out.println(unicom);
	%></span></td>
  </tr>
<%}}else{%>
<tr>
    <td height="20" colspan="3" align="center"><span class="STYLE2">无邀请记录</span></td>
  </tr>
<%}%>
<tr>
    <td colspan="3" height="1" bgcolor="#E4E4E4"></td>
  </tr>
  <tr>
    <td height="25" colspan="3" align="right"><%@ include file="page.jsp"%></td>
  </tr>
</table>
<input name="msnid" type="hidden" value="<%=msnid%>">
<input name="TotalNum" type="hidden" value="<%=pageBean.getRecordCount()%>">
<input name="SuccessNum" type="hidden" value="<%=invite.getSuccess(msnid)%>">
<input name="UnicomNum" type="hidden" value="<%=invite.getUnicom(msnid)%>">
</form>
<script>
var TotalNum = pageForm.TotalNum.value;
var SuccessNum = pageForm.SuccessNum.value;
var UnicomNum = pageForm.UnicomNum.value;
parent.setNum(TotalNum,SuccessNum,UnicomNum);
</script>
</body>
</html>
