package com.tis.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.DTO;
import com.tis.model.SQL;

@WebServlet("/reservelist.do")
public class ReserveListController extends HttpServlet {
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
		
		SQL sql = new SQL();
		
		String pnum="", skey="", sval="", returnPage="", display="";
		int pageNum, start, end, startPage, endPage, pageCount, temp;
		
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		if (skey==null || skey=="" || sval==null || sval=="" || skey.equals("") || sval.equals(""))
			{ skey="rscode"; display=""; sval=""; }
		
		returnPage = "&keyfield="+skey+"&keyword="+sval;
		pnum = request.getParameter("pageNum");
		if (pnum=="" || pnum==null) {pnum="1";}
		pageNum = Integer.parseInt(pnum);
		start = (pageNum-1)*10+1;
		end = (pageNum*10);
		
		int RStotal = sql.rsvTotal(skey, sval);
		if(RStotal%10==0) {pageCount=RStotal/10;}
		else {pageCount=(RStotal/10)+1;}
		
		temp = (pageNum-1)%10;
		startPage=pageNum-temp;
		endPage=startPage+9;
		
		if(endPage>pageCount) {endPage=pageCount;}
		
		try {
			ArrayList<DTO> aaaa = sql.rsvSelect(start, end, skey, sval);
			request.setAttribute("aaaa", aaaa);
			request.setAttribute("RStotal", RStotal);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("returnPage", returnPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("skey", skey);
			request.setAttribute("sval", sval);
			request.setAttribute("display", display);
			
			RequestDispatcher dis = request.getRequestDispatcher("TE_reserve/reservelist.jsp");
			dis.forward(request, response);
		}
		catch (Exception e) {System.out.println(" " + e);}
	}
}