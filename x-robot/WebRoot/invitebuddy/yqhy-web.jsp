<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String msnid = request.getParameter("msnid");
%>
<html>
<head>
<title>邀请好友</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css">
<style>
.scol {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	SCROLLBAR-FACE-COLOR: #ffffff;
	SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
	SCROLLBAR-SHADOW-COLOR: #cccccc;
	SCROLLBAR-3DLIGHT-COLOR: #cccccc;
	SCROLLBAR-ARROW-COLOR: #ffffff;
	SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
	SCROLLBAR-BASE-COLOR: #ffffff;
}
.STYLE1 {
	font-size: 12px;
	color: #333333;
}
</style>
<script>
String.prototype.trim= function(){return this.replace(/^\s+|\s+$/g, "");} 
function chkform(){
        var msnid = form.MSNID.value.toLowerCase().trim();
	var msnid1 = form.FRIENDEMAILSTR1.value.toLowerCase().trim();
	var msnid2 = form.FRIENDEMAILSTR2.value.toLowerCase().trim();
	var msnid3 = form.FRIENDEMAILSTR3.value.toLowerCase().trim();
	var msnid4 = form.FRIENDEMAILSTR4.value.toLowerCase().trim();
	var msnid5 = form.FRIENDEMAILSTR5.value.toLowerCase().trim();
        var val = chkmail(msnid);
	var val1 = chkmail(msnid1);
	var val2 = chkmail(msnid2);
	var val3 = chkmail(msnid3);
	var val4 = chkmail(msnid4);
	var val5 = chkmail(msnid5);
	if(val != 0) form.MSNID.value = "MSN帐号不正确";
	if(val1 != 0) form.FRIENDEMAILSTR1.value = "MSN帐号不正确";
	if(val2 != 0) form.FRIENDEMAILSTR2.value = "MSN帐号不正确";
	if(val3 != 0) form.FRIENDEMAILSTR3.value = "MSN帐号不正确";
	if(val4 != 0) form.FRIENDEMAILSTR4.value = "MSN帐号不正确";
	if(val5 != 0) form.FRIENDEMAILSTR5.value = "MSN帐号不正确";
	
	
	var Email1 = form.Email1.value.toLowerCase().trim();
	var Email2 = form.Email2.value.toLowerCase().trim();
	var Email3 = form.Email3.value.toLowerCase().trim();
	var Email4 = form.Email4.value.toLowerCase().trim();
	var Email5 = form.Email5.value.toLowerCase().trim();
	var m1 = chkmail(Email1);
	var m2 = chkmail(Email2);
	var m3 = chkmail(Email3);
	var m4 = chkmail(Email4);
	var m5 = chkmail(Email5);
	if(m1 != 0) form.Email1.value = "格式错误";
	if(m2 != 0) form.Email2.value = "格式错误";
	if(m3 != 0) form.Email3.value = "格式错误";
	if(m4 != 0) form.Email4.value = "格式错误";
	if(m5 != 0) form.Email5.value = "格式错误";
	
	setCookie("MSNID", form.MSNID.value);

	if(val1 == 0 && val2 == 0 && val3 == 0 && val4 == 0 && val5 == 0 && m1 == 0 && m2 == 0 && m3 == 0 && m4 == 0 && m5 == 0){
		if(msnid1 != "" || msnid2 != "" || msnid3 != "" || msnid4 != "" || msnid5 != ""){
			if(msnid2 == msnid1){
				form.FRIENDEMAILSTR2.value = "";
			}
			if(msnid3 == msnid2 || msnid3 == msnid1){
				form.FRIENDEMAILSTR3.value = "";
			}
			if(msnid4 == msnid3 || msnid4 == msnid2 || msnid4 == msnid1){
				form.FRIENDEMAILSTR4.value = "";
			}
			if(msnid5 == msnid4 || msnid5 == msnid3 || msnid5 == msnid2 || msnid5 == msnid1){
				form.FRIENDEMAILSTR5.value = "";
			}
			form.submit();
		}
	}

        
}
function char_test(chr)
//字符检测函数
{
var i;
var smallch="abcdefghijklmnopqrstuvwxyz";
var bigch="ABCDEFGHIJKLMNOPQRSTUVWXYZ";
for(i=0;i<26;i++)
if(chr==smallch.charAt(i) || chr==bigch.charAt(i))
  return(1);
return(0);
}

