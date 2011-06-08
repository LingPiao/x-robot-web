 <%@   page   language="java"   import="java.sql.*"%>     
  <%@   page   import="java.io.*"%>     
  <%@   page   contentType="text/html;charset=gb2312"%>     
    
  <%     
  Class.forName("oracle.jdbc.driver.OracleDriver");     
  String   url="jdbc:oracle:thin:@192.168.0.5:1521:db";     
  String   image_id   =   (String)   request.getParameter("ID");     
    
  Connection   con=DriverManager.getConnection(url,"unicom","unicom");     
  PreparedStatement   sql=con.prepareStatement("select   *   from   sms_mms   WHERE   mms_id   =  28");     
  ResultSet   rs   =   sql.executeQuery();     
    
  rs.next();     
  //输入img字段内容到in     
  InputStream   in   =   rs.getBinaryStream("mms_content");     
    
  //以下可是任何处理,比如向页面输出:     
    
  response.reset();     
  //此处的image/jpeg似乎与显示的图片格式无关     
  //因为我显示jsp和gif都没有错误     
  response.setContentType("image/jpeg");     
  byte[]   b   =   new   byte[1024];     
  int   len;     
  while((len=in.read(b))   >0)     
  response.getOutputStream().write(b,0,len);     
    
  in.close();     
  rs.close();     
  %>   
