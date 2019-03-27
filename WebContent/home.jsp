<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee List</title>
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
	<%
		if (session != null) {
			if (session.getAttribute("user") != null) {
	%>
	
	<nav class="navbar navbar-inverse ">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Employee List Page</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="">Employee List</a></li>
				<li><a href="addEmployee.jsp">new Employee</a></li>
				<li><a href="">Search Employee</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a> <%
 	Employee emp = (Employee) session.getAttribute("employee");
 	out.print(emp.getFirstName() + " " + emp.getLastName());
 %>
				</a></li>
				<li><a href="logoutServlet"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
			</ul>
		</div>
	</nav>



	<div class="container">

		<div id="formContent">
			<h2>Show employees in department by department ID or all
				employees</h2>
			<form action="showDepartmentEmployees" method="post">
				<input type="text" name="departmentId" value=""
					placeholder="Department ID"> <input type="submit"
					value="Show Department Employees"> <input type="button"
					value="Show All Employees"
					onclick="window.location.href='http://www.google.com'">
			</form>
		</div>

	</div>
		
	
	<%
		} else {
				response.sendRedirect("index.html");
			}
		}
	%>
	
</body>
</html>