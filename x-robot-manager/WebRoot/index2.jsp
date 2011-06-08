<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="net.sf.robot.util.message.InstanceMessage"%>
<%@ page import="net.sf.robot.util.service.impl.Queue"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  
  <body>
  
  
  <form action="MyJsp.jsp">
  	<input type='text' name=''/>
  
  </form>
    <% 
    	
					InstanceMessage msg = new InstanceMessage("www.10010.com@hotmail.com", 
							"gmzlzhl@live.cn", "11111111111111");
					msg.setColor(0xFF0000);
					msg.setRequest(false);
					
					Queue.pushResponse(msg);
    
    %>
  </body>
</html>
