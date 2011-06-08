<%@ page pageEncoding="gb2312" contentType="text/html;charset=gb2312"%>
<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="com.opensymphony.xwork.ActionContext,
				 com.wxtd.staticname.StaticFieldName,
				 java.util.*"%>

<%
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0); 
%>	
<html>
<head>
<title>menu</title>
<STYLE ID="JoustStyles" TYPE="text/css">
<!--
	.scrollbar {
		scrollbar-face-color: #cccccc; 
		scrollbar-highlight-color: #ffffff; 
		scrollbar-shadow-color: #ffffff; 
		scrollbar-3dlight-color: #ececec; 
		scrollbar-arrow-color: #000000; 
		scrollbar-track-color: #ffffff; 
		scrollbar-darkshadow-color: #ececec;
		font-size: 12px;
		border: 1px inset #ffffff;
		position: absolute;
	}
	
	A:link { color: #666666; text-decoration: none; }
	A:visited { color: #666666; text-decoration: none; }
	A:active { color: #ff9900; text-decoration: none; }
	A:hover { color: #ff9900; text-decoration: none; }

-->
</STYLE>
<script src=list_nav.js></script>
<script language="JavaScript">

//**********************************************
//菜单参数
	var node = new Array();
	node[0] = -1;
	var delaultTitle;		//默认展开的标题
	var delaultTarget;		//默认打开页面的位置,不定义则弹出新窗口
<%
	ActionContext context = ActionContext.getContext();
	List navs = (List)context.getValueStack().findValue("navs");
	List privileges = (List)session.getAttribute(StaticFieldName.PRIVILEGE);
	Integer userID = (Integer)session.getAttribute(StaticFieldName.USERID);	
		
	String[] level = new String[20];
	HashMap idmapnode = new HashMap();
	level[0] = "-1";
	String isDocument = "Document";
	String defaultMenu = null;
	if (navs != null  && userID != null)
	{
		for(int i = 0, j = 1; i < navs.size(); i++, j++)
		{
			Map nav = (Map)navs.get(i);
			
			String navID = nav.get("NAVIGATIONID").toString();
			String navLevel = nav.get("LEVEL").toString();
			String urlName = nav.get("URLNAME").toString();
			String picLocation = (String)nav.get("PIC_LOCATION");
			String url = "";
			
			if (defaultMenu == null)
				defaultMenu = urlName;
				
			if (nav.get("URL") != null && !"#".equals(nav.get("URL").toString()) &&
				!" ".equals(nav.get("URL").toString()))
				url = nav.get("URL").toString();
					
			if (nav.get("PARENTID") != null)
				level[new Integer(navLevel).intValue()] = nav.get("PARENTID").toString();
			else
				level[new Integer(navLevel).intValue()] = "-1";
				
			//////////判断权限////////////////////
			if (userID.intValue() != 0)
			{
				boolean isPrivilege = false;
		    	for (int k = 0; k < privileges.size(); k++)
			    {	
			        Map priv = (Map)privileges.get(k);
		        
		        	if ((priv != null && priv.get("RESOURCEURL") != null && 
		        	    url.indexOf(priv.get("RESOURCEURL").toString()) != -1) || "".equals(url))
		        	{
	   					isPrivilege = true;
		        		break;
		        	}    
		           
		        }	
				
				if (!isPrivilege)	
					continue;
			}	
			//////////////////////////////////////
				
				
			if (i < navs.size() - 1)
			{
				Map temp = (Map)navs.get(i + 1);
				if (new Integer(navLevel).intValue() < new Integer(temp.get("LEVEL").toString()).intValue())
					isDocument = "Folder";
				else
					isDocument = "Document";
			}
			else
				isDocument = "Document";
			
			String parentID = "0";
			if (idmapnode.get(new Integer(level[new Integer(navLevel).intValue()])) != null)
				parentID = idmapnode.get(new Integer(level[new Integer(navLevel).intValue()])).toString();	
				
			if (navLevel.equals("1"))
			{
%>
				node[<%=j%>]=outlookbar.addtitle("<%=urlName%>");
<%	
			}
			else if (navLevel.equals("2"))
			{
%>		
				node[<%=j%>]=outlookbar.additem("<img src=../<%=picLocation%> border='0'><br>", node[<%=parentID%>], '<%=url%>', '<%=urlName%>');			
<%
			}			
			idmapnode.put(new Integer(navID),new Integer(j));
		}
	}
%>	

delaultTitle = "<%=defaultMenu%>"	//默认展开的标题
delaultTarget = "mainFrame"		//默认打开页面的位置	
//**************************************************
</script>
<body bgcolor="#f6f6f6" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="scrollbar">
<TABLE align="center" class="scrollbar" id=mnuList style="WIDTH: 120px; HEIGHT: 100% ;border: 3px solid #CCCCCC; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr='#000000', endColorStr='#ececec', gradientType='0')" cellSpacing=0 cellPadding=0 border=0 > 
<TBODY>
  <TR> 
	<TD id=outLookBarShow style="HEIGHT: 100%" vAlign=top align=middle name="outLookBarShow"> 
	  <SCRIPT>
		//默认展开项目
		locatefold(delaultTitle, delaultTarget);
		outlookbar.show();
	  </SCRIPT> </TD>
  </TR>
</TBODY></TABLE>
</body>