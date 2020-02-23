package com.yukino.bilibili;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * @title J2py.java
 * @author ���ߣ�XuJing
 * @date ����ʱ�䣺2018��7��13������2:39:05
 * @version 1.0.0
 * @parameter �����������壺
 * @return ����ֵ��
 */

public class Test {

    public static void main(String[] args) {
        // �贫��Ĳ���
        String keyword = "hanser";
        System.out.println("Java�ж�̬�����Ѿ���ʼ��,׼������");
        // ���������д������
        String[] args1 = new String[] { "python","E:\\private\\python\\bilibili\\searchUser.py", keyword }; 
        //Java����a,b,c,d����Python
        Process pr;
        try {
            pr = Runtime.getRuntime().exec(args1); //����ĵĺ���

            BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream(), "gbk"));
            String line;
            List<String> lines = new ArrayList<String>();

            System.out.println("-----------------------------------------------");

            while ((line = in.readLine()) != null) {
                System.out.println(line);
                lines.add(line); //��Python��printֵ����������

            }
            System.out.println("-------------------------------------------------");

            in.close();

            pr.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Java��Python����");

    }

}