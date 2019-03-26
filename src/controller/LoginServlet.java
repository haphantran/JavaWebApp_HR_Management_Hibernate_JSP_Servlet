package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("login.html");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		DAO dao = new DAO();
		
		int empid = dao.checkCredential(username, password);
		if (empid >0) {
			Employee emp = dao.getEmployeeByID(empid);
			System.out.println(emp.getFirstName() + " " + emp.getLastName());
			request.setAttribute("employee", emp);
			getServletContext().getRequestDispatcher("/EmployeeListPage.jsp")
			.forward(request, response);
		} else {
			response.sendRedirect("error.jsp");
		}			
	}
}
