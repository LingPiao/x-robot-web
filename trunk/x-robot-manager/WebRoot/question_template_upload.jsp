<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="jxl.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />

<%

	String annex_path = "";
	mySmartUpload.initialize(pageContext);
	ServletContext app = (ServletContext)pageContext.getServletContext();
	String servletPath = app.getRealPath("/");
	//System.out.println(servletPath);
	File uploadPath = new File(servletPath + "upload/");
	if (!uploadPath.exists()) {
		uploadPath.mkdirs();
	}

	//�ļ��ϴ�
	mySmartUpload.upload();
	//System.out.println(mySmartUpload.getFiles().getCount());
	for (int i = 0; i < mySmartUpload.getFiles().getCount(); i++)
	{
		com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
		annex_path = "upload/" + String.valueOf(System.currentTimeMillis()) + myFile.getFileName();
		//System.out.println(annex_path);
		if (!myFile.isMissing()) {
    		myFile.saveAs(annex_path);
		}
	}
	
	DataConn dataConn = null;
	InputStream is = null;
	jxl.Workbook rwb = null;

	try {
		
		// �½�һ������
	    dataConn = new DataConn();
	    
		//����Workbook����, ֻ��Workbook����
		//ֱ�Ӵӱ����ļ�����Workbook
		//������������Workbook
		String serpath = servletPath + annex_path;
		is = new FileInputStream(serpath);
		
	
		// �ļ����
		rwb = Workbook.getWorkbook(is);
		Sheet sheet = rwb.getSheet("Sheet1");
		if (sheet == null) {
			throw new Exception("�����ռ������Ӧ����Sheet1��");
		}
		
		int rows = sheet.getRows();
		int cols = sheet.getColumns();
		System.out.println(rows);
		System.out.println(cols);
		//if (cols < 5) {
		//	throw new Exception("�ļ��������ԣ�����ϵ����Ա��");
		//}
		if (rows == 0) {
			throw new Exception("�ļ�û�����ݣ�");
		}
	
		// ���뱨����ϸ��ϸ��
		String sTable = "T_UNICOM_QUESTION";
		int id=0;
		String field_str="";
		String value_str="";
		QueryData query=new QueryData(dataConn);
		InsertData insertData=new InsertData(dataConn);	
		

		field_str = "QUESTIONID,QUESTION,ANSWER,KEYWORD1,KEYWORD2,QUESTION_CLASS,KEYWORD1_NUM";

			String question = "";
			String answer = "";
			String sort = "";
			String mword = "";
			String sword = "";
			int num=0;
			int iReturn=0;
			System.out.println("111111111111111111111111111");
			for (int i = 0; i < rows; i++) {
				id=query.KeyNextValue(sTable,"QUESTIONID");
				//����
				 question = sheet.getCell(0, i).getContents().trim();
				
				//��
				 answer = sheet.getCell(1, i).getContents().trim();
				
				//���
				 sort = sheet.getCell(4, i).getContents().trim();
				
				// ���
				 mword = sheet.getCell(3, i).getContents().trim();
				
				// ����
				 sword = sheet.getCell(2, i).getContents().trim();
				
				 num=(mword.length()-(mword.replace("��","")).length())+1;

				value_str=id+",'"+question+"','"+answer+"','"+mword+"','"+sword+"','"+sort+"','"+num+"'";
				System.out.println(value_str);
				iReturn = insertData.insert(sTable, field_str, value_str);
				if (iReturn == 0) {
					
				}
			}
			response.sendRedirect("question.jsp");
	} catch (Exception e) {
		out.println("<Script Language='javaScript'>");
		out.println("alert('" + e.getMessage() + "')");
		out.println("</Script>");
	} finally {
		if (dataConn != null) {
			dataConn.close();
		}
		if (is != null) {
			is.close();
		}
		if (rwb != null) {
			rwb.close();
		}
		File delFile = new File(servletPath + annex_path);
		if (delFile.exists()) {
			delFile.delete();
		}
	}
	
%>
