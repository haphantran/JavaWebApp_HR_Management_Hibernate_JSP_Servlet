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
				<form action="employeeList.jsp" method="post">
					<input type="text" name="departmentId" value=""
						placeholder="Department ID"> <input type="submit"
						value="Show Department Employees"> <input type="button"
						value="Show All Employees"
						onclick="window.location.href='employeeList.jsp'">
				</form>


				<%
					} else {
				%>


				<h1>Welcome to HR Management System</h1>
				<img class="fadeIn first" style="height: 200px" src="images/hr.jpeg"
					alt="HR">

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