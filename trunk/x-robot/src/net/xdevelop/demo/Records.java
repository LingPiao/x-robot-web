// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi 
// Source File Name:   Records.java

package net.xdevelop.demo;

public class Records
{

    String records[][] = {
        {
            "����Ա", "�׳���Ա"
        }, {
            "����Ա", "�ҳ���Ա"
        }, {
            "����Ա", "������Ա"
        }, {
            "����Ա", "������Ա"
        }, {
            "����Ա", "�����Ա"
        }, {
            "����Ա", "������Ա"
        }, {
            "����Ա", "������Ա"
        }, {
            "����Ա", "�����Ա"
        }, {
            "����Ա", "�ɳ���Ա"
        }, {
            "����Ա", "�����Ա"
        }, {
            "�߼�����Ա", "�׸߼�����Ա"
        }, {
            "�߼�����Ա", "�Ҹ߼�����Ա"
        }, {
            "�߼�����Ա", "���߼�����Ա"
        }, {
            "�߼�����Ա", "���߼�����Ա"
        }, {
            "�߼�����Ա", "��߼�����Ա"
        }, {
            "�߼�����Ա", "���߼�����Ա"
        }, {
            "�߼�����Ա", "���߼�����Ա"
        }, {
            "�߼�����Ա", "��߼�����Ա"
        }, {
            "�߼�����Ա", "�ɸ߼�����Ա"
        }, {
            "�߼�����Ա", "��߼�����Ա"
        }, {
            "ϵͳ����Ա", "��ϵͳ����Ա"
        }, {
            "ϵͳ����Ա", "��ϵͳ����Ա"
        }, {
            "ϵͳ����Ա", "��ϵͳ����Ա"
        }, {
            "ϵͳ����Ա", "��ϵͳ����Ա"
        }, {
            "ϵͳ����Ա", "��ϵͳ����Ա"
        }
    };

    public Records()
    {
    }

    public int count(String condition)
    {
        if(condition.equals("����Ա"))
            return 10;
        if(condition.equals("�߼�����Ա"))
            return 10;
        if(condition.equals("ϵͳ����Ա"))
            return 5;
        return !condition.equals("ȫ��") ? 0 : 25;
    }

    public String[][] getRecords(String condition, int index, int num)
    {
        int j = 0;
        if(index > 0)
            index--;
        if(condition == null || condition.equals(""))
            condition = "ȫ��";
        if(condition.equals("����Ա"))
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
        
        if(condition.equals("�߼�����Ա"))
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
        
        if(condition.equals("ϵͳ����Ա"))
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
        
        if(condition.equals("ȫ��"))
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
