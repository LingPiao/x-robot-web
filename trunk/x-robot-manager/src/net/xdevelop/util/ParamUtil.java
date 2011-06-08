// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   ParamUtil.java
package net.xdevelop.util;

import javax.servlet.ServletRequest;

public class ParamUtil
{

    public ParamUtil()
    {
    }

    public static String getParameter(ServletRequest request, String paramName)
    {
        String temp = request.getParameter(paramName);
        if(temp != null && !temp.equals(""))
        {
            try
            {
                temp = new String(temp.getBytes("8859_1"), "GB2312");
            }
            catch(Exception e)
            {
                String s = "";
                return s;
            }
            return temp;
        } else
        {
            return "";
        }
    }

    public static int getIntParameter(ServletRequest request, String paramName, int defaultNum)
    {
        String temp = request.getParameter(paramName);
        if(temp != null && !temp.equals(""))
        {
            int num = defaultNum;
            try
            {
                num = Integer.parseInt(temp);
            }
            catch(Exception exception) { }
            return num;
        } else
        {
            return defaultNum;
        }
    }
}
