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
			<form class="" action="AddOrUpdateEmployeeServlet" method="post">
				<table>
					<tr>
						<td>First name:</td>
						<td><input type="text" name="firstName"></td>
						<td>Last name:</td>
						<td><input type="text" name="lastName"></td>
					</tr>

					<tr>
						<td>Email:</td>
						<td><input type="text" name="email"></td>
						<td>Phone Number:</td>
						<td><input type="text" name="phoneNumber"></td>
					</tr>

					<tr>
						<td>Hire Date:</td>
						<td><input type="date" name="hireDate"
							placeHolder="Hire Date"></td>

						<td>Job ID:</td>


						<td><select name="jobId">
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
						<td><input type="text" name="salary"></td>

						<td>Commission:</td>
						<td><input type="text" name="commissionPct"></td>
					</tr>
					<tr>
						<td>Manager ID:</td>
						<td><input type="text" name="managerId"></td>

						<td>Department:</td>
						<td><select name="dept">
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
