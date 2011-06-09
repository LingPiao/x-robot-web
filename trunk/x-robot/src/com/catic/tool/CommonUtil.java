package com.catic.tool;

/**
 * @author mikko
 * @filename DataConn.java
 * @date 2008-5-30
 */
public class CommonUtil {
	public CommonUtil() {

	}

	/**
	 *	将文件名变成byte组合
	 */
	public String getByteStr(String filename) {
		String str = "";
		try {
			byte[] bt = filename.getBytes("gbk");
			for (int i = 0; i < bt.length; i++)
				str += bt[i] + "_";
		} catch (Exception e) {
			System.out.println(e + "      :getByteStr");
		}
		return str;
	}
	public static String toUtf8String(String s)
    {

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < s.length(); i++)
        {
            char c = s.charAt(i);
            // System.out.println(c);
            if ( c >= 0 && c <= 255 )
            {
                sb.append(c);
            }
            else
            {
                byte [ ] b;
                try
                {
                    b = Character.toString(c).getBytes("utf-8");
                }
                catch (Exception ex)
                {
//                    if ( logger.isDebugEnabled() )
//                    {
//                        logger.debug("字符串转换成UTF-8字符集出错!");
//                    }
                    b = new byte [ 0 ];
                }
                for (int j = 0; j < b.length; j++)
                {
                    int k = b[j];
                    if ( k < 0 )
                        k += 256;
                    sb.append("%" + Integer.toHexString(k).toUpperCase());
                }
            }
        }
        return sb.toString();
    }
	/**
	 *	将byte转换的字符串还原成原来的文件名
	 */
	public String getReturnFileName(String filename) {
		try {
			if (filename == null
					|| (filename != null && filename.indexOf("_") == -1)) {
				return "";
			}
			String a[] = filename.split("_");
			byte b[] = new byte[a.length];

			for (int i = 0; i < a.length; i++) {
				b[i] = Byte.valueOf(a[i]);
			}
			return new String(b, "gbk");
		} catch (Exception e) {
			System.out.println(e + "      :getReturnFileName");
			return "";
		}
	}

	// 采用正则表达式将包含有 单引号(')，分号(;) 和 注释符号(--)的语句给替换掉来防止SQL注入 
	public static String TransactSQLInjection(String str) {
		return str.replaceAll(".*([';]+|(--)+).*", " ");
	}
	
    /** Unicode 编码转变成 中文字符
     * @Functionality:
     * @param strvalue
     * @return
     */
    public static String toGBK(String strvalue) {
        try{
            if(strvalue == null || strvalue.equals("")) {
                return "";
            }
            else {
                strvalue = new String(strvalue.getBytes("ISO-8859-1"), "gbk");
            }
            return strvalue;
        } //TRY END
        catch(Exception e){
            return "";
        }
    }

    /** 中文字符 编码转变成 Unicode
     * @Functionality:
     * @param strvalue
     * @return
     */
    public static String toUnicode(String strvalue) {
        if(strvalue==null || strvalue.equals("")) {
            return "";
        } else {
            return strvalue;
        }
    }

    

	/**
	 * 把 null 转变为 “0”；保证不会出现null
	 * @param sqlstr
	 * @return
	 */
	public static String toZeroStr(String str) {
		String strsql = "";
		try {
			if ((str == null) || (str.equals(""))) {
				strsql = "0";
			} else {
				strsql = str;
			}
		} catch (java.lang.Exception e) {
		}
		return strsql;
	}
    
    /**
     * 把 null 转变为 空字符串；保证不会出现null
     * @param sqlstr
     * @return
     */
    public static String toSpaceStr(String str) {
        String strsql = "";
        try {
            if ((str == null) || (str.equals("")) ) {
                strsql = "";
            }
            else {
                strsql = str;
            }
        }catch(java.lang.Exception e){}
        return strsql;
    }

    /**
     * 将字符串格式化成 HTML 代码输出
     * @param str 要格式化的字符串
     * 2004-04-23
     * @return 格式化后的字符串
     */
    public static String toHtml(String str) {
        String html = "";
        try {
            html = str;
            html = html.replaceAll("&", "&amp;");
            html = html.replaceAll("<", "&lt;");
            html = html.replaceAll(">", "&gt;");
            html = html.replaceAll("\r\n", "\n");
            html = html.replaceAll("\n", "<br>\n");
            html = html.replaceAll("\t", "    ");
            html = html.replaceAll("  ", " &nbsp;");
        }catch(java.lang.Exception e){ }
        return html;
    }
    public static String Htmlto(String str) {
        String html = "";
        try {
            html = str;
            html = html.replaceAll("&amp;", "&");
            html = html.replaceAll("&lt;", "<");
            html = html.replaceAll("&gt;", ">");
            html = html.replaceAll("\n", "\r\n");
            html = html.replaceAll("<br>\n", "\n");
            html = html.replaceAll("    ", "\t");
            html = html.replaceAll(" &nbsp;", "  ");
        }catch(java.lang.Exception e){ }
        return html;
    }
}
