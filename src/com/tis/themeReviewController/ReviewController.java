package com.tis.themeReviewController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tis.model.TEDTO;
import com.tis.model.TESQL;

@WebServlet("/ReviewController")
public class ReviewController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ReviewController() {
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doUser(request, response);
    }
    public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8;");
        request.setCharacterEncoding("UTF-8");
        
        TESQL tesql = new TESQL();
        int Gtotal = tesql.getTotal(request.getParameter("theme"));
        int avg = tesql.getAvg(request.getParameter("theme"));
        String pnum;
        int pageNum,start,end,startpage,endpage,pagecount,tmp;
        
        pnum=request.getParameter("pageNum");
        if(pnum=="" || pnum==null){pnum="1"; }
        pageNum=Integer.parseInt(pnum); //[11]~[17클릭]~[20]클릭번호  숫자형17
        start=(pageNum-1)*10+1; //161=pageNUM*10-9
        end=(pageNum*10); //170=start+9
        
        if(Gtotal%10==0){ pagecount=Gtotal/10; }
        else{pagecount=(Gtotal/10)+1; }
        
        tmp=(pageNum-1)%10;
        startpage=pageNum-tmp; 
        endpage=startpage+9;
        //총레코드데이터갯수 316라서 최종페이지는 32인데  [31]~[40]표시를 [31][32] 
        if(endpage>pagecount) {endpage=pagecount;}
        
        ArrayList<TEDTO> themeList = tesql.themeList(request.getParameter("theme"));
        ArrayList<TEDTO> reviewList = tesql.reviewList(start,end,request.getParameter("theme"));
    
        request.setAttribute("themeList", themeList);
        request.setAttribute("reviewList", reviewList);
        request.setAttribute("avg", avg);       

        request.setAttribute("startpage", startpage);
        request.setAttribute("endpage", endpage);
        request.setAttribute("pagecount", pagecount);
        request.setAttribute("pageNum", pageNum);
        
        RequestDispatcher rd = request.getRequestDispatcher("theme/Review.jsp");
        rd.forward(request,response);
        
    }
}
