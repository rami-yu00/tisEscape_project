package com.tis.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class TESQL {
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	ResultSet RS;
	
	String msg;
	int Gtotal,avg,CheckNum;
	
	public ArrayList<TEDTO> themeSelect(){
		ArrayList<TEDTO> list = new ArrayList<TEDTO>();
		try {
			CN=DB.getConnection();
			msg = "select * from theme";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next()==true) {
				TEDTO dto = new TEDTO();
				dto.setTheme(RS.getString("theme"));
				dto.setContent(RS.getString("content"));
				dto.setImg(RS.getString("img"));
				dto.setDifficulty(RS.getInt("difficulty"));
				dto.setHeadcount(RS.getInt("headcount"));
				list.add(dto);
			}
		} catch (Exception ex) {
			System.out.println("Theme에러" + ex);
		}
		return list;
	}
	public ArrayList<TEDTO> reviewList(int start, int end, String theme){
		ArrayList<TEDTO> reviewList = new ArrayList<TEDTO>();
		try {
			CN=DB.getConnection();
			String a="select  * from (";
			String b="select rownum as rn ,theme, name ,content ,rating from review";
			String c=" where theme = '" + theme + "') where rn between "+ start + " and  " + end;
			msg = a+b+c;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next()==true) {
				TEDTO dto = new TEDTO();
				dto.setTheme(RS.getString("theme"));
				dto.setRownum(RS.getInt("rn"));
				dto.setName(RS.getString("name"));
				dto.setContent(RS.getString("content"));
				dto.setRating(RS.getInt("rating"));
				reviewList.add(dto);
			}
		} catch (Exception ex) {
			System.out.println("reviewList에러" + ex);
		}
		return reviewList;
	}
	public ArrayList<TEDTO> themeList( String theme){
		ArrayList<TEDTO> themeList = new ArrayList<TEDTO>();
		try {
			CN=DB.getConnection();
			msg = "select * from theme where theme='" + theme + "' order by theme";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next()==true) {
				TEDTO dto = new TEDTO();
				dto.setTheme(RS.getString("theme"));
				dto.setContent(RS.getString("content"));
				dto.setImg(RS.getString("img"));
				dto.setDifficulty(RS.getInt("difficulty"));
				dto.setHeadcount(RS.getInt("headcount"));
				themeList.add(dto);
			}
		} catch (Exception ex) {
			System.out.println("Theme에러" + ex);
		}
		return themeList;
	}
	  public int getTotal(String theme){
		  	try { 
		  	  CN=DB.getConnection();
		      msg="select count(*) as cnt from review where theme ='" + theme + "'";
		      ST=CN.createStatement();
		      RS=ST.executeQuery(msg);
		      	if(RS.next()==true) {	    	
		        Gtotal=RS.getInt("cnt");
		      }
		  	}catch(Exception ex){System.out.println("getTotal" + ex);}
		  	return Gtotal;
		 }//end
	  public ArrayList<TEDTO> getAvgThemeList(){ 
		  ArrayList<TEDTO> list = new ArrayList<TEDTO>();
		  	try { 
		  	  CN=DB.getConnection();
		      msg="select theme ,avg(rating) as avg from review group by theme order by theme";
		      ST=CN.createStatement();
		      RS=ST.executeQuery(msg);
		      while(RS.next()==true) {
		    	  TEDTO dto = new TEDTO();
		    	  dto.setAvg(RS.getInt("avg"));
		    	  list.add(dto);
		      }
		  	}catch(Exception ex){System.out.println("getAvg" + ex);}
		  	return list;
		 }//end
	  public int getAvg(String theme){ 
		  	try { 
		  	  CN=DB.getConnection();
		      msg="select avg(rating) as avg from review where theme ='" + theme + "'";
		      ST=CN.createStatement();
		      RS=ST.executeQuery(msg);
		      if(RS.next()==true) {
		        avg=RS.getInt("avg");
		      }
		  	}catch(Exception ex){System.out.println("getAvg" + ex);}
		  	return avg;
		 }//end
	  public int checkReserve(String rscode){ 
		  	try { 
		  	  CN=DB.getConnection();
		      msg="select count(*) as cnt from reservation where rscode = '" + rscode +"'";
		      ST=CN.createStatement();
		      RS=ST.executeQuery(msg);
		      if(RS.next()==true) {
		        CheckNum=RS.getInt("cnt");
		      }
		  	}catch(Exception ex){System.out.println("checkReserve" + ex);}
		  	return CheckNum;
		 }//end
	  public void insertReview(String theme,String rscode, String name, String review, int rating) {
		  try {
			  CN=DB.getConnection();
			  msg="insert into review values(?,?,?,?,?)";
			  PST=CN.prepareStatement(msg);
			  	PST.setString(1, theme);
			  	PST.setString(2, rscode);
			  	PST.setString(3, name);
			  	PST.setString(4, review);
			  	PST.setInt(5, rating);
			  PST.executeUpdate();
		} catch (Exception ex) {System.out.println("insertReview"+ex);}
	  }//end
	  
}
