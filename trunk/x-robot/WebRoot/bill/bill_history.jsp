<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<html>
<head>
<title>��ʷ�˵���ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--

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
		form1.action="bill.action?op=history_detail&user_tel=<ww:property value="user_tel"/>";
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
		<td background="../images/main_101.jpg" width="41" height="511">
			</td>
	  <td width="397" height="511" align="center" valign="middle" background="../images/main_111.jpg"><table id="__01" width="369" height="504" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/bgbg_01.gif" width="24" height="53" alt=""></td>
		<td background="../images/bgbg_021.gif" width="217" height="53">			</td>
		<td colspan="2" width="117" height="53">
		    <table id="__01" width="100%" height="53" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<img src="../images/bill/icon_01.gif" width="5" height="8" alt=""></td>
		<td colspan="3" background="../images/bill/icon_02.gif" width="106" height="8">
			</td>
		<td>
			<img src="../images/bill/icon_03.gif" width="6" height="8" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/bill/icon_04.gif" width="5" height="28" alt=""></td>
		<td width="" height="28" colspan="3" align="center" background="../images/bill/icon_05.gif" class="fontStyle">��ʷ�˵���ѯ</td>
		<td>
			<img src="../images/bill/icon_06.gif" width="6" height="28" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/bill/icon_07.gif" width="5" height="17" alt=""></td>
		<td background="../images/bill/icon_08.gif" width="46" height="17">
			</td>
		<td>
			<img src="../images/bill/icon_09.gif" width="14" height="17" alt=""></td>
		<td background="../images/bill/icon_10.gif" width="46" height="17">			</td>
		<td>
			<img src="../images/bill/icon_11.gif" width="6" height="17" alt=""></td>
	</tr>
</table>
		  </td>
		<td>
			<img src="../images/bgbg_04.gif" width="11" height="53" alt=""></td>
	</tr>
	<tr>
		<td background="../images/bgbg_051.gif" width="24" height="426">			</td>
		<td width="326" height="426" colspan="2" align="center" valign="top" background="../images/bgbg_061.gif">
		<table width="100%">
          <tr>
            <td><table width="100%">
          <tr>
            <td width="3%">&nbsp;</td>
            <td width="8%"><img src="../images/bill/bill_arrow.png" width="14" height="14"></td>
            <td width="79%" class="titleblue">��ʷ�˵���ѯ</td>
            <td width="5%">&nbsp;</td>
          </tr>
        </table></td>
          </tr>
          <tr>
            <td height="15" align="center" valign="middle"><img src="../images/bill/blueline.gif" width="294" height="3"></td>
          </tr>
          <tr>
            <td align="center" valign="top">
            <table width="100%">
			     <tr>
			       <td width="2%"><img src="../images/bill/bill_icon01.png" width="11" height="11"></td>
			       <td width="98%"><span class="STYLE14">��ѡ���·�</span></td>
			     </tr>
		   </table>
		   
		   <table width="100%" align=center>
		   <form method="post" name="form1" action="">
		      <tr>
		        <td width="1%">&nbsp;</td>
		        <td width="90%" class="STYLE14"><table width="100%">
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
		      </form>
		    </table>
            </td>
          </tr>
          <tr>
			    <td class="line11"><table width="100%" align=right>
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
  <tr>
    <td class="STYLE26">2.����ʷ�˵�������Ϊ���ṩ���6���µ���ʷ�˵���</td>
  </tr>
  <tr>
    <td class="STYLE26">3.Ŀǰ����������û��ṩ�˲�ѯ��������ͨ���������û��ݲ�֧�ִ����ѯҵ��</td>
  </tr>
        </table>
		</td>
		<td colspan="2" background="../images/bgbg_071.gif" width="19" height="426">		  </td>
	</tr>
	<tr>
		<td>
			<img src="../images/bgbg_08.gif" width="24" height="24" alt=""></td>
		<td colspan="2">
			<img src="../images/bgbg_09.gif" width="326" height="24" alt=""></td>
		<td colspan="2">
			<img src="../images/bgbg_10.gif" width="19" height="24" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/�ָ���.gif" width="24" height="1" alt=""></td>
		<td>
			<img src="../images/�ָ���.gif" width="217" height="1" alt=""></td>
		<td>
			<img src="../images/�ָ���.gif" width="109" height="1" alt=""></td>
		<td>
			<img src="../images/�ָ���.gif" width="8" height="1" alt=""></td>
		<td>
			<img src="../images/�ָ���.gif" width="11" height="1" alt=""></td>
	</tr>
</table></td>
		<td background="../images/main_121.jpg" width="39" height="511">
			</td>
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