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

@WebServlet("/QnAlist.do")
public class QnAListController extends HttpServlet {
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
		
		String pnum="", skey="", sval="", returnPage="", display="";
		int pageNum, start, end, startPage, endPage, pageCount, temp;
		
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		if (skey==null || skey=="" || sval==null || sval=="" || skey.equals("") || sval.equals(""))
			{ skey="num"; display=""; sval=""; }
		
		returnPage = "&keyfield="+skey+"&keyword="+sval;
		pnum = request.getParameter("pageNum");
		if (pnum=="" || pnum==null) {pnum="1";}
		pageNum = Integer.parseInt(pnum);
		start = (pageNum-1)*10+1;
		end = (pageNum*10);
		
		int RStotal = Qdao.QnAcount(skey, sval);
		if(RStotal%10==0) {pageCount=RStotal/10;}
		else {pageCount=(RStotal/10)+1;}
		
		temp = (pageNum-1)%10;
		startPage=pageNum-temp;
		endPage=startPage+9;
		
		if(endPage>pageCount) {endPage=pageCount;}
		
		try {
			ArrayList<QnADTO> qqqq = Qdao.QnAselect(skey, sval, start, end);
			request.setAttribute("qqqq", qqqq);
			request.setAttribute("RStotal", RStotal);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("returnPage", returnPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("skey", skey);
			request.setAttribute("sval", sval);
			request.setAttribute("display", display);
			
			RequestDispatcher dis = request.getRequestDispatcher("QnA/QnAList.jsp");
			dis.forward(request, response);
		}
		catch (Exception e) {System.out.println("QnA컨트롤 출력 에러 : " + e);}
	}
}