<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Message</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/basic.css">
</head>
<body>


	<%
		String message = (String) request.getAttribute("message"); // the execution result message received from servlet
		if (message != null) {
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">

		<div class="main">
			<h2 style="color: black;"><%=message%></h2>
			<input class="smallButton" class="fadeIn first" type="button" value="Return"
					onclick="javascript:history.go(-2)">
		</div>
	</div>

	<%@ include file="footer.jsp"%>
	<%
		}else{
			response.sendRedirect("index.jsp");
		}
	%>

</body>
</html>
