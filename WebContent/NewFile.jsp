<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>
<jsp:useBean id="log" class="carrental.ClientManager" scope="session"></jsp:useBean>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<%
	int success = 0;
	Boolean submitted = Boolean.parseBoolean(request.getParameter("submitted"));
	if (submitted){
		String id = "M003";
		String name2 = request.getParameter("name");
		String surname2 = request.getParameter("surname");
		String dob2 = request.getParameter("dob");
		String gender2 = request.getParameter("gender");
		int phone2 = Integer.parseInt(request.getParameter("phone"));
		String address2 = request.getParameter("address");
		int liNum2 = Integer.parseInt(request.getParameter("licenseNum"));
		int status2 = Integer.parseInt(request.getParameter("status"));
		
		success = log.updateClient(id, name2, surname2, dob2, gender2, phone2, address2, liNum2, status2);
	}
%>
<form method="post" action="NewFile.jsp">
	<table>
		<tr>
			<td>First Name: </td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>Surname: </td>
			<td><input type="text" name="surname"></td>
		</tr>
		<tr>
			<td>DOB: </td>
			<td><input type="date" name="dob" placeholder="yyyy-MM-DD"></td>
		</tr>
		<tr>
			<td>Gender: </td>
			<td>
				<input type="text" name="gender">
			</td>
		</tr>
		<tr>
			<td>Phone: </td>
				<td><input type="number" name="phone"></td>
			</tr>
			<tr>
				<td>Address: </td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>License Number: </td>
			<td><input type="number" name="licenseNum"></td>
			</tr>
		<tr>
			<td>Status:</td>
			<td>
				<select name="status">
					<option value="1">1 - Still on loan</option>
					<option value="0">0 - Car returned</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="Update Client"></td>
			<td><input type="hidden" name="submitted" value="true"></td>
		</tr>
	</table>
</form>
<br>
<jsp:include page="viewAllClients.jsp"></jsp:include>
</body>
</html>