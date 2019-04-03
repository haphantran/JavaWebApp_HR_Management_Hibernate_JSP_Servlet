package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

import bean.Employee;
import model.DAO;

/**
 * Servlet implementation class GetEmployeeListServlet
 */
@WebServlet("/GetEmployeeListServlet")
public class GetEmployeeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEmployeeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Employee> employeeList = null;
		String listChoice = request.getParameter("listChoice");
		DAO dao = new DAO();
		switch (listChoice) {
			case "getByDept":
				String deptIDString = request.getParameter("departmentId");
				int deptId = Integer.parseInt(deptIDString);
				employeeList = dao.getEmployeeByDeptId(deptId);
				break;
			case "getBySearchTerm":
				employeeList= dao.getEmployeeBySearchTerm(request.getParameter("searchTerm"));
				break;
			default: //getAll or default, return all Employee;
				employeeList = dao.getAllEmployee();
		}
		
		request.setAttribute("employeeList", employeeList);
		getServletContext().getRequestDispatcher("/employeeList.jsp").forward(request, response);
	}

}
