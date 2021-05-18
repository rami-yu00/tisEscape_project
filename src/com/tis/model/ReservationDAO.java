package com.tis.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ReservationDAO {

    Connection CN;
    Statement ST;
    PreparedStatement PST;
    ResultSet RS;
    String sql;
    
    /*=======[ 실시간예약페이지에서 비교할 예약번호 가져오기 ]========*/
    public ArrayList<Reservation> getRscodeList2( String param_rscode_date, String param_tmcode  ) {
        ArrayList<Reservation> rscode_list = new ArrayList<Reservation>();
        StringBuffer sql = new StringBuffer();
        if( param_tmcode == "all" ) {
            sql.append("select SUBSTR(rscode, 1 , 13) as rscode from reservation ");
            sql.append("where rscode LIKE '"+param_rscode_date+"%' ");
        }else {
            sql.append("select SUBSTR(rscode, 1 , 13) as rscode from reservation ");
            sql.append("where rscode LIKE '"+param_rscode_date+"-"+param_tmcode+"%' ");
        }//end
        try {
            CN = DB.getConnection();
            ST= CN.createStatement();
            RS = ST.executeQuery(sql.toString());
            while(RS.next()) {
                Reservation rdto = new Reservation();
                rdto.setRscode(RS.getString("rscode"));
                rscode_list.add(rdto);
            }
            System.out.println("com.tis.model/ReservationDAO/getRscodeList() 호출성공");
        } catch (Exception e) {
            System.out.println("com.tis.model/ReservationDAO/getRscodeList() 호출에러");
            e.printStackTrace();
        }
        return rscode_list;
    }//end
    

/*=====================[ select 테마 코드, 이름 가져오기 ]======================*/   
    public ArrayList<Theme> getSelecThemes() {
        ArrayList<Theme> theme_select_list = new ArrayList<Theme>();
        StringBuffer sql = new StringBuffer();
        sql.append("select tmcode, theme from theme ");
        try {
            CN = DB.getConnection();
            ST= CN.createStatement();
            RS = ST.executeQuery(sql.toString());
            while (RS.next()) {
                Theme tm = new Theme();
                tm.setTmcode(RS.getString("tmcode"));
                tm.setTheme(RS.getString("theme"));
                theme_select_list.add(tm);
            }//end
            System.out.println("com.tis.model/ReservationDAO/getSelecThemes() 호출성공");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("com.tis.model/ReservationDAO/getSelecThemes() 호출에러");
        }finally {
            DB.closeDbST(CN, ST, RS);
        }
        return theme_select_list;
    }//end
    
/*=====================[ 테마 리스트 가져오기 ]======================*/   
    public ArrayList<Theme> getThemelist( String param_tmcode ){
        ArrayList<Theme> theme_list = new ArrayList<Theme>();
        StringBuffer sql = new StringBuffer();
        if(param_tmcode.equals("")==true) {
            sql.append("select tm.tmcode, tm.theme, tm.img, tm.price, ");
            sql.append("ti.h1, ti.h2, ti.h3, ti.h4, ti.h5, ti.h6, ti.h7, ti.h8, ti.h9 ");
            sql.append(" from theme tm inner join  rsv_times ti ");
            sql.append(" on ( tm.tmcode = ti.tmcode ) "); 
        }else {
            sql.append("select tm.tmcode, tm.theme, tm.img, tm.price, ");
            sql.append("ti.h1, ti.h2, ti.h3, ti.h4, ti.h5, ti.h6, ti.h7, ti.h8, ti.h9 ");
            sql.append(" from theme tm inner join  rsv_times ti ");
            sql.append(" on ( tm.tmcode = ti.tmcode ) ");
            sql.append(" where tm.tmcode = '"+param_tmcode+"' "); 
            
        }//end
        try {
            CN = DB.getConnection();
            ST= CN.createStatement();
            RS = ST.executeQuery(sql.toString());
            while (RS.next()) {
                Theme tm = new Theme();
                tm.setTmcode(RS.getString("tmcode"));
                tm.setTheme(RS.getString("theme"));
                tm.setImg(RS.getString("img"));
                tm.setPrice(RS.getInt("price"));
                tm.setH1(RS.getString("h1"));
                tm.setH2(RS.getString("h2"));
                tm.setH3(RS.getString("h3"));
                tm.setH4(RS.getString("h4"));
                tm.setH5(RS.getString("h5"));
                tm.setH6(RS.getString("h6"));
                tm.setH7(RS.getString("h7"));
                tm.setH8(RS.getString("h8"));                
                tm.setH9(RS.getString("h9"));
                theme_list.add(tm);
            }//end
            System.out.println("com.tis.model/ReservationDAO/getThemelist() 호출성공");
        } catch (Exception e) { 
            System.out.println("com.tis.model/ReservationDAO/getThemelist() 호출에러");
            e.printStackTrace(); 
        } finally {
            DB.closeDbST(CN, ST, RS);
        }
        return theme_list; 
    }//end
  //String SQL="insert into reservation values ('"+insertcode+"'||trim(to_char(rsv_seq.nextval,'00')), ? , to_date(?,'yyyy-mm-dd'), ?, ?, ?, ?, ?, sysdate ) ";
    
/*======================[ 예약정보 인서트 ]======================*/
    public int insertReservation( Reservation rdto, String insertcode ) {
        StringBuffer sql = new StringBuffer();
            try {   
                sql.append("insert into reservation values (");
                sql.append("'"+insertcode+"'||trim(to_char(rsv_seq.nextval,'00')), ? , ");
                sql.append("to_date(?,'yyyy-mm-dd'), ?, ?, ?, ?, ?, sysdate ) ");
                  CN = DB.getConnection();
                  PST = CN.prepareStatement(sql.toString());
                      PST.setString(1, rdto.getTheme());
                      PST.setString(2, rdto.getRsdate());
                      PST.setString(3, rdto.getTime());
                      PST.setInt(4, rdto.getPrsnl());
                      PST.setString(5, rdto.getName());
                      PST.setString(6, rdto.getPhone());
                      PST.setString(7, rdto.getPrice());
                  PST.executeUpdate();
                  System.out.println("com.tis.model/ReservationDAO/insertReservation() 저장성공");
                  return 1;
              } catch (Exception e) {
                  e.printStackTrace();
              }//end
        System.out.println("com.tis.model/ReservationDAO/insertReservation() 저장에러");
        return 0;
    }//end
    /*======================[ 예약정보 인서트 전 중복체크 ]======================*/
    public String checkReservation(String insertcode) {
        StringBuffer sql = new StringBuffer();
        String result = "";
        try {   
            sql.append("select COUNT(SUBSTR(rscode, 1 , 13)) as rsc_cnt from reservation ");
            sql.append("where rscode LIKE '"+insertcode+"%' ");
            CN = DB.getConnection();
            ST= CN.createStatement();
            RS = ST.executeQuery(sql.toString());
            if(RS.next()) {
                if(RS.getInt("rsc_cnt") == 0) {
                    System.out.println("중복없음"+RS.getInt("rsc_cnt"));
                    result = "중복없음";
                }else {
                    System.out.println("중복확인"+RS.getInt("rsc_cnt"));
                    result = "중복확인";
                }
            }
        }catch (Exception e) {
            System.out.println("com.tis.model/ReservationDAO/getSaveRsvcode() 호출에러");
            e.printStackTrace();
            result = "DB에러";
        }//end
        return result;
    }//end
    
/*======================[ 예약정보 저장후 코드가져오기 ]======================*/
    public String getSaveRsvcode( String insertcode ) {
        StringBuffer sql = new StringBuffer();
        String getRsvcode = null;
        try {
            sql.append("select rscode from reservation ");
            sql.append("where rscode LIKE '"+insertcode+"%' ");
            CN = DB.getConnection();
            ST= CN.createStatement();
            RS = ST.executeQuery(sql.toString());
            if (RS.next()) {
                getRsvcode = RS.getString("rscode");
            };
            System.out.println("com.tis.model/ReservationDAO/getSaveRsvcode() 호출성공");
        } catch (Exception e) {
            System.out.println("com.tis.model/ReservationDAO/getSaveRsvcode() 호출에러");
            e.printStackTrace();
        }//end
        return getRsvcode;
    }//end   
/*======================[ 중복체크 - 예약번호로 조회 ]======================*/
    
    public int chackrscodeSearch(String rscode) {
        try {
            sql = "select count(rscode) cnt from reservation where rscode Like ?";
            CN = DB.getConnection();
            PST = CN.prepareStatement(sql);
                PST.setString(1,rscode);
                RS = PST.executeQuery();
             if(RS.next()) {
                 if(RS.getInt("cnt") > 0 ) {
                     return 1;
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 0;
    }//end
/*======================[ 예약확인 - 예약번호로 조회 ]======================*/
    public Reservation rscodeSearch_getRsvList( String rscode ) {
        StringBuffer sql = new StringBuffer();
        try {
            System.out.println(rscode);
            sql.append("select * from reservation ");
            sql.append("where rscode LIKE ? ");
            CN = DB.getConnection();
            PST = CN.prepareStatement(sql.toString());
                PST.setString(1,rscode);
                RS = PST.executeQuery();
            if (RS.next()) {
                Reservation rsv_data = new Reservation();
                rsv_data.setRscode(RS.getString("rscode"));
                rsv_data.setTheme(RS.getString("theme"));
                rsv_data.setRsdate(RS.getString("rsdate"));
                rsv_data.setTime(RS.getString("time"));
                rsv_data.setPrsnl(RS.getInt("prsnl"));
                rsv_data.setName(RS.getString("name"));
                rsv_data.setPhone(RS.getString("phone"));
                rsv_data.setPrice(RS.getString("price"));
                rsv_data.setRegdate(RS.getDate("regdate"));
                return rsv_data;
            };
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }//end
        return null;
    }//end       
    
/*======================[ 중복체크 - 예약자정보로 조회 ]======================*/
    public int chackrrsnameSearch(String name, String phone) {
        StringBuffer sql = new StringBuffer();
        try {
            sql.append("select count(rscode) cnt from reservation ");
            sql.append("where name LIKE ? and phone LIKE ? ");
            sql.append(" ORDER BY rsdate DESC ");
            CN = DB.getConnection();
            PST = CN.prepareStatement(sql.toString());
                PST.setString(1,name);
                PST.setString(2,phone);
                RS = PST.executeQuery();
             if(RS.next()) {
                 if(RS.getInt("cnt") > 0 ) {
                     return 1;
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 0;
    }//end
/*======================[ 예약확인 - 예약자정보로 조회 ]======================*/   
    public ArrayList<Reservation> rsnameSearch_getRsvList( String name, String phone ) {
        ArrayList<Reservation> rsv_list = new ArrayList<Reservation>();
        StringBuffer sql = new StringBuffer();
        try {
            System.out.println(name);
            System.out.println(phone);
            sql.append("select * from reservation ");
            sql.append("where name LIKE ? and phone LIKE ? ");
            sql.append(" ORDER BY rsdate DESC ");
            CN = DB.getConnection();
            PST = CN.prepareStatement(sql.toString());
                PST.setString(1,name);
                PST.setString(2,phone);
                RS = PST.executeQuery();
            while (RS.next()) {
                Reservation rsv_data = new Reservation();
                rsv_data.setRscode(RS.getString("rscode"));
                rsv_data.setTheme(RS.getString("theme"));
                rsv_data.setRsdate(RS.getString("rsdate"));
                rsv_data.setTime(RS.getString("time"));
                rsv_data.setPrsnl(RS.getInt("prsnl"));
                rsv_data.setName(RS.getString("name"));
                rsv_data.setPhone(RS.getString("phone"));
                rsv_data.setPrice(RS.getString("price"));
                rsv_data.setRegdate(RS.getDate("regdate"));
                rsv_list.add(rsv_data);   
            };
            return rsv_list;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }//end
    }//end          

}//Class AND
