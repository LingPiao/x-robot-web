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
          	��ǰ��<ww:property value="pageInfo.page"/>ҳ&nbsp;��<ww:property value="pageInfo.pageCount"/>ҳ
          </td>
          <td height="30" align=center class="font12 STYLE4" valign=middle>
          <A href="#" onclick="goPageByImg(document.forms[0],'FIRST')">��  ҳ</A>
          <A href="#" onclick="goPageByImg(document.forms[0],'PERVIOUS')">��һҳ</A>
          <A href="#" onclick="goPageByImg(document.forms[0],'NEXT')">��һҳ</A>
          <A href="#" onclick="goPageByImg(document.forms[0],'LAST')">���һҳ</A></td>
         </td>
         <td width="150" align="center" style="display:none">ת�� 
            <input type="text" name="page" class="textborder" style="width:50px;">
            &nbsp;<img src="<%=basePath1%>images/tabbottom_02.gif" width="22" height="22" align="middle" onclick="goPage(document.forms[0])">
		  </td>
        </tr>
      </table>  
          