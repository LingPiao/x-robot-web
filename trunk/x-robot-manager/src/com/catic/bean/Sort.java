package com.catic.bean;

import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;

public class Sort {
    /** */
    /**
    * �ļ�ת��Ϊ�ֽ����� file �ļ���·��(c:\\pet.txt��c�̵�pet.txt���ļ�ת����byte[]�ֽ���)
    */
    public static byte[] getBytesFromFile(String file) {
        File f = new File(file);
        if (f == null) {
            return null;
        }
        try {
            FileInputStream stream = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream(1000);
            byte[] b = new byte[1000];
            int n;
            while ((n = stream.read(b)) != -1)
                out.write(b, 0, n);
            stream.close();
            out.close();
            return out.toByteArray();
        } catch (IOException e) {
        }
        return null;
    }

    /**
    * ���ֽ����鱣��Ϊһ���ļ� b �ֽ��� outputFile �����ļ���·�����ļ���(��c:\\xx.txt���������C������xx.txt���ļ�)
    */

    public static File getFileFromBytes(byte[] b, String outputFile) {
        BufferedOutputStream stream = null;
        File file = null;
        try {
            file = new File(outputFile);
            FileOutputStream fstream = new FileOutputStream(file);
            stream = new BufferedOutputStream(fstream);
            stream.write(b);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stream != null) {
                try {
                    stream.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
        return file;
    }

    /** */
    /**
    * ���ֽ������ȡ����
    * 
    */
    public static Object getObjectFromBytes(byte[] objBytes) throws Exception {
        if (objBytes == null || objBytes.length == 0) {
            return null;
        }
        ByteArrayInputStream bi = new ByteArrayInputStream(objBytes);
        ObjectInputStream oi = new ObjectInputStream(bi);
        return oi.readObject();
    }

    /** */
    /**
    * �Ӷ����ȡһ���ֽ�����
    */
    public static byte[] getBytesFromObject(Serializable obj) throws Exception {
        if (obj == null) {
            return null;
        }
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        ObjectOutputStream oo = new ObjectOutputStream(bo);
        oo.writeObject(obj);
        return bo.toByteArray();
    }

    public static void main(String args[]) {
        File file = new File("D:\\2.jpg");
        Sort s = new Sort();
        byte[] b = s.getBytesFromFile("");

        System.out.print(b);

        s.getFileFromBytes(b, "c:\\xx.jpg");

    }

}
