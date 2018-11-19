<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="booking" class="booking.BookCar"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Booking | Car Rental</title>
<link rel="stylesheet" href="resources\css\style.css">
</head>
<body bgcolor="#BBC8D0">
    <%
        Boolean submitted = Boolean.parseBoolean(request.getParameter("isSubmitted"));
        if (submitted){
            String clientID = request.getParameter("clientID");
            String surname = request.getParameter("clientSurname");
            String name = request.getParameter("clientName");
            String address = request.getParameter("clientAddress");
            String phone = request.getParameter("clientPhone");
            String carID = request.getParameter("carID");
            String make = request.getParameter("carMake");
            String model = request.getParameter("carModel");
            String color = request.getParameter("carColor");
            String year = request.getParameter("year");
            String nod = request.getParameter("nOfDays");
            String returnDate = request.getParameter("rtrnDate");
            String fees = request.getParameter("fees");
            String discount = request.getParameter("discount");
            String deposit = request.getParameter("deposit");

            Boolean valid = booking.validateClientID(clientID);
            if (valid == true){

            } else {
                success = booking.bookCar(carID, clientID);
            }
        } else {
    %>
    <center>
    <form method="get" action="booking.jsp">
        <table>
            <tr>
                <td colspan="2">
                    <center>
                        <h1>New Booking</h1>
                    </center>
                </td>
            </tr>
            <tr>
                <td>
                    <h3 style="text-align:right">Client Details</h3>
                </td>
                <td>
                    <h3 style="text-align:right">Car Details</h3>
                </td>
            </tr>
            <tr>
                <td>
                    <div style="text-align:right">
                        ID: <input type="text" name="clientID" /><br/><br/>
                        Surname: <input type="text" name="clientSurname" /><br/><br/>
                        Name: <input type="text" name="clientName" /><br/><br/>
                        Address: <input type="text" name="clientAddress" /><br/><br/>
                        Phone: <input type="text" name="clientPhone" />
                    </div>
                </td>
                <td>
                    <div style="text-align:right">
                        Car ID: <input type="text" name="carID" /><br/><br/>
                        Make: <input type="text" name="carMake" /><br/><br/>
                        Model: <input type="text" name="carModel" /><br/><br/>
                        Color: <input type="text" name="carColor" /><br/><br/>
                        Year: <input type="text" name="year" />
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3 style="text-align:center">Booking Details</h3>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="text-align:center">
                        <div style="text-align:right;display:inline-block">
                            Number of Days: <input type="text" name="nOfDays" /><br/><br/>
                            Return Date: <input type="text" name="rtrnDate" /><br/><br/>
                            Fees: <input type="text" name="fees" /><br/><br/>
                            Discount: <input type="text" name="discount" /><br/><br/>
                            Deposit: <input type="text" name="deposit" /><br/><br/> 
                            Total: <input type="text" name="total" />
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <center>
                        <input type="hidden" value="true" name="isSubmitted" />
                        <input type="button" value="New Client" class="anchor" />
                        <input type="submit" value="Confirm Booking" class="anchor" />
                    </center>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <center>
                        <a href="mainMenu.jsp" class="anchor">Main Menu</a>
                    </center>
                </td>
            </tr>
        </table>
    </form>
    </center>
    <% } %>
</body>
</html>