package com.tis.model;


import java.util.Date;

public class Reservation {
    
    private String rscode; //받아올 예약코드
    private String insertcode;
    
    private String theme; //테마명
    private String rsdate; //예약일
    private String time; //예약시간
    private int prsnl; //인원
    private String name; //이름
    private String phone; //연락처
    private String price; //총가격 000,000
    private Date regdate; //예약한일시

    public Reservation() {} //기본생성자
    public Reservation( String theme, String rsdate, String time, int prsnl, String name, String phone, String price) {

        this.theme= theme;   
        this.rsdate = rsdate;
        this.time = time;
        this.prsnl = prsnl;
        this.name = name;
        this.phone = phone;
        this.price = price;
    }//end

//----------------------------------------------------------------------------------------------------
    public String getRscode() { return rscode; }
    public void setRscode(String rscode) {  this.rscode = rscode; }
    public String getTheme() { return theme; }
    public void setTheme(String theme) {  this.theme = theme; }
    public String getRsdate() { return rsdate; }
    public void setRsdate(String rsdate) { this.rsdate = rsdate; }
    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }
    public int getPrsnl() { return prsnl; }
    public void setPrsnl(int prsnl) { this.prsnl = prsnl; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getPrice() { return price; }
    public void setPrice(String price) { this.price = price; }
    public Date getRegdate() { return regdate; }
    public void setRegdate(Date regdate) { this.regdate = regdate; }
    public String getInsertCode() {  return insertcode;  }
    public void setInsertCode(String insertCode) { this.insertcode = insertCode; }
    
}//Class END
