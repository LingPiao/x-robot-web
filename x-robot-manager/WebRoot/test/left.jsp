<%@page contentType="text/html;charset=gb18030"
	import="java.sql.*,java.util.*"%>

<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    

<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
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
	
	var txt2=document.getElementById('name').value;
    createRequest();
    //parent.rightFrame.location = "right.jsp?content="+txt2;
    parent.rightFrame.sshandler(txt2);
    var url = "ajaxAction1.jsp?content="+txt2+"&"+Math.round(Math.random()*100)  ;
	//Math.round(Math.random()*100);
	
    request.open("GET",url,true);
    request.onreadystatechange = ajaxshowsearchquestion; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxshowsearchquestion()
{	
	var txt;
	var txt1;
	var txt2;
	var txt3; 
	var x;
	var huanhang="\n";
    if(request.readyState == 4)
    {

        if(request.status == 200)
        {
 //var question = request.responseXML.getElementsByTagName("question"); 

			x=request.responseXML.documentElement.getElementsByTagName("question");
			for (i=0;i<x.length;i++)
			   {
			   txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   
			   yy=x[i].getElementsByTagName("content");
			     {
			     try
			       {
			       txt=txt + "<tr><td width='85%' align='left' valign='top' class='sms002_table'>" +  yy[0].firstChild.nodeValue + "</td></tr><tr><td class='line'></td></tr>";
			       txt3=yy[0].firstChild.nodeValue;
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }
			     }
			   
		   txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='返回' onclick=\"ajaxLogin1()\" /></span></td></tr><tr><td class='line'></td></tr>";
			   txt=txt + "</table>";
			   }
			 
if(txt3==null){
txt3="没有相关答案！";
}
				txt=document.getElementById('name').value;
				txt1=document.getElementById('name1').value;
				if(txt==""){
				document.getElementById('name1').value = "机器人:"+huanhang+txt3+huanhang+txt1;
				}else{
				document.getElementById('name1').value = "机器人："+huanhang+txt3+huanhang+"匿名用户:"+huanhang+txt+huanhang+txt1;
				}
				
            
        }
    }
}
</script>

  <body>
    <form action="">
	    <table> 
	    <tr>
	    <td><textarea id="name" name="name" cols="40" rows="10" ></textarea></td>
	    </tr>
		<tr>
	    <td><input type="button" value="提交" onclick="ajaxshowsearch()" /></td>
	    </tr> 
		<tr>
	    <td><textarea id="name1" name="name1"  cols="40" rows="10"  readonly="readonly"
></textarea></td>
	    </tr>
	    </table>
	</form>
  </body>
</html>
