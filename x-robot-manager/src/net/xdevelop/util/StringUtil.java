// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   StringUtil.java

package net.xdevelop.util;


public class StringUtil
{

    public StringUtil()
    {
    }

    public static final String replace(String line, String oldString, String newString)
    {
        if(line == null)
            return null;
        int i = 0;
        if((i = line.indexOf(oldString, i)) >= 0)
        {
            char line2[] = line.toCharArray();
            char newString2[] = newString.toCharArray();
            int oLength = oldString.length();
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newString2);
            i += oLength;
            int j;
            for(j = i; (i = line.indexOf(oldString, i)) > 0; j = i)
            {
                buf.append(line2, j, i - j).append(newString2);
                i += oLength;
            }

            buf.append(line2, j, line2.length - j);
            return buf.toString();
        } else
        {
            return line;
        }
    }
}
