package com.tis.QnAController;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.QnADAO;
import com.tis.model.SQL;

@WebServlet("/QnAreplyDelete.do")
public class QnAReplyDeleteController extends HttpServlet {
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
		String rddata=request.getParameter("replyNum");
		String rndata=request.getParameter("QnAno");
		
		Qdao.QnAreplyDelete(rddata);
		response.sendRedirect("QnAdetail.do?QnAno="+rndata);
		}
}