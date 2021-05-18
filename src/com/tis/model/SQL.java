package com.tis.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class SQL {
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	ResultSet RS;
	
	String msg;
	int RStotal;
	
	public SQL() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			CN = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "1234");
		}
		catch (Exception e) {System.out.println("DB연결 에러 : " + e);	}
	}
	
	public ArrayList<DTO> rsvSelect(int start, int end, String skey, String sval) {
		ArrayList<DTO> alist = new ArrayList<DTO>();
		try {
			msg = "	select * from (select rownum as rn, r.* from reservation r where "+skey+" like '%"+sval+"%' order by rscode) where rn between "+start+" and "+end;

			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
				while (RS.next()==true) {
					DTO dto = new DTO();
					dto.setRn(RS.getInt("rn"));
					dto.setRscode(RS.getString("rscode"));
					dto.setTheme(RS.getString("theme"));
					dto.setRsdate(RS.getDate("rsdate"));
					dto.setTime(RS.getString("time"));
					dto.setPrsnl(RS.getInt("prsnl"));
					dto.setName(RS.getString("name"));
					dto.setPhone(RS.getString("phone"));
					dto.setPrice(RS.getString("price"));
					dto.setRegdate(RS.getDate("regdate"));
					alist.add(dto);
			}
		}
		catch (Exception e) {System.out.println("SQL.java 예약리스트 출력에러 : " + e);}
		return alist;
	}
	
	public void rsvDelete(String rrscode) {
		try {
			msg="delete from reservation where rscode=?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, rrscode);
			PST.executeUpdate();
		}
		catch(Exception e) {System.out.println("예약리스트 삭제에러 : " + e);}
	}
	
	public int rsvTotal (String skey, String sval) {
		try {
			msg = "select count(*) as rsvcnt from reservation where "+skey+" like '%"+sval+"%'";
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if (RS.next()==true) {RStotal=RS.getInt("rsvcnt");}
		}
		catch (Exception e) {System.out.println("예약 카운트 에러 : " + e);}
		return RStotal;
	}
	
}//class SQL end
