package com.tis.model;

public class QnADTO {
	int rn, num, hit, rcnt;
	String name, title, email, content;
	java.util.Date wdate; //QnA
	
	int replyNum, QnAno;
	String replyWriter, replyPwd, replyContent; //QnAreply
	java.util.Date replyDate;
	
	
	public int getRn() { return rn; }
	public void setRn(int rn) { this.rn = rn; }
	
	public int getNum() { return num; }
	public void setNum(int num) { this.num = num; }
	
	public int getHit() {	return hit; }
	public void setHit(int hit) {	this.hit = hit;	}
	
	public String getName() {	return name; }
	public void setName(String name) { this.name = name; }
	
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getContent() { return content; }
	public void setContent(String content) { this.content = content; }
	
	public java.util.Date getWdate() { return wdate; }
	public void setWdate(java.util.Date wdate) { this.wdate = wdate; }
	
	public int getReplyNum() { return replyNum; }
	public void setReplyNum(int replyNum) { this.replyNum = replyNum; }
	
	public String getReplyWriter() { return replyWriter; }
	public void setReplyWriter(String replyWriter) { this.replyWriter = replyWriter; }
	
	public String getReplyPwd() {	return replyPwd; }
	public void setReplyPwd(String replyPwd) { this.replyPwd = replyPwd; }
	
	public String getReplyContent() {	return replyContent; }
	public void setReplyContent(String replyContent) { this.replyContent = replyContent; }
	
	public java.util.Date getReplyDate() { return replyDate; }
	public void setReplyDate(java.util.Date replyDate) { this.replyDate = replyDate; }
	
	public int getQnAno() { return QnAno; }
	public void setQnAno(int qnAno) { QnAno = qnAno; }
	
	public int getRcnt() { return rcnt; }
	public void setRcnt(int rcnt) { this.rcnt = rcnt; }
	
	
}
