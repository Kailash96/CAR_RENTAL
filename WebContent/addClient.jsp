<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:useBean id="newClient" class="carrental.ClientManager" scope="session"></jsp:useBean>
<meta charset="ISO-8859-1">
<title>Client Information</title>
<link rel="stylesheet" href="..\resources\css\style.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function () {
    	$("#datepicker").datepicker();
    });
</script>
</head>
<body style="background-color:#BBC8D0;">
<% 
	int success = 0;
	String str = "";
	boolean submit = Boolean.parseBoolean(request.getParameter("submitted"));
	if (submit){
		String clid = ((request.getParameter("clid1")) + (request.getParameter("clid2")));
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		int phone = Integer.parseInt(request.getParameter("phone"));
		String address = request.getParameter("address");
		int licenseNum = Integer.parseInt(request.getParameter("licenseNum"));
		int status = 0;
		
		String cl = newClient.validateClid(clid);
		if (clid == cl){
			str = "<h6 class='error'>Client ID already exists!</h6>";
		}else{
			success = newClient.addClient(clid, name, surname, dob, gender, phone, address, licenseNum, status);
		}
	}
%>
<div class="container">
<div class="leftClient">
<p>M - Mauritian</p>
<p>T - Tourist</p>
<form method="post" action="addClient.jsp" onsubmit="return validate()" name="clientForm">
<table>
<tr>
	<td>Client ID: </td>
	<td>
		<select name="clid1">
			<option value="M">M</option>
			<option value="T">T</option>
		</select>
		<input type="number" name="clid2" size="3" maxlength="3">
		<div id="id_error" class="error"></div>
		<%=str %>
	</td>
</tr>
<tr>
	<td>First Name: </td>
	<td>
		<input type="text" name="name">
		<div id="name_error" class="error"></div>
	</td>
</tr>
<tr>
	<td>Surname: </td>
	<td>
		<input type="text" name="surname">
		<div id="surname_error" class="error"></div>
	</td>
</tr>
<tr>
	<td>DOB: </td>
	<td>
		<input type="text" name="dob" id="datepicker">
		<div id="date_error" class="error"></div>
	</td>
</tr>
<tr>
	<td>Gender: </td>
	<td>
		<select name="gender">
			<option value="male">Male</option>
			<option value="female">Female</option>
		</select>
	</td>
</tr>
<tr>
	<td>Phone: </td>
	<td>
		<input type="text" name="phone">
		<div id="phone_error" class="error"></div>
	</td>
</tr>
<tr>
	<td>Address: </td>
	<td>
		<input type="text" name="address">
		<div id="address_error" class="error"></div>
	</td>
</tr>
<tr>
	<td>License Number: </td>
	<td>
		<input type="text" name="licenseNum">
		<div id="liNum_error" class="error"></div>
	</td>
</tr>
<tr>
	<td>
		<a class="anchor" href="client.html">&lt; Back</a>
		<input type="hidden" name="submitted" value="true">
	</td>
	<td><input type="submit" class="test2" value="Add Client"></td>
