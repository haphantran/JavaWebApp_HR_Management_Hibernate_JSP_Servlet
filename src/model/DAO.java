package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.jdbc.ReturningWork;
import org.hibernate.query.Query;

import bean.Department;
import bean.Employee;
 


public class DAO {
	
	public Integer checkCredential(String username, String password) {

		 
			Session session = HibernateUtil.openSession();
			
			Integer result = session.doReturningWork(new ReturningWork <Integer> () {
				public Integer execute(Connection conn) throws SQLException {
					//call the security function to check				 
			
					CallableStatement stmt;
					
					stmt = conn.prepareCall(" {? = call p_security.F_SECURITY(?,?)}");
					
					stmt.registerOutParameter (1,Types.INTEGER);
					stmt.setString(2, username);
					stmt.setString(3, password);
					stmt.execute();
			
					
					return stmt.getInt(1);		
				}											
			});
				System.out.println(result);
		return result;
	}	

	public  void addEmployee(Employee employee) {

			Session session = HibernateUtil.openSession();
			Transaction trx = session.beginTransaction();
			session.save(employee);
			trx.commit();
	}
	
	public Employee getEmployeeByID(int empid) {
		
		Session session = HibernateUtil.openSession();

		Employee emp = (Employee) session.get(Employee.class, empid);
		return emp;		
	}
	public List<Employee> getEmployeeByDeptId(int deptId){
	
		Session session = HibernateUtil.openSession();
		Query<Employee> query = session.createNamedQuery("Employee.findEmployeeByDeptId", Employee.class);
		query.setParameter("deptId", deptId);
		return query.getResultList();
	}
	
	public List<Employee> getAllEmployee(){
		Session session = HibernateUtil.openSession();
		Query<Employee> query = session.createNamedQuery("Employee.findAll", Employee.class);		
		return query.getResultList();
	}

	@SuppressWarnings("null")
	public List<Department> getAllDepartmentIdAndName(){
		List<Department> deptList = null;
		Session session = HibernateUtil.openSession();
		@SuppressWarnings("rawtypes")
		Query query = session.createSQLQuery("Select DEPARTMENT_ID, DEPARTMENT_NAME FROM departments");
		List<Object[]> rows = query.list();
		for (Object[] row : rows) {
			Department dept =  new Department();
			dept.setId(Integer.parseInt(row[0].toString()));
			dept.setName(row[1].toString());
			deptList.add(dept);
		}
		return deptList;		
	}
	
	public List<String> getAllJobId() {
		List<String> result = null;
		List<Department> deptList = null;
		Session session = HibernateUtil.openSession();
		@SuppressWarnings("rawtypes")
		Query query = session.createSQLQuery("Select job_id FROM jobs");

		result = query.list();
		System.out.println(result);	
		return result;
	}
}
