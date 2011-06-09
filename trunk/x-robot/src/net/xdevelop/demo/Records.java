// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   Records.java

package net.xdevelop.demo;

public class Records
{

    String records[][] = {
        {
            "程序员", "甲程序员"
        }, {
            "程序员", "乙程序员"
        }, {
            "程序员", "丙程序员"
        }, {
            "程序员", "丁程序员"
        }, {
            "程序员", "戊程序员"
        }, {
            "程序员", "己程序员"
        }, {
            "程序员", "庚程序员"
        }, {
            "程序员", "申程序员"
        }, {
            "程序员", "壬程序员"
        }, {
            "程序员", "癸程序员"
        }, {
            "高级程序员", "甲高级程序员"
        }, {
            "高级程序员", "乙高级程序员"
        }, {
            "高级程序员", "丙高级程序员"
        }, {
            "高级程序员", "丁高级程序员"
        }, {
            "高级程序员", "戊高级程序员"
        }, {
            "高级程序员", "己高级程序员"
        }, {
            "高级程序员", "庚高级程序员"
        }, {
            "高级程序员", "申高级程序员"
        }, {
            "高级程序员", "壬高级程序员"
        }, {
            "高级程序员", "癸高级程序员"
        }, {
            "系统分析员", "甲系统分析员"
        }, {
            "系统分析员", "乙系统分析员"
        }, {
            "系统分析员", "丙系统分析员"
        }, {
            "系统分析员", "丁系统分析员"
        }, {
            "系统分析员", "戊系统分析员"
        }
    };

    public Records()
    {
    }

    public int count(String condition)
    {
        if(condition.equals("程序员"))
            return 10;
        if(condition.equals("高级程序员"))
            return 10;
        if(condition.equals("系统分析员"))
            return 5;
        return !condition.equals("全部") ? 0 : 25;
    }

    public String[][] getRecords(String condition, int index, int num)
    {
        int j = 0;
        if(index > 0)
            index--;
        if(condition == null || condition.equals(""))
            condition = "全部";
        if(condition.equals("程序员"))
        {
            String rec[][];
            if(index + num > 10)
                rec = new String[10 - index][2];
            else
                rec = new String[num][2];
            for(int i = index; i < index + num && i < 10;)
            {
                rec[j][0] = records[i][0];
                rec[j][1] = records[i][1];
                i++;
                j++;
            }

            return rec;
        }
        
        if(condition.equals("高级程序员"))
        {
            String rec[][];
            if(index + num > 20)
                rec = new String[10 - index][2];
            else
                rec = new String[num][2];
            for(int i = 10 + index; i < 10 + index + num && i < 20;)
            {
                rec[j][0] = records[i][0];
                rec[j][1] = records[i][1];
                i++;
                j++;
            }

            return rec;
        }
        
        if(condition.equals("系统分析员"))
        {
            String rec[][];
            if(index + num > 5)
                rec = new String[5 - index][2];
            else
                rec = new String[num][2];
            for(int i = 20 + index; i < 20 + index + num && i < 25;)
            {
                rec[j][0] = records[i][0];
                rec[j][1] = records[i][1];
                i++;
                j++;
            }

            return rec;
        }
        
        if(condition.equals("全部"))
        {
            String rec[][];
            if(index + num > 25)
                rec = new String[25 - index][2];
            else
                rec = new String[num][2];
            for(int i = index; i < index + num && i < 25;)
            {
                rec[j][0] = records[i][0];
                rec[j][1] = records[i][1];
                i++;
                j++;
            }

            return rec;
        } else
        {
            return null;
        }
    }
}
