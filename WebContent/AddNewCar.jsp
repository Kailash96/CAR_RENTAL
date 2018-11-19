<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*,carrental.*" %>
<jsp:useBean id="car" class="carrental.CarManager" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Car</title>
<link rel="stylesheet" href="..\resources\css\style.css">
</head>
<body>
<div id="side" style="float: left;width:40%;">
<%
	int success = 0;
	String str = "";
	boolean submit = Boolean.parseBoolean(request.getParameter("submitted"));
	if (submit){
		String crid = request.getParameter("crid");
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String color = request.getParameter("color");
		String regmark = request.getParameter("regmark");
		String engine = request.getParameter("engine");
		String transmission = request.getParameter("transmission");
		int year = Integer.parseInt(request.getParameter("year"));
		
		String cr = car.validateCrid(crid);
		if (crid == cr){
			str = "<h6 class='error'>Car ID already exists!</h6>";
		}else{
			success = car.createcar(crid, make, model, color, regmark, engine, transmission, year);
		}
	}
%>
<form method="post" action="AddNewCar.jsp" onsubmit="return validate()" name="carForm">
<fieldset>
<legend> Add a new Car</legend>
	<table>
		<tr>
		<td><label> Car ID: </label></td>
		<td>
			<input type="text" name="crid" size="3" maxlength="3">
			<div id="id_error" class="error"></div>
			<%=str %>
		</td>
		</tr>
		<tr>
		<td><label> Make: </label></td>
		<td>
			<select name="make">
			  <option value="Mazda">Mazda</option>
			  <option value="Nissan">Nissan</option>
			  <option value="Toyota">Toyota</option>
			  <option value="Audi">Audi</option>
			</select>
		</td>
		</tr>
		<tr>
		<td style="width: 99px;"><label> Model: </label></td>
		<td>
			<input type="text" name="model">
			<div id="model_error" class="error"></div>
		</td>
		</tr>
		<tr>
		<td><label> Color: </label></td>
		<td>
			<input type="text" name="color">
			<div id="color_error" class="error"></div>
		</td>
		</tr>
		<tr>
		<td><label> Registration Mark: </label></td>
		<td>
			<input type="text" name="regmark">
			<div id="regmark_error" class="error"></div>
		</td>
		</tr>
		<tr>
		<td><label> Engine: </label></td>
		<td>
			<select name="engine">
			  <option value="Petrol">Petrol</option>
			  <option value="Diesel">Diesel</option>
			  <option value="Hybrid">Hybrid</option>
			</select>
		</td>
		</tr>
		<tr>
		<td><label> Transmission: </label></td>
		<td>
			<select name="transmission">
			  <option value="semi">Semi Automatic</option>
			  <option value="manual">Manual</option>
			</select>
		</td>
		</tr>
		<tr>
		<td><label> Year: </label></td>
		<td>
			<input type="text" name="year" size="4" maxlength="4">
			<div id="year_error" class="error"></div>
		</td>
		</tr>
		<tr>
		<td><a class="anchor" href="mainMenu.jsp">&lt; Back</a></td>
		<td><input class="test2" type="submit" value="Register"></td>
		</tr>
	</table>
	<input type="hidden" name="submitted" value="true">
	<br>
	<%
		if ((submit) && (success == 1)){ %>
		<center><h3 class="success">Added successfully!</h3></center>
	<% }else if(submit){ %>
		<center><h3 class="error">Not added!</h3></center>
	<% }
	%>
</fieldset>
</form>
<script>
	var id = document.forms["carForm"]["crid"];
	var model = document.forms["carForm"]["model"];
	var color = document.forms["carForm"]["color"];
	var regmark = document.forms["carForm"]["regmark"];
	var year = document.forms["carForm"]["year"];
	
	var id_error = document.getElementById("id_error");
	var model_error = document.getElementById("model_error");
	var color_error = document.getElementById("color_error");
	var regmark_error = document.getElementById("regmark_error");
	var year_error = document.getElementById("year_error");
	
	id.addEventListener("blur", idVerify, true);
	model.addEventListener("blur", modelVerify, true);
	color.addEventListener("blur", colorVerify, true);
	regmark.addEventListener("blur", regmarkVerify, true);
	year.addEventListener("blur", yearVerify, true);
	
	function validate(){
		if (id.value == ""){
			id.style.border = "1px solid red";
			id_error.innerHTML = "<h6 class='error'>ID required!</h6>";
			id.focus();
			return false;
		}
		if (model.value == ""){
			model.style.border = "1px solid red";
			model_error.innerHTML = "<h6 class='error'>Model required!</h6>";
			model.focus();
			return false;
		}
		if (color.value == ""){
			color.style.border = "1px solid red";
			color_error.innerHTML = "<h6 class='error'>Color required!</h6>";
			color.focus();
			return false;
		}
		if (regmark.value == ""){
			date.style.border = "1px solid red";
			date_error.innerHTML = "<h6 class='error'>Registration mark required!</h6>";
			date.focus();
			return false;
		}
		if (year.value == ""){
			year.style.border = "1px solid red";
			year_error.innerHTML = "<h6 class='error'>Year required!</h6>";
			year.focus();
			return false;
		}
		if ((year.value).length < 4){
			year.style.border = "1px solid red";
			year_error.innerHTML = "<h6 class='error'>Year Format yyyy!</h6>";
			year.focus();
			return false;
		}
	}
	function idVerify(){
		if (id.value != ""){
			id.style.border = "1px solid blue";
			id_error.innerHTML = "";
			return true;
		}
	}
	function modelVerify(){
		if (model.value != ""){
			model.style.border = "1px solid blue";
			model_error.innerHTML = "";
			return true;
		}
	}
	function colorVerify(){
		if (color.value != ""){
			color.style.border = "1px solid blue";
			color_error.innerHTML = "";
			return true;
		}
	}
	function regmarkVerify(){
		if (regmark.value != ""){
			regmark.style.border = "1px solid blue";
			regmark_error.innerHTML = "";
			return true;
		}
	}
	function yearVerify(){
		if (year.value != ""){
			year.style.border = "1px solid blue";
			year_error.innerHTML = "";
			return true;
		}
	}
	function yearVerify(){
		if ((year.value).length == 4){
			year.style.border = "1px solid blue";
			address_error.innerHTML = "";
			return true;
		}
	}
</script>
</div>

<div id="side" style="float: right;width:60%;">
	<jsp:include page="viewAllCars.jsp"></jsp:include>
</div>

</body>
</html>