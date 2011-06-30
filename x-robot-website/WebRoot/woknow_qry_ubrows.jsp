<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" type=text/css rel=stylesheet>
<%@ include file="header.jsp" %> 
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="top" align="left" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <%@ include file="top.jsp" %>
    </table></td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><table width="80%" border="0" cellspacing="2" cellpadding="2">
          <tr>
            <td width="100%" height="40" align="center" valign="bottom">&nbsp;</td>
          </tr>
          
          
          <tr>
            <td align="center" valign="top"><table width="100%" cellpadding="0" cellspacing="0" width　border="0">
      
              <tr>
                <td valign="top"align="center" class="by_bg"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr> </tr>
                  <tr>
                    <td><table width="100%"  border="0" align="left" cellpadding="4" cellspacing="0">
                        
                        <ww:iterator value="ansList" status="row">
                        <tr>
                          <td align="left">&nbsp;</td>
                        </tr>
                        <tr>
                          	<td align="left" class="qbc">
								问题描述&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
                        </tr>
                        <tr>
                          <td align="left"><span class="content2">
									&nbsp;&nbsp;&nbsp;&nbsp;<ww:property value="['QUESTION']"/>
						</td>
						</tr>
						<tr>
                          <td align="left">&nbsp;</td>
                        </tr>
                        <tr>
                          	<td align="left" class="qbc">
								问题回复&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
                        </tr>
                        <tr>
                          <td align="left"><span class="content2">
									&nbsp;&nbsp;&nbsp;&nbsp;<ww:property value="['ANSWER']"/>
						</td>
						</tr>
                        </ww:iterator>
                       
                    </table></td>
                  </tr>
                  <TR>
										<TD colspan="2" align="center" height="50px">
									
										<input type="button" name="Submit" value="关闭" class="button" onclick="window.close();"/>
										
									</TD>
									</TR>
                </table></td>
              </tr>
              
            </table></td>
          </tr>
          
          
        </table></td>
      </tr>
      
      <tr>
        <td align="center" class="a1"><br />
          <br /></td>
      </tr>
       <%@ include file="buttom.jsp" %>
    </table></td>
  </tr>
</table>
</body>
</html>
