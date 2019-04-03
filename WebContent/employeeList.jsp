<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee List</title>
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
				List<Employee> empList = (List<Employee>) request.getAttribute("employeeList");
			%>


			<table class="employeeList">
				<thead>
					<tr>
						<th>Employee ID</th>
						<th>First Name</th>
						<th>LastName</th>
						<th>Email</th>
						<th>Department ID</th>
						<th>Job ID</th>
						<th>Manager ID</th>
						<th>Hire Date</th>
						<th>Salary</th>
						<th>Commission PCT</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Employee employee : empList) {
									int empId = employee.getEmployeeId();
					%>
					<tr>
						<td><a href="editEmployee.jsp?id=<%=empId%>"><%=empId%></a></td>
						<td><%=employee.getFirstName()%></td>
						<td><%=employee.getLastName()%></td>
						<td><%=employee.getEmail()%></td>
						<td><%
								if (employee.getDepartmentId() != null) {
												out.print(employee.getDepartmentId());
											}
							%></td>
						<td><%=employee.getJobId()%></td>
						<td><%
								if (employee.getManagerId() != null) {
												out.print(employee.getManagerId());
											}
							%></td>
						<td><%=employee.getHireDate()%></td>
						<td><%=employee.getSalary()%></td>
						<td>
							<%
								if (employee.getCommissionPct() != null) {
												out.print(employee.getCommissionPct());
											}
							%>
						</td>
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
	}

</body>
</html>
