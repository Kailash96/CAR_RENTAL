<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="car" class="carmgt.CarManager" scope="session"/>

<%
int success = 0;
Boolean submitted = Boolean.parseBoolean(request.getParameter("submitted"));
if(submitted){
	String make = request.getParameter("make");	
	String model = request.getParameter("model");
	String color = request.getParameter("color");
	String reg = request.getParameter("regmark");
	String engine = request.getParameter("engine");
	String transmission = request.getParameter("transmission");
	String year = request.getParameter("year");
	String age = request.getParameter("age");
	success = car.createcar(make, model, color, reg, engine, transmission, year, age);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Car Management</title>
</head>
<body>
<div id="side" style="float: left;width:40%;">

<form>
<fieldset>
<legend> Add a new Car</legend>
	<table>
		<tr>
		<td><label> Make: </label></td>
		<td>
			<select name="make">
			  <option value="0"> </option>
			  <option value="Maz">Mazda</option>
			  <option value="Nis">Nissan</option>
			  <option value="Toy">Toyota</option>
			  <option value="Aud">Audi</option>
			</select>
		</td>
		</tr>
		<tr>
		<td style="width: 99px;"><label> Model: </label></td>
		<td><input type="text" name="model"></td>
		</tr>
		<tr>
		<td><label> Color: </label></td>
		<td><input type="text" name="color"></td>
		</tr>
		<tr>
		<td><label> Registration Mark: </label></td>
		<td><input type="text" name="regmark"></td>
		</tr>
		<tr>
		<td><label> Engine: </label></td>
		<td>
			<select name="engine">
			  <option value="0"> </option>
			  <option value="pet">Petrol</option>
			  <option value="hyb">Hybrid</option>
			</select>
		</td>
		</tr>
		<tr>
		<td><label> Transmission: </label></td>
		<td>
			<select name="transmission">
			  <option value="0"> </option>
			  <option value="semi">Semi Automatic</option>
			  <option value="man">Manual</option>
			</select>
		</td>
		</tr>
		<tr>
		<td><label> Year: </label></td>
		<td><input type="date" name="year"></td>
		</tr>
		<tr>
		<td><label> Age: </label></td>
		<td><input type="text" name="age"></td>
		</tr>
		<tr>
		<td><input type="submit" value="Register"></td>
		</tr>
	</table>
	<input type="hidden" name="submitted" value="true">
</fieldset>
</form>
</div>

<div id="side" style="float: right;width:60%;">
	
	<table border="2">
	<tr>
	<td>ID</td>
	<td>Make</td>
	<td>Model</td>
	<td>Color</td>
	<td>Reg</td>
	<td>Engine</td>
	<td>Transmission</td>
	<td>Year</td>
	<td>Age</td>
	
	</tr>
	
	<%
	try
	{
	car.displaytable()
	%>
	</table>
	    <% }
	    rs.close();
	    stmt.close();
	    conn.close();
	    }
	catch(Exception e)
	{
	    
	    }
	
	%>

</div>

<a href="">Back to Main Menu</a>
</body>
</html>
