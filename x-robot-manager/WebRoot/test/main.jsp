<%@page contentType="text/html;charset=gb18030"
	import="java.sql.*,java.util.*"%>

<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
 <% String content =request.getParameter("content"); %>
<script type="text/javascript">
//alert();
function sshandler(classid,date)
{
//alert(classid,date);
	ajaxLogin(classid,date);
}



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
function ajaxsearch(id,name)
{
	
	var txt=name+"->常见问题";
    document.getElementById('name1').innerHTML = txt;
 
   //alert("1111111111111");
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?action=search&classid=" + id +"&"+Math.round(Math.random()*100) ;

    request.open("GET",url,true);
    request.onreadystatechange = updatePageUsersearch; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function updatePageUsersearch()
{	
	var txt;

	var num;

    if(request.readyState == 4)
    {
		//alert("2222222");
		//alert("3333333"+request.status);
        if(request.status == 200)
        {
          // alert("3333333");
            //var question = request.responseXML.getElementsByTagName("question"); 
            
         	//alert(question.length);
			txt="";
			x=request.responseXML.documentElement.getElementsByTagName("question");

			num=x.length;
			if(num>10){

			num=10;

			}
			for (i=0;i<num;i++)
			   {
			   txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   xx=x[i].getElementsByTagName("questionid");
			   yy=x[i].getElementsByTagName("content");
			     {
			     try
			       {
			       txt=txt + "<tr><td width='85%' style='text-align: left' valign='top' >·<a href='#' onclick=\"ajaxshowsearch('" + xx[0].firstChild.nodeValue + "')\" >" +  yy[0].firstChild.nodeValue + "</a></td></tr><tr><td class='line'></td></tr>";
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }
			     }
			   
	
			   txt=txt + "</table>";
			   }
		   //txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='显示全部' onclick=\"ajaxLogins()\" /></span></td></tr><tr><td class='line'></td></tr>";
				document.getElementById('name').innerHTML = txt;

            
        }
    }
}
function ajaxshowsearch(id)
{
	
	
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?action=show&questionid=" + id+"&"+Math.round(Math.random()*100)  ;

    request.open("GET",url,true);
    request.onreadystatechange = ajaxshowsearchquestion; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}

function ajaxshowsearchquestion()
{	
	var txt;
    if(request.readyState == 4)
    {

        if(request.status == 200)
        {
           
            //var question = request.responseXML.getElementsByTagName("question"); 
            
         	//alert(question.length);
			txt="";
			x=request.responseXML.documentElement.getElementsByTagName("question");
			for (i=0;i<x.length;i++)
			   {
			   txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   
			   yy=x[i].getElementsByTagName("content");
			     {
			     try
			       {
			       txt=txt + "<tr><td width='85%' align='left' valign='top' class='sms002_table'>" +  yy[0].firstChild.nodeValue + "</td></tr><tr><td class='line'></td></tr>";
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }
			     }
			   
		 //  txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='返回' onclick=\"ajaxLogin1()\" /></span></td></tr><tr><td class='line'></td></tr>";
			   txt=txt + "</table>";
			   }


				document.getElementById('name').innerHTML = txt;

            
        }
    }
}
function ajaxLogin(classid,content)
{
    //alert(content);
 		var txt="";
    document.getElementById('name1').innerHTML = txt;
    document.getElementById("content1").value=content;
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?classid="+classid+"&content=" + content +"&"+Math.round(Math.random()*100) ;

    request.open("GET",url,true);
    request.onreadystatechange = updatePageUserLogin; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxLogin1()
{
		var txt="";
    document.getElementById('name1').innerHTML = txt;
    var content=document.getElementById("content1").value;
 
    
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?content=" + content +"&"+Math.round(Math.random()*100) ;

    request.open("GET",url,true);
    request.onreadystatechange = updatePageUserLogin; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxLogins()
{
    var content=document.getElementById("content1").value;
 
   // window.open("mains.jsp?content="+content,"_top");
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?content=" + content +"&"+Math.round(Math.random()*100) ;

    request.open("GET",url,true);
    request.onreadystatechange = updatePageUserLogins; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxshow(id)
{

    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?action=show&questionid=" + id +"&"+Math.round(Math.random()*100) ;

    request.open("GET",url,true);
    request.onreadystatechange = ajaxshowquestion; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function updatePageUserLogins()
{	
	var txt;

var num;

    if(request.readyState == 4)
    {

        if(request.status == 200)
        {
           
            //var question = request.responseXML.getElementsByTagName("question"); 
            
         	//alert(question.length);
			txt="";
			x=request.responseXML.documentElement.getElementsByTagName("question");

			num=x.length;
		
			for (i=0;i<num;i++)
			   {
			   txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   xx=x[i].getElementsByTagName("questionid");
			   yy=x[i].getElementsByTagName("content");
			     {
			     try
			       {
			       txt=txt + "<tr><td width='85%' align='left' valign='top' >·<a href='#' onclick=\"ajaxshow('" + xx[0].firstChild.nodeValue + "')\" class='index_huitxt'>" +  yy[0].firstChild.nodeValue + "</a></td></tr><tr><td class='line'></td></tr>";
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }
			     }
			   
	
			   txt=txt + "</table>";
			   }
		   txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='返回' onclick=\"ajaxLogin1()\" /></span></td></tr><tr><td class='line'></td></tr>";
				document.getElementById('name').innerHTML = txt;

            
        }
    }
}
function updatePageUserLogin()
{	
	var txt;

	var num;

    if(request.readyState == 4) 
    {
		//alert("2222222");
		//alert("3333333"+request.status);
        if(request.status == 200)
        {
          // alert("3333333");
            //var question = request.responseXML.getElementsByTagName("question"); 
            
         	//alert(question.length);
			txt="";
			x=request.responseXML.documentElement.getElementsByTagName("question");

			num=x.length;
			if(num>10){

			num=10;

			}
			for (i=0;i<num;i++)
			   {
			   txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   xx=x[i].getElementsByTagName("questionid");
			   yy=x[i].getElementsByTagName("content");
			     {
			     try
			       {
			       txt=txt + "<tr><td width='85%' style='text-align: left' valign='top' >·<a href='#' onclick=\"ajaxshow('" + xx[0].firstChild.nodeValue + "')\" >" +  yy[0].firstChild.nodeValue + "</a></td></tr><tr><td class='line'></td></tr>";
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }
			     }
			   
	
			   txt=txt + "</table>";
			   }
		   txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='显示全部' onclick=\"ajaxLogins()\" /></span></td></tr><tr><td class='line'></td></tr>";
				document.getElementById('name').innerHTML = txt;

            
        }
    }
}
function ajaxshowquestion()
{	
	var txt;
    if(request.readyState == 4)
    {

        if(request.status == 200)
        {
           
            //var question = request.responseXML.getElementsByTagName("question"); 
            
         	//alert(question.length);
			txt="";
			x=request.responseXML.documentElement.getElementsByTagName("question");
			for (i=0;i<x.length;i++)
			   {
			   txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   
			   yy=x[i].getElementsByTagName("content");
			     {
			     try
			       {
			       txt=txt + "<tr><td width='85%' align='left' valign='top' class='sms002_table'>" +  yy[0].firstChild.nodeValue + "</td></tr><tr><td class='line'></td></tr>";
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }
			     }
			   
		   txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='返回' onclick=\"ajaxLogin1()\" /></span></td></tr><tr><td class='line'></td></tr>";
			   txt=txt + "</table>";
			   }


				document.getElementById('name').innerHTML = txt;

            
        }
    }
}

</script>
<body>
<div style="margin:0 auto;width:690px;">


  <div id="main">
    <div id="cont_left">
      
      <!-- =========================================== -->

      <!-- =========================================== -->
      <div class="cl_ans2">
        <div class="ans_t3">
          <div class="cb">相关问题</div>
        </div>
        <div class="qus_c2" id="">
    <form action="">



<table width="100%" height="100%" border="0" >
  <tr>
    <td><table width="100%" height="100%" border="0" >
      <tr>
        <td class="top_banner"><table width="100%" border="0" >
            <tr>
              <td><table width="100%" border="0">
                <tr>

                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" height="100%" border="0" >
           
            <tr>
              <td class="header_bg left_middle">
            <table width="500" >
	   <tr>
	  
		 <td>
			<div id="description" style="height:30px;width:450px">
       
      </div>
		 </td>
		
	   </tr>
	 </table>
  
             
               
              </td>
            </tr>
            <tr>
              <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" class="main_table padding">
                  <tr>
                    <td>
                    	<table width="100%" border="0" cellpadding="0" cellspacing="0" >
						<tr>
					  	 <td><p><span id="name1" style="color: red;"></span></p></td>
					
					    </tr>
					    <tr><td class='line'></td></tr>
					  	<tr>
					  	 
					    <td id="left"><p><span id="name"></span></p></td>
					    </tr>
						
						</table>                        
					</td>
                  </tr>
                  <input type="hidden" name="content1" id="content1" value="" />
              </table>
                </td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>

</form>
          
        </div>
      </div>
      <!-- =========================================== -->
    </div>
  </div>
</div>
</body>
</html>
