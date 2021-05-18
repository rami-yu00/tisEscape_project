package com.tis.themeReviewController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.TEDTO;
import com.tis.model.TESQL;

@WebServlet("/ReviewInsertController")
public class ReviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReviewInsertController() {
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
	
		ArrayList<TEDTO> list = tesql.themeSelect();
		
		request.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("theme/Review.jsp");
		rd.forward(request,response);
		
	}
}
