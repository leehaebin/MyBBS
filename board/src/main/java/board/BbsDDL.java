package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class BbsDDL {
	private Connection conn;
	private ResultSet rs;
	
	
	//
	public static int getAllSelect() {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		int allCount = 0;
		sql = "select count(*) from bbs";
		
		try {
			conn = new DBConnect().getConn();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				allCount = rs.getInt(1);
			}
			System.out.println(allCount);
		}catch(SQLException e) {
			
		}finally {
			try { 
				if(rs != null) rs.close();
				if(st != null) st.close(); 
				if(conn != null) conn.close();
			}catch(SQLException e) {}
		}
		return allCount;
	}
	
	//게시글 보기
	public static Vector<BBSDTO> getbbs(int bbsnum) {
		hitAdd(bbsnum);  //조회수 증가
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from bbs where bbsnum=? ";
		Vector<BBSDTO> bdata = new Vector<>();
		try {
			conn = new DBConnect().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsnum);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			if(rs.next()) {
				BBSDTO bdto = new BBSDTO();
				bdto.setBbsnum(rs.getInt("bbsnum"));
				bdto.setUserid(rs.getString("userid"));
				bdto.setUsername(rs.getString("username"));
				bdto.setTitle(rs.getString("title"));
				bdto.setContent(rs.getString("content"));
				bdto.setCount(rs.getInt("count"));
				bdto.setWdate(rs.getString("wdate"));
				bdata.add(bdto);
			}
		}catch(SQLException e) {}
	       finally {
		          try { 
		              if(rs != null) rs.close();
	if(conn != null) conn.close();
		           }catch(SQLException e) {}
		       }
		       return bdata;
	}
	
	//게시글 수정
	public boolean bbsupdate (BBSDTO bdto, int bbsnum) {
		Connection conn = null;
    	PreparedStatement pstmt = null;
    	int flag = 0;
    	try {
    		conn = new DBConnect().getConn();
    		String sql = "update bbs set title = ?, content = ?, wdate=? where bbsnum =? ";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, bdto.getTitle());
    		pstmt.setString(2, bdto.getContent());
    		pstmt.setString(3, bdto.getWdate());
    		pstmt.setInt(4, bbsnum);
    		System.out.println(pstmt);
    		flag = pstmt.executeUpdate();
    	}catch(Exception e) {
    		e.printStackTrace();
    	}finally {
    		try { 
    			if(pstmt != null) pstmt.close(); 
    		    if(conn != null) conn.close();
    		}catch(SQLException e) {}
    	}
    	if(flag > 0) { //성공
    		return true;
    	}else {  //실패
    		return false;
    	}
    	
	}
	
	//게시글 삭제
	public boolean delete(int bbsnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DBConnect().getConn();
			String sql = "delete from bbs where bbsnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsnum);

			System.out.println(pstmt);
			flag = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {}
		}
    	if(flag > 0) { //성공
    		return true;
    	}else {  //실패
    		return false;
    	}
	}

	//게시글 목록 보기
	public static Vector<BBSDTO> getSelect(int limitNum, int listNum) {
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String sql = null;
    	sql = "select * from bbs order by bbsnum desc limit ? , ?";	
 
    	Vector<BBSDTO> bdata = new Vector<>();
    	conn = new DBConnect().getConn();
    	try {
    	  ps = conn.prepareStatement(sql);
    	  ps.setInt(1, limitNum);
    	  ps.setInt(2, listNum);
   
    	  System.out.println(ps);
    	  rs = ps.executeQuery();

    	  while(rs.next()) {
        	  BBSDTO mb = new BBSDTO();
             mb.setBbsnum(rs.getInt("bbsnum"));
             mb.setTitle(rs.getString("title"));
             mb.setUserid(rs.getString("userid"));
             mb.setUsername(rs.getString("username"));
             mb.setContent(rs.getString("content"));
             mb.setCount(rs.getInt("count"));
             mb.setUip(rs.getString("uip"));
             mb.setWdate(rs.getString("wdate"));
             bdata.add(mb);
          }

    	}catch(SQLException e) {}
    	finally {
    	   try { 
    	    	if(rs != null) rs.close();
    		    if(ps != null) ps.close(); 
    	         if(conn != null) conn.close();
    	    }catch(SQLException e) {}
    	}
    	return bdata;
    }
	
	//조회수많은 5개
	public static Vector<BBSDTO> gethitSelect(BBSDTO bdto) {
    	Connection conn = null;
    	PreparedStatement ps = null;
    	ResultSet rs = null;
    	String sql = null;
    	sql = "select * from bbs order by count desc limit 0 , 5";	
 
    	Vector<BBSDTO> bdata = new Vector<>();
    	conn = new DBConnect().getConn();
    	try {
    	  ps = conn.prepareStatement(sql);

    	  System.out.println(ps);
    	  rs = ps.executeQuery();

    	  while(rs.next()) {
    		  BBSDTO mb = new BBSDTO();
    		mb.setBbsnum(rs.getInt("bbsnum"));
			mb.setTitle(rs.getString("title"));
			bdata.add(mb);
          }

    	}catch(SQLException e) {}
    	finally {
    	   try { 
    	    	if(rs != null) rs.close();
    		    if(ps != null) ps.close(); 
    	         if(conn != null) conn.close();
    	    }catch(SQLException e) {}
    	}
    	return bdata;
    }
	
	
	//조회수올리기
	private static void hitAdd(int bbsnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = new DBConnect().getConn();
			String sql = "update bbs set count = count + 1 where bbsnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bbsnum);
			int r = pstmt.executeUpdate();
			System.out.println("hit업데이트 :" + r);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception ee) {}
		}
	}
	
	//글쓰기 글등록하는 메소드
	public boolean write(BBSDTO bdto, MembersDTO mdto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DBConnect().getConn();
			String sql = "insert into bbs"
					   + "(title, userid, username, content, count, wdate, uip)"
					   + "values"
					   + "(?, ?, ?, ?, ?, ?, ?)";
						
						
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bdto.getTitle());
			pstmt.setString(2, mdto.getUserid());
			pstmt.setString(3, mdto.getUsername());
			pstmt.setString(4, bdto.getContent());
			pstmt.setInt(5, bdto.getCount());
			pstmt.setString(6, bdto.getWdate());
			pstmt.setString(7, bdto.getUip());
			
			System.out.println(pstmt);
			flag =  pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
    		try { 
    			if(pstmt != null) pstmt.close(); 
    		    if(conn != null) conn.close();
    		}catch(SQLException e) {}
    	}
    	if(flag > 0) { //성공
    		return true;
    	}else {  //실패
    		return false;
    	}
	}

}
