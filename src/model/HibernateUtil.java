package model;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;;

public class HibernateUtil {
	private static SessionFactory sessionFactory;
	 
    public static synchronized SessionFactory getSessionFactory() {
    	if (sessionFactory == null) {
    		try {
    			sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    		} catch (Throwable ex) {
    			System.err.println("Initial SessionFactory creation failed." + ex);
    			throw new ExceptionInInitializerError(ex);
    		}
    	}
    	return sessionFactory;
    }
 
}
