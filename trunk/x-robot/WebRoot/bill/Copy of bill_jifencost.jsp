<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>���������嵥��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
	color: #cccccc;
}
a:visited {
	text-decoration: none;
	color: #ce8965;
}
a:hover {
	text-decoration: none;
	color: #ECE9D8;
}
a:active {
	text-decoration: none;
}
a:link img{
	background:url(../images/buttom_preview01.png);
}
a:visited img{
	background:url(../images/buttom_preview02.png);
	
}
.STYLE1 {
	color: #1982B0;
	font-size: 16px;
}
.STYLE2 {font-size: 12px}
.STYLE13 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE14 {font-size: 12px; }
.STYLE22 {font-size: 16; }
.STYLE23 {font-size: 16; color: #FFFFFF; }
.STYLE26 {font-size: 12px;color:#179CBD; }
.line11 {
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #333333;
}
-->
</style>
<script type="text/javascript">
	function form_submit()
	{
		form1.action="bill.action?op=jifen_costdetail&user_tel=<ww:property value="user_tel"/>";
		form1.submit();
	}
	</script>
</head>
<body bgcolor="#FFFFFF">
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
		<td>
			<img src="../images/main_10.jpg" width="41" height="511" alt=""></td>
	  <td width="397" height="511" align="center" valign="middle" background="../images/main_11.jpg">
	     <table id="__01" width="363" height="486" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="363" height="85" colspan="3" align="right" background="../images/bill/bill_bg_01.gif">&nbsp;</td>
	</tr>
	<tr>
		<td rowspan="3">
			<img src="../images/bill/bill_bg_02.gif" width="7" height="401" alt=""></td>
		<td background="../images/bill/bill_bg_03.png" width="338" height="33"><table width="100%">
          <tr>
            <td width="8%">&nbsp;</td>
            <td width="8%"><img src="../images/bill/bill_arrow.png" width="14" height="14"></td>
            <td width="79%" class="STYLE1">���������嵥��ѯ</td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table>			</td>
		<td rowspan="3">
			<img src="../images/bill/bill_bg_04.gif" width="18" height="401" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/bill/bill_bg_05.png" width="338" height="4" alt=""></td>
	</tr>
	<tr>
		<td width="338" height="364" align="center" valign="top" background="../images/bill/bill_bg_06.gif">
		   <table width="100%" height="265">
             <tr>
               <td align="center"><table width="100%" height="135">
  <tr>
    <td><table width="100%">
      <tr>
        <td width="2%"><img src="../images/bill/bill_icon01.png" width="11" height="11"></td>
        <td width="98%"><span class="STYLE14">��ѡ���·�</span></td>
      </tr>
    </table></td>
  </tr>
  <form method="post" name="form1" action="">
  <tr>
    <td><table width="100%">
      <tr>
        <td width="2%">&nbsp;</td>
        <td width="98%" class="STYLE14"><table width="100%">
          <tr>
            <td align="center" class="STYLE14">
			<script type="text/javascript">
        		var Now=new Date();
				var year=Now.getFullYear();
				var month=Now.getMonth()+1;
				
				for(var i=1;i<=6;i++)
				{
					month-=1;
					if(month<=0)
					{
						month=12;
						year-=1;
					}
					if(parseInt(month)<10)
						month = "0"+month;
					if(i==1)
					document.write("<input type='radio' checked value='"+year+month+"' name='month' />"+year+"��"+month+"��&nbsp;&nbsp;");
					else
					document.write("<input type='radio' value='"+year+month+"' name='month' />"+year+"��"+month+"��&nbsp;&nbsp;");
					
				}
	        </script>
			</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  </form>
  <tr>
    <td class="line11"><table width="100%">
      <tr>
        <td><input name="button" type="submit" class="input_button2" id="button" value="��ѯ" onClick="form_submit();"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="STYLE26">��ܰ��ʾ��</td>
  </tr>
  <tr>
    <td class="STYLE26">1.ÿ��1��0����8��Ϊϵͳ�����ڣ���ʱ�޷�Ϊ���ṩ��ز�ѯ����������ÿ��1����8���Ժ��ѯ�������½⡣</td>
  </tr>

</table></td>
             </tr>		 
	      </table></td>
	</tr>
</table></td>
		<td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" background="../images/main_14.jpg"><table width="95%">
          <tr>
            <td align="right"><input name="button" type="submit" class="input_button02" id="button" value="����" onClick="window.location.href='bill.action?op=login&user_tel=<ww:property value="user_tel"/>';"></td>
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
</body>
</html>