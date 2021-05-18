package com.tis.reservationController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.Reservation;
import com.tis.model.ReservationDAO;

@WebServlet("/reservationView.do")
public class ReservationSearchViewController extends HttpServlet {
private static final long serialVersionUID = 1L;


    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String rscode = request.getParameter("rscode");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        System.out.println(rscode+" "+name+" "+phone);
        ReservationDAO rdao = new ReservationDAO();
        
        if(rscode != null) {
            int Cflag = rdao.chackrscodeSearch(rscode); 
            Reservation shcode_rsvlist = rdao.rscodeSearch_getRsvList(rscode);
            request.setAttribute("Cflag",Cflag );
            request.setAttribute("shcode_rsvlist",shcode_rsvlist );
            RequestDispatcher dis = request.getRequestDispatcher("reservation/reservationRscodeSearchView.jsp");
            dis.forward(request, response);
        }
        else if(name != null && phone !=null ) {
            int Nflag = rdao.chackrrsnameSearch(name, phone);
            ArrayList<Reservation> shname_rsvList = rdao.rsnameSearch_getRsvList(name, phone);
            request.setAttribute("Nflag",Nflag );
            request.setAttribute("shname_rsvList",shname_rsvList );
            RequestDispatcher dis = request.getRequestDispatcher("reservation/reservationNameSearchView.jsp");
            dis.forward(request, response);
        }
    }//doPost end

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }//doGet end

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }//doPost end
    
}//Servlet END