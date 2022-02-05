package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import entities.User;

public class UserDao {
	public static boolean addUser(User usr) {
		try {
			Configuration con = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class);
			SessionFactory sf = con.buildSessionFactory();
			Session session = sf.openSession();
			session.beginTransaction();

			session.save(usr);

			session.getTransaction().commit();
			session.close();
			sf.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
