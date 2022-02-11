package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import entities.Category;

public class CatDao {
	private SessionFactory factory;
	
	public CatDao() {
		Configuration con = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Category.class);
		this.factory = con.buildSessionFactory();
	}
	
	// save category to db
	public int saveCategory(Category cat) {
		
		
			Session session = factory.openSession();
			session.beginTransaction();
			int catId=(int) session.save(cat);
			session.getTransaction().commit();
			session.close();	
			return catId;

	}
	
	public List<Category> getcategories(){
		Session s=this.factory.openSession();
		Query query=s.createQuery("from Category");
		query.list();
		List<Category> list=query.list();
		return list;
		
		
		
	}

	public Category getCategoryById(int cid) {
		Category cat=null;
		try {
			
			Session session =this.factory.openSession();
			cat=session .get(Category.class,cid);
			session.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
	
}
