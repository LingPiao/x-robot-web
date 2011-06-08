<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ page import="com.opensymphony.xwork.ActionContext"%>
<%
	ActionContext context = ActionContext.getContext();
	String path1 = request.getContextPath();
	String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
%>
<%@ taglib prefix="ww" uri="webwork" %>
	  <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
	  	<tr>
	   	  <input type="hidden" name="maxPage" value="<ww:property value="pageInfo.pageCount"/>">
	   	  <input type="hidden" name="curPage" value="<ww:property value="pageInfo.page"/>">
	   	  
         
          <td align="left" width="70%">
          <input type="hidden" name="page" class="textborder" style="width:50px;">
          <a href="#" onclick="goPageByImg(document.forms[0],'FIRST')"><img src="images-jp/1.jpg" width="31" height="23" border="0" alt="Ê×Ò³"></A>&nbsp;
          <a href="#" onclick="goPageByImg(document.forms[0],'PERVIOUS')"><img src="images-jp/2.jpg" width="31" height="23" border="0" alt="ÉÏÒ³"></A>&nbsp;     
          <A href="#" onclick="goPageByImg(document.forms[0],'NEXT')"><img src="images-jp/3.jpg" width="31" height="23" border="0" alt="ÏÂÒ³"></A>&nbsp;
          <A href="#" onclick="goPageByImg(document.forms[0],'LAST')"><img src="images-jp/4.jpg" width="31" height="23" border="0" alt="Î²Ò³"></A></td>
        </tr>
      </table>