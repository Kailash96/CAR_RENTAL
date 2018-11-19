<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<jsp:useBean id="cm" class="carrental.ClientManager" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Client</title>
</head>
<body style="background-color:#BBC8D0;">
<%
	int remove=0;
	boolean submitted = Boolean.parseBoolean(request.getParameter("isSubmitted"));
	if(submitted){
		String clid = request.getParameter("clid");
		remove = cm.deleteClient(clid);
%>
		<script type="text/javascript">
			window.onload = function(){
				alert("Client has been deleted!");
			}
		</script>
<%
	}else if((remove == 0) && (submitted)){
%>
		<script type="text/javascript">
			window.onload = function(){
				alert("Client has not been deleted!");	
			}
		</script>
<%
	}
%>
<form action="delClient.jsp" method="post">
	<input type="hidden" name="isSubmitted" value="true">
	<span>Enter Client ID: <input type="text" name="clid"> <input type="submit" class="test2" value="Delete"></span>
</form>
<br>
<a class="anchor" href="client.html">&lt; Back</a>
<br><br>
<jsp:include page="viewAllClients.jsp"></jsp:include>
</body>
</html>