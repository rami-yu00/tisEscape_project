package com.tis.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tis.model.DB;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
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
		
		HttpSession session = request.getSession();
		
		String loginid = request.getParameter("adminid");
		String loginpwd = request.getParameter("adminpwd");
		int Gtotal=0;
		
		try {
		Connection CN = DB.getConnection();
		
		String msg = "select count(*) as cnt from admininfo where adminid=? and adminpwd=?";
		PreparedStatement PST = CN.prepareStatement(msg);
			PST.setString(1, loginid);
			PST.setString(2, loginpwd);
		ResultSet RS = PST.executeQuery();
		
		if(RS.next()==true) {Gtotal = RS.getInt("cnt");}
		if(Gtotal>0) {
			session.setAttribute("loginid", loginid);
			response.sendRedirect("http://localhost:8080/TisEscape/index.jsp");
		}
		else {
			out.println("<script>alert('아이디, 비밀번호를 확인해주세요.');");
			out.println("history.back();</script>");
			out.close();
		}
		}
		catch (Exception e) {System.out.println("  : " + e);}
	}
}