function spchar_test(chr)
//数字和特殊字符检测函数
{
var i;
var spch="_-.0123456789";
for (i=0;i<13;i++)
  if(chr==spch.charAt(i))
  return(1);
return(0);
}

function isChn(str){
	if(escape(str).indexOf("%u")!=-1)
	return true;
	else
	return false;
}
function chkmail(str)
{
if(isChn(str))
return(7);

var i,flag=0;
var at_symbol=0;
//“@”检测的位置
var dot_symbol=0;
//“.”检测的位置
if(char_test(str.charAt(0))==0 )
return (0);
//首字符不必用字母

for (i=1;i<str.length;i++)
if(str.charAt(i)=='@')
  {
  at_symbol=i;
  break;
  }
//检测“@”的位置

if(at_symbol==str.length-1 || at_symbol==0)
return(2);
//没有邮件服务器域名

if(at_symbol<3)
return(3);
//帐号少于三个字符

if(at_symbol>19 )
return(4);
//帐号多于十九个字符

for(i=1;i<at_symbol;i++)
if(char_test(str.charAt(i))==0 && spchar_test(str.charAt(i))==0)
  return (5);
for(i=at_symbol+1;i<str.length;i++)
if(char_test(str.charAt(i))==0 && spchar_test(str.charAt(i))==0)
  return (5);
//不能用其它的特殊字符  
 
for(i=at_symbol+1;i<str.length;i++)
if(str.charAt(i)=='.') dot_symbol=i;
for(i=at_symbol+1;i<str.length;i++)
if(dot_symbol==0 || dot_symbol==str.length-1)
//简单的检测有没有“.”，以确定服务器名是否合法
return (6);
 
return (0);
//邮件名合法
}

function setCookie(name, value) 
{ 
    var argv = setCookie.arguments; 
    var argc = setCookie.arguments.length; 
    var expires = (argc > 2) ? argv[2] : null; 
    if(expires!=null) 
    { 
        var LargeExpDate = new Date (); 
        LargeExpDate.setTime(LargeExpDate.getTime() + (expires*1000*3600*24));         
    } 
    document.cookie = name + "=" + escape (value)+((expires == null) ? "" : ("; expires=" +LargeExpDate.toGMTString())); 
}
function getCookie(Name) 
{ 
    var search = Name + "=" 
    if(document.cookie.length > 0) 
    { 
        offset = document.cookie.indexOf(search) 
        if(offset != -1) 
        { 
            offset += search.length 
            end = document.cookie.indexOf(";", offset) 
            if(end == -1) end = document.cookie.length 
            return unescape(document.cookie.substring(offset, end)) 
        } 
        else return "" 
    } 
} 

function forward(link)
{
  document.location.href= link + "?msnid=" + form.MSNID.value;
}

</script>
</head>
<body bgcolor="#FFFFFF">
<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="images/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="images/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="images/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<tr>
		<td width="397" height="52">
			<img src="images/main_04.jpg" width="41" height="52" alt=""></td>
		<td background="images/main_05_bg.jpg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="33" height="52"><br>
              <img src="images/nav_left.gif" width="33" height="23" border="0"></td>
            <td align="center" valign="top"><img src="images/banner_unicom.gif" width="208" height="44"></td>
            <td width="33"><br>
            <img src="images/nav_right.gif" width="33" height="23"></td>
          </tr>
        </table></td>
