<%@page contentType="text/html;charset=gb2312" %>
<%@ page import="com.catic.tool.*"%>
<%@ page import="com.catic.bean.*"%>
<%@ include file="../session.jsp"%>
<% 
	response.setHeader("Pragma","No-cache"); 
	response.setHeader("Cache-Control","no-cache"); 
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("gb2312");
    response.setCharacterEncoding("gb2312");
    
 
    com.jspsmart.upload.SmartUpload mySmartUpload = new com.jspsmart.upload.SmartUpload();
    mySmartUpload.initialize(pageContext);
    mySmartUpload.upload();
	
	MmsManagerAction mmAction = new MmsManagerAction();
	String mms_category = "";
	String mms_title = "";
	String action = mySmartUpload.getRequest().getParameter("action");
	if(action!= null)
	{
		//System.out.println(action);
		if (action.equals("add"))
		{	
			 mms_category = mySmartUpload.getRequest().getParameter("mms_category");
			 mms_title = new String(mySmartUpload.getRequest().getParameter("mms_title").getBytes("8859_1"));
			 com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
			String ext = myFile.getFileExt();	
			String AllowedUploadList="gif,jpg,GIF,JPG";
			if(AllowedUploadList.indexOf(ext)>=0 && myFile.getSize()>0)
			{
				ServletContext app = (ServletContext)pageContext.getServletContext();
				String strSysPath = app.getRealPath("/")+"\\pic";
				String strSavePath = "pic";
				if(mmAction.InsertAndUpload(strSysPath,strSavePath,myFile,mms_category,mms_title))
				{
					out.println("<script>alert('����ɹ���');window.location.href='mms.jsp';</script>");
				}
				else
				{
					out.println("<script>alert('����ʧ�ܣ�');window.location.href='mms.jsp';</script>");			
				}
			}
			else
			{
				out.println("<script>alert('�ϴ�������Ч����ѡ��gif,jpg,GIF,JPG�����ļ���');window.location.href='mms.jsp';</script>");	
			}
		}
		if (action.equals("edit"))
		{
			mms_category = mySmartUpload.getRequest().getParameter("mms_category");		
			mms_title = new String(mySmartUpload.getRequest().getParameter("mms_title").getBytes("GBK"),"utf-8");
			com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
			String ext = myFile.getFileExt();	
			String AllowedUploadList="gif,jpg,GIF,JPG";
			//uploadornot�ж��Ƿ������ϴ��ļ��������ϴ���uploadornotֵΪ1������Ϊ0
			String uploadornot = mySmartUpload.getRequest().getParameter("uploadornot");
			String mms_id = mySmartUpload.getRequest().getParameter("mms_id");
			System.out.println(uploadornot);
			//1��ʾ�����ϴ��ļ�
			if(uploadornot.equals("1"))
			{
				//�����ϴ��ļ����ļ��Ƿ����
				if(myFile.getSize()>0)
				{
					if(AllowedUploadList.indexOf(ext)>=0)
					{
						ServletContext app = (ServletContext)pageContext.getServletContext();
						String  strSysPath = app.getRealPath("/")+"\\pic";
						String strSavePath = "pic";
						if(mmAction.UpdateAndUpload(strSysPath,strSavePath,myFile,mms_id,mms_category,mms_title))
						{
							out.println("<script>alert('�޸ĳɹ���');window.location.href='mms.jsp';</script>");
						}
						else
						{
							out.println("<script>alert('�޸�ʧ�ܣ�');window.location.href='mms.jsp';</script>");			
						}
					}
					else
					{
						out.println("<script>alert('�ϴ�������Ч����ѡ��gif,jpg,GIF,JPG�����ļ���');window.location.href='mms.jsp';</script>");	
					}
				}
			}
			else
			{
				if(mmAction.update(mms_id,mms_category,mms_title))
				{
					out.println("<script>alert('�޸ĳɹ���');window.location.href='mms.jsp';</script>");
				}
				else
				{
					out.println("<script>alert('�޸�ʧ�ܣ�');window.location.href='mms.jsp';</script>");			
				}
			}
			
		}
	}

%>