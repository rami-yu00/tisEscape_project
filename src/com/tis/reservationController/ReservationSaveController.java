package com.tis.reservationController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.Reservation;
import com.tis.model.ReservationDAO;

@WebServlet("/reservationSave.do")
public class ReservationSaveController extends HttpServlet {
private static final long serialVersionUID = 1L;


    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String insertcode = request.getParameter("insertcode"); 
        String theme = request.getParameter("theme"); 
        String rsdate =request.getParameter("rsdate");
        String time = request.getParameter("time"); 
        int prsnl =  Integer.parseInt(request.getParameter("prsnl"))  ;
        String name = request.getParameter("name"); 
        String phone = request.getParameter("phone");;
        String price = request.getParameter("price");
        
        System.out.println("[ReservationSave] insertcode: "+insertcode+" theme: "+theme);
        System.out.println("[ReservationSave] rsdate: "+rsdate+" time: "+time+" prsnl: "+prsnl);
        System.out.println("[ReservationSave] name: "+name+" phone: "+phone+" price: "+price);
        
        ReservationDAO rdao = new ReservationDAO();
        String rsCheck = rdao.checkReservation(insertcode);
        int result=0;
        String rscode="";
        System.out.println(rsCheck);
        if(rsCheck != null && rsCheck.equals("중복확인") == true) {
            result = -1;
        }else if(rsCheck != null && rsCheck.equals("중복없음") == true) {
            result = rdao.insertReservation( new Reservation( theme, rsdate, time, prsnl, name, phone, price), insertcode);
            rscode = rdao.getSaveRsvcode(insertcode);
            result = 1;
        }else {
            result = 0;
        }
        request.setAttribute("result", result);
        request.setAttribute("rscode", rscode);
        request.setAttribute("theme", theme);
        request.setAttribute("rsdate",rsdate );
        request.setAttribute("time",time );
        request.setAttribute("prsnl",prsnl );
        request.setAttribute("name",name );
        request.setAttribute("phone",phone);
        request.setAttribute("price",price);

        RequestDispatcher dis = request.getRequestDispatcher("reservation/reservationSave.jsp");
        dis.forward(request, response);
        
    }//doPost end

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }//doGet end

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }//doPost end
    
}//Servlet END