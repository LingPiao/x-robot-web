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
  //����img�ֶ����ݵ�in     
  InputStream   in   =   rs.getBinaryStream("mms_content");     
    
  //���¿����κδ���,������ҳ�����:     
    
  response.reset();     
  //�˴���image/jpeg�ƺ�����ʾ��ͼƬ��ʽ�޹�     
  //��Ϊ����ʾjsp��gif��û�д���     
  response.setContentType("image/jpeg");     
  byte[]   b   =   new   byte[1024];     
  int   len;     
  while((len=in.read(b))   >0)     
  response.getOutputStream().write(b,0,len);     
    
  in.close();     
  rs.close();     
  %>   
