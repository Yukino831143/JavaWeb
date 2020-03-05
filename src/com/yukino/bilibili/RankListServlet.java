package com.yukino.bilibili;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RankListServlet
 */
@WebServlet("/ranklist")
public class RankListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpGetData getData = new HttpGetData();
		response.setContentType("text/html;charset=utf-8");
		String type  = request.getParameter("type");
		String rid = request.getParameter("rid");
		String arc_type = request.getParameter("arc_type");
		String day = request.getParameter("day");
		String season_type = request.getParameter("season_type");
		String params = "rid="+rid+"&day="+day+"&type="+type+"&arc_type="+arc_type;
		System.out.println(params);
		String send2FontEnd = getData.sendGet("https://api.bilibili.com/x/web-interface/ranking",params);
		System.out.println(send2FontEnd);
		response.getWriter().println(send2FontEnd);
//		request.getServletContext().setAttribute("pageData", send2FontEnd);
//		request.getServletContext().setAttribute("salary", "8000");
//		request.getRequestDispatcher("/rankList.ftl").forward(request, response);
		
	}

}
