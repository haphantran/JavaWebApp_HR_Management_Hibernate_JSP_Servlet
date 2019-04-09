CJV805 Assignment 2 ¨C Winter 2019
Assignment Submission Form
==========================================================================
I/we declare that the attached assignment is my/our own work in accordance
with Seneca Academic Policy. No part of this assignment has been copied
manually or electronically from any other source (including web sites) or
distributed to other students.
Name(s)			Student ID(s) 
Pei Zhang		106052186
Haphan Tran		122699176
Azar Shamseh	126346162

< the brief description of the assignment >
Package: bean
Class: Department - a department bean
Class: Employee - an employee bean

Package: controller
Class: EmployeeServlet - adding, editing, deleting employee
Class: GetEmployeeListServlet - get either department employees or all employees
Class: LoginServlet - working with logoutServlet, creates a login session
Class: logoutServlet - working with longinServlet, kills a login session

Package: model
Class: DAO - database access layer
Class: HibernateUtil - connection pool

GUI:
index.jsp - the home page
login.jsp - the login page. When user deos not login, no metter which link is clicked, it will redirected to this page.
logout.jsp - when user logouts, the it directed to this page
addEmployee.jsp - for adding new employee
editEmployee.jsp - for editing or deleting an existing employee
employeeList.jsp - for displaying employee information 
navigation.sjp - displaying a navigation bar (header) which can be included by the other pages.
footer.jsp - displaying a footer which can be included by the other pages.
message.jsp - a page which tells the user that the employee has been edited/deleted/added.
error.jsp - a page which tells the user the specific error message if there is. For example, login failed, adding employee failed, etc.


Login information
password: hr
username: hr