package com.yukino.bilibili;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class getInfoServlet
 */
@WebServlet("/info")
public class getInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword= request.getParameter("upName");
		System.out.println(keyword);
		response.setContentType("text/html;charset=utf-8");
		UpInfo temp = new UpInfo();
		String info = temp.spiderData(keyword);
		response.getWriter().println(info);
		System.out.println(info);
//		UpInfo up = JSON.parseObject(info,UpInfo.class);//反序列构成对象
//		System.out.println(up);
		
		
	}
	

}
