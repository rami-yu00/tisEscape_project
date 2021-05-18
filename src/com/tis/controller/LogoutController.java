package com.tis.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        ServletContext svc = this.getServletContext();
        HttpSession session = request.getSession();
        session.invalidate();
        
        response.sendRedirect("http://localhost:8080/TisEscape/index.jsp");
    }
}
