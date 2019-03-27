<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- Latest compiled and minified CSS -->
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
				response.sendRedirect("index.jsp");
			} else {
	%>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Home</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="">Employee List</a></li>
				<li><a href="addEmployee.jsp">New Employee</a></li>
				<li><a href="">Search Employee</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="login.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">

		<div id="formContent">
			<h1>You have logged out</h1>

			<!-- need to clear the context or the entity -->

			<input type="button" value="Login"
				onclick="window.location.href='login.jsp'">

		</div>
	</div>
	<%
		}
		}
	%>
	<!-- Footer -->
	<footer class="page-footer font-small blue pt-4">

		<!-- Footer Links -->
		<div class="container-fluid text-center text-md-left">

			<!-- Grid row -->
			<div class="row">

				<!-- Grid column -->
				<div class="col-md-6 mt-md-0 mt-3">

					<!-- Content -->
					<h5 class="text-uppercase">HR Management System</h5>
					<p>This system allow users to add, edit and delete employee
						information. For more information, please do not hesitate to
						contact us</p>

				</div>
				<!-- Grid column -->

				<hr class="clearfix w-100 d-md-none pb-3">

				<!-- Grid column -->
				<div class="col-md-3 mb-md-0 mb-3">

					<!-- Links -->
					<h5 class="text-uppercase">Links</h5>

					<ul class="list-unstyled">
						<li><a href="#!">Link 1</a></li>
						<li><a href="#!">Link 2</a></li>

					</ul>

				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-3 mb-md-0 mb-3">

					<!-- Links -->
					<h5 class="text-uppercase">Links</h5>

					<ul class="list-unstyled">
						<li><a href="#!">Link 1</a></li>
						<li><a href="#!">Link 2</a></li>

					</ul>

				</div>
				<!-- Grid column -->

			</div>
			<!-- Grid row -->

		</div>
		<!-- Footer Links -->

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">� Seneca College
			CJV805SAA.03567.2191 Group 10</div>
		<!-- Copyright -->

	</footer>
	<!-- Footer -->
</body>
</html>
