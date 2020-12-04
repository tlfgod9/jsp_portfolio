package deliver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class DeliverDAO {

	private Connection conn;
	private ResultSet rs;
	
	public DeliverDAO() {
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
	
	public int write(int pID, String recipient, String tel, String address, String memo, String payment) {
		String SQL = "insert into deliver(pID, recipient, tel, address, memo, payment) values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pID);
			pstmt.setString(2, recipient);
			pstmt.setString(3, tel);
			pstmt.setString(4, address);
			pstmt.setString(5, memo);
			pstmt.setString(6, payment);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Deliver> getDeliver(int pID) { /* 어레이리스트 배열 함수 사용하는게 좋나? */
		String SQL = "select * from product where pID = ? order by pID desc limit 5";
		ArrayList<Deliver> list = new ArrayList<Deliver>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Deliver deliver = new Deliver();
				deliver.setpID(rs.getInt(1));
				deliver.setId(rs.getInt(2));
				deliver.setRecipient(rs.getString(3));
				deliver.setTel(rs.getString(4));
				deliver.setAddress(rs.getString(5));
				deliver.setMemo(rs.getString(6));
				deliver.setPayment(rs.getString(7));
				list.add(deliver);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
