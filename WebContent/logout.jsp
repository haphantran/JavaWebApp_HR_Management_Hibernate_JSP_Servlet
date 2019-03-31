<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
<!-- Latest compiled and minified CSS -->
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
	<%@ include file="navigation.jsp"%>
	
	<div class="container">
		<div class="wrapper fadeInDown">
			<div id="formContent">
				<h1>You have logged out</h1>

				<input class="fadeIn first" type="button" value="Login"
					onclick="window.location.href='login.jsp'">
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

	
</body>
</html>
