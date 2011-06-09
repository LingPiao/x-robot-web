// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   PageTEI.java
package net.xdevelop.taglib.page.tei;

import javax.servlet.jsp.tagext.*;

public class PageTEI extends TagExtraInfo
{

    public PageTEI()
    {
    }

    public VariableInfo[] getVariableInfo(TagData data)
    {
        return (new VariableInfo[] {
            new VariableInfo("pageSize", "java.lang.Integer", true, 0), new VariableInfo("pageNo", "java.lang.Integer", true, 0), new VariableInfo("pages", "java.lang.Integer", true, 0), new VariableInfo("index", "java.lang.Integer", true, 0), new VariableInfo("total", "java.lang.Integer", true, 0)
        });
    }
}
