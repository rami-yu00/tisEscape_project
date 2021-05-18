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

@WebServlet("/QnAreplyList.do")
public class QnAReplyListController extends HttpServlet {
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
		
		QnADAO Qdao = new QnADAO();
		String Sdata = request.getParameter("QnAno");
		int data = Integer.parseInt(Sdata);
		
		try {
			ArrayList<QnADTO> rrrr = Qdao.QnAreplyList(data);
			int replycnt = Qdao.QnAreplyCount(Sdata);
			request.setAttribute("rrrr", rrrr);
			request.setAttribute("data", data);
			request.setAttribute("replycnt", replycnt);

			RequestDispatcher dis = request.getRequestDispatcher("QnA/QnAReply.jsp");
			dis.forward(request, response);
		}
		catch (Exception e) {System.out.println("QnA덧글 컨트롤 출력 에러 : " + e);}
	}
}