package carrental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginManager {	
	int success = 0;
	public int loginUser(String user, String pass) throws SQLException, ClassNotFoundException{
		String url="jdbc:mysql://localhost/carrental";
		String login="root";
		String password="1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String str = "select * from usersdetails where username='" + user + "'";
		Statement s = con.prepareStatement(str);
		ResultSet rs = s.executeQuery(str);
		
		if (rs.next()) {
			return success = 1;
		}else{
			return success = 0;
		}
	}
}
