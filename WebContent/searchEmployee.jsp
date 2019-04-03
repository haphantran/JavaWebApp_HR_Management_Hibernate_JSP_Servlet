<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee,java.util.List,model.DAO,bean.Department"%>
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
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">


		<div class="main">
			<form action="GetEmployeeListServlet" method="post">
				<input type="text" name="searchTerm"
					placeholder="Please type any part of the employee name, department name, email or phone NO.">
				<input type="hidden" name="listChoice" value="getBySearchTerm">
				<input class="smallButton" type="submit" value="Search Employee">
			</form>

			<%
				List<Employee> empList = null;
						empList = (List<Employee>) request.getAttribute("employeeList");
						if (empList != null) {
							//get the employee with the employee id
							DAO dao = new DAO();
							//get the department list
							List<Department> deptList = dao.getAllDepartmentIdAndName();
			%>
			<h2>
				Employee search result for input:<span style="color: red"> <%=request.getAttribute("searchTerm")%></span>
			</h2>
			<table class="employeeList">
				<thead>
					<tr>
						<th>Name</th>
						<th>Department</th>
						<th>Job ID</th>
						<th>Salary</th>
						<th>Email</th>
						<th>Phone Number</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (Employee employee : empList) {
										int empId = employee.getEmployeeId();
					%>
					<tr>
						<td><%=employee.getFirstName() + " " + employee.getLastName()%></td>
						<td>
							<%
								if (employee.getDepartmentId() != null) {
													for (Department department : deptList) {
														if (department.getId() == employee.getDepartmentId()) {
															out.print(department.getName());
															break;
														}
													}
												}
							%>
						</td>
						<td><%=employee.getJobId()%></td>
						<td><%=employee.getSalary()%></td>
						<td><a
							href="mailto:<%=employee.getEmail() + "@myseneca.ca"%>"><%=employee.getEmail() + "@myseneca.ca"%></a></td>
						<td><%=employee.getPhoneNumber()%></td>

					</tr>
					<%
						}
					%>

				</tbody>
			</table>
			<%
				}
			%>


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
