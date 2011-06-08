// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   StringUtil.java

package com.catic.tool;

public class StringUtil
{

    public StringUtil()
    {
    }

    public boolean CheckInputStr(String str) 
    {
      // String inj_str = "'|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare|;|or|-|+|,";
      // String inj_stra[] = inj_str.split("|");
       String inj_stra[] = {"'","and","exec","insert","select","delete","update","count","*","%","chr","mid","master","truncate","char","declare",";","or","-","+",","};
       for (int i=0 ; i < inj_stra.length ; i++ )
       {
           if (str.indexOf(inj_stra[i])>=0)
           {
               return true;
           }
       }
       return false;
    }
    public static void main(String[] ages){
    	//System.out.print(StringUtil.sql_inj("dasdsa"));
    	//System.out.print(StringUtil.sql_inj("dasdsa"));
    }

}
