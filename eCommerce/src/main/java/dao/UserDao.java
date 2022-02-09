package dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import entities.User;

public class UserDao {
	static SessionFactory factory;
	static {
		Configuration con = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(User.class);
		factory = con.buildSessionFactory();
	}
	public boolean addUser(User usr) {
		try {
			
			Session session = factory.openSession();
			session.beginTransaction();

			session.save(usr);

			session.getTransaction().commit();
			session.close();			
			return true;
		} catch (Exception e) {
			return false;
		}

	}

public User getUserByEmailAndPassword(String email, String password) {
	User user=null;
	try {
		
		Session session =this.factory.openSession();
		session.beginTransaction();
		Query q=session.createQuery("from User where userEmail= :e and userPassword= :p");
		q.setParameter("e", email);
		q.setParameter("p", password);
		
		List l = q.getResultList();
		session.getTransaction().commit();
		session.close();
		
		if(l.size()>0) {
			user =(User)l.get(0);
		}
		
	}catch(Exception e){
		e.printStackTrace();		
	}
	return user;
}
	
}