<td>
			<img src="images/main_06.jpg" width="39" height="52" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_07.jpg" width="41" height="41" alt=""></td>
		<td width="397" height="41" background="images/main_08.jpg">&nbsp;</td>
  <td>
			<img src="images/main_09.jpg" width="39" height="41" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_10.jpg" width="41" height="535" alt=""></td>
    <td width="397" height="535" valign="top" background="images/main_11.jpg"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="95" height="95" align="center" valign="middle"><img src="images/yqhy_but2.png" width="95" height="95" border="0"></td>
            <td width="95" align="center" valign="middle"><a href="#" onclick="forward('yqjl.jsp');"><img src="images/yqjl_but1.png" width="71" height="71" border="0"></a></td>
            <td width="95" align="center" valign="middle"><a href="#" onclick="forward('hdpm.jsp');"><img src="images/jfqk_but1.png" width="71" height="71" border="0"></a></td>
            <td width="95" align="center" valign="middle"><a href="#" onclick="forward('lpdh.jsp');"><img src="images/lpdh_but1.png" width="71" height="71" border="0"></a></td>
          </tr>
          <tr class="font14">
            <td height="22" align="center" valign="top">邀请好友</td>
            <td width="25%" align="center" valign="top">邀请记录</td>
            <td width="25%" align="center" valign="top">活动排名</td>
            <td width="25%" align="center" valign="top">活动规则</td>
          </tr>
        </table>
		  <table width="377" height="389" border="0" align="center" cellpadding="0" cellspacing="0" id="__">
            <tr>
              <td><img src="images/memo_01.png" width="23" height="16" alt=""></td>
              <td><img src="images/memo_02.png" width="328" height="16" alt=""></td>
              <td><img src="images/memo_03.png" width="26" height="16" alt=""></td>
            </tr>
            <tr>
              <td><img src="images/memo_04.png" width="23" height="380" alt=""></td>
              <td width="328" height="365" align="center" valign="top" background="images/memo_bj.png">
              <form name="form" action="yqhy_save.jsp" method="post">
              <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="88" align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="bottom"><span class="fontStyle">&nbsp;&nbsp;&nbsp;&nbsp;由于邀请好友数量较大及每日邀请次数的限制，现在出现好友邀请排队情况；为确保邀请好友赢大奖活动不受影响，建议填写好友MSN帐号后，再填写好友Email通知。或将这句话发送给您的好友：邀请你体验联通MSN机器人，请添加www.10010.com@hotmail.com为好友，谢谢！ </span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td height="2" align="center" valign="middle"></td>
                </tr>
                <tr>
                  <td height="2" align="left" valign="middle" bgcolor="#E3E3E3">
                  <span class="fontStyle"><b>您的MSN帐号:</b></span>&nbsp;<input name="MSNID" type="text" class="ipt" id="MSNID"  style="width:212px" onMouseDown="if(this.value=='MSN帐号不正确') this.value=''" onMouseUp="if(this.value=='MSN帐号不正确') this.value=''">
                  </td>
                </tr>
                <tr>
                  <td align="center" bgcolor="#E3E3E3"><table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                      <td width="12" height="20" align="center" valign="middle">&nbsp;</td>
                      <td width="145" align="center" valign="middle"><span class="STYLE1">好友MSN帐号</span></td>
                      <td width="145" align="center" valign="middle"><span class="STYLE1">好友手机号</span></td>
                    </tr>
                    <tr>
                      <td height="25" align="center" valign="middle"><span class="STYLE1">1</span></td>
                      <td align="center" valign="middle"><input name="FRIENDEMAILSTR1" type="text" class="ipt" id="FRIENDEMAILSTR1"  style="width:135px" onMouseDown="if(this.value=='MSN帐号不正确') this.value=''" onMouseUp="if(this.value=='MSN帐号不正确') this.value=''"></td>
                      <td align="center" valign="middle"><input name="Email1" type="text" class="ipt" id="Email1"  style="width:135px" onMouseDown="if(this.value=='格式错误') this.value=''" onMouseUp="if(this.value=='格式错误') this.value=''"></td>
                    </tr>
                    <tr>
                      <td height="25" align="center" valign="middle"><span class="STYLE1">2</span></td>
                      <td height="28" align="center" valign="middle"><input name="FRIENDEMAILSTR2" type="text" class="ipt" id="FRIENDEMAILSTR2"  style="width:135px" onMouseDown="if(this.value=='MSN帐号不正确') this.value=''" onMouseUp="if(this.value=='MSN帐号不正确') this.value=''"></td>
                      <td height="28" align="center" valign="middle"><input name="Email2" type="text" class="ipt" id="Email2" style="width:135px" onMouseDown="if(this.value=='格式错误') this.value=''" onMouseUp="if(this.value=='格式错误') this.value=''"></td>
                    </tr>
                    <tr>
                      <td height="25" align="center" valign="middle"><span class="STYLE1">3</span></td>
                      <td height="28" align="center" valign="middle"><input name="FRIENDEMAILSTR3" type="text" class="ipt" id="FRIENDEMAILSTR3"  style="width:135px" onMouseDown="if(this.value=='MSN帐号不正确') this.value=''" onMouseUp="if(this.value=='MSN帐号不正确') this.value=''"></td>
                      <td height="28" align="center" valign="middle"><input name="Email3" type="text" class="ipt" id="Email3" style="width:135px" onMouseDown="if(this.value=='格式错误') this.value=''" onMouseUp="if(this.value=='格式错误') this.value=''"></td>
                    </tr>
                    <tr>
                      <td height="25" align="center" valign="middle"><span class="STYLE1">4</span></td>
                      <td height="28" align="center" valign="middle"><input name="FRIENDEMAILSTR4" type="text" class="ipt" id="FRIENDEMAILSTR4"  style="width:135px" onMouseDown="if(this.value=='MSN帐号不正确') this.value=''" onMouseUp="if(this.value=='MSN帐号不正确') this.value=''"></td>
                      <td height="28" align="center" valign="middle"><input name="Email4" type="text" class="ipt" id="Email4" style="width:135px" onMouseDown="if(this.value=='格式错误') this.value=''" onMouseUp="if(this.value=='格式错误') this.value=''"></td>
                    </tr>
                    <tr>
                      <td height="25" align="center" valign="middle"><span class="STYLE1">5</span></td>
                      <td height="28" align="center" valign="middle"><input name="FRIENDEMAILSTR5" type="text" class="ipt" id="FRIENDEMAILSTR5"  style="width:135px" onMouseDown="if(this.value=='MSN帐号不正确') this.value=''" onMouseUp="if(this.value=='MSN帐号不正确') this.value=''"></td>
                      <td height="28" align="center" valign="middle"><input name="Email5" type="text" class="ipt" id="Email5" style="width:135px" onMouseDown="if(this.value=='格式错误') this.value=''" onMouseUp="if(this.value=='格式错误') this.value=''"></td>
                    </tr>
                  </table></td>
                </tr>
                <tr class="font12">
                  <td height="28" align="center" valign="middle"><input name="delay" type="radio" id="radio" value="0" checked>
                    立即邀请&nbsp;
                    <input type="radio" name="delay" id="radio2" value="5">
                  5分钟后邀请&nbsp;
                  <input type="radio" name="delay" id="radio3" value="60">
                  1小时后邀请</td>
                </tr>
                <tr>
                  <td height="5" align="center" valign="middle"><hr color="#CCCCCC" size="1" noshade></td>
                </tr>
                <tr>
                  <td height="30" align="center" valign="bottom"><input name="button" type="button" class="input_button2" id="button" value="邀请" onClick="chkform();"> 
                    &nbsp;&nbsp;&nbsp;&nbsp;
                  <input name="button" type="reset" class="input_button2" id="button" value="取消">
                  <input name="msnid" type="hidden" value="<%=msnid%>"></td>
                </tr>
              </table>
              </form>
              </td>
              <td><img src="images/memo_06.png" width="26" height="380" alt=""></td>
            </tr>
            <tr>
              <td><img src="images/memo_07.png" width="23" height="21" alt=""></td>
              <td><img src="images/memo_08.png" width="328" height="21" alt=""></td>
              <td><img src="images/memo_09.png" width="26" height="21" alt=""></td>
            </tr>
          </table></td>
<td>
			<img src="images/main_12.jpg" width="39" height="535" alt=""></td>
  </tr>
	<tr>
		<td>
			<img src="images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="images/main_14.jpg">&nbsp;</td>
<td>
			<img src="images/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="images/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="images/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="images/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</body>

<script>
var msnid= getCookie("MSNID");


form.MSNID.value=msnid;

</script>
</html> 