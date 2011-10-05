<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="woshop/style.css" rel="stylesheet" type="text/css">
<title>手机沃商城</title>
</head>
<script type="text/javascript">
	//ajax---------------------------------------begin
	var xmlHttp; 
	var msg;
	function createXMLHttpRequest(){ 
	if(window.ActiveXObject){ 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP"); 
	} 
	else 
		if(window.XMLHttpRequest){ 
			xmlHttp = new XMLHttpRequest();
		} 
	}
	function startRequest(){
		createXMLHttpRequest();
		if(<%=request.getParameter("id")%> == 1)
		{	
			msg="7031";
		}
		if(<%=request.getParameter("id")%> == 2)
		{	
			msg="7032";	
		}
		if(<%=request.getParameter("id")%> == 3)
		{	
			msg="7033";
		}
		if(<%=request.getParameter("id")%> == 4)
		{	
			msg="7034";
		}
		
		if(<%=request.getParameter("id")%> == 5)
		{	
			msg="7011";
		}
		if(<%=request.getParameter("id")%> == 6)
		{	
			msg="7012";	
		}
		if(<%=request.getParameter("id")%> == 7)
		{	
			msg="7013";
		}
		if(<%=request.getParameter("id")%> == 8)
		{	
			msg="6021";
		}
		
		if(<%=request.getParameter("id")%> == 9)
		{	
			msg="6022";
		}
		if(<%=request.getParameter("id")%> == 10)
		{	
			msg="6031";	
		}
		if(<%=request.getParameter("id")%> == 11)
		{	
			msg="6032";
		}
		if(<%=request.getParameter("id")%> == 12)
		{	
			msg="6041";
		}
		if(<%=request.getParameter("id")%> == 13)
		{	
			msg="6042";
		}
		if(<%=request.getParameter("id")%> == 14)
		{	
			msg="201";
		}
		if(<%=request.getParameter("id")%> == 15)
		{	
			msg="102";
		}
		alert(msg);
		var stra = "calleds=10010&content="+msg+"&userid=<%=request.getParameter("userid")%>&caller=<%=request.getParameter("usermobile")%>";
		xmlHttp.open("POST", "domain_action.jsp?"+stra, true); 
		xmlHttp.onreadystatechange = myCallback; 
		xmlHttp.send(null);
	}
	function myCallback(){ 
		if(xmlHttp.readyState==4){ 
			if(xmlHttp.status==200){ 
				listInfo(); 
			} 
		} 
	}
	function listInfo(){ 
		var backstr=xmlHttp.responseText;
		//alert(backstr.indexOf("success"));
		if(backstr.indexOf("success")>0)
		{
			alert("成功！")
			return false;
		}
		else
		{
			alert("失败！")
			return false;
		}
		
	}
	//ajax-----------------------------------------end	
</script>
<body>
<table width="320" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td><table width="316" border="0" cellspacing="0" cellpadding="0" class="content">
      <tr>
        <td class="top_header" align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="91%" align="right"><label>
              <input type="submit" name="button" id="button" value="返回" onclick="window.location.href='woshop.action?userid=<%=request.getParameter("userid")%>'";/>
              </label></td>
            <td width="9%">&nbsp;</td>
          </tr>
        </table></td>
        </tr>
      <tr>
        <td height="36">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><table width="92%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="54%" rowspan="2" align="center"><img src="woshop/1_1.png" width="89" height="89" /></td>
            <td width="46%" class="word">订购流量包</td>
          </tr>
          <tr>
            <td> 资费标准：5元<br />
             	 流量标准：100KB<br />
              	流量标准：100KB</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="20">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><table width="80%" border="0" cellspacing="0" cellpadding="0" class="intr">
          <tr>
            <td align="center"><table width="90%" border="0" cellspacing="1" cellpadding="1">
              <tr>
                <td class="word2">5元浏量包简介</td>
              </tr>
              <tr>
                <td>此处为内容简介示意（可以直接在手机上订购5元、10元、20元、
                  30元流量包现需要提供流量包每个不同资费的图标</td>
              </tr>
            </table>              </td>
            </tr>
          
        </table></td>
      </tr>
      <tr>
        <td align="center">&nbsp;</td>
      </tr>
      <tr>
        <td align="center"><table width="80%" border="0" cellspacing="0" cellpadding="0" class="but">
          <tr>
            <td align="center"><a href="#" onclick="startRequest();">订购此业务</a></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="center" height="40">&nbsp;</td>
      </tr>
      
    </table></td>
  </tr>
</table>

<table width="320" border="0" cellspacing="0" cellpadding="0" class="footer">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
