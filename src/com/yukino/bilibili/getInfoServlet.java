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
		String jsonFile = "/Users/yukino/Desktop/git_test/bilibili/JavaWeb/WebContent/json/Java2python.json";//暂时是绝对路径，相对路径在servlet 与 单Java相对不同
		String keyword= request.getParameter("upName");
		String absolutePath=null;
		System.out.println("keyword:"+keyword);
		response.setContentType("text/html;charset=utf-8");
		UpInfo temp = new UpInfo();
		try {
			absolutePath = temp.writeJson2file(jsonFile,keyword);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("absolutePath:"+absolutePath);
		System.out.println("python开始");
		String info = temp.spiderData("/Users/yukino/Desktop/git_test/bilibili/JavaWeb/WebContent/json/Java2python.json");
		response.getWriter().println(info);
		System.out.println(info);
		System.out.println("python结束");
		

		
		
	}
	

}
