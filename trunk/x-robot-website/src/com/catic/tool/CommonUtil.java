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
	 *	���ļ������byte���
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
//                        logger.debug("�ַ���ת����UTF-8�ַ�������!");
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
	 *	��byteת�����ַ�����ԭ��ԭ�����ļ���
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

	// ����������ʽ�������� ������(')���ֺ�(;) �� ע�ͷ���(--)�������滻������ֹSQLע�� 
	public static String TransactSQLInjection(String str) {
		return str.replaceAll(".*([';]+|(--)+).*", " ");
	}
	
    /** Unicode ����ת��� �����ַ�
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

    /** �����ַ� ����ת��� Unicode
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
	 * �� null ת��Ϊ ��0������֤�������null
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
     * �� null ת��Ϊ ���ַ�������֤�������null
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
     * ���ַ�����ʽ���� HTML �������
     * @param str Ҫ��ʽ�����ַ���
     * 2004-04-23
     * @return ��ʽ������ַ���
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
