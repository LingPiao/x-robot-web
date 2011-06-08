// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   NavigatorTag.java
package net.xdevelop.taglib.page;
import java.io.IOException;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.TagSupport;
import net.xdevelop.util.StringUtil;

public class NavigatorTag extends TagSupport
{

    private String type;

    public NavigatorTag()
    {
        type = "BUTTON";
    }

    public void setType(String newType)
    {
        type = newType;
    }

    public int doStartTag()
        throws JspException
    {
        try
        {
            String bar = getNavigatorBar(type);
            pageContext.getOut().write(bar);
            int i = 0;
            return i;
        }
        catch(IOException ioe)
        {
            throw new JspException(ioe.getMessage());
        }
    }

    public int doEndTag()
        throws JspException
    {
        return 6;
    }

    private String getNavigatorBar(String type)
    {
        String bar = "";
        String pageNo = ((Integer)pageContext.getAttribute("pageNo")).toString();
        String pages = ((Integer)pageContext.getAttribute("pages")).toString();
        String total = ((Integer)pageContext.getAttribute("total")).toString();
        String pageSize = ((Integer)pageContext.getAttribute("pageSize")).toString();
        String nextDisabled = "";
        String prevDisabled = "";
        if(Integer.parseInt(pageNo) >= Integer.parseInt(pages))
            nextDisabled = "disabled";
        if(Integer.parseInt(pageNo) <= 1)
            prevDisabled = "disabled";
        if(type.equalsIgnoreCase("BUTTON"))
        {
            String pageSizeInput = String.valueOf(String.valueOf((new StringBuffer("<input type='text' size='2' value='")).append(pageSize).append("' ").append("onChange=\"javascript:this.form.choice.value='current';").append("this.form.pageSize.value=this.value;this.form.submit();\">")));
            String firstButton = String.valueOf(String.valueOf((new StringBuffer("<input type='button' value='首  页' ")).append(prevDisabled).append(" ").append("onClick=\"javascript:this.form.choice.value='first';this.form.submit();\">")));
            String prevButton = String.valueOf(String.valueOf((new StringBuffer("<input type='button' value='上一页' ")).append(prevDisabled).append(" ").append("onClick=\"javascript:this.form.choice.value='prev';this.form.submit();\">")));
            String nextButton = String.valueOf(String.valueOf((new StringBuffer("<input type='button' value='下一页' ")).append(nextDisabled).append(" ").append("onClick=\"javascript:this.form.choice.value='next';this.form.submit();\">")));
            String lastButton = String.valueOf(String.valueOf((new StringBuffer("<input type='button' value='最后一页' ")).append(nextDisabled).append(" ").append("onClick=\"javascript:this.form.choice.value='last';this.form.submit();\">")));
            String pageNoInput = String.valueOf(String.valueOf((new StringBuffer("<input type='text' size='3' value='")).append(pageNo).append("' ").append("onChange=\"javascript:this.form.pageNo.value=this.value\">")));
            bar = "每页pageSize条记录 | \n共pages页/total条记录 | \nfirst \n prev \n next \n last \n | 第pageNo页\n <input type='submit' value='go' onClick=\"javascript:this.form.choice.value='current';\">\n";
            bar = StringUtil.replace(bar, "pageSize", pageSizeInput);
            bar = StringUtil.replace(bar, "pages", pages);
            bar = StringUtil.replace(bar, "total", total);
            bar = StringUtil.replace(bar, "first", firstButton);
            bar = StringUtil.replace(bar, "prev", prevButton);
            bar = StringUtil.replace(bar, "next", nextButton);
            bar = StringUtil.replace(bar, "last", lastButton);
            bar = StringUtil.replace(bar, "pageNo", pageNoInput);
        }
        if(type.equalsIgnoreCase("TEXT"))
        {
            String pageSizeInput = String.valueOf(String.valueOf((new StringBuffer("<input type='text' size='2' value='")).append(pageSize).append("' ").append("onChange=\"document.pager.choice.value='current';").append("this.form.pageSize.value=this.value;this.form.submit();\">")));
            String firstText = "首  页";
            String prevText = "上一页";
            String nextText = "下一页";
            String lastText = "最后一页";
            if(prevDisabled.equalsIgnoreCase(""))
            {
                firstText = "<a href='first' onClick=\"javascript:document.pager.choice.value='first';document.pager.submit();return false;\">首  页</a>";
                prevText = "<a href='prev' onClick=\"javascript:document.pager.choice.value='prev';document.pager.submit();return false;\">上一页</a>";
            }
            if(nextDisabled.equalsIgnoreCase(""))
            {
                nextText = "<a href='next' onClick=\"javascript:document.pager.choice.value='next';document.pager.submit();return false;\">下一页</a>";
                lastText = "<a href='last' onClick=\"javascript:document.pager.choice.value='last';document.pager.submit();return false;\">最后一页</a>";
            }
            String pageNoInput = String.valueOf(String.valueOf((new StringBuffer("<input type='text' size='3' size='2' value='")).append(pageNo).append("' ").append("onChange=\"javascript:this.form.pageNo.value=this.value\">")));
            bar = "每页pageSize条记录 | \n共pages页/total条记录 | \nfirst \n prev \n next \n last \n | 第pageNo页\n <input type='submit' value='go' onClick=\"javascript:this.form.choice.value='current';\">\n";
            bar = StringUtil.replace(bar, "pageSize", pageSizeInput);
            bar = StringUtil.replace(bar, "pages", pages);
            bar = StringUtil.replace(bar, "total", total);
            bar = StringUtil.replace(bar, "first", firstText);
            bar = StringUtil.replace(bar, "prev", prevText);
            bar = StringUtil.replace(bar, "next", nextText);
            bar = StringUtil.replace(bar, "last", lastText);
            bar = StringUtil.replace(bar, "pageNo", pageNoInput);
        }
        if(type.equalsIgnoreCase("SIMPLEBUTTON"))
        {
            String pageSizeInput = String.valueOf(String.valueOf((new StringBuffer("<input class='navbar' type='text' size='1' value='")).append(pageSize).append("' ").append("onChange=\"javascript:this.form.choice.value='current';").append("this.form.pageSize.value=this.value;this.form.submit();\">")));
            String prevButton = String.valueOf(String.valueOf((new StringBuffer("<input class='navbar' type='button' value='上一页' ")).append(prevDisabled).append(" ").append("onClick=\"javascript:this.form.choice.value='prev';this.form.submit();\">")));
            String nextButton = String.valueOf(String.valueOf((new StringBuffer("<input class='navbar' type='button' value='下一页' ")).append(nextDisabled).append(" ").append("onClick=\"javascript:this.form.choice.value='next';this.form.submit();\">")));
            String pageNoInput = String.valueOf(String.valueOf((new StringBuffer("<input class='navbar' type='text' size='1' value='")).append(pageNo).append("' ").append("onChange=\"javascript:this.form.pageNo.value=this.value\">")));
            bar = "每页pageSize条记录 | \n共pages页/total条记录 | \n\n prev \n next \n | 第pageNo页\n <input class='navbar' type='submit' value='go' onClick=\"javascript:this.form.choice.value='current';\">\n";
            bar = StringUtil.replace(bar, "pageSize", pageSizeInput);
            bar = StringUtil.replace(bar, "pages", pages);
            bar = StringUtil.replace(bar, "total", total);
            bar = StringUtil.replace(bar, "prev", prevButton);
            bar = StringUtil.replace(bar, "next", nextButton);
            bar = StringUtil.replace(bar, "pageNo", pageNoInput);
        }
        if(type.equalsIgnoreCase("SIMPLETEXT"))
        {
            String pageSizeInput = String.valueOf(String.valueOf((new StringBuffer("<input type='text' size='1' value='")).append(pageSize).append("' ").append("onChange=\"javascript:document.pager.choice.value='current';").append("this.form.pageSize.value=this.value;this.form.submit();\">")));
            String firstText = "首  页";
            String prevText = "上一页";
            String nextText = "下一页";
            String lastText = "最后一页";
            if(prevDisabled.equalsIgnoreCase(""))
            {
                firstText = "<a href='first' onClick=\"javascript:document.pager.choice.value='first';document.pager.submit();return false;\">首  页</a>";
                prevText = "<a href='prev' onClick=\"javascript:document.pager.choice.value='prev';document.pager.submit();return false;\">上一页</a>";
            }
            if(nextDisabled.equalsIgnoreCase(""))
            {
                nextText = "<a href='next' onClick=\"javascript:document.pager.choice.value='next';document.pager.submit();return false;\">下一页</a>";
                lastText = "<a href='last' onClick=\"javascript:document.pager.choice.value='last';document.pager.submit();return false;\">最后一页</a>";
            }
            String pageNoInput = String.valueOf(String.valueOf((new StringBuffer("<input type='text' size='1' value='")).append(pageNo).append("' ").append("onChange=\"javascript:this.form.pageNo.value=this.value\">")));
            bar = "每页pageSize条记录 | \n共pages页/total条记录 | \nprev \n next \n | 第pageNo页\n <input type='submit' value='go' onClick=\"javascript:this.form.choice.value='current';\">\n";
            bar = StringUtil.replace(bar, "pageSize", pageSizeInput);
            bar = StringUtil.replace(bar, "pages", pages);
            bar = StringUtil.replace(bar, "total", total);
            bar = StringUtil.replace(bar, "prev", prevText);
            bar = StringUtil.replace(bar, "next", nextText);
            bar = StringUtil.replace(bar, "pageNo", pageNoInput);
        }
        return bar;
    }
}
