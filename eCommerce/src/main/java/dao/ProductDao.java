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
	
	
	//get all products of given category
		public List<Product> getAllProductsById(int cid){
			Session s= this.factory.openSession();
			Query<Product> query=s.createQuery("from Product as p where p.category.categoryId= :id");
			query.setParameter("id",cid);
			List<Product> list=query.list();
			return list;			
		}
	
	public static byte[] getImage(int id) {
		
		Session s= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Product.class).addAnnotatedClass(Category.class).buildSessionFactory().openSession();
		Query query=s.createNativeQuery("select image from product where pId="+id);		
		List list=query.list();
		if(list.size()>0) return ((byte[])list.get(0));
		else return null;
	}
	
	
	
}
