package dao;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.mysql.cj.xdevapi.SessionFactory;

import entities.Category;

public class CatDao {
	private SessionFactory factory;
	
	public CatDao(SessionFactory factory) {
		this.factory=factory;
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


}
