package com.tis.QnAController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tis.model.QnADAO;
import com.tis.model.QnADTO;

@WebServlet("/QnAdetail.do")
public class QnADetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String Sdata = request.getParameter("QnAno"); //String-data
		int data = Integer.parseInt(Sdata);

		QnADAO Qdao = new QnADAO();
		Qdao.QnAhitCount(data);
		int rcrc = Qdao.QnAreplyCount(Sdata);
		QnADTO dddd = Qdao.QnAdetail(data);
		request.setAttribute("dddd", dddd);
		request.setAttribute("rcrc", rcrc);
		
		RequestDispatcher dis = request.getRequestDispatcher("QnA/QnADetail.jsp");
		dis.forward(request, response);
	}
}