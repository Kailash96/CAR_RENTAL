package carrental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Login {
	String url="jdbc:mysql://localhost/carrental";
	String login="root";
	String password="1234";
	
	String userName;
	String userPass;
	ArrayList<String> errorMsg;
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String loginUser() throws SQLException, ClassNotFoundException{
		errorMsg = new ArrayList<String>();
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String str = "select * from usersdetails where username='" + userName + "' and password='" + userPass + "'";
		Statement s = con.prepareStatement(str);
		ResultSet rs = s.executeQuery(str);
		
		if (rs.next()) {
			return "mainMenu.jsp?faces-redirect=true";
		}else {
			errorMsg.add("Invalid Username or Password!");
			return null;
		}
	}
	
	public String getErrorMsg() {
		String msgList;
		if ((errorMsg == null) || (errorMsg.size() == 0)) {
			msgList = "";
		}else {
			msgList = "<font color=red><b><ul>";
			for (int i=0; i<errorMsg.size(); i++) {
				msgList += "<li>" + errorMsg.get(i) + "</li>";
			}
			msgList += "</ul></b></font>";
		}
		return msgList;
	}
}
