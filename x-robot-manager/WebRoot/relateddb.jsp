<%@ page contentType="text/html; charset=gb2312" language="java" import="java.util.*" errorPage="" %>
<jsp:useBean id="mgr" scope="page" class="com.catic.tool.mgr.Manager" />
<%
String id = request.getParameter("id");
String mes_content = mgr.getStr(request.getParameter("mes_content"));
int result = mgr.updateRelated(id,mes_content);
if(result == 0){//0成功
%>
<script>
alert("修改成功");
window.location.href='related.jsp';
</script>
<%}else{%>
<script>
alert("修改失败");
window.history.go(-1);
</script>
<%}%>
