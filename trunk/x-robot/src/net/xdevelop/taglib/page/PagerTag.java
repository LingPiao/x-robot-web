// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   PagerTag.java
package net.xdevelop.taglib.page;
import java.io.IOException;
import java.util.*;
import java.util.Enumeration;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import net.xdevelop.util.ParamUtil;
public class PagerTag extends BodyTagSupport
{

    private StringBuffer output;
    private int pageNo;
    private int pageSize;
    private int index;
    private int pages;
    private String queryString;
    private String prevPage;
    private String nextPage;
    private String currentPage;
    private String firstPage;
    private String lastPage;
    private boolean resume;
    private int total;
    private int defaultPageSize;

    public PagerTag()
    {
        output = new StringBuffer();
        index = 1;
        resume = false;
        total = 0;
        defaultPageSize = 20;
    }

    public void setTotal(int newTotal)
    {
        total = newTotal;
    }

    public void setDefaultPageSize(int newDefaultPageSize)
    {
        defaultPageSize = newDefaultPageSize;
    }

    public int doStartTag()
        throws JspTagException
    {
        output = new StringBuffer();
        resume = false;
        handler();
        return 2;
    }

    public int doAfterBody()
        throws JspTagException
    {
        BodyContent bodyContent = getBodyContent();
        if(bodyContent != null)
        {
            output.append(bodyContent.getString());
            try
            {
                bodyContent.clear();
            }
            catch(IOException ex)
            {
                throw new JspTagException("Fatal IO Error");
            }
        }
        return 0;
    }

    public int doEndTag()
        throws JspTagException
    {
        BodyContent bodyContent = getBodyContent();
        try
        {
            if(bodyContent != null)
            {
                output.append("</form>\n");
                bodyContent.getEnclosingWriter().write(output.toString());
            }
        }
        catch(IOException ex)
        {
            throw new JspTagException("Fatal IO Error");
        }
        return 6;
    }

    public void setVariable()
    {
        pageContext.setAttribute("pageSize", new Integer(pageSize));
        pageContext.setAttribute("pageNo", new Integer(pageNo));
        pageContext.setAttribute("total", new Integer(total));
        pageContext.setAttribute("pages", new Integer(pages));
        pageContext.setAttribute("index", new Integer(index));
    }

    private void handler()
    {
        HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
        StringBuffer paramBuf = new StringBuffer();
        HttpSession session = pageContext.getSession();
        String choice = "";
        HashMap params = new HashMap();
        String requestURI = request.getRequestURI();
        choice = ParamUtil.getParameter(request, "choice");
        if(choice.equals("") && request.getMethod().equals("GET") && request.getQueryString() == null)
        {
            String pageURI = (String)session.getAttribute("pageURI");
            if(request.getRequestURI().equalsIgnoreCase(pageURI))
                resume = true;
            else
                resume = false;
        }
        if(resume)
        {
            Object obj = session.getAttribute("pagerParameters");
            if(obj != null)
            {
                params = (HashMap)obj;
                pageSize = ((Integer)params.get("pageSize")).intValue();
                pageNo = ((Integer)params.get("pageNo")).intValue();
            } else
            {
                pageSize = defaultPageSize;
                pageNo = 1;
            }
            choice = "current";
        } else
        {
            pageSize = ParamUtil.getIntParameter(request, "pageSize", defaultPageSize);
            pageNo = ParamUtil.getIntParameter(request, "pageNo", 1);
        }
        if(pageSize <= 0)
            pageSize = 1;
        pages = total % pageSize != 0 ? total / pageSize + 1 : total / pageSize;
        if(choice.equals("next"))
            pageNo++;
        if(choice.equals("prev"))
            pageNo--;
        if(choice.equals("first"))
            pageNo = 1;
        if(choice.equals("last"))
            pageNo = pages;
        if(pageNo > pages)
            pageNo = pages;
        if(pageNo <= 0)
            pageNo = 1;
        index = (pageNo - 1) * pageSize + 1;
        output.append("<form action='' method='post' name='pager'>\n");
        if(resume)
        {
            Collection co = params.entrySet();
            if(co != null)
            {
                Iterator it = params.entrySet().iterator();
                do
                {
                    if(!it.hasNext())
                        break;
                    java.util.Map.Entry e = (java.util.Map.Entry)it.next();
                    String name = (String)e.getKey();
                    if(!name.equals("pageNo") && !name.equals("pageSize") && !name.equals("choice"))
                    {
                        String value = (String)e.getValue();
                        paramBuf.append(String.valueOf(String.valueOf((new StringBuffer("<input type='hidden' name='")).append(name).append("' value='").append(value).append("'>\n"))));
                    }
                } while(true);
            }
        } else
        {
        	Enumeration aenum = request.getParameterNames();
            do
            {
                if(!aenum.hasMoreElements())
                    break;
                String name = (String)aenum.nextElement();
                String value = ParamUtil.getParameter(request, name);
                params.put(name, value);
                if(!name.equals("pageNo") && !name.equals("pageSize") && !name.equals("choice") && !name.equals("user_msn") && !name.equals("op") && !name.equals("mmsclassid"))
                    paramBuf.append(String.valueOf(String.valueOf((new StringBuffer("<input type='hidden' name='")).append(name).append("' value='").append(value).append("'>\n"))));
            } while(true);
            params.put("pageNo", new Integer(pageNo));
            params.put("pageSize", new Integer(pageSize));
            session.setAttribute("pagerParameters", params);
            session.setAttribute("pageURI", request.getRequestURI());
        }
        paramBuf.append(String.valueOf(String.valueOf((new StringBuffer("<input type='hidden' name='pageNo' value='")).append(pageNo).append("'>\n"))));
        paramBuf.append(String.valueOf(String.valueOf((new StringBuffer("<input type='hidden' name='pageSize' value='")).append(pageSize).append("'>\n"))));
        paramBuf.append(String.valueOf(String.valueOf((new StringBuffer("<input type='hidden' name='choice' value='")).append(choice).append("'>\n"))));
        output.append(paramBuf.toString());
        setVariable();
        if(resume)
        {
            String resend = "<script language='javascript'>document.pager.submit();</script>\n";
            output.append(resend);
        }
    }
}
