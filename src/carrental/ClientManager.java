package carrental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ClientManager {
	String url="jdbc:mysql://localhost/carrental";
	String login="root";
	String password="1234";
	
	public int addClient(String clid, String name, String surname,	String date, String gender, int phone, String address, int lisenceNum, int status) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String sql = "insert into client values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clid);
		ps.setString(2, name);
		ps.setString(3, surname);
		ps.setString(4, date);
		ps.setString(5, gender);
		ps.setInt(6, phone);
		ps.setString(7, address);
		ps.setInt(8, lisenceNum);
		ps.setInt(9, status);
		
		int add = ps.executeUpdate();
		ps.close();
		con.close();
		return add;
	}
	
	public ArrayList<ClientMgt> getAllClients() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		
		String queryStr = "select * from client";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(queryStr);
		ArrayList<ClientMgt> clients = new ArrayList<ClientMgt>();
		
		while (rs.next()) {
			String clid = rs.getString("clid");
			String name = rs.getString("name");
			String surname = rs.getString("surname");
			String dob = rs.getString("DOB");
			String gender = rs.getString("gender");
			int phone = rs.getInt("phone");
			String address = rs.getString("address");
			int lisenceNum = rs.getInt("licensenum");
			int status = rs.getInt("status");
			ClientMgt newClient = new ClientMgt();
			newClient.setClid(clid);
			newClient.setName(name);
			newClient.setSurname(surname);
			newClient.setDate(dob);
			newClient.setGender(gender);
			newClient.setPhone(phone);
			newClient.setAddress(address);
			newClient.setLisenceNum(lisenceNum);
			newClient.setStatus(status);
			clients.add(newClient);
		}
		con.close();
		stmt.close();
		rs.close();
		
		return clients;
	}
	
	public ArrayList<ClientMgt> findClient(String id) throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		
		String queryStr = "select * from client where clid='" + id + "'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(queryStr);
		ArrayList<ClientMgt> clients = new ArrayList<ClientMgt>();
		
		while (rs.next()) {
			String clid = rs.getString("clid");
			String name = rs.getString("name");
			String surname = rs.getString("surname");
			String dob = rs.getString("DOB");
			String gender = rs.getString("gender");
			int phone = rs.getInt("phone");
			String address = rs.getString("address");
			int lisenceNum = rs.getInt("licensenum");
			int status = rs.getInt("status");
			ClientMgt newClient = new ClientMgt();
			newClient.setClid(clid);
			newClient.setName(name);
			newClient.setSurname(surname);
			newClient.setDate(dob);
			newClient.setGender(gender);
			newClient.setPhone(phone);
			newClient.setAddress(address);
			newClient.setLisenceNum(lisenceNum);
			newClient.setStatus(status);
			clients.add(newClient);
		}
		con.close();
		stmt.close();
		rs.close();
		
		return clients;
	}
	
	public int deleteClient(String clid)throws SQLException, ClassNotFoundException{
	    	
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn = DriverManager.getConnection(url,login,password);
	    
	    String removeSQL = "DELETE FROM client WHERE clid=?";
	    PreparedStatement pstmt  = conn.prepareStatement(removeSQL);
	    pstmt.setString(1, clid);
	    
	    int remove = pstmt.executeUpdate();
	    
	    conn.close();
	    pstmt.close();
	    
	    return remove;
	}
	
	public int updateClient(String clid, String name, String surname, int phone, String address, int lisenceNum, int status) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String sql = "update client set name='" + name + "', surname='" + surname + "', phone='" + phone + "',  address='" + address + "', licensenum='" + lisenceNum + "', status='" + status + "' where clid='" + clid + "'";
		Statement s = con.createStatement();
		
		int update = s.executeUpdate(sql);
		s.close();
		con.close();
		
		return update;
	}
	
	public String validateClid(String clid)throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String cl = "";
		
		String queryStr = "select clid from client where clid='" + clid + "'";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(queryStr);
		
		if (rs.next()) {
			cl = clid;
		}
		
		con.close();
		stmt.close();
		rs.close();
		
		return cl;
	}
}
