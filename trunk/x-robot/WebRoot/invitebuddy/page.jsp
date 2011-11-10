<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<table width="95%" border="0" cellspacing="0" cellpadding="0"
	align="center">
	<tr>
		<input type="hidden" name="maxPage" value="<%=pageBean.getPageCount()%>">
		<input type="hidden" name="curPage" value="<%=pageBean.getPage()%>">
		<td height="30" nowrap>&nbsp;<span class="STYLE2"><%=pageBean.getPage()%>/<%=pageBean.getPageCount()%>ҳ</span>
		</td>
		<td align="right">
			<img src="images/newPage_01.gif" align="middle"
				border="0" onclick="goPageByImg(document.forms[0],'FIRST')"
				style="cursor:hand">
			<img src="images/newPage_02.gif" align="middle"
				border="0" onclick="goPageByImg(document.forms[0],'PERVIOUS')"
				style="cursor:hand">
			<img src="images/newPage_03.gif" align="middle"
				border="0" onclick="goPageByImg(document.forms[0],'NEXT')"
				style="cursor:hand">
			<img src="images/newPage_04.gif" align="middle"
				border="0" onclick="goPageByImg(document.forms[0],'LAST')"
				style="cursor:hand">		</td>
  <td align="right" nowrap><input type="text" name="page" id="page" class="textborder"
				style="width:20px;" value="<%=pageNo%>" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
<img src="images/go.jpg" align="middle"
				onclick="goPage(document.forms[0])" style="cursor:hand">
		</td>
	</tr>
</table>
