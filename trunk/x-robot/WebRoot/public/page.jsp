<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ page import="com.opensymphony.xwork.ActionContext"%>
<%
	ActionContext context = ActionContext.getContext();
	String path1 = request.getContextPath();
	String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
%>
<%@ taglib prefix="ww" uri="webwork" %>
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	  	<tr>
	   	  <input type="hidden" name="maxPage" value="<ww:property value="pageInfo.pageCount"/>">
	   	  <input type="hidden" name="curPage" value="<ww:property value="pageInfo.page"/>">
	   	  
          <td width=140 height="30" align=right class="font12 STYLE4" valign=middle>
          	当前第<ww:property value="pageInfo.page"/>页&nbsp;共<ww:property value="pageInfo.pageCount"/>页
          </td>
          <td height="30" align=center class="font12 STYLE4" valign=middle>
          <A href="#" onclick="goPageByImg(document.forms[0],'FIRST')">首  页</A>
          <A href="#" onclick="goPageByImg(document.forms[0],'PERVIOUS')">上一页</A>
          <A href="#" onclick="goPageByImg(document.forms[0],'NEXT')">下一页</A>
          <A href="#" onclick="goPageByImg(document.forms[0],'LAST')">最后一页</A></td>
         </td>
         <td width="150" align="center" style="display:none">转到 
            <input type="text" name="page" class="textborder" style="width:50px;">
            &nbsp;<img src="<%=basePath1%>images/tabbottom_02.gif" width="22" height="22" align="middle" onclick="goPage(document.forms[0])">
		  </td>
        </tr>
      </table>  
          