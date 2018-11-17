package carrental;

import java.sql.*;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.ValidatorException;

public class Register {
	String url="jdbc:mysql://localhost/carrental";
	String login="root";
	String password="1234";
	
	String user;
	String pass;
	
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String addingUser() throws SQLException, ClassNotFoundException{	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String sql="insert into usersdetails values(?,?)";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, user);
		ps.setString(2, pass);
		
		ps.executeUpdate();
		
		ps.close();
		con.close();
		
		return "mainMenu.jsp?faces-redirect=true";
	}
	public void validateUser(FacesContext context, UIComponent componentToValidate, Object value) throws ValidatorException,SQLException, ClassNotFoundException{
		String username = (String) value;
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url, login, password);
		String str = "select * from usersdetails where username='" + username + "'";
		Statement s = con.prepareStatement(str);
		ResultSet rs = s.executeQuery(str);
		
		if (rs.next()) {
			FacesMessage msg = new FacesMessage("Username already exists!");
			throw new ValidatorException(msg);
		}
	}
}
