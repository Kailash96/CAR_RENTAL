<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList,carrental.*"%>
<jsp:useBean id="cm" class="carrental.ClientManager" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Find Client</title>
<link rel="stylesheet" href="..\resources\css\style.css">
</head>
<body style="background-color:#BBC8D0;">
<%
		int success = 0;
		boolean submit2 = Boolean.parseBoolean(request.getParameter("submitted"));
		if (submit2){
			String id = request.getParameter("clid");
			String name2 = request.getParameter("name");
			String surname2 = request.getParameter("surname");
			String dob2 = request.getParameter("dob");
			int phone2 = Integer.parseInt(request.getParameter("phone"));
			String address2 = request.getParameter("address");
			int liNum2 = Integer.parseInt(request.getParameter("licenseNum"));
			
			success = cm.updateClient(id, name2, surname2, phone2, address2, liNum2);
		}
%>
<form action="updateClient.jsp" method="post">
	Enter Client ID: <input type="text" name="clid">
	<input type="submit" value="Find">
</form>
<br>
<jsp:include page="viewAllClients.jsp"></jsp:include>
<br>
<a class="anchor" href="client.html">&lt; Back</a>
</body>
</html>