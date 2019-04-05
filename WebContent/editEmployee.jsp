<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.List,java.util.ArrayList,bean.Department,model.DAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Employee</title>
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

				int id = Integer.parseInt(request.getParameter("id"));

				//get the employee with the employee id
				DAO dao = new DAO();
				Employee employee = dao.getEmployeeByID(id);

				//get the job list and department list

				List<String> jobList = dao.getAllJobId();
				List<Department> deptList = dao.getAllDepartmentIdAndName();
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">

		<div class="main">
			<h1>Edit Employee</h1>
			<form id="editEmployee" action="employeeServlet" method="post">
				<table>
					<tr>
						<td>Employee Id:</td>
						<td><input type="text" name="employeeId" readonly="readonly"
							value="<%=id%>"></td>

					</tr>
					<tr>
						<td>First name:</td>
						<td><input type="text" name="firstName"
							value="<%=employee.getFirstName()%>" required></td>
						<td>Last name:</td>
						<td><input type="text" name="lastName"
							value="<%=employee.getLastName()%>" required></td>
					</tr>

					<tr>
						<td>Email:</td>
						<td><input type="text" name="email"
							value="<%=employee.getEmail()%>" required></td>
						<td>Phone Number:</td>
						<td><input type="text" name="phoneNumber"
							value="<%=employee.getPhoneNumber()%>" required></td>
					</tr>

					<tr>
						<td>Hire Date:</td>
						<td><input type="date" name="hireDate"
							placeHolder="Hire Date" value="<%=employee.getHireDate()%>" required></td>

						<td>Job ID:</td>
						<td><select name="jobId" required>
								<option></option>
								<%
									for (String job : jobList) {
												if (job.equals(employee.getJobId())) {
													out.print("<option selected=\"selected\">" + job + "</option>");
												} else {
													out.print("<option>" + job + "</option>");
												}
											}
								%>
						</select></td>
					</tr>
					<tr>
						<td>Salary:</td>
						<td><input type="number" min="0" name="salary"
							value="<%=employee.getSalary()%>" required></td>

						<td>Commission:</td>
						<td><input type="number" step="0.01" min="0" max="0.99" name="commissionPct"
							<%if (employee.getCommissionPct() == null) {%> value=""
							<%} else {%> value="<%=employee.getCommissionPct()%>" <%}%> required></td>
					</tr>
					<tr>
						<td>Manager ID:</td>
						<td><input type="number" name="managerId"
							value="<%=employee.getManagerId()%>" required></td>

						<td>Department:</td>
						<td><select name="dept" required>
								<option></option>
								<%
									//display department name if the employee has a department.
											for (Department dept : deptList) {
												if (employee.getDepartmentId() != null && dept.getId() == employee.getDepartmentId()) {
													out.print("<option selected=\"selected\">" + dept.getName() + "</option>");
												} else {
													out.print("<option>" + dept.getName() + "</option>");
												}
											}
								%>
						</select></td>
					</tr>

				</table>
				<input type="hidden" name="singleChoice" value="update"> 
				<input class="smallButton" type="submit" value="Edit Employee"> 
				
			</form>
			<!-- a second form when user click delete, send the hidden input -->
			<form action="employeeServlet" method="post">
				<input type="hidden" name="singleChoice" value="delete"> 
				<input type="hidden" name="employeeId" value="<%=id%>">
				<input class="smallButton" type="submit" value="Delete Employee"">
			</form>
			<input class="smallButton" type="button" onclick="javascript:history.back(-1);" value="Return">
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
