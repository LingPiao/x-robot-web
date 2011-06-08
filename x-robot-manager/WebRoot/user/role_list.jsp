<%@page contentType="text/html;charset=gb2312"  import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.catic.tool.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>管理页面</title>
<style type="text/css">
<!--
body {
	font-family: Tahoma,Verdana,宋体;
	font-size: 12px;
	scrollbar-face-color: #EDEDED;
	scrollbar-highlight-color: #FAFAFA;
	scrollbar-shadow-color: #BDBDBD;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-arrow-color: #939393;
	scrollbar-track-color: #F4F4F4;
	scrollbar-darkshadow-color: #FFFFFF
}
-->
</style>
<LINK href="../css/default.css" rel="stylesheet" type="text/css">
</head>
<!--引入通用的JavaScript程序-->
<script src="../tree/singletree.js"></script>

<%!
  Vector getStringArray(String mString,String sparaString) {
    Vector sStringList;
    sStringList = new Vector();
    if ((mString == null) || mString.equals("NULL") || mString.equals(";"))
       return null;
    int tCount =0;
    String tString = "";
    int tHave = mString.indexOf(sparaString);
    while(tHave >0) {
      if (!mString.equals("")) {
        if (tCount == 0)
          tString = "tree"+ mString.substring(0, tHave);
        else 
          tString = sStringList.get(tCount-1) + "_" + mString.substring(0, tHave);
        sStringList.add(tString);
        tCount++;
      }
      mString = mString.substring(tHave+1);
      tHave = mString.indexOf(sparaString);
    }
    if (!mString.equals("")) {
      if (tCount > 0)
        tString = sStringList.get(tCount-1) + "_"+ mString;
      else
        tString = "tree"+mString;
      sStringList.add(tString);
    }
    return sStringList;
}

%>
<%
  
  String class_id = request.getParameter("class_id");
  Vector tAttList = getStringArray(class_id,"_");
  
  int levelCount;
  String[] tmpar = new String[5];
  if (class_id == null) {
    //while (
    tmpar[0]="tree01";
    tmpar[1]="tree01_02";
  }
%>
<script>
function switchCategory(app,seq){
    parent.topFrame1.location='role_toolbar.jsp?role_id='+app;
    parent.mainFrame1.location='role_edit.jsp?role_id='+seq+"&doMode=edit";
}
function getSonTreeItem(code){
  sonTreeItem.location='sontreeitem.jsp?code='+code;
}
</script>
<body leftmargin="0" topmargin="0">
<iframe name="sonTreeItem" width="400" height="200" style="display:none"></iframe>
<div id="warning" style="position:absolute; top:10; left:10; z-index:10; visibility:hidden"><TABLE WIDTH=350 BORDER=0 CELLSPACING=0 CELLPADDING=0><TR><td width=20></td><TD bgcolor=#ff9900><TABLE WIDTH=100% height=50 BORDER=0 CELLSPACING=2 CELLPADDING=0><TR><td bgcolor=#eeeeee align=left>
&nbsp;&nbsp;正在获取数据，请稍候片刻... ...
</td></tr></table></td><td width=20></td></tr></table></div>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FFC73C">
  
  <tr>
    <td bgcolor="#FFFFFF" ><table width="100%" border="0" align="center" cellpadding="5" cellspacing="0">
      <tr>
        <td height="30" bgcolor="#FFFFFF"  class="leftmenu"><a href="#" class="link-white">&nbsp;&nbsp;&nbsp;&nbsp; 角色列表</a></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFFF"> 

<script>

setTreeImg("dark");
if (document.getElementById) {
  var tree0=new WebFXTree('角色列表','javascript:switchCategory(\'0\',\'\');','classic');
  <%
  	String sTable="";
	String sField="";
	String sCondition="";
	DataConn dataConn = new DataConn();
	QueryData queryData = new QueryData(dataConn);
	sTable="t_private";
	sField="DISTINCT role_id, role_name";
	sCondition="1=1";
	queryData.setRecordSet(sTable,sField, sCondition);
	ResultSet rolers = queryData.getResultSet();
	while(rolers.next()){
  %>
  var tree<%=rolers.getInt("role_id")%>=new WebFXTreeItem("<%=rolers.getString("role_name")%>","javascript:switchCategory('<%=rolers.getInt("role_id")%>','<%=rolers.getInt("role_id")%>');","<%=rolers.getInt("role_id")%>");
  tree0.add(tree<%=rolers.getInt("role_id")%>);
	<%}
	rolers.close();
	dataConn.close();
	%>
}
document.write(tree0);
tree0.expand();

<%
  if (tAttList != null) {
    for (int j = 0; j < tAttList.size()-1; j++) {
      out.println("if (typeof "+tAttList.get(j)+" !='undefined')");
      out.println("\t"+tAttList.get(j)+".expand();");
    }
    String tmp1=(String)tAttList.get(tAttList.size()-1);
%>
if(<%=tmp1%>.ishavesubitem()=="yes"){
  <%=tmp1%>.expand();
}
<% }%>

</script>
</td>
      </tr>
    </table></td>
  </tr>
</table>
<br>
<br>
</body>
</html>
