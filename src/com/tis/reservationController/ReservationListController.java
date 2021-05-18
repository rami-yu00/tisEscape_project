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
import com.tis.model.Theme;

@WebServlet("/reservationList.do")
public class ReservationListController extends HttpServlet {
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
        //PrintWriter out = response.getWriter();
        String param_tmcode = request.getParameter("param_tmcode");
        String param_rscode_date = request.getParameter("param_rscode_date");
        ReservationDAO rdao = new ReservationDAO();
        
        ArrayList<Reservation> rscode_list2 = rdao.getRscodeList2(param_rscode_date , param_tmcode);
        ArrayList<Theme> tm_list = rdao.getThemelist(param_tmcode);

        request.setAttribute("param_rscode_date", param_rscode_date);
        request.setAttribute("param_tmcode",param_tmcode);
        request.setAttribute("rscode_list2",rscode_list2);
        request.setAttribute("tm_list",tm_list);
        
        RequestDispatcher dis = request.getRequestDispatcher("reservation/reservationList.jsp");
        dis.forward(request, response);

    }//doPost end
    
}//Servlet END
