package carrental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.ejb.Stateful;

@Stateful
public class RegisterManager {
	
	String url="jdbc:mysql://localhost/carrental2";
	String login="root";
	String password="1234";
	
	public int addUser(int cid,String name,String dob,String gender,int phone,String address,String licenseNum,String user,String pass) throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String sql = "insert into registered_users values(?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, cid);
		ps.setString(2, name);
		ps.setString(3, dob);
		ps.setString(4, gender);
		ps.setInt(5, phone);
		ps.setString(6, address);
		ps.setString(7, licenseNum);
		ps.setString(8, user);
		ps.setString(9, pass);
		
		int add = ps.executeUpdate();
		ps.close();
		con.close();
		
		return add;
	}
}
