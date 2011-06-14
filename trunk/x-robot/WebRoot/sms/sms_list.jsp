<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>

<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>常用短信</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE8 {color: #747373}
.STYLE10 {font-size: 11px}

.STYLE19 {
	font-size: 12px;
	
}
.STYLE9 {
	font-size: 12px;
	color: #cccccc;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #666666;
}
.STYLE9 a:link{
	font-size:12px;
	color:#666666;
}
.STYLE9 a:hover,
  .STYLE9 a:active{
	font-size:12px;
	color:#B20ccc;
}

-->
</style>
<script language="JavaScript" src="../js/page.js"></script>
<script type="text/javascript">
function  tab1()
{
	document.getElementById("t1").style.display="none";
	document.getElementById("t2").style.display="block";
	document.getElementById("t3").style.display="none";
	document.getElementById("t4").style.display="none";
	document.getElementById("td1").innerHTML="排行榜";
}
function  tab2()
{
	document.getElementById("t1").style.display="none";
	document.getElementById("t2").style.display="none";
	document.getElementById("t3").style.display="block";
	document.getElementById("t4").style.display="none";
	document.getElementById("td1").innerHTML="热门推荐";
}
function  tab3()
{
	document.getElementById("t1").style.display="none";
	document.getElementById("t2").style.display="none";
	document.getElementById("t3").style.display="none";
	document.getElementById("t4").style.display="block";
	document.getElementById("td1").innerHTML="计费管理";
}
</script>
</head>

<body bgcolor="#FFFFFF">
<form name="qryForm" action="" method="post">
<table width="477" height="735" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
<tr>
		<td>
			<img src="../images/main_01.jpg" width="41" height="30" alt=""></td>
		<td>
			<img src="../images/main_02.jpg" width="397" height="30" alt=""></td>
		<td>
			<img src="../images/main_03.jpg" width="39" height="30" alt=""></td>
	</tr>
	<%@ include file="../public/title.jsp"%>
	<tr>
		<td background="../images/main_101.jpg" width="41" height="511">&nbsp;</td>
	  <td width="397" height="511" valign="top" background="../images/main_111.jpg">
		<table width="395" height="126" align="center" >
         <tr>
            <td height="91" align="center" valign="middle"><a href="sms.action?op=view&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_01.gif" width="81" height="89" border="0"></a></td>
			<td align="center" valign="middle"><img src="../images/sms/pic_02_link.gif" width="81" height="89" border="0"></td>
			<td align="center" valign="middle"><a href="../telbook/telbook.action?op=view&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_03.gif" width="81" height="89" border="0"></a></td>
			<td align="center" valign="middle"><a href="sms.action?op=history&user_msn=<ww:property value="user_msn"/>"><img src="../images/sms/pic_04.gif" width="81" height="89" border="0"></a></td>
          </tr>
		  <tr>
		    <td height="27" align="center" valign="top" class="title">自编短信</td>
			<td align="center" valign="top" class="title">常用短信</td>
			<td align="center" valign="top" class="title">电话薄</td>
            <td align="center" valign="top" class="title">历史记录</td>
          </tr>
        </table>
		<table id="__01" width="100%" height="378" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center"><table id="__01" width="359" height="382" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="4">
			<img src="../images/sms/message_use_bg_01.gif" width="359" height="17" alt=""></td>
	</tr>
	<tr>
		<td width="93" height="337" align="right" valign="top" background="../images/sms/message_use_bg_02.gif"><table width="95%" height="100%">
          <tr>
            <td valign="top"><table id="__01" width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
		<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle">信息分类</td>
		<td>
			<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
	</tr>
</table></td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" height="283">
              <ww:iterator value="classList" status="row">
              <tr>
                <td height="28" class="ban">
				<a href="sms.action?op=sms&user_msn=<ww:property value="['user_msn']"/>&smsclassid=<ww:property value="['CLASS_ID']"/>"><ww:property value="['CLASS_NAME']"/></a>
				</td>
              </tr>
              </ww:iterator>
              <tr>
                <td height="50" class="ban"></td>
              </tr>
              <tr>
                <td height="28" class="ban"><a href="#" onclick="tab1()">排行榜</a></td>
              </tr>
              <tr>
                <td height="28" class="ban"><a href="#"  onclick="tab2()">热门推荐</a></td>
              </tr>
              <tr>
                <td height="28" class="ban"><a href="#"  onclick="tab3()">计费管理</a></td>
              </tr>
            </table></td>
          </tr>
         
        </table></td>
		<td background="../images/sms/message_use_bg_03.gif" width="13" height="337">
			</td>
		<td width="239" height="337" valign="top" background="../images/sms/message_use_bg_04.gif"><table width="100%" height="347">
          <tr>
            <td><table id="__01" width="90" height="23" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/sms/buttonbg_01.gif" width="10" height="23" alt=""></td>
		<td width="70" height="23" align="center" background="../images/sms/buttonbg_02.gif" class="fontStyle" id=td1>所有短信</td>
		<td>
			<img src="../images/sms/buttonbg_03.gif" width="10" height="23" alt=""></td>
	</tr>
</table></td>
          </tr>
          <tr>
            <td height="280" align="center" valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#F3F1F0" id = t1>
  				<ww:iterator value="pageInfo.records" status="row">
			  <tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    *&nbsp;<a href="sms.action?op=view&user_msn=<ww:property value="['user_msn']"/>&mes_id=<ww:property value="['MES_ID']"/>"><ww:property value="['MES_CONTENT']"/></a>
			    </td>
			  </tr>
			  </ww:iterator>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#F3F1F0" id =t2 style="display:none">
  				
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;遇到你，是我心动的开始，爱上你，是我幸福的选择，拥有你，是我最珍贵的财富，踏入红毯，是我永恒的动力。最爱的人是你。遗憾的是我传错人了。
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;一年又一年，风风雨雨。您为了我们呕心沥血，请接受我们对您深深感谢和炙热的爱。 
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;生日祝福你，好事追着你，主管重视你，病魔躲着你，情人深爱你，痛苦远离你，开心跟着你，万事顺着你！
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;梅雨季节，不管外面是风是雨、是涛是浪，不管世事是变幻是无常是沧海是桑田，我的。祝你：平安做事，平淡做人，平静生活，平顺一生！
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;读一年又一年，毅力啊！考一门过一门，犀利啊！报一个中一个，实力啊！（祝福）发一个收一个，情谊啊！祝奋斗在高考一线的朋友们考试顺利。
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;当我将硬币投进愿望池，一个可爱的精灵问我要许什么愿望，我对他说：请帮我好好照顾这个看信息的人，永远别烦恼，要永远开心，幸福！天热，注意身体！
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;阳光替我祝福，月光为我祈祷，当繁星闪烁的时候，每一颗星都承载我这个心愿：愿正在看短信的人远离疾病，全家健康幸福！
			    </td>
			  </tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#F3F1F0" id =t3 style="display:none">
  				
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>佳节祝福</b>
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;有种友情事过境迁依然纯朴；有种信任事隔多年依然怀念；有种问候清清淡淡却最真诚；有种友谊，无须挂齿，却心领神会，祝父亲节快乐！
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>真情祝福</b>
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;梅雨季节，不管外面是风是雨、是涛是浪，不管世事是变幻是无常是沧海是桑田，我的。祝你：平安做事，平淡做人，平静生活，平顺一生！
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>幽默搞笑</b>
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;当年同事在广州工作，一日由于工作原因遇到个黑人，当时想着去练一下英语，于是走上前去笑盈盈的问黑人：where are you from? 没想到黑人露出疑惑和惊恐的目光看着他，用标准粤语说：我听不懂。
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>整蛊短信</b>
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    *&nbsp;你想出人投地吗？你想发财致富吗？你想光宗耀祖吗？你想大富大贵吗？你想升官发财吗？请别胡思乱想了，早点睡吧！
			    </td>
			  </tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="2" bgcolor="#F3F1F0" id =t4 style="display:none">
  				
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>2011-06</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;136次
			    </td>
			  </tr>
			  
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>2011-05</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;181次
			    </td>
			  </tr>
			  
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>2011-04</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;167次
			    </td>
			  </tr>
			  
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>2011-03</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;190次
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>2011-02</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;393次
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="fontStyle">
			    <b>2011-01</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;217次
			    </td>
			  </tr>
			  
			</table>
			</td>
          </tr>      
        </table>
        </td>
		<td background="../images/sms/message_use_bg_05.gif" width="14" height="337">
		</td>
	</tr>
	<tr><td colspan=3 background="../images/sms/billbg_03.gif" valign=top>
	<%@ include file="../public/page.jsp" %>
	</td><td background="../images/sms/message_use_bg_05.gif" width="14"></tr>
	<tr>
		<td colspan="4" background="../images/sms/message_use_bg_06.gif" width="359" height="28" align=right valign=middle>
			 </td>
	</tr>
</table>

</td>
	</tr>
	
</table>
		
	  </td>
	  <td background="../images/main_121.jpg" width="39" height="511">
			</td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" align="right" valign="top" background="../images/main_14.jpg"><table width="100%" height="39">
          <tr>
            <td width="94%" align="right" valign="top"><input name="button" type="button" class="input_button03" id="button" value="发送"></td>
            <td width="6%">&nbsp;</td>
          </tr>
        </table></td>
		<td>
			<img src="../images/main_15.jpg" width="39" height="59" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_16.jpg" width="41" height="42" alt=""></td>
		<td>
			<img src="../images/main_17.jpg" width="397" height="42" alt=""></td>
		<td>
			<img src="../images/main_18.jpg" width="39" height="42" alt=""></td>
	</tr>
</table>
</form>
</body>
</html>