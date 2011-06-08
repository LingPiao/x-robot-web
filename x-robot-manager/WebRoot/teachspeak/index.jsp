<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import = "com.catic.tool.*,java.sql.*"%>
<%@ page import="com.catic.bean.*"%>
<%
	String msnid = request.getParameter("msnid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link rel="stylesheet" type="text/css" href="../css/bbcss.css">
<link rel="stylesheet" type="text/css" href="../css/css.css">
<link rel="stylesheet" type="text/css" href="../css/business.css">
</head>
<script type="text/javascript">
	function formCheck()
		{
			if(teachform.question.value=="")
			{
				//alert("请填写信息内容！");
				teachform.question.focus();
				return false;
			}
			if(teachform.answer.value=="")
			{
				//alert("请填写信息内容！");
				teachform.answer.focus();
				return false;
			}
			return true;
		}
</script>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
     <td><%@include file="../ad.html"%></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td  colspan="2" align="left">
		  	<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td class="login_t"><table width="480" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td id="lt">&nbsp;</td>
						<td id="font14">联通贝贝教说话</td>
						<td align="right" valign="bottom" id="font14"><table class="index_btxt" width="90%" border="0" align="right" cellpadding="0" cellspacing="0">
							<tr>
							  <td align="left" valign="middle" class="index_btxt"></td>
							</tr>
						  </table></td>
					  </tr>
					</table></td>
				</tr>
				</table>
		  </td>
        </tr>
        
      <%
String action=request.getParameter("action");
	String url="";
	String table="";
	String fieldarraystr="";
	String condition="";
	DataConn conn=new DataConn();
	QueryData query=new QueryData(conn);
	String id="";
	String question="";

	String answer="";

	String state="";
if("update".equals(action)){
	String speak_id=request.getParameter("speak_id");
	table="SMS_SPEAK";
	fieldarraystr="*";
	condition="speak_id="+speak_id;
	query.setRecordSet(table,fieldarraystr,condition);
	ResultSet rs3 = query.getResultSet();
	while(rs3.next()){
		id=rs3.getString("speak_id");
		question=rs3.getString("question");
		answer=rs3.getString("answer");
		state= rs3.getString("state");
		if("2".equals(state)){
			response.sendRedirect("index.jsp");
		}
	}
}else{
	action="insert";
}
 %>
<form action="operation/operation.jsp" method="post" name=teachform onSubmit=return(formCheck())>
<input type="hidden" name="action" value="<%=action %>"/>
<input type="hidden" name="id" value="<%=id %>"/>
<input type="hidden" name="msn" value="<%=msnid %>"/>
<input type="hidden" name="state" value="<%=state %>"/>
      
        <tr>
          <td style="width:120px;" align="left" valign="top" class="tab_b"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="sdsd_bj">
              <tr>
                <td valign="middle"><img src="../images/icons02.gif" width="12" height="12"> <a href="#">教说话</a></td>
              </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="sdsd_bj">
              <tr>
                <td valign="middle">&nbsp;</td>
              </tr>
            </table></td>
          <td align="left" valign="top" class="tab_b"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" valign="top" class="welcome_bj">你好！<span class="font_red"></span> 老师 ，<br>
                  只要把老师说的话，和希望贝贝回答的话分别输入到下面两个框中，再点击“教给贝贝”按钮就行了！</td>
              </tr>
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellpadding="4" cellspacing="0" class="write_bj">
                    <tr>
                      <td align="right" valign="top" style="width:80px;">你&nbsp; 说：</td>
                      <td><textarea  name="question"  cols="40" rows="5" class="input-text"><%=question %></textarea></td>
                    </tr>
                    <tr>
                      <td align="right" valign="top" style="width:80px;">贝贝说：</td>
                      <td><label>
                        <textarea name="answer" cols="40" rows="5" class="input-text"><%=answer %></textarea>
                        </label></td>
                    </tr>
                    <tr>
                      <td align="right" valign="middle">&nbsp;</td>
                      <td><span class="btn-l">
                        <input name="submit" type="submit" value="教给贝贝" />
                        </span></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<% 
	conn.close();
%>
</body>
</html>
