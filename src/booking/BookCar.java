package booking;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ejb.Stateless;

import com.mysql.cj.xdevapi.Statement;

@Stateless
public class BookCar {
	String url = "jdbc:mysql://localhost/carrental";
	String login = "root";
    String password = "";
    
    public int bookCar(String cid, String clid, String bookdate, String returnDate, Float fees, Float discount, Float totalPayment, int Status) throws SQLException, ClassNotFoundException {
        Status = 0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, login, password);

        String bookstr = "INSERT INTO booking VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(bookstr);
        /* pstmt.setString(1, bid); */
        pstmt.setString(1, cid);
        pstmt.setString(2, clid);
        pstmt.setString(3, bookdate);
        pstmt.setString(4, returnDate);
        pstmt.setFloat(5, fees);
        pstmt.setFloat(6, discount);
        pstmt.setFloat(7, totalPayment);
        pstmt.setInt(8, Status);

        int booked = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return booked;
    }

    public Boolean validateClientID(String clientID) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, login, password);
        Boolean client = false;

        String queryBooking = "SELECT clientID FROM booking WHERE clid = '" + clientID + "'";
        Statement stmt = (Statement) con.createStatement();
        ResultSet rs = ((java.sql.Statement) stmt).executeQuery(queryBooking);

        if (rs.next()){
            client = true;
        }

        con.close();
        stmt.close();
        rs.close();

        return client;
    }
}
