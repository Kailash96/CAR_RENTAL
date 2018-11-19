package carrental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.ejb.Stateless;

@Stateless
public class CarManager {
	String url = "jdbc:mysql://localhost/carrental";
	String login = "root";
	String password = "1234";
	
	public int createcar(String crid, String make, String model, String color, String reg, String engine, String transmission, 
		int year) throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		
		String insertstr = "INSERT INTO car VALUES(?,?,?,?,?,?,?,?,?)";
		int status = 0;
		PreparedStatement pstmt = con.prepareStatement(insertstr);
		pstmt.setString(1, crid);
		pstmt.setString(2, make);
		pstmt.setString(3, model);
		pstmt.setString(4, color);
		pstmt.setString(5, reg);
		pstmt.setString(6, engine);
		pstmt.setString(7, transmission);
		pstmt.setInt(8, year);
		pstmt.setInt(9, status);
		
		int insert = pstmt.executeUpdate();
		
		con.close();
		pstmt.close();
		
		return insert;
	}
	
	public String validateCrid(String crid)throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String cr = "";
		
		String queryStr = "select crid from car where crid='" + crid + "'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(queryStr);
		
		if (rs.next()) {
			cr = crid;
		}
		
		con.close();
		stmt.close();
		rs.close();
		
		return cr;
	}
		
	public ArrayList<CarMgt> getAllCars() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		
		String queryStr = "select * from car";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(queryStr);
		ArrayList<CarMgt> cars = new ArrayList<CarMgt>();
		
		while (rs.next()) {
			String crid = rs.getString("crid");
			String make = rs.getString("make");
			String model = rs.getString("model");
			String color = rs.getString("color");
			String regmark = rs.getString("regmark");
			String engine = rs.getString("engine");
			String transmission = rs.getString("transmission");
			int year = rs.getInt("year");
			CarMgt newCar = new CarMgt();
			newCar.setId(crid);
			newCar.setMake(make);
			newCar.setModel(model);
			newCar.setColor(color);
			newCar.setReg(regmark);
			newCar.setEngine(engine);
			newCar.setTransmission(transmission);
			newCar.setYear(year);
			cars.add(newCar);
		}
		con.close();
		stmt.close();
		rs.close();
		
		return cars;
	}
}
