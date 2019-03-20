package model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.jdbc.ReturningWork;

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
	

}
