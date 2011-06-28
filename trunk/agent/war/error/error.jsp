<%@ page isErrorPage="true" pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
<html>
<title>Uh oh,出状况了...</title>
<head>
<style type="text/css">
body,td,th,select {
	font-size: 9pt;
	line-height: 15pt;
}
</style>
</head>
<body>

<%
	String code = request.getParameter("code") == null ? null : (String) request.getParameter("code");

	String errorMsg = "";
	String errorClass = "";
	if (code != null) {
		if (code.equals("404") || code.equals("401") || code.equals("403") || code.equals("404")
				|| code.equals("500")) {
			errorMsg = "请求出错或页面未找到!";
		} else {
			errorMsg = "我还不能识别(" + code + ")错误!";
		}
	} else {

		if (exception != null) {
			exception.printStackTrace();
			errorMsg = exception.getMessage();
		}
	}

	if (request.getAttribute("errorMsg") != null) {
		errorMsg = (String) request.getAttribute("errorMsg");
	}
%>
<TABLE>

	<tr>
		<td>错误信息:</td>
		<td><%=errorMsg%></td>
	</tr>

	<%
		if (exception != null) {
	%>
	<tr>
		<td>错误源:</td>
		<td><%=exception.toString()%></td>
	</tr>
	<%
		}
	%>
</TABLE>

</body>

</html>
