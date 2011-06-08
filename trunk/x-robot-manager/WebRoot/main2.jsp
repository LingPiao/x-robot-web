<%@page contentType="text/html;charset=gb2312"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="session.jsp"%>


<head>
<title></title>
<meta http-equiv=Content-Type content=text/html; charset=gb2312> 


<script language="javascript">
function switchSysBar(){
if (parent.document.getElementById('zongFrame').cols=="202,11,*"){
document.getElementById('leftbar').style.display="";
document.getElementById('rightbar').style.display="none";
parent.document.getElementById('zongFrame').cols="0,11,*";
}
else{
parent.document.getElementById('zongFrame').cols="202,11,*";
document.getElementById('leftbar').style.display="none"
document.getElementById('rightbar').style.display="";
}
}
function load(){
if (parent.document.getElementById('zongFrame').cols=="0,11,*"){
document.getElementById('leftbar').style.display="";
document.getElementById('rightbar').style.display="none";
}
}
</script>
</head>
<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0 bgcolor=#000000 >
<center>
<table width=100% height=100% border=0 cellpadding=0 cellspacing=0>
<tr>
<td bgcolor="#666666" width="1"></td>
<td id="leftbar" bgcolor="#666666" style="display:none"><a href="#" onclick="switchSysBar()"><img src="images/mnu2.gif" width="9" height="53" alt='打开左侧窗体' border="0"></a></td>
<td id="rightbar" bgcolor="#666666" ><a href="#" onclick="switchSysBar()"><img src="images/mnu1.gif" width="9" height="53" alt='关闭左侧窗体' border="0"></a></td>
</tr>
</table>
</center>
</body> 

</html> 

