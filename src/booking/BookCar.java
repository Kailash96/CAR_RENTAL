package booking;

import java.sql.Connection;

@Stateless
public class BookCar {
	String url = "jdbc:mysql://localhost/carrental";
	String login = "root";
    String password = "";
    
    public int bookCar(String cid, String clid, Date bookdate, Date returnDate, float fees, float discount, float totalPayment, int Status) throws SQLException, ClassNotFoundException {
        Status = 0;
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, login, password);

        String bookstr = "INSERT INTO booking VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(bookstr);
        /* pstmt.setString(1, bid); */
        pstmt.setString(1, cid);
        pstmt.setString(2, clid);
        pstmt.setSTring(3, bookdate);
        pstmt.setSTring(4, returnDate);
        pstmt.setSTring(5, fees);
        pstmt.setSTring(6, discount);
        pstmt.setSTring(7, totalPayment);
        pstmt.setSTring(8, Status);

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
        Statement stmt = con.createStatement();
        ResultSeet rs = stmt.executeQuery(queryBooking);

        if (rs.next()){
            client = true;
        }

        con.close();
        stmt.close();
        rs.close();

        return client;
    }
}
