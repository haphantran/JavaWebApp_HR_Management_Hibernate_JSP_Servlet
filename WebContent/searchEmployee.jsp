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
	%>
	<%@ include file="navigation.jsp"%>


	<div class="container">

		<div class="wrapper">
			<div id="formContent">
				<form action="GetEmployeeListServlet" method="post">
					<input type="text" name="searchTerm" placeholder="Search Employee">
						<input type="hidden" name="listChoice" value ="getBySearchTerm" > 
						<input type="submit" value="Search Employee">
				</form>




			</div>
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
