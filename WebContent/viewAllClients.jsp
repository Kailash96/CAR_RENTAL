<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,carrental.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Client</title>
<link rel="stylesheet" href="..\resources\css\style.css">
</head>
<jsp:useBean id="cm" class="carrental.ClientManager" scope="session"></jsp:useBean>
<%
	ArrayList<ClientMgt> clients = cm.getAllClients();
%>
<body style="background-color:#C2C4C3;">
<table border="1">
	<tr>
		<th style="text-align: center;" colspan=9>
			<h2 style="margin: 0px;">Existing Clients</h2>
		</th>
	</tr>
	<tr>
		<th><b>Clid</b></th>
		<th><b>Name</b></th>
		<th><b>Surname</b></th>
		<th><b>DOB</b></th>
		<th><b>Gender</b></th>
		<th><b>Phone</b></th>
		<th><b>Address</b></th>
		<th><b>License Num</b></th>
	</tr>
	<%
		for (int i=0; i < clients.size(); i++){
			ClientMgt client = clients.get(i);
	%>
	<tr>
		<td style="background-color: white;"><%=client.getClid() %></td>
		<td style="background-color: white;"><%=client.getName() %></td>
		<td style="background-color: white;"><%=client.getSurname() %></td>
		<td style="background-color: white;"><%=client.getDate() %></td>
		<td style="background-color: white;"><%=client.getGender() %></td>
		<td style="background-color: white;"><%=client.getPhone() %></td>
		<td style="background-color: white;"><%=client.getAddress() %></td>
		<td style="background-color: white;"><%=client.getLisenceNum() %></td>
	</tr>
	<% } %>
</table>
</body>
</html>