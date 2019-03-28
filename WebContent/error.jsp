<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a new Employee</title>
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
		String errorMessage = (String) request.getAttribute("errorMessage");
		if (errorMessage != null) {
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">

		<div class="main">
			<h2 style="color: red;"><%=errorMessage%></h2>
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