</tr>
</table>
</form>
<script>
	var id = document.forms["clientForm"]["clid2"];
	var name = document.forms["clientForm"]["name"];
	var surname = document.forms["clientForm"]["surname"];
	var date = document.forms["clientForm"]["dob"];
	var phone = document.forms["clientForm"]["phone"];
	var address = document.forms["clientForm"]["address"];
	var liNum = document.forms["clientForm"]["licenseNum"];
	
	var id_error = document.getElementById("id_error");
	var name_error = document.getElementById("name_error");
	var surname_error = document.getElementById("surname_error");
	var date_error = document.getElementById("date_error");
	var phone_error = document.getElementById("phone_error");
	var address_error = document.getElementById("address_error");
	var liNum_error = document.getElementById("liNum_error");
	
	id.addEventListener("blur", idVerify, true);
	name.addEventListener("blur", nameVerify, true);
	surname.addEventListener("blur", surnameVerify, true);
	date.addEventListener("blur", dateVerify, true);
	phone.addEventListener("blur", phoneVerify, true);
	address.addEventListener("blur", addressVerify, true);
	liNum.addEventListener("blur", liNumVerify, true);
	
	function validate(){
		if (id.value == ""){
			id.style.border = "1px solid red";
			id_error.innerHTML = "<h6 class='error'>ID required!</h6>";
			id.focus();
			return false;
		}
		if (name.value == ""){
			name.style.border = "1px solid red";
			name_error.innerHTML = "<h6 class='error'>First Name required!</h6>";
			name.focus();
			return false;
		}
		if (surname.value == ""){
			surname.style.border = "1px solid red";
			surname_error.innerHTML = "<h6 class='error'>Surname required!</h6>";
			surname.focus();
			return false;
		}
		if (date.value == ""){
			date.style.border = "1px solid red";
			date_error.innerHTML = "<h6 class='error'>Date required!</h6>";
			date.focus();
			return false;
		}
		if (phone.value == ""){
			phone.style.border = "1px solid red";
			phone_error.innerHTML = "<h6 class='error'>Phone number required!</h6>";
			phone.focus();
			return false;
		}
		if ((phone.value).length < 7){
			phone.style.border = "1px solid red";
			phone_error.innerHTML = "<h6 class='error'>Phone number be > 7 digits!</h6>";
			phone.focus();
			return false;
		}
		if (isNaN(phone.value)){
			phone.style.border = "1px solid red";
			phone_error.innerHTML = "<h6 class='error'>Phone number Invalid!</h6>";
			phone.focus();
			return false;
		}
		if (address.value == ""){
			address.style.border = "1px solid red";
			address_error.innerHTML = "<h6 class='error'>Address required!</h6>";
			address.focus();
			return false;
		}
		if (liNum.value == ""){
			liNum.style.border = "1px solid red";
			liNum_error.innerHTML = "<h6 class='error'>License Number required!</h6>";
			liNum.focus();
			return false;
		}
		if (isNaN(liNum.value)){
			liNum.style.border = "1px solid red";
			liNum_error.innerHTML = "<h6 class='error'>License Number Invalid!</h6>";
			liNum.focus();
			return false;
		}
		if ((liNum.value).length != 7){
			liNum.style.border = "1px solid red";
			liNum_error.innerHTML = "<h6 class='error'>License Number contains 7 digits!</h6>";
			liNum.focus();
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
	function nameVerify(){
		if (name.value != ""){
			name.style.border = "1px solid blue";
			name_error.innerHTML = "";
			return true;
		}
	}
	function surnameVerify(){
		if (surname.value != ""){
			surname.style.border = "1px solid blue";
			surname_error.innerHTML = "";
			return true;
		}
	}
	function dateVerify(){
		if ((date1.value != "") && (date2.value != "") && (date3.value != "")){
			date1.style.border = "1px solid blue";
			date2.style.border = "1px solid blue";
			date3.style.border = "1px solid blue";
			date_error.innerHTML = "";
			return true;
		}
	}
	function phoneVerify(){
		if (phone.value != ""){
			phone.style.border = "1px solid blue";
			phone_error.innerHTML = "";
			return true;
		}
	}
	function addressVerify(){
		if (address.value != ""){
			address.style.border = "1px solid blue";
			address_error.innerHTML = "";
			return true;
		}
	}
	function liNumVerify(){
		if (liNum.value != ""){
			liNum.style.border = "1px solid blue";
			liNum_error.innerHTML = "";
			return true;
		}
	}
</script>
<br>
<%
	if ((submit) && (success == 1)){ %>
		<center><h3 class="success">Added successfully!</h3></center>
	<% }else if(submit){ %>
		<center><h3 class="error">Not added!</h3></center>
	<% }
%>
</div>
<div class="rightClient">
	<jsp:include page="viewAllClients.jsp"></jsp:include>
</div>
</div>
</body>
</html>