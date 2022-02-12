package dao;

import javax.transaction.Transaction;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.mysql.cj.xdevapi.SessionFactory;


public class ProductDao {
	
	private SessionFactory factory;
	
	public ProductDao(SessionFactory factory) {
		this.factory=factory;

	}
	
	public boolean saveProduct (Product product) {
		boolean f=false;
		try {
			
			Session session=this.factory.openSession();
			Transaction tx=session.beginTransaction();
			session.save(product);
			
			tx.commit();
			session.close();
			
		}catch(Exception e) {
			e.printStackTrace();
			f=false;
		}
		return f;
		
		}
	
//get all products
	public List<Product> getAllProducts(){
		Session s= this.factory.openSession();
		Query query=s.createQuery("from product");
		List<Product> list=query.list();
		return list;
		
	}
	
	
	
	
}
