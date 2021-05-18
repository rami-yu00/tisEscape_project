package com.tis.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class QnADAO {
	Connection CN;
	Statement ST;
	PreparedStatement PST;
	ResultSet RS;
	
	String msg;
	int RStotal, RPtotal, Mtotal, Mcnt;
	
	public QnADAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			CN = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "system", "1234");
		}
		catch (Exception e) {System.out.println("QnADAO DB연결 에러 : " + e);	}
	}
	
	public ArrayList<QnADTO> QnAselect(String skey, String sval, int start, int end) { //QnA 목록 가져오기
		ArrayList<QnADTO> Qlist = new ArrayList<QnADTO>();
		try {
			msg = "select * from ("
							+" select rownum as rn, qq.* , ("
							+" select count(*) from QnAreply r where qq.num = r.QnAno"
							+" ) as rcnt from ("
							+" select q.* from QnA q order by num desc"
							+" ) qq"
							+" ) where "+skey+" like '%"+sval+"%' and rn between "+start+" and "+end;
			
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while(RS.next()==true) {
				QnADTO QDTO = new QnADTO();
				QDTO.setRn(RS.getInt("rn"));
				QDTO.setNum(RS.getInt("num"));
				QDTO.setName(RS.getString("name"));
				QDTO.setTitle(RS.getString("title"));
				QDTO.setWdate(RS.getDate("wdate"));;
				QDTO.setHit(RS.getInt("hit"));
				QDTO.setContent(RS.getString("content"));
				QDTO.setRcnt(RS.getInt("rcnt"));
				Qlist.add(QDTO);
			}
		}
		catch (Exception e) {System.out.println("QnADAO QnAselect 에러 : " + e);}
		return Qlist;
	}
	
	public int QnAcount(String skey, String sval) {
		try {
		msg = "select count(*) as cnt from QnA where "+skey+" like '%"+sval+"%'";
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		if (RS.next()==true) {RStotal = RS.getInt("cnt");}
		}
		catch (Exception e) { System.out.println("QnADAO QnAcount 에러 : " + e);}
		return RStotal;
	}
	
	public QnADTO QnAdetail(int data) {
		QnADTO Qdto = new QnADTO();
		try {
		msg = "select * from QnA where num = " + data;
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		if(RS.next()==true) {
			Qdto.setNum(RS.getInt("num"));
			Qdto.setName(RS.getString("name"));
			Qdto.setTitle(RS.getString("title"));
			Qdto.setWdate(RS.getDate("wdate"));
			Qdto.setHit(RS.getInt("hit"));
			Qdto.setContent(RS.getString("content"));
			}
		}
		catch (Exception e) {System.out.println("QnADAO QnAdetail 에러 : " + e);	}
		return Qdto;
	}
	
	public void QnAdelete(String data) {
		try {
		msg = "delete from QnA where num=?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, data);
			PST.executeUpdate();
		}
		catch (Exception e) {System.out.println("QnADAO QnAdelete 에러 : " + e);}
	}
	
	public void QnAWrite (String name, String pwd, String title, String content) {
		try {
			msg = "insert into QnA values (QnA_SEQ.nextval, ?, ?, ?, sysdate, 0, ?)";
			PST = CN.prepareStatement(msg);
				PST.setString(1, name);
				PST.setString(2, pwd);
				PST.setString(3, title);
				PST.setString(4, content);
			PST.executeUpdate();
		}
		catch (Exception e) { System.out.println("QnADAO QnAWrite 에러 : " + e);}
	}
	
	public void QnAhitCount(int data) {
		try {
			msg = "update QnA set hit=hit+1 where num=?";
			PST = CN.prepareStatement(msg);
				PST.setInt(1, data);
			PST.executeUpdate();
		}
		catch (Exception e) { System.out.println("QnADAO QnAhitCount 에러 : " + e);
		}
	}
	
	public ArrayList<QnADTO> QnAreplyList(int data) {
		ArrayList<QnADTO> Rlist = new ArrayList<QnADTO>();
		try {
			msg = "select * from QnAreply where QnAno = " + data;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			while (RS.next()==true) {
				QnADTO QDTO = new QnADTO();
				QDTO.setReplyNum(RS.getInt("replyNum"));
				QDTO.setReplyWriter(RS.getString("replyWriter"));
				QDTO.setReplyContent(RS.getString("replyContent"));
				QDTO.setReplyDate(RS.getDate("replyDate"));
				QDTO.setQnAno(RS.getInt("QnAno"));
				Rlist.add(QDTO);
			}
		}
		catch (Exception e) { System.out.println("QnADAO QnAreplyCount 에러 : " + e);}
		return Rlist;
	}
	
	public void QnAreplyDelete(String data) {
		try {
		msg = "delete from QnAreply where replyNum=?";
			PST = CN.prepareStatement(msg);
				PST.setString(1, data);
			PST.executeUpdate();
		}
		catch (Exception e) {System.out.println("QnADAO QnAreplyDelete 에러 : " + e);}
	}
	
	public int QnAreplyCount(String data) {
		try {
			msg = "select count(*) as replycnt from QnAreply where QnAno = " + data;
			ST = CN.createStatement();
			RS = ST.executeQuery(msg);
			if(RS.next()==true) { RPtotal = RS.getInt("replycnt"); }
		}
		catch (Exception e) { System.out.println("QnADAO QnAreplyCount에러 : " + e); }
		return RPtotal;
	}
	
	public void QnAReplyWrite(String replyWriter, String replyContent, int QnAno) {
		try {
			msg = "insert into QnAreply values (QnAreply_seq.nextval, ?, ?, sysdate, ?)";
			PST = CN.prepareStatement(msg);
				PST.setString(1, replyWriter);
				PST.setString(2, replyContent);
				PST.setInt(3, QnAno);
			PST.executeUpdate();
		}
		catch (Exception e) { System.out.println("QnADAO QnAReplyWrite 에러 : " + e);}
	}
	
	public int QnAmatch(String QnAno, String pwd) {
		String msg = "select count(*) as cnt from QnA where num=? and pwd=?";
		try {
			PST = CN.prepareStatement(msg);
				PST.setString(1, QnAno);
				PST.setString(2, pwd);
			RS = PST.executeQuery();
			if (RS.next()==true) {Mcnt = RS.getInt("cnt");}
		} catch (Exception e) {System.out.println("QnADAO QnAmatch 에러 : " + e); }
		return Mcnt;
	}
}
