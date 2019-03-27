<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HR - Login page</title>
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
		if (session != null) {
			if (session.getAttribute("user") != null) {
				response.sendRedirect("index.jsp");
			} else {
	%>
	<div class="container">
		<div class="wrapper fadeInDown">
			<div id="formContent">
				<!-- Tabs Titles -->
				<h2>HR Management System</h2>
				<!-- Login Form -->
				<form action="loginServlet" method="post">
					<input type="text" id="login" class="fadeIn second" name="username"
						placeholder="login"> <input type="password" id="password"
						class="fadeIn third" name="password" placeholder="password">
					<input type="submit" class="fadeIn fourth" value="Log In">
				</form>

				<!-- Remind Passowrd -->
				<div id="formFooter">
					<a class="underlineHover" href="#">Forgot Password?</a>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		}
	%>
</body>
</html>
