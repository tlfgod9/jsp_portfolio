package fbbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FbbsDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public FbbsDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/text?characterEncoding=UTF-8&serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "select fbbsID from fbbs order by fbbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int write(String fbbsTitle, String userID, String fbbsContent) {
		String SQL = "insert into fbbs values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, fbbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, fbbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Fbbs> getList(int pageNumber) {
		String SQL = "select * from fbbs where fbbsID < ? and fbbsAvailable = 1 order by fbbsID desc limit 5 ";
		ArrayList<Fbbs> list = new ArrayList<Fbbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Fbbs fbbs = new Fbbs();
				fbbs.setFbbsID(rs.getInt(1));
				fbbs.setFbbsTitle(rs.getString(2));
				fbbs.setUserID(rs.getString(3));
				fbbs.setFbbsDate(rs.getString(4));
				fbbs.setFbbsContent(rs.getString(5));
				fbbs.setFbbsAvailable(rs.getInt(6));
				list.add(fbbs);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "select * from fbbs where fbbsID < ? and fbbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Fbbs getFbbs(int fbbsID) {
		String SQL = "select * from fbbs where fbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fbbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Fbbs fbbs = new Fbbs();
				fbbs.setFbbsID(rs.getInt(1));
				fbbs.setFbbsTitle(rs.getString(2));
				fbbs.setUserID(rs.getString(3));
				fbbs.setFbbsDate(rs.getString(4));
				fbbs.setFbbsContent(rs.getString(5));
				fbbs.setFbbsAvailable(rs.getInt(6));
				return fbbs;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int update(int fbbsID, String fbbsTitle, String fbbsContent) {
		String SQL = "update fbbs set fbbsTitle = ?, fbbsContent = ? where fbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, fbbsTitle);
			pstmt.setString(2, fbbsContent);
			pstmt.setInt(3, fbbsID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public int delete(int fbbsID) {
		String SQL = "update fbbs set fbbsAvailable = 0 where fbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, fbbsID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
