<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
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
		<div class="wrapper">
			<div id="formContent">
				<%
					if (session != null) {
						if (session.getAttribute("user") != null) {
				%>

				<h1>Show Employees</h1>
				<form action="GetEmployeeListServlet" method="post">
					<input type="number" min="1" name="departmentId" placeholder="Department ID" required>
						<input type="hidden" name="listChoice" value ="getByDept" > 
						<input type="submit" value="Show Department Employees">
				</form>
				<form action="GetEmployeeListServlet" method="post">
					<input type="hidden" name="listChoice" value ="getAll" > 
					<input type="submit" value="Show All Employees">
				</form>


				<%
					} else {
				%>


				<h1>Welcome to HR Management System</h1>
				<img class="fadeIn first" style="height: 200px" src="images/hr.jpeg"
					alt="HR"> <input class="fadeIn first" type="button"
					value="Login" onclick="window.location.href='login.jsp'">
				<%
					}
					}
				%>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>