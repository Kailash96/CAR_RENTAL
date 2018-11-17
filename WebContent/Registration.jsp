<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="..\resources\css\style.css">
</head>
<body background="..\resources\img\car.jpg">
<f:view>
<div class="right">
<h:form>
<table>
	<tr>
		<td><p>Username:</p></td>
		<td>
			<h:inputText styleClass="test" value="#{register.user }" id="username" validator="#{register.validateUser }"></h:inputText><br>
			<h:message for="username" style="color:red"/>
		</td>
	</tr>
	<tr>
		<td><p>Password:</p></td>
		<td>
			<h:inputText styleClass="test" value="#{register.pass }" required="true" id="password" label="Password"></h:inputText><br>
			<h:message for="password" errorStyle="color:red"/>
		</td>
	</tr>
</table>
<center><h:commandButton styleClass="submit" value="Register" action="#{register.addingUser }"/></center>
</h:form>
</div>
</f:view>
</body>
</html>