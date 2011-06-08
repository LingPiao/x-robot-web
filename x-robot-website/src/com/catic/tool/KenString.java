package com.catic.tool;

/**
 * <p>Title: 处理字符串和其他类型的特殊转换</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author 
 * @version 1.0
 */

public class KenString {

    /**
     * 将整数iSouc
     * @param iSource
     * @param iLen
     * @return
     */
    public static String  toString(int iSource, int iLen) {
        return "";
    }

    public static String arrayToString(String array_str[]) {
        String str = "";
        if (array_str == null) {
            return str;
        }

        for (int i=0; i < array_str.length; i++) {
            str += array_str[i] + ",";
        }
        if (str.length() > 1) {
            str = str.substring(0, str.length()-1);
        }
        return str;
    }

}