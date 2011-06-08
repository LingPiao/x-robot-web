<%@page contentType="text/html;charset=gb18030"
	import="java.sql.*,java.util.*"%>

<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
<script type="text/javascript">
var request; 
function createRequest()
{
    try
    {
        request = new XMLHttpRequest();
    }
    catch(trymicrosoft)
    {
        try
        {
            request = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch(othermicrosoft)
        {
            try
            {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(failed)
            {
                request = null;
            }
        }
    }
    if(request == null)
    {
        alert("Error,Creating request object!");
    }
}
function ajaxshowsearch()
{
	
	
    createRequest();
    
    var url = "ajaxAction.jsp"  ;

    request.open("GET",url,true);
    request.onreadystatechange = ajaxshowsearchquestion; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxshowsearchquestion()
{	
	var txt;
	var txt1;
	var x;
    if(request.readyState == 4)
    {

        if(request.status == 200)
        {

			txt="";
			alert(request);
			alert(request.responseXML);
			alert(request.responseXML.documentElement);
			x=request.responseXML.documentElement.getElementsByTagName("question");
			for (i=0;i<x.length;i++)
			   {
			   txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   
			   yy=x[i].getElementsByTagName("content");
			     {
			     try
			       {
			       txt=txt + "<tr><td width='85%' align='left' valign='top' class='sms002_table'>" +  yy[0].firstChild.nodeValue + "</td></tr><tr><td class='line'></td></tr>";
			       txt1=yy[0].firstChild.nodeValue;
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }
			     }
			   
		   txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='返回' onclick=\"ajaxLogin1()\" /></span></td></tr><tr><td class='line'></td></tr>";
			   txt=txt + "</table>";
			   }

				var text=document.getElementById('name').value;
				if(text==""){
				document.getElementById('name').value = txt1;
				}else{
				document.getElementById('name').value = text+huanhang+txt1;
				}
				
            
        }
    }
}
</script>

  <body>
    <form action="">
	    <table>
	    <tr>
	    <td><textarea id="name" name="name" cols="19" rows="10" ></textarea></td>
	    <td><textarea id="name1" name="name1"  cols="19" rows="10"  ></textarea></td>
	    </tr>
	    <tr>
	    <td><textarea id="name2" name="name2"  cols="19" rows="10"  ></textarea></td>
	    <td></td>
	    </tr>
	    </table>
	    <input type="button" value="提交" onclick="ajaxshowsearch()" />
    </form>
  </body>
</html>
