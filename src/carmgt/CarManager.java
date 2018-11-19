package carmgt;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.ejb.Stateless;

@Stateless
public class CarManager {
	String url = "jdbc:mysql://localhost/carrental";
	String login = "root";
	String password = "";

	public int createcar(String make, String model, String color, String reg, String engine, String transmission, 
			String year, String age) throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		
		String insertstr = "INSERT INTO book VALUES(?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(insertstr);
		pstmt.setString(1, make);
		pstmt.setString(2, model);
		pstmt.setString(3, color);
		pstmt.setString(4, reg);
		pstmt.setString(5, engine);
		pstmt.setString(6, transmission);
		pstmt.setString(7, year);
		pstmt.setString(8, age);
		
		int insert = pstmt.executeUpdate();
		
		con.close();
		pstmt.close();
		
		return insert;
	}
	
	public void displaytable() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,login,password);
		String query="select * from car";
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next());
	}
}
