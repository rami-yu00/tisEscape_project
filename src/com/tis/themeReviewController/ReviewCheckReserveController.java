package com.tis.themeReviewController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.TESQL;

@WebServlet("/ReviewCheckReserveController")
public class ReviewCheckReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReviewCheckReserveController() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8;");
		request.setCharacterEncoding("UTF-8");
		
		TESQL tesql = new TESQL();
		String theme = request.getParameter("theme");
		String rscode =request.getParameter("rscode");
		int reserveNum = tesql.checkReserve(rscode);
		String name = request.getParameter("name");
		String review = request.getParameter("review");
		int rating = Integer.parseInt(request.getParameter("rating"));
		
		if(reserveNum != 0) {tesql.insertReview(theme, rscode, name, review, rating);}
		request.setAttribute("reserveNum", reserveNum);
		
		RequestDispatcher rd = request.getRequestDispatcher("theme/ReviewCheckReserve.jsp");
		rd.forward(request,response);
		
	}
}
