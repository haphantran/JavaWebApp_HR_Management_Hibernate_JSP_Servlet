<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee List</title>
<link rel="stylesheet" href="css/main.css" type="text/css" />

</head>
<body>
	<header>
		
			<ul class="navFullList">
				<li><a href="">Employee List</a></li>
				<li><a href="addEmployee.jsp">new Employee</a></li>
				<li><a href="">Search Employee</a></li>
				<li ><%
					Employee emp = (Employee)request.getAttribute("employee");
					out.print(emp.getFirstName()+" "+emp.getLastName());
				%> <a style="font-size: 0.8em" href="logout.jsp">-Logout-</a></li>			
			</ul>
		
	</header>
	<h1>Employee List Page</h1>
	<h3>Show employees in department by department ID or all employees</h3>
	<div class="form">

		<form action="showDepartmentEmployees" method="post">
			<label class="pad_top">Department ID:</label> <input type="number"
				name="departmentId" value=""><br> <label>&nbsp;</label><input
				type="submit" value="Show Department Employees" class="margin_left"><br>
			<label>&nbsp;</label>
			<button type="button" onclick="window.location.href='/showAllEmployees'" class="margin_left">Show All Employees</button>
		</form>
	</div>


</body>
</html>