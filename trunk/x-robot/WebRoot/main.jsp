<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="webwork" prefix="ww"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户登录信息</title>
  </head>
  
  <body align="center">
        <h4>用户登录信息</h4>
        <hr>
    <TABLE width="50%" border="1" align="center" bgColor="#CCCCCC">
          <TR align="center" height="25"> 
            <TD width="10%">用户ID</TD>
			<TD width="10%">登录IP</TD>
            <TD width="20%">最后登录时间</TD>
            
          </TR>        
          <ww:iterator value="userinfoList" status="info">
          <TR align="center" height="25"> 
            <TD><ww:property value="userid"/></TD>
			<TD><ww:property value="lastip"/></TD>
            <TD><ww:property value="lastvisit"/></TD>
          </TR>
          </ww:iterator>  
        </TABLE>
  </body>
</html>
