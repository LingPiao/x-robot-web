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
	   	  
          <td width="30%" height="30" nowrap><ww:property value="pageInfo.page"/>/<ww:property value="pageInfo.pageCount"/>ҳ ÿҳ<ww:property value="pageInfo.pageRows"/></td>

          <td align="right" width="40%">
          <A href="#"><img src="<%=basePath1%>images/arrow_01.gif" width="15" height="15" align="middle" border="0" onclick="goPageByImg(document.forms[0],'FIRST')"></A>&nbsp;
          <A href="#"><img src="<%=basePath1%>images/arrow_02.gif" width="15" height="15" align="middle" border="0" onclick="goPageByImg(document.forms[0],'PERVIOUS')"></A>&nbsp;
          
<%
	  int pageCount = ((Integer)context.getValueStack().findValue("pageInfo.pageCount")).intValue();
	  int curPage =  ((Integer)context.getValueStack().findValue("pageInfo.page")).intValue();
	  
	  for(int i = curPage - 2; i <= pageCount && i <= curPage + 2;i++)
      {
     	if(i > 0)
        {
       	if(i == curPage)
            	out.print("<font color='#ff0000'>" + i + "</font>");
            
           else
             {
%>
              <a href="javascript:goPageByNum(document.forms[0], <%=i%>)"><%=i%></a>
<%
 			 }
         }
      }
%>        
          
          <A href="#"><img src="<%=basePath1%>images/arrow_03.gif" width="15" height="15" align="middle" border="0" onclick="goPageByImg(document.forms[0],'NEXT')"></A>&nbsp;
          <A href="#"><img src="<%=basePath1%>images/arrow_04.gif" width="15" height="15" align="middle" border="0" onclick="goPageByImg(document.forms[0],'LAST')"></A></td>
          <td width="30%" align="center">ת�� 
            <input type="text" name="page" class="textborder" style="width:20px;">
            &nbsp;<img src="<%=basePath1%>images/tabbottom_02.gif" width="22" height="22" align="middle" onclick="goPage(document.forms[0])">
		  </td>
        </tr>
      </table>