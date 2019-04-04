package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Department;
import bean.Employee;
import model.DAO;

/**
 * Servlet implementation class HRServlet
 */
@WebServlet("/employeeServlet")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			
			

	
		int id = 0;
		String firstName;
		String lastName;
		String email;
		Date hireDate = null;
		String phoneNumber;
		Double salary;
		Double commissionPct;
		String jobId;
		Integer managerId;
		Integer departmentId = 0;
		
		

		if (request.getParameter("employeeId") !=null) {
			id = Integer.parseInt(request.getParameter("employeeId"));	
		}
		
		firstName = request.getParameter("firstName");
		lastName = request.getParameter("lastName");
		email = request.getParameter("email");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			hireDate = format.parse(request.getParameter("hireDate"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		phoneNumber = request.getParameter("phoneNumber");
		salary = Double.parseDouble(request.getParameter("salary"));
		commissionPct = Double.parseDouble(request.getParameter("commissionPct"));
		jobId = request.getParameter("jobId");
		managerId = Integer.parseInt(request.getParameter("managerId"));
		String deptname = request.getParameter("dept");
		
		DAO dao = new DAO();
		List<Department> deptList = dao.getAllDepartmentIdAndName();
		for (Department department : deptList) {
			if (department.getName().equalsIgnoreCase(deptname)) {
				departmentId = department.getId();				
				break;
			}
		}		
		
		HttpSession session = request.getSession(true);
		Employee emp = new Employee(id,firstName, lastName, email, hireDate, phoneNumber, salary, commissionPct, jobId,
				managerId, departmentId);
		try {
			
			String singleChoice = request.getParameter("singleChoice");
			if (singleChoice.equalsIgnoreCase("delete")) {//delete
				dao.deleteEmployee(emp);	
				String message = "Employee deleted";
				request.setAttribute("message", message);
				getServletContext().getRequestDispatcher("/message.jsp")
						.forward(request, response);
			} else { //add or update
				//id = 0 mean add new  employee without ID field
				if (id ==0) emp = new Employee(firstName, lastName, email, hireDate, phoneNumber, salary, commissionPct, jobId,
						managerId, departmentId);
				dao.addOrUpdateEmployee(emp);
				String message = "Employee added or updated";
				request.setAttribute("message", message);
				getServletContext().getRequestDispatcher("/message.jsp")
						.forward(request, response);
			}
			
			

		} catch (Exception e) {
			String errorMessage = "Cannot add or update employee";
			request.setAttribute("errorMessage", errorMessage+": "+e.getMessage());
			getServletContext().getRequestDispatcher("/error.jsp")
					.forward(request, response);
		}

	}


}
