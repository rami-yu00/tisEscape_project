package com.tis.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DB {

    public static Connection  getConnection() {
        Connection CN = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
            CN = DriverManager.getConnection(url, "system", "1234");
            System.out.print("[DBConnection 성공]");
        } catch (Exception e) {
            System.out.print("[DBConnection 에러] ");
            e.printStackTrace(); 
        }
        return CN;
    }// getConnection() end
    
    public static void closeDbPST(Connection CN, PreparedStatement PST, ResultSet RS) {
       try {
       if(RS != null) RS.close();
       if(PST != null) PST.close();
       if(CN != null) CN.close();
        } catch (Exception e) {
            e.printStackTrace();
        }//end
    }//end
    public static void closeDbST(Connection CN, Statement ST, ResultSet RS) {
        try {
            if(RS != null) RS.close();
            if(ST != null) ST.close();
            if(CN != null) CN.close();
             } catch (Exception e) {
                 e.printStackTrace();
             }//end
    }//end
    
}//class END
