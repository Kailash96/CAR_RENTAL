<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,carrental.*" %>
<jsp:useBean id="car" class="carrental.CarManager" scope="session"/>
<%
	ArrayList<CarMgt> cars = car.getAllCars();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table border=1>
		<tr>
			<th>ID</th>
			<th>Make</th>
			<th>Model</th>
			<th>Color</th>
			<th>Reg</th>
			<th>Engine</th>
			<th>Transmission</th>
			<th>Year</th>
		</tr>
		<%
			for (int i=0; i < cars.size(); i++){
				CarMgt newCar = cars.get(i);
		%>
		<tr>
			<td style="background-color: white;"><%=newCar.getId() %></td>
			<td style="background-color: white;"><%=newCar.getMake() %></td>
			<td style="background-color: white;"><%=newCar.getModel() %></td>
			<td style="background-color: white;"><%=newCar.getColor() %></td>
			<td style="background-color: white;"><%=newCar.getReg() %></td>
			<td style="background-color: white;"><%=newCar.getEngine() %></td>
			<td style="background-color: white;"><%=newCar.getTransmission() %></td>
			<td style="background-color: white;"><%=newCar.getYear() %></td>
		</tr>
		<% } %>
			
	</table>
</body>
</html>