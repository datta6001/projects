package helper;

import org.hibernate.Session;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Query;

import com.mysql.cj.xdevapi.SessionFactory;

public class Helper {
	private static Long productCount;


	public static String get10Words(String description) {
		String[] strs=description.split(" ");
		if(strs.length>10) 
		{
			String res=" ";
			for(int i=0;i<10;i++) {
				
				res=res+strs[i]+" ";
			}
				return(res+"...");
		}else
		{
			return(description+"...");
		}
	}

	
public static Map<String,Long> getCounts(SessionFactory factory) {
	
	Session session = factory.op
	String q1="Select coumt(*)from User";
	String q2="Select coumt(*)from Product";
	
	Query query1=session.createQuery(q1);
	Query query2=session.createQuery(q2);
	
	Long userCount=(long)query1.getResultList().get(0);
	Long productCounnt=(long)query1.getResultList().get(0);
	
	Map<String,Long> map=new HashMap<>();
	map.put("userCount",userCount);
	map.put("productCount",productCount);
	
	session.close();
	
	return map;
	
}
	
	
}
