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
function ajaxshowsearch(classid)
{
	//alert(classid);
	var txt2=document.getElementById('key').value;
    createRequest();
    //alert(txt2);
    //parent.rightFrame.location = "right.jsp?content="+txt2;
    parent.mainFrame.sshandler(classid,txt2);
    var url = "ajaxAction1.jsp?classid="+classid+"&content="+txt2+"&"+Math.round(Math.random()*100)  ;
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
			  // txt=txt + "<table width='100%' border='0' cellspacing='0' cellpadding='0'>";
			   
			   yy=x[i].getElementsByTagName("content");
zz=x[i].getElementsByTagName("questionid");
			     {
			     try
			       {
			       //txt=txt + "<tr><td width='85%' align='left' valign='top' class='sms002_table'>" +  yy[0].firstChild.nodeValue + "</td></tr><tr><td class='line'></td></tr>";
			        txt3=yy[0].firstChild.nodeValue;
				txt2=zz[0].firstChild.nodeValue;
			       }
			     catch (er)
			       {
			    	txt=txt+"";
			       }

			     }
			   break;
		  // txt=txt + "<tr><td id='left'><span class='btn-l'><input type='button' name='' value='返回' onclick=\"ajaxLogin1()\" /></span></td></tr><tr><td class='line'></td></tr>";
			 //  txt=txt + "</table>";
			   }
			 
if(txt3==null){
txt2="没有相关问题！";
txt3="没有相关答案！";
}
				txt=document.getElementById('key').value;
				//txt1=document.getElementById('name1').value;
				if(txt==""){
				document.getElementById('wenti').innerHTML = txt;

				}else{
document.getElementById('wen').innerHTML = txt;
document.getElementById('wenti').innerHTML = txt2;
				document.getElementById('daan').innerHTML = txt3;
				}
				
            
        }
    }
}
</script>
<body>
<%
String classid=request.getParameter("classid");
if("".equals(classid)||classid==null){
classid="0";
}
 %>
<div style="margin:0 auto;width:690px;">
  <div id="head">
    <div class="fl hd2" style="width: 480px;">
      <div style="position:relative; z-index:11;">
        <form id="zsForm" name="zsForm" method="get" target="" >
          <div class="fl">
            <input type="text" name="key" id="key" style="width:300px;" class="f14"  value="" />
          </div>
          <div class="fl" style="padding-top:0;">
            <input type="button" class="hd_tw" value="搜索" onClick="ajaxshowsearch('<%=classid %>');"/>
          </div>
        </form>
      </div>
    </div>
    <div class="cb"></div>
  </div>
  <%
  String sql="select * from t_unicom_class t where class_type='question' order by CLASS_NUM";
  	DataConn conn=new DataConn();
	
	QueryData query=new QueryData(conn);
 	 query.setRecordSet(sql);
 	 ResultSet rs3 = query.getResultSet();
 	 int i=0;
   %>
  <div id="nav">
    <div class="fl">|</div>
    <%
    while(rs3.next()){
    String name=rs3.getString("CLASS_NAME");
    String num=rs3.getString("CLASS_NUM");
     %>
     <div class="fl" style="width:52px;"><a href="top.jsp?classid=<%=num %>"><%=name %></a></div>
     <div class="fl">|</div>
     <%
     i++;
     	if(i>6){
     	 break;
     	}
     }
      %>
    <div class="fl" style="width:52px;"><a href="#">更多</a></div>
     <div class="fl">|</div>
    <div class="cb"></div>
  </div>
  <div id="main">
    <div id="cont_left">
      <!-- =========================================== -->
      <div class="cl_qus">
        <div class="qus_t">
          <div class="f14 fl"><strong>问题:</strong></div>
          <div class="cr"></div>
        </div>
        <div class="qusi"><img src="images/ques.gif"></div>
        <div class="qus_c">
          <div class="usr_info">
            <div class="wpb5"><a href="#" target="_blank" class="c7f"><img src="images/50_1650680127.gif" id="q1650680127" class="img1" align="absmiddle" width="50" height="50"><br/>
              </a><br/>
            </div>
          </div>
          <div class="usr_qus"><strong><div id="wen"></div></strong>
            <div class="twsj" style="text-align:left;"><span class="ar"></span></div>
            <div class="pb5" id="wenti"></div>
          </div>
          <div class="cb"></div>
        </div>
      </div>
      <!-- =========================================== -->
      <div class="cl_ans2">
        <div class="ans_t3">
          <div class="cb"></div>
        </div>
        <div class="qus_c2">
          <div class="usr_info">
            <div class="wpb5"><a href="#" target=_blank class="c7f"><img src="images/50_1650680127.gif" id="a48016427" class="img1" align="absmiddle" width="50" height="50"><br/>
             </a><br/>
            </div>
          </div>
          <div class="usr_qus">
            <div class="pb5" id="daan"> <br/>
            </div>
            <div class="twsj"><span class="ar"></span></div>
            <div class="f12" style="border-top:1px solid #feeba0; margin-bottom:10px; padding-top:10px;">
            </div>
          </div>
          <div class="cb"></div>
        </div>
      </div>
      <!-- =========================================== -->

      <!-- =========================================== -->
  
      <!-- =========================================== -->
    </div>
  </div>
</div>
</body>
</html>
<%conn.close(); %>

