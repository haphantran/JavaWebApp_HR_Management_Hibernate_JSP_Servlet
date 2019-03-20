package model;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import bean.Employee;
 


public class DAO {
	

	public void addEmployee(Employee employee) {

			Session session = HibernateUtil.openSession();
			Transaction trx = session.beginTransaction();
			session.save(employee);
			trx.commit();
	}
	
	

}
