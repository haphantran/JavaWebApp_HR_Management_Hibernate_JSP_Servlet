<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="bean.Employee"%>

<nav class="navbar navbar-inverse navbar-fixed-top bg-primary">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp">Home</a>
		</div>
		<ul class="nav navbar-nav">

			<li><a href="index.jsp">Employee List</a></li>
			<li><a href="addEmployee.jsp">New Employee</a></li>
			<li><a href="searchEmployee.jsp">Search Employee</a></li>
		</ul>
		<%
			if (session != null) {
				if (session.getAttribute("user") != null) {
		%>
		<ul class="nav navbar-nav navbar-right">
			<li><a> <%
 	Employee emp = (Employee) session.getAttribute("employee");
 			out.print(emp.getFirstName() + " " + emp.getLastName());
 %>
			</a></li>
			<li><a href="logoutServlet"><span
					class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		</ul>

		<%
			} else {
		%>


		<ul class="nav navbar-nav navbar-right">

			<li><a href="login.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Login</a></li>
		</ul>


		<%
			}
			}
		%>
	</div>
</nav>