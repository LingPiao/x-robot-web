<%@ page isErrorPage="true" pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
<html>
<title>Uh oh,��״����...</title>
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
			errorMsg = "��������ҳ��δ�ҵ�!";
		} else {
			errorMsg = "�һ�����ʶ��(" + code + ")����!";
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
		<td>������Ϣ:</td>
		<td><%=errorMsg%></td>
	</tr>

	<%
		if (exception != null) {
	%>
	<tr>
		<td>����Դ:</td>
		<td><%=exception.toString()%></td>
	</tr>
	<%
		}
	%>
</TABLE>

</body>

</html>
