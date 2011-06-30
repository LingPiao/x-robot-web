<%@ page pageEncoding="GBK" contentType="text/html;charset=GBK"%>
<%@ taglib prefix="ww" uri="webwork"%>
	<ww:if test="userid==null">
	<tr>
        <td width="7%" align="left" valign="top">&nbsp;</td>
        <td width="16%" align="right" valign="bottom"><img src="images/logo.jpg" width="175" height="84" /></td>
        <td width="56%" valign="bottom" align="left"><table width="40%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="woknow_main.action?chanel=other" class="a4">“沃”知道</a></td>
            <!-- td align="center"><a href="#" class="a4">联通贝贝</a></td -->
            <td align="center"><a href="10.html" class="a4">设置好友</a></td>
          </tr>
        </table></td>
        <td width="21%" align="right" valign="bottom"><a href="index.action" class="a1">首页</a>　｜　<a href="login.jsp" class="a1">登录</a>　｜　<a href="regist.jsp" class="a1">注册</a>　｜　<a href="faq.action" class="a1">帮助</a>&nbsp;&nbsp;</td>
      </tr>
     </ww:if>
     <ww:else>
     <tr>
        <td width="7%" align="left" valign="top">&nbsp;</td>
        <td width="16%" align="right" valign="bottom"><a href="index.action"><img src="images/logo.jpg" width="175" height="84" border="0" /></a></td>
        <td width="40%" valign="bottom" align="left"><table width="40%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="woknow_main.action?chanel=other" class="a4">“沃”知道</a></td>
            <!-- td align="center"><a href="#" class="a4">联通贝贝</a></td -->
            <td align="center"><a href="10.html" class="a4">设置好友</a></td>
          </tr>
        </table></td>
        <td width="35%" align="right" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="1%" height="22" align="right"></td>
              <td width="99%" align="left" valign="middle"><ww:property value="['nickname']"/><ww:if test="usermobile!=null && !usermobile.equals(\"\")">[<ww:property value="['usermobile'].substring(0,3)"/>****<ww:property value="['usermobile'].substring(7,11)"/>]</ww:if>：您好！｜<ww:if test="usermobile!=null && !usermobile.equals(\"\")"><a href="bindmobile.action?op=unbind" class="a1">取消绑定</a>｜</ww:if><ww:else><a href="bindmobile.action?op=bind" class="a1">绑定手机</a>｜</ww:else><a href="index.action" class="a1">首页</a>｜<a href="faq.action" class="a1">帮助</a>｜<a href="index.action?op=logout" class="a1">退出</a></td>
            </tr>
            
                </table></td>
      </tr>
     </ww:else>