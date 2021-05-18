package com.tis.reservationController;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.ReservationDAO;
import com.tis.model.Theme;

@WebServlet("/reservation.do")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }//doGet end

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }//doPost end
	
    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String today = format.format(new Date());
        String date = request.getParameter("date");
        String tmcode = request.getParameter("tmcode");
        String rscode_date = request.getParameter("date");
        
        if(date == null || date == "" ) { 
            date = today;  
         }//end
        if(tmcode == null || tmcode == "" ) {
            tmcode = ""; 
         }//end 
        if( rscode_date =="" || rscode_date == null) {
            rscode_date = today;
        }//end

        ReservationDAO rdao = new ReservationDAO();
        ArrayList<Theme> tm_select_list = rdao.getSelecThemes();
        
        StringBuffer str = new StringBuffer(rscode_date.replaceAll("-", ""));
        
        request.setAttribute("date", date);
        request.setAttribute("tmcode",tmcode);
        request.setAttribute("rscode_date", str.delete(0,2) );
        request.setAttribute("tm_select_list", tm_select_list);
        
        
        RequestDispatcher dis = request.getRequestDispatcher("reservation/reservation.jsp");
        dis.forward(request, response);
    }//doPost end
    
}//Servlet END
