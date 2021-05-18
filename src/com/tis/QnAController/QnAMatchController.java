package com.tis.QnAController;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tis.model.DB;
import com.tis.model.QnADAO;

@WebServlet("/QnAmatch.do")
public class QnAMatchController extends HttpServlet {
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
		PrintWriter out = response.getWriter();
		
		QnADAO Qdao = new QnADAO();
		
		String QnAno = request.getParameter("QnAno");
		String adminpwd = request.getParameter("adminpwd");
		int Mcnt = 0;
		
		Mcnt = Qdao.QnAmatch(QnAno, adminpwd);
		
		if (Mcnt>0) {
			RequestDispatcher dis = request.getRequestDispatcher("QnAdetail.do");
			dis.forward(request, response);
		}
		else {
			out.println("<script>alert('비밀번호를 확인해주세요.');");
			out.println("history.back();</script>");
			out.close();
		}
	}
}