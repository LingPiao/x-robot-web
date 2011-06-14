<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<%@ taglib uri="/xdevelop.net/taglibs/page" prefix="page"%>
<%@ page import="com.opensymphony.xwork.ActionContext,
				 java.util.*"%>

<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>
<%
	ActionContext context = ActionContext.getContext();
	List mmsList = (List)context.getValueStack().findValue("mmsList");
	int count=mmsList.size();
%>
<html>
<head>
<title>彩信</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--

.STYLE9 {
	font-size: 12px;
	color: #cccccc;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #666666;
}
-->
</style>
<script type="text/javascript">
function  tab1()
{
	document.getElementById("t1").style.display="none";
	document.getElementById("t11").style.display="none";
	document.getElementById("t2").style.display="block";
	document.getElementById("t3").style.display="none";
	document.getElementById("t4").style.display="none";
	
}
function  tab2()
{
	document.getElementById("t1").style.display="none";
	document.getElementById("t11").style.display="none";
	document.getElementById("t2").style.display="none";
	document.getElementById("t3").style.display="block";
	document.getElementById("t4").style.display="none";
	
}
function  tab3()
{
	document.getElementById("t1").style.display="none";
	document.getElementById("t2").style.display="none";
	document.getElementById("t3").style.display="none";
	document.getElementById("t4").style.display="block";
	document.getElementById("t11").style.display="none";
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
	  <td width="397" height="511" valign="top" background="../images/main_11.jpg">
		<table width="395" height="120" align="center" background="../images/bg_01.jpg">
          <tr>
            <td align="center" valign="middle">
			<%@ include file="../ad.jsp"%></td>
          </tr>
        </table>
		<table width="390">
          <tr>
		    <td valign="bottom" height="22">
		    <a href="mms.action?op=mms&user_msn=<ww:property value="['user_msn']"/>"><img src="../images/mms/button_alwaysmms.gif" width="66" height="18" border=1></a></td>      
          </tr>
           <tr>
                <td height="28"  ><ww:iterator value="classList" status="row">
				&nbsp;&nbsp;<img src="../images/dot1.gif" width="11" height="11">&nbsp;<a href="mms.action?op=mms&user_msn=<ww:property value="['user_msn']"/>&mmsclassid=<ww:property value="['CLASS_ID']"/>"><ww:property value="['CLASS_NAME']"/></a>
				</ww:iterator></td>
              </tr>
           <tr>
                <td height="28"  >
				&nbsp;&nbsp;<img src="../images/dot1.gif" width="11" height="11">&nbsp;<a href="#"  onclick="tab1()">排行榜</a>
				&nbsp;&nbsp;<img src="../images/dot1.gif" width="11" height="11">&nbsp;<a href="#"  onclick="tab2()">热门推荐</a>
				&nbsp;&nbsp;<img src="../images/dot1.gif" width="11" height="11">&nbsp;<a href="#"  onclick="tab3()">计费管理</a>
				</td>
              </tr>   
        </table>
         <page:pager total='<%=count%>' defaultPageSize="6">
		<table width="390"  align="center" style="display:no1ne" id = t1>
		<%
				int step=0;
				for (int i = 0; i < mmsList.size(); i++) {
					Map map = (Map) mmsList.get(i);
					step++;
					if ((step + 1) > index.intValue() && step < (index.intValue() + pageSize.intValue())) {	
					if((i+1)%3 == 1) {
		%>
          <tr>
            <td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../<%=map.get("MMS_PICURL") %>" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle"><a href="mms.action?op=view&user_msn=<ww:property value="['user_msn']"/>&mms_id=<%=map.get("MMS_ID") %>"><img src="../images/mms/buttom_preview.gif" width="41" height="13" border="0" onMouseOver="this.src='../images/mms/buttom_preview01.gif'" onMouseOut="this.src='../images/mms/buttom_preview.gif'"></a></td>
 		  		</tr>
				</table>
			</td>
			<%		
				} 
				if((i+1)%3!=0 && ((i+1)%3!=1))
				{
			%>
			  <td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../<%=map.get("MMS_PICURL") %>" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle"><a href="mms.action?op=view&user_msn=<ww:property value="['user_msn']"/>&mms_id=<%=map.get("MMS_ID") %>"><img src="../images/mms/buttom_preview.gif" width="41" height="13" border="0" onMouseOver="this.src='../images/mms/buttom_preview01.gif'" onMouseOut="this.src='../images/mms/buttom_preview.gif'"></a></td>
 		  		</tr>
				</table>
			</td>
			<%
					}
					if((i+1)%3==0){
			%>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../<%=map.get("MMS_PICURL") %>" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle"><a href="mms.action?op=view&user_msn=<ww:property value="['user_msn']"/>&mms_id=<%=map.get("MMS_ID") %>"><img src="../images/mms/buttom_preview.gif" width="41" height="13" border="0" onMouseOver="this.src='../images/mms/buttom_preview01.gif'" onMouseOut="this.src='../images/mms/buttom_preview.gif'"></a></td>
 		  		</tr>
				</table>
			</td>			
          </tr> 
          <%}}
					}%>    
        </table>
        <table cellspacing="1" cellpadding="3" width="99%" align="center" border="0" id=t11  style="display:no1ne">
                                <form action="?txtitle=&amp;classid=45&amp;nclassid=&amp;announcemode=" method="post">
                                  <tbody>
                                    <tr>
                                      <td height="16"><table cellspacing="0" cellpadding="0" width="100%" border="0">
                                          <tbody>
                                            <tr>
                                              <td><div align="center" class=STYLE9>
                                                  <page:navigator type='SIMPLETEXT' />
                                                </div></td>
                                            </tr>
                                          </tbody>
                                        </table></td>
                                    </tr>
                                  </tbody>
                                </form>
        </table>
                        </page:pager>
       <table width="390"  align="center" style="display:none" id = t2>
       		<tr>
            <td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
		</tr>	
       <tr>
            <td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
		</tr>	
       </table>
        <table width="390"  align="center" style="display:none" id = t3>
       		<tr>
            <td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
		</tr>	
       <tr>
            <td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
			<td align="center" valign="middle">
            	<table id="__01" width="101" height="120" border="0" cellpadding="0" cellspacing="0">			
					<tr>
						<td >	
							<img src="../pic/1/123.jpg" border=0 width=90 height=110>
        			   </td>
					</tr>
				</table>
				<table id="__01" width="101" border="0" cellpadding="0" cellspacing="0">
				<tr>
        		<td align="center" valign="middle">123</td>
 		  		</tr>
				</table>
			</td>
		</tr>	
       </table>
         <table width="390"  align="center" style="display:none" id = t4>
       	<tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2011-06</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;136次
			    </td>
			  </tr>
			  
			  <tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2011-05</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;181次
			    </td>
			  </tr>
			  
			  <tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2011-04</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;167次
			    </td>
			  </tr>
			  
			  <tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2011-03</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;190次
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2011-02</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;393次
			    </td>
			  </tr>
			  <tr>
			    <td width="100%" height="22" colspan="3" class="STYLE9">
			    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2011-01</b>&nbsp;&nbsp;186****3066&nbsp;&nbsp;217次
			    </td>
			  </tr>
       </table>
	  </td>
	  <td>
			<img src="../images/main_12.jpg" width="39" height="511" alt=""></td>
	</tr>
	<tr>
		<td>
			<img src="../images/main_13.jpg" width="41" height="59" alt=""></td>
		<td width="397" height="59" align="right" valign="top" background="../images/main_14.jpg">&nbsp;</td>
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