package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;




public class ProductDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public ProductDAO() {
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
	
	public String getUserName(String userID) {
		String SQL = "select userName from user where userID=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); 
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int write(String pName, String userID, int bid, int price, String category, String image, String outputDate, String description) {
		String SQL = "insert into product(category,uName,pName,bid,price,inputDate,outputDate,description,image,userID) values(?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, category);
			pstmt.setString(2, getUserName(userID));
			pstmt.setString(3, pName);
			pstmt.setInt(4, bid);
			pstmt.setInt(5, price);
			pstmt.setString(6, getDate());
			pstmt.setString(7, outputDate);
			pstmt.setString(8, description);
			pstmt.setString(9, image);
			pstmt.setString(10, userID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public Product getProduct(String userID) { /* 어레이리스트 배열 함수 사용하는게 좋나? */
		String SQL = "select * from product where userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Product product = new Product();
				product.setpName(rs.getString(1));
				product.setBid(rs.getInt(2));
				product.setPrice(rs.getInt(3));
				product.setInputDate(rs.getString(4));
				product.setOutputDate(rs.getString(5));
				return product;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int getNext() {
		String SQL = "select userID from product order by userID desc";
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
	
	public ArrayList<Product> getList(int pageNumber, String userID) { /* 어레이리스트 배열 함수 사용하는게 좋나? */
		String SQL = "select * from product where userID = ? and pID > ? order by pID desc limit 5";
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, getNext() - (pageNumber - 1) * 5);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setpID(rs.getInt(1));
				product.setCategory(rs.getString(2));
				product.setuName(rs.getString(3));
				product.setpName(rs.getString(4));
				product.setBid(rs.getInt(5));
				product.setPrice(rs.getInt(6));
				product.setInputDate(rs.getString(7));
				product.setOutputDate(rs.getString(8));
				product.setDescription(rs.getString(9));
				product.setImage(rs.getString(10));
				product.setUserID(rs.getString(11));
				list.add(product);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public Product getProduct(int pID) {
		String SQL = "select * from product where pID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Product product = new Product();
				product.setpID(rs.getInt(1));
				product.setCategory(rs.getString(2));
				product.setuName(rs.getString(3));
				product.setpName(rs.getString(4));
				product.setBid(rs.getInt(5));
				product.setPrice(rs.getInt(6));
				product.setInputDate(rs.getString(7));
				product.setOutputDate(rs.getString(8));
				product.setDescription(rs.getString(9));
				product.setImage(rs.getString(10));
				product.setUserID(rs.getString(11));
				return product;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int delete(int pID) {
		String SQL = "delete from product where pID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, pID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int update(int pID, String category, String pName, int bid, int price, String outputDate, String image, String description) {
		String SQL = "update product set category = ?, pName = ?, bid = ?, price = ?, outputDate = ?, image = ?, description = ? where pID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, category);
			pstmt.setString(2, pName);
			pstmt.setInt(3, bid);
			pstmt.setInt(4, price);
			pstmt.setString(5, outputDate);
			pstmt.setString(6, image);
			pstmt.setString(7, description);
			pstmt.setInt(8, pID);
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
		
	}
}
