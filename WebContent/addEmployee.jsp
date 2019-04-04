<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee,bean.Department,java.util.List,model.DAO"%>
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
				DAO dao = new DAO();
				List<String> jobList = dao.getAllJobId();
				List<Department> deptList = dao.getAllDepartmentIdAndName();
	%>
	<%@ include file="navigation.jsp"%>




	<div class="container">

		<div class="main">
			<h1>Add a new Employee</h1>
			<form class="" action="employeeServlet" method="post">
				<table>
					<tr>
						<td>First name:</td>
						<td><input type="text" name="firstName" required></td>
						<td>Last name:</td>
						<td><input type="text" name="lastName" required></td>
					</tr>

					<tr>
						<td>Email:</td>
						<td><input type="text" name="email" required></td>
						<td>Phone Number:</td>
						<td><input type="text" name="phoneNumber" required></td>
					</tr>

					<tr>
						<td>Hire Date:</td>
						<td><input type="date" name="hireDate"
							placeHolder="Hire Date" required></td>

						<td>Job ID:</td>


						<td><select name="jobId" required>
								<option></option>
								<%
									for (String jobID : jobList) {
								%>
								<option><%=jobID%></option>
								<%
									}
								%>
						</select></td>
					</tr>

					<tr>
						<td>Salary:</td>
						<td><input type="number" min="0" name="salary" required></td>

						<td>Commission:</td>
						<td><input type="number" min="0" max="1" name="commissionPct" required></td>
					</tr>
					<tr>
						<td>Manager ID:</td>
						<td><input type="number" name="managerId" required></td>

						<td>Department:</td>
						<td><select name="dept" required>
								<option></option>
								<%
									for (Department dept : deptList) {
								%>
								<option><%=dept.getName()%></option>
								<%
									}
								%>
						</select></td>
					</tr>

				</table>
				<input type="hidden" name="singleChoice" value="add"> 
				<input class="smallButton" type="submit" name=""
					value="Add Employee"> 
				<input class="smallButton"
					type="reset" name="" value="Reset value">
			</form>

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
