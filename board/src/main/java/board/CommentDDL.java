package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class CommentDDL {
	private Connection conn;
	private ResultSet rs;
	
	
	//댓글보기
	public static Vector<CommentDTO> getcomment(int bbsnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from comment where bbsnum=?";
		Vector<CommentDTO> cdata = new Vector<>();
		try {
			conn = new DBConnect().getConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bbsnum);
			rs = pstmt.executeQuery();
			System.out.println(pstmt);
			if(rs.next()) {
				CommentDTO cdto = new CommentDTO();
				cdto.setBbsnum(rs.getInt("bbsnum"));
				cdto.setUserid(rs.getString("userid"));
				cdto.setUsername(rs.getString("username"));
				cdto.setComment(rs.getString("comment"));
				cdto.setWdate(rs.getString("wdate"));
				cdata.add(cdto);
			}
		}catch(SQLException e) {}
	       finally {
		          try { 
		              if(rs != null) rs.close();
	if(conn != null) conn.close();
		           }catch(SQLException e) {}
		       }
		       return cdata;
	}
}
