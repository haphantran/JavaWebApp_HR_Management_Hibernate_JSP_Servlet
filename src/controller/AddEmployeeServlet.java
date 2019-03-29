package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Employee;
import model.DAO;

/**
 * Servlet implementation class HRServlet
 */
@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddEmployeeServlet() {
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
		// TODO Auto-generated method stub
		String firstName;
		String lastName;
		String email;
		Date hireDate = null;
		String phoneNumber;
		Double salary;
		Double commissionPct;
		String jobId;
		Integer managerId;
		Integer departmentId;

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
		departmentId = Integer.parseInt(request.getParameter("departmentId"));
	
		HttpSession session = request.getSession(true);
		try {
			DAO dao = new DAO();
			Employee emp = new Employee(firstName, lastName, email, hireDate, phoneNumber, salary, commissionPct, jobId,
					managerId, departmentId);
			dao.addEmployee(emp);
			response.sendRedirect("addSuccess");

		} catch (Exception e) {
			e.getStackTrace();
		}

	}

}
