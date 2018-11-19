<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Main Menu</title>
<link rel="stylesheet" href="..\resources\css\style.css">
</head>
<body background="..\resources\img\car1.jpg" style="background-size: cover;background-repeat: no-repeat;">
<f:view>
<center>
<div class="bottom">
	<ul>
		<li><a href="AddNewCar.jsp"><img class="icons" src="..\resources\img\carLogo.png"></a></li>
		<li><a href=""><img class="icons" src="..\resources\img\bookings.png"></a></li>
		<li><a href="client.html"><img class="icons" src="..\resources\img\clients.png"></a></li>
		<li><a href=""><img class="icons" src="..\resources\img\return.png"></a></li>
		<li><a href=""><img class="icons" src="..\resources\img\report.png"></a></li>
		<li><a href="login.jsp"><img class="icons" src="..\resources\img\logout.png"></a></li>
	</ul>
</div>
</center>
</f:view>
</body>
</html>