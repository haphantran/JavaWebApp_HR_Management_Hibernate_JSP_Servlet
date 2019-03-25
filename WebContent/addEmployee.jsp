<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a new Employee</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
</head>
<body>
  <h1>Add a new Employee</h1>
  <form class="" action="AddEmployee" method="post">
    <table>
      <tr>
        <td>First name: </td>
        <td><input type="text" name="firstName"> </td>
      </tr>
      <tr>
        <td>Last name: </td>
        <td><input type="text" name="lastName"> </td>
      </tr>
      <tr>
        <td>Email: </td>
        <td><input type="text" name="email"> </td>
      </tr>
      <tr>
        <td>Phone Number: </td>
        <td><input type="text" name="phoneNumber"> </td>
      </tr>
      <tr>
        <td>Hire Date: </td>
        <td><input type="date" name="hireDate"> </td>
      </tr>
      <tr>
        <td>Job ID: </td>
        <td><input type="text" name="jobId"> </td>
      </tr>
      <tr>
        <td>Salary: </td>
        <td><input type="number" name="salary"> </td>
      </tr>
      <tr>
        <td>Commission Percentage: </td>
        <td><input type="number" name="commissionPct"> </td>
      </tr>
      <tr>
        <td>Manager ID: </td>
        <td><input type="number" name="managerId"> </td>
      </tr>
      <tr>
        <td>Department ID: </td>
        <td><input type="number" name="departmentId"> </td>
      </tr>

    </table>
    <p />
    <input type="submit" name="" value="Add Employee">
    <input type="reset" name="" value="Reset value">
  </form>


</body>
</html>
