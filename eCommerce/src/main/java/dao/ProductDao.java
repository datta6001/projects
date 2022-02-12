package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import entities.Category;
import entities.Product;


public class ProductDao {
	
	private SessionFactory factory;
	
	public ProductDao() {
		factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Product.class).addAnnotatedClass(Category.class).buildSessionFactory();
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
		Query<Product> query=s.createQuery("from Product");
		List<Product> list=query.list();
		return list;
		
	}
	
	
	
	
}
