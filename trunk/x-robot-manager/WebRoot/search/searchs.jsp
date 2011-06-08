<%@page contentType="text/html;charset=gb18030"
	import="java.sql.*,java.util.*"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<link rel="stylesheet" type="text/css" href="../css/master.css">
    <title>My JSP 'search.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>



#description{
width:810px;/*=154*5+15*2 */
height:10px;
overflow:hidden;
margin-right:0px;
float:left;
}
.dis{
float:left;
width:40px;
text-align: center;
padding-top:30px
}
#description ul, #description li {
float:left;
display: inline;
margin: 0;
padding: 0;
height:150px
}
.content a:active,
.content a:visited,
.content a:link {
display: inline;
margin: 0;
padding: 0;
padding-left: 4;
padding-right: 4;
text-decoration: none;
}
.content a:hover {
color: #ffffff;
display: inline;
text-decoration: none;
}
img {border:0px}
</STYLE>
  </head>
<script type="text/javascript">

function sshandler(date)
{
	//alert(date);
	ajaxLogin(date);
}
parent.setIMReceiveHandler(sshandler);


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
    request.onreadystatechange = updatePageUsersearch; //回调函数updatePageUse&rLogin方法名后面被禁止书写小括号()
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
    var url = "ajaxAction.jsp?action=show&questionid=" + id +"&"+Math.round(Math.random()*100);

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
function ajaxLogin(content)
{
    
 		var txt="相关问题";
    document.getElementById('name1').innerHTML = txt;
    document.getElementById("content1").value=content;
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?content=" + content +"&"+Math.round(Math.random()*100);

    request.open("GET",url,true);
    request.onreadystatechange = updatePageUserLogin; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxLogin1()
{
		var txt="相关问题";
    document.getElementById('name1').innerHTML = txt;
    var content=document.getElementById("content1").value;
 
    
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?content=" + content ;

    request.open("GET",url,true);
    request.onreadystatechange = updatePageUserLogin; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxLogins()
{
    var content=document.getElementById("content1").value;
 
    
    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?content=" + content ;

    request.open("GET",url,true);
    request.onreadystatechange = updatePageUserLogins; //回调函数updatePageUserLogin方法名后面被禁止书写小括号()
    request.send(null);
}
function ajaxshow(id)
{

    createRequest();
    //new Date().getTime() 加上一个随机时间字符，避免请求缓存
    var url = "ajaxAction.jsp?action=show&questionid=" + id ;

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
<%
	String msnid=request.getParameter("msnid");
	String table="unicom.t_visit_record";
	String field="ID,MSNID,CLASSES";
	String value="";
	String rclass="04";
	DataConn conn=new DataConn();
	InsertData insert=new InsertData(conn);
	QueryData query=new QueryData(conn);
	int id=query.KeyNextValue(table,"ID");
	value="'"+id+"','"+msnid+"','"+rclass+"'";
	insert.insert(table,field,value);

 %>
   <form action="">



<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="top_banner"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="bg top_banner">
            <tr>
              <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="bg main_table">
                <tr>
                  <td class="left_middle"><a href="../htm/index.htm"><img src="../images/07091_6.gif" width="20" height="20"></a>请在左侧对话框里输入您想了解的问题，我除了回答您的问题外，还会把一些有关联的业务知识在下面列出，以方便你更好地了解联通公司的业务；有一些问题我可能需要请教专家，若不能马上回复，请您谅解。您若投诉联通的服务，请进入业务栏目选择投诉功能。</td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td><table width="100%" height="." border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td class="line"></td>
            </tr>
            <tr>
              <td class="header_bg left_middle">
            <table width="500" >
	   <tr>
	     <td>
	     <img  src="../images/left_2.jpg"  id="img_l" onClick="doSlide(-1)"  />
	   
	     </td>
		 <td>
			<div id="description" style="height:30px;width:450px">
        <div id="content0" style=" height:50px;width:3240px"><!--(#description.width=810px)*4 width要有值不然沒效果-->
        <ul id="content" class=content style="padding-top:5px;">        
             <li><A href="#"  onclick="ajaxLogin1()">相关信息</A></li>&nbsp;&nbsp;
							<%
								query.setRecordSet("select * from t_unicom_class where class_type='question' order by class_order");
								ResultSet rsclass1 = query.getResultSet();
								while(rsclass1.next()){
									String classnum=rsclass1.getString("CLASS_NUM");
									String classname=rsclass1.getString("CLASS_NAME");
									
			                   %>
			                  <li><A href="#"  onclick="ajaxsearch('<%=classnum %>','<%=classname %>')"><%=classname %></A></li>&nbsp;&nbsp;
			                  <%
			                  } 
			                  
			                  %>
		 </ul>
		 </div>
      </div>
		 </td>
		 <td>
		   <img  src="../images/right_1.jpg"   id="img_r" onClick="doSlide(1)"  />
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
  </body>
  <script>
var ok_obj=document.getElementById("content").getElementsByTagName("LI")
// ok=3
//var ok=Math.ceil(ok_obj.length/5)-1
var ok=Math.ceil(ok_obj.length)-5
//alert(ok);
var ele=document.getElementById("description");
//w=810
//var w=ele.clientWidth;
// 注： w為單個框所中的width
var w=65;
var n=20,t=40;
var timers=new Array(n);
var k=0;doSlide(0);
function doSlide(s){
if (k>=ok &&s>0){
	document.getElementById("img_r").src="../images/right_2.jpg";
	document.getElementById("img_l").src="../images/left_1.jpg";
}else if( k<=0 &&s<0){
	document.getElementById("img_r").src="../images/right_1.jpg";
	document.getElementById("img_l").src="../images/left_2.jpg";
}


else{
	document.getElementById("img_r").src="../images/right_1.jpg";
	document.getElementById("img_l").src="../images/left_1.jpg";
k+=s;
    var x=ele.scrollLeft;
//alert(' x: '+x);
    var d=k*w-x;
//alert('d: '+d);
    for(var i=0;i<n;i++)(
    function(){
       if(timers[i]) clearTimeout(timers[i]);
       var j=i;
//       alert(x)
       timers[i]=setTimeout(function(){ele.scrollLeft=x+Math.round(d*Math.sin(Math.PI*(j+1)/(2*n)));},(i+1)*t);
    //alert('timers: '+timers[i]);
    }
    )();
//ele.scrollLeft+=x*s;
}}
</script>
  
</html>
	<%conn.close(); %>

