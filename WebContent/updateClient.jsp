<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList,carrental.*"%>
<!DOCTYPE html>
<jsp:useBean id="cm" class="carrental.ClientManager" scope="session" />
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Client</title>
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
<body>
<%
	String name="";
	String surname="";
	String dob="";
	String gender="";
	int phone=0;
	String address="";
	int liNum=0;
	
	String id = request.getParameter("clid");
	ArrayList<ClientMgt> list = cm.findClient(id);
	
	if(list.size() > 0){
		for (int i=0; i < list.size(); i++){
			ClientMgt client = list.get(i);
			id = client.getClid();
			name = client.getName();
			surname = client.getSurname();
			dob = client.getDate();
			gender = client.getGender();
			phone = client.getPhone();
			address = client.getAddress();
			liNum = client.getLisenceNum();
		}
%>
			<form method="post" action="findClient.jsp" onsubmit="return validate()" name="clientForm">
				<table>
					<tr>
						<td>Client Id: </td>
						<td><input type="text" name="clid" value="<%=id %>"></td>
					</tr>
					<tr>
						<td>First Name: </td>
						<td>
							<input type="text" name="name" value="<%=name %>">
							<div id="name_error" class="error"></div>
						</td>
					</tr>
					<tr>
						<td>Surname: </td>
						<td>
							<input type="text" name="surname" value="<%=surname %>">
							<div id="surname_error" class="error"></div>
						</td>
					</tr>
					<tr>
						<td>DOB: </td>
						<td>
							<input type="date" name="dob" value="<%=dob %>" id="datepicker">
							<div id="date_error" class="error"></div>
						</td>
					</tr>
					<tr>
						<td>Gender: </td>
						<td>
							<input type="text" name="gender" value="<%=gender %>">
						</td>
					</tr>
					<tr>
						<td>Phone: </td>
						<td>
							<input type="number" name="phone" value="<%=phone %>">
							<div id="phone_error" class="error"></div>
						</td>
					</tr>
					<tr>
						<td>Address: </td>
						<td>
							<input type="text" name="address" value="<%=address %>">
							<div id="address_error" class="error"></div>
						</td>
					</tr>
					<tr>
						<td>License Number: </td>
						<td>
							<input type="number" name="licenseNum" value="<%=liNum %>">
							<div id="liNum_error" class="error"></div>
						</td>
					</tr>
					<tr>
						<td>
							<input type="hidden" name="submitted" value="true">
							<a class="anchor" href="findClient.jsp">&lt; Back</a>
						</td>
						<td><input type="submit" class="test2" value="Update Client"></td>
					</tr>
					</table>
					<script>
						var name = document.forms["clientForm"]["name"];
						var surname = document.forms["clientForm"]["surname"];
						var phone = document.forms["clientForm"]["phone"];
						var address = document.forms["clientForm"]["address"];
						var liNum = document.forms["clientForm"]["licenseNum"];
						
						var name_error = document.getElementById("name_error");
						var surname_error = document.getElementById("surname_error");
						var phone_error = document.getElementById("phone_error");
						var address_error = document.getElementById("address_error");
						var liNum_error = document.getElementById("liNum_error");
						
						name.addEventListener("blur", nameVerify, true);
						surname.addEventListener("blur", surnameVerify, true);
						phone.addEventListener("blur", phoneVerify, true);
						address.addEventListener("blur", addressVerify, true);
						liNum.addEventListener("blur", liNumVerify, true);
						
						function validate(){
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
				</form>
				<%
		}else if(list.size() == 0){
			%>
				<h4>Client Not Found</h4>
				<br>
				<a class="anchor" href="findClient.jsp">&lt; Back</a>
			<%
		}
%>
</body>
</html>