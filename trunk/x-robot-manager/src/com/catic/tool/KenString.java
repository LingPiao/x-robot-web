package com.catic.tool;

/**
 * <p>Title: �����ַ������������͵�����ת��</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author 
 * @version 1.0
 */

public class KenString {

    /**
     * ������iSouc
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