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
     * 增加数据到对应的Hashtable中
     * 说明:如果Hashtable中已存在该键值，则将新增加的和原来的都封装到列表中。
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
        appendPara(request.getParameterMap());  /**//*追加url对应传递的参数*/
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
     * 不用Hashtable对应的put方法，目的避免覆盖重复的键值
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
     * 输出上传表单信息
     * 
     * @param pw
     */
    protected String getOutPutInfo() {
        StringBuffer sb = new StringBuffer();
        sb.append("<table width=100% border=1>");
        sb.append("<tr><td>参数名</td><td>参数值</td></tr>");
        sb.append(getHashInfo(paratable));
        sb.append(getHashInfo(filetable));
        sb.append("</table>");
        return sb.toString();
    }

    /** *//**
     * 解析字节流
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
     * 获取本次上传对应的表单元素间的分隔符，注意该分隔符是随机生成的
     * @param contentType   
     * @return
     */
    private String getBoundary(String contentType) {
        String tempStr = "";
        if (contentType != null && contentType.startsWith(SIGN_MULTIDATA)
                && contentType.indexOf(SIGN_BOUNDARY) != -1) {
            //获取表单每个元素的分隔符
            tempStr = contentType
                    .substring(
                            contentType.indexOf(SIGN_BOUNDARY)
                                    + SIGN_BOUNDARY.length()).trim();
        }
        return tempStr;
    }

    /** *//**
     * 解析文件上传对应的字节流。实现算法<br>
     * 通过解析ISO8859_1编码方式的字符串后转换成对应上传文件的字节。
     * 通过解析GBK编码方式的字符串后转换成对应上传文件的文件名。
     * 说明:因不清楚字节在不同编码方式下的关系，只好使用两个字符串（比较影响性能，以后优化）
     * @param s   以ISO8859_1编码方式组成的字符串
     * @param s2  以GBK编码方式组成的字符串
     */
    private void readFile(String s, String s2) {
        int filepos = -1;
        if ((filepos = s.indexOf(SIGN_FORMFILE)) >= 0) {
            String realName = readFileName(s2);
            //部分确定上传的是文件而不是任意输入的字符串
            if(!realName.equals("")&& realName.length()>0 && (realName.indexOf(".")>=0)){
                String filepath = readWriteFile(s, realName);
                addElement(filetable, realName, filepath);
            }
        } 
        else {
            /**//*上传的不是文件*/
            if (s.indexOf(SIGN_NOTFILE) >= 0) {
                return;
            }
        }

    }
    
    /** *//**
     * 解析文件上传对应的名称 
     * 实现说明：如果上传的是文件对应格式为:<br>filename="文件名"</br> 格式
     * 通过处理可以拆分出对应的文件名  
     * @param s   以GBK编码方式组成的包含文件名的字符串
     * @return    对应上传文件的文件名（不包括文件路径）
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
     * 通过解析ISO8859_1编码方式的字符串后转换成对应上传文件的字节。
     * 实现算法说明：文件名转化后的字节和具体的文件字节中间是以两个重复的两个字符隔开，
     * 对应char值为13,10,转换后的字符对应的最后四个字符也是格式字符，获取对应中间的字节即为
     * 上传文件的真正的字节数
     * @param s        以ISO8859_1编码方式组成的包含文件名和具体文件字节的字符串
     * @param realName  对应的文件名
     * @return          对应生成的文件名包括全路径
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
     * 解析提交过来的表单元素对应的名称以及值<br> 
     * 实现说明：如果表单元素的是对应格式为:<br>name="表单元素名"</br> 格式
     * 表单元素名和具体的输入值中间是以两个重复的两个字符隔开，
     * 对应char值为13,10,转换后的字符对应的最后四个字符也是格式字符，获取对应中间的字符即为
     * 表单元素的输入值
     * 通过处理可以拆分出对应的表单元素名以及输入值  
     * @param s   以GBK编码方式组成的包含表单元素名和值的字符串    
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
