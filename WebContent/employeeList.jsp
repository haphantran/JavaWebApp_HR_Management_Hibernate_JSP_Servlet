<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee,java.util.ArrayList"%>
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
		if (session != null) {
			if (session.getAttribute("user") != null) {

				int count = 20;
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">

		<div class="main">
			<%
				//ArrayList<Employee> empList = (ArrayList<Employee>) request.getAttribute("employeeList");
			%>


			<table class="employeeList">
				<thead>
					<tr>
						<th>Employee ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>department</th>
						<th>Job ID</th>
						<th>Manager ID</th>
						<th>Hire Date</th>
						<th>Salary</th>
						<th>Commission</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i = 1; i < count; i++) {
					%>
					<tr>
						<td><a href="http://www.google.com"><%=i%></a></td>
						<td>apple</td>
						<td>apple</td>
						<td>apple</td>
						<td>apple</td>
						<td>apple</td>
						<td>apple</td>
						<td>apple</td>
						<td>apple</td>
					</tr>
					<%
						}
					%>

				</tbody>
			</table>

		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<%
		} else {
				response.sendRedirect("login.jsp");
			}
		}
	%>


</body>
</html>
