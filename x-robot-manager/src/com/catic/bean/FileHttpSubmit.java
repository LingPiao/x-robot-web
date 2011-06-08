package com.catic.bean;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FileHttpSubmit extends HttpServlet {

    public final static String DEFAULT_ENCODING = "ISO8859_1";

    public final static String CHINESE_ENCODING = "GBK";

    public final static String SIGN_BOUNDARY = "boundary=";

    public final static String SIGN_FORMELEMENT = "name=";

    public final static String SIGN_FORMFILE = "filename=";

    public final static String SIGN_NOTFILE = "application/octet-stream";

    public final static String SIGN_MULTIDATA = "multipart/form-data";

    public final static String CHINESE_CONTENTTYPE = "text/html; charset=GBK";

    private Hashtable paratable = new Hashtable();

    private Hashtable filetable = new Hashtable();

    private String strBoundary = "";
    
    private String strSavePath="";
    

    private static void println(String s) {
        System.out.println(s);
    }
    
    
    

    /** *//**
     * �������ݵ���Ӧ��Hashtable��
     * ˵��:���Hashtable���Ѵ��ڸü�ֵ���������ӵĺ�ԭ���Ķ���װ���б��С�
     * @param table    
     * @param paraName
     * @param paraValue
     */
    private static void addElement(Hashtable table, String paraName,
            Object paraValue) {
        ArrayList list = new ArrayList();
        if (table.containsKey(paraName)) {
            Object o = table.get(paraName);
            if (o instanceof List) {
                ((List) o).add(paraValue);
            } else {
                list.add(o);
                list.add(paraValue);
                o = list;
            }
            table.put(paraName, o);
        } else {
            table.put(paraName, paraValue);
        }
    }

    public static String getHashInfo(Hashtable paratable){
        StringBuffer sb=new StringBuffer();
        Set keySet=paratable.keySet();
        Iterator it=keySet.iterator();
        while(it.hasNext()){
            
            Object keyobj=it.next();
            Object valueobj=paratable.get(keyobj);
            
            sb.append("<tr>");
            sb.append("<td>"+keyobj.toString()+"</td>");
            if(valueobj instanceof List){
                sb.append("<td>");
                int isize=((List)valueobj).size();
                for(int i=0;i<isize;i++){
                    Object tempobj=((List)valueobj).get(i);
                    if(i<isize-1){
                       sb.append(tempobj.toString()+",");
                    }
                    else{
                       sb.append(tempobj.toString());
                    }
                }
                
                sb.append("</td>");
            }
            else{
                sb.append("<td>"+valueobj.toString()+"</td>");
            }
            sb.append("</tr>");
        }
        return sb.toString();
    }
    
    
    private static byte[] getfileBytes(InputStream is) {
        List byteList = new ArrayList();
        byte[] filebyte = null;
        int readbyte = 0;
        try {
            while ((readbyte = is.read()) != -1) {
                byteList.add(new Byte((byte) readbyte));
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        filebyte = new byte[byteList.size()];
        for (int i = 0; i < byteList.size(); i++) {
            filebyte[i] = ((Byte) byteList.get(i)).byteValue();
        }
        return filebyte;

    }
    
    

    
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
        //HttpRequest r=null;
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        paratable = new Hashtable();
        filetable = new Hashtable();
        strSavePath=this.getInitParameter("savepath");
        File file=new File(strSavePath);
        if(!file.exists()){
            file.mkdirs();
        }
        String contentType = request.getContentType();    
        strBoundary = getBoundary(contentType);
        ServletInputStream sis = request.getInputStream();
        BufferedInputStream bis = new BufferedInputStream(sis);
        parseInputStream(bis);
        appendPara(request.getParameterMap());  /**//*׷��url��Ӧ���ݵĲ���*/
        response.setContentType(CHINESE_CONTENTTYPE);
        
//        response.getWriter().write(getOutPutInfo());
//        response.getWriter().write(new String(getfileBytes(sis),"GBK"));
        bis.close();
        sis.close();
        request.setAttribute("para",paratable);
        request.setAttribute("file",filetable);
        
        this.getServletContext().getRequestDispatcher("/result.jsp").
        forward(request,response);
        
    }
    
    
    /** *//**
     * ����Hashtable��Ӧ��put������Ŀ�ı��⸲���ظ��ļ�ֵ
     * @return
     */
    private void appendPara(Map map){
        
        if(map!=null){
            Set keySet=map.keySet();
            Iterator it=keySet.iterator();
            while(it.hasNext()){
                Object keyobj=it.next();
                String[] valueobj=(String[])map.get(keyobj);
                println("keyobj===="+keyobj);
                println("valueobj===="+valueobj);
                for(int i=0;i<valueobj.length;i++){
                    addElement(paratable,(String)keyobj,valueobj[i]);
                }
            }
        }
    }
    
    

    /** *//**
     * ����ϴ�����Ϣ
     * 
     * @param pw
     */
    protected String getOutPutInfo() {
        StringBuffer sb = new StringBuffer();
        sb.append("<table width=100% border=1>");
        sb.append("<tr><td>������</td><td>����ֵ</td></tr>");
        sb.append(getHashInfo(paratable));
        sb.append(getHashInfo(filetable));
        sb.append("</table>");
        return sb.toString();
    }

    /** *//**
     * �����ֽ���
     * @param is
     */
    private void parseInputStream(InputStream is) {
        byte[] sizes = getfileBytes(is);
        int icount = 0;
        String s = "";
        int readbyte = 0;
        String reals;
        try {
            reals = new String(sizes, DEFAULT_ENCODING);
            String realsvalue = new String(sizes, CHINESE_ENCODING);
            String[] arrs = reals.split(strBoundary);
            String[] arrsvalue = realsvalue.split(strBoundary);
            for (int i = 0; i < arrs.length; i++) {
                String tempStr = arrs[i];
               String tempStr2 = arrsvalue[i];
                if (tempStr.indexOf(SIGN_FORMFILE) >= 0) {
                    readFile(tempStr, tempStr2);
                } else {
                    readParameter(tempStr2);
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

    }

    /** *//**
     * ��ȡ�����ϴ���Ӧ�ı�Ԫ�ؼ�ķָ�����ע��÷ָ�����������ɵ�
     * @param contentType   
     * @return
     */
    private String getBoundary(String contentType) {
        String tempStr = "";
        if (contentType != null && contentType.startsWith(SIGN_MULTIDATA)
                && contentType.indexOf(SIGN_BOUNDARY) != -1) {
            //��ȡ��ÿ��Ԫ�صķָ���
            tempStr = contentType
                    .substring(
                            contentType.indexOf(SIGN_BOUNDARY)
                                    + SIGN_BOUNDARY.length()).trim();
        }
        return tempStr;
    }

    /** *//**
     * �����ļ��ϴ���Ӧ���ֽ�����ʵ���㷨<br>
     * ͨ������ISO8859_1���뷽ʽ���ַ�����ת���ɶ�Ӧ�ϴ��ļ����ֽڡ�
     * ͨ������GBK���뷽ʽ���ַ�����ת���ɶ�Ӧ�ϴ��ļ����ļ�����
     * ˵��:������ֽ��ڲ�ͬ���뷽ʽ�µĹ�ϵ��ֻ��ʹ�������ַ������Ƚ�Ӱ�����ܣ��Ժ��Ż���
     * @param s   ��ISO8859_1���뷽ʽ��ɵ��ַ���
     * @param s2  ��GBK���뷽ʽ��ɵ��ַ���
     */
    private void readFile(String s, String s2) {
        int filepos = -1;
        if ((filepos = s.indexOf(SIGN_FORMFILE)) >= 0) {
            String realName = readFileName(s2);
            //����ȷ���ϴ������ļ�����������������ַ���
            if(!realName.equals("")&& realName.length()>0 && (realName.indexOf(".")>=0)){
                String filepath = readWriteFile(s, realName);
                addElement(filetable, realName, filepath);
            }
        } 
        else {
            /**//*�ϴ��Ĳ����ļ�*/
            if (s.indexOf(SIGN_NOTFILE) >= 0) {
                return;
            }
        }

    }
    
    /** *//**
     * �����ļ��ϴ���Ӧ������ 
     * ʵ��˵��������ϴ������ļ���Ӧ��ʽΪ:<br>filename="�ļ���"</br> ��ʽ
     * ͨ��������Բ�ֳ���Ӧ���ļ���  
     * @param s   ��GBK���뷽ʽ��ɵİ����ļ������ַ���
     * @return    ��Ӧ�ϴ��ļ����ļ������������ļ�·����
     */
    private String readFileName(String s) {
        int filepos = s.indexOf(SIGN_FORMFILE);
        String tempstr = s.substring(filepos + SIGN_FORMFILE.length() + 1);
        int iendpos = tempstr.indexOf("\"");
        String fileName = tempstr.substring(0, iendpos);
        int ifilenamepos = fileName.lastIndexOf("\\");
        String realName = fileName.substring(ifilenamepos + 1);        
        return realName;

    }

    /** *//**
     * ͨ������ISO8859_1���뷽ʽ���ַ�����ת���ɶ�Ӧ�ϴ��ļ����ֽڡ�
     * ʵ���㷨˵�����ļ���ת������ֽں;�����ļ��ֽ��м����������ظ��������ַ�������
     * ��ӦcharֵΪ13,10,ת������ַ���Ӧ������ĸ��ַ�Ҳ�Ǹ�ʽ�ַ�����ȡ��Ӧ�м���ֽڼ�Ϊ
     * �ϴ��ļ����������ֽ���
     * @param s        ��ISO8859_1���뷽ʽ��ɵİ����ļ����;����ļ��ֽڵ��ַ���
     * @param realName  ��Ӧ���ļ���
     * @return          ��Ӧ���ɵ��ļ�������ȫ·��
     */
    private String readWriteFile(String s, String realName) {
        int filepos = s.indexOf(SIGN_FORMFILE);
        String tempstr = s.substring(filepos + SIGN_FORMFILE.length() + 1);
        int icount = 0;
        while (true) {
            int charnum = tempstr.charAt(icount);
            int charnum2 = tempstr.charAt(icount + 1);
            int charnum3 = tempstr.charAt(icount + 2);
            int charnum4 = tempstr.charAt(icount + 3);
            if (charnum == 13 && charnum2 == 10 && charnum3 == 13
                    && charnum4 == 10) {
                break;
            }
            icount++;
        }
        String filevalue = tempstr.substring(icount + 4, tempstr.length() - 4);
        FileOutputStream fos = null;
        String createName=strSavePath + realName;
        File uploadfile = new File(createName);        
        String shortname=realName.substring(0,realName.lastIndexOf("."));
        String filetype=realName.substring(realName.lastIndexOf(".")+1);
        int namecount=1;
        while(uploadfile.exists()){            
            createName=strSavePath+shortname+"["+namecount+"]"+"."+filetype;
            uploadfile=new File(createName);
            namecount++;
            
        }
        try {
            byte[] filebytes = filevalue.getBytes(DEFAULT_ENCODING);
            fos = new FileOutputStream(uploadfile);
            fos.write(filebytes);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
       } catch (IOException e1) {

            e1.printStackTrace();
        } finally {
            try {
                fos.close();
            } catch (IOException e2) {

                e2.printStackTrace();
            }
        }

        return createName;
    }

    
    /** *//**
     * �����ύ�����ı�Ԫ�ض�Ӧ�������Լ�ֵ<br> 
     * ʵ��˵���������Ԫ�ص��Ƕ�Ӧ��ʽΪ:<br>name="��Ԫ����"</br> ��ʽ
     * ��Ԫ�����;��������ֵ�м����������ظ��������ַ�������
     * ��ӦcharֵΪ13,10,ת������ַ���Ӧ������ĸ��ַ�Ҳ�Ǹ�ʽ�ַ�����ȡ��Ӧ�м���ַ���Ϊ
     * ��Ԫ�ص�����ֵ
     * ͨ��������Բ�ֳ���Ӧ�ı�Ԫ�����Լ�����ֵ  
     * @param s   ��GBK���뷽ʽ��ɵİ�����Ԫ������ֵ���ַ���    
     */    
    private void readParameter(String s) {
        String paraName = "";
        String paraValue = "";
        int istartlen = -1;
        int iendlen = -1;

        if ((istartlen = s.indexOf(SIGN_FORMELEMENT)) >= 0) {
            String tempstr = s.substring(istartlen + SIGN_FORMELEMENT.length()
                    + 1);
            int nameindex = tempstr.indexOf("\"");
            paraName = tempstr.substring(0, nameindex);
            paraValue = tempstr.substring(nameindex + 5, tempstr.length() - 4);
            addElement(paratable, paraName, paraValue);
        }
    }

}
