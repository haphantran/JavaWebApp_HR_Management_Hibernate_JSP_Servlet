<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,java.util.ArrayList"%>
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

				String id = request.getParameter("id");

				//testing part begin
				String jobId = "SA_MAN";//assume the employee has this job id

				List<String> jobList = new ArrayList<>();
				jobList.add("AD_PRES");
				jobList.add("AD_VP");
				jobList.add("AD_ASST");
				jobList.add("FI_MGR");
				jobList.add("FI_ACCOUNT");
				jobList.add("AC_MGR");
				jobList.add("AC_ACCOUNT");
				jobList.add("SA_MAN");
				jobList.add("SA_REP");
				jobList.add("PU_MAN");
				jobList.add("PU_CLERK");
				jobList.add("ST_MAN");
				jobList.add("ST_CLERK");
				jobList.add("SH_CLERK");
				jobList.add("IT_PROG");
				jobList.add("MK_MAN");
				jobList.add("MK_REP");
				jobList.add("HR_REP");
				jobList.add("PR_REP"); //testing part end
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">

		<div class="main">
			<h1>Edit Employee</h1>
			
			<script>
			function editEmp (){
				document.getElementById("editEmployee").action="EditEmployeeServlet";
			}
			function deleteEmp (){
				document.getElementById("editEmployee").action="DeleteEmployeeServlet";
			}
			</script>
			
			<form id="editEmployee" action="" method="post">
				<table>
					<tr>
						<td>Employee Id:</td>
						<td><input type="text" name="firstName" readonly="readonly"
							value="<%=id%>"></td>

					</tr>
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
						<td><select name="jobId"
							value="<%=request.getParameter("jobId")%>">
								<option></option>
								<%
									for (String job : jobList) {
												if (job.equals(jobId)) {
													out.print("<option selected=\"selected\">" + job + "</option>");
												}
												else {
													out.print("<option>" + job + "</option>");
												}
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

						<td>Department ID:</td>
						<td><input type="text" name="departmentId"></td>
					</tr>

				</table>
				<input class="smallButton"type="submit"  value="Edit Employee" onclick="editEmp()"> 
				<input class="smallButton" type="submit"  value="Delete Employee" onclick="deleteEmp()">
				<input class="smallButton" type="button"  onclick="javascript:history.back(-1);" value="Return">
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
