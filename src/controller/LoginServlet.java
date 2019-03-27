package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Employee;
import model.DAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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
		response.sendRedirect("index.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		DAO dao = new DAO();

		int empid = dao.checkCredential(username, password);

		if (empid > 0) {
			out.print("Welcome, " + username);
			HttpSession session = request.getSession(true); // reuse existing
															// session if exist
															// or create one
			session.setAttribute("user", username);
			session.setMaxInactiveInterval(30); // 30 seconds
			Employee emp = dao.getEmployeeByID(empid);
			System.out.println(emp.getFirstName() + " " + emp.getLastName());
			session.setAttribute("employee", emp);
			response.sendRedirect("home.jsp");

		} else {
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			out.println("<font color=red>Either user name or password is wrong.</font>");
			rd.include(request, response);
		} // TODO Auto-generated method stub

	}
}
