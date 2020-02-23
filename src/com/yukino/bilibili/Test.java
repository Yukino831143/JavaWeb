package com.yukino.bilibili;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

/**
 * @title J2py.java
 * @author 作者：XuJing
 * @date 创建时间：2018年7月13日下午2:39:05
 * @version 1.0.0
 * @parameter 参数及其意义：
 * @return 返回值：
 */

public class Test {

    public static void main(String[] args) {
        // 需传入的参数
        String keyword = "hanser";
        System.out.println("Java中动态参数已经初始化,准备传参");
        // 设置命令行传入参数
        String[] args1 = new String[] { "python","E:\\private\\python\\bilibili\\searchUser.py", keyword }; 
        //Java数据a,b,c,d传入Python
        Process pr;
        try {
            pr = Runtime.getRuntime().exec(args1); //最核心的函数

            BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream(), "gbk"));
            String line;
            List<String> lines = new ArrayList<String>();

            System.out.println("-----------------------------------------------");

            while ((line = in.readLine()) != null) {
                System.out.println(line);
                lines.add(line); //把Python的print值保存了下来

            }
            System.out.println("-------------------------------------------------");

            in.close();

            pr.waitFor();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Java调Python结束");

    }

}