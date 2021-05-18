package com.tis.model;

public class DTO {
    private int prsnl, rn;
    private String rscode, theme, time, name, phone, price ;
    private java.util.Date rsdate, regdate;
    
    public int getPrsnl() { return prsnl; }
    public void setPrsnl(int prsnl) { this.prsnl = prsnl;   }
    
    public int getRn() { return rn; }
    public void setRn(int rn) { this.rn = rn; }
    
    public String getRscode() { return rscode; }
    public void setRscode(String rscode) { this.rscode = rscode; }
    
    public String getTheme() { return theme; }
    public void setTheme(String theme) { this.theme = theme; }
    
    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }
    
    public String getName() {   return name; }
    public void setName(String name) { this.name = name; }
    
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    
    public String getPrice() { return price; }
    public void setPrice(String price) { this.price = price; }
    
    public java.util.Date getRsdate() { return rsdate; }
    public void setRsdate(java.util.Date rsdate) { this.rsdate = rsdate; }
    
    public java.util.Date getRegdate() { return regdate; }
    public void setRegdate(java.util.Date regdate) { this.regdate = regdate; }
        
    }