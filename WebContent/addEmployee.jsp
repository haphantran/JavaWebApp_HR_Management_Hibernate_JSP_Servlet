<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">

		<div class="main">
			<h1>Add a new Employee</h1>
			<form class="" action="AddEmployee" method="post">
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
								<option>AD_PRES</option>
								<option>AD_VP</option>
								<option>AD_ASST</option>
								<option>FI_MGR</option>
								<option>FI_ACCOUNT</option>
								<option>AC_MGR</option>
								<option>AC_ACCOUNT</option>
								<option>SA_MAN</option>
								<option>SA_REP</option>
								<option>PU_MAN</option>
								<option>PU_CLERK</option>
								<option>ST_MAN</option>
								<option>ST_CLERK</option>
								<option>SH_CLERK</option>
								<option>IT_PROG</option>
								<option>MK_MAN</option>
								<option>MK_REP</option>
								<option>HR_REP</option>
								<option>PR_REP</option>
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

						<td>Department ID:</td>
						<td><input type="text" name="departmentId"></td>
					</tr>

				</table>
				<input class="smallButton" type="submit" name="" value="Add Employee">
				<input class="smallButton" type="reset" name="" value="Reset value">
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
