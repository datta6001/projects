package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.SessionFactory;
import org.hibernate.boot.archive.internal.FileInputStreamAccess;

import dao.CatDao;
import dao.ProductDao;
import entities.Category;
import entities.Product;

@MultipartConfig
@WebServlet("/ProductActionServlet")
public class ProductActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductActionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		
		// servlet 2
		// add category
		// add product
		String op=request.getParameter("operation");
		if(op.trim().equals("addcategory")) {
			//add category
			

			//fetching category data
					String title =request.getParameter("catTitle");
					String decription =request.getParameter("catDescription");
					
					Category category=new Category();
					category.setCategoryTitle(title);
					category.setCategoryDescription(decription);
					System.out.println(category);
			// category database save
			CatDao catDao=new CatDao();	
				int catId=catDao.saveCategory(category);
				HttpSession httpsession=request.getSession();
				httpsession.setAttribute("message","Category added successfully:"+catId);
				response.sendRedirect("admin.jsp");
				return;
				
		}else if(op.trim().equals("addproduct")) {
//add product
			

			String pName =request.getParameter("pName");
			String pDescription =request.getParameter("pDescription");
			int pPrice =Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount =Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity =Integer.parseInt(request.getParameter("pQuantity"));
			int catId =Integer.parseInt(request.getParameter("catId"));
			Part part=request.getPart("pPic");
			
			
			
			Product p=new Product();
			p.setpName(pName);
			p.setpDescription(pDescription);
			p.setpPrice(pPrice);
			p.setpDiscount(pDiscount);
			p.setpQuantity(pQuantity);
			p.setpPhoto(part.getSubmittedFileName());
			
//get category by id			
			CatDao cdao=new CatDao();
			Category category = cdao.getCategoryById(catId);
			p.setCategory(category);
			
			
			
			
			
//product save
			
			ProductDao pdao=new ProductDao();
			pdao.saveProduct(p);
			
//pic upload
			
//find  out the path  to upload photo
			String path = request.getRealPath("img")+File.separator+"products"+File.pathSeparator+part.getSubmittedFileName();
			System.err.println(path);
			
//uploading code..
			try {
				
			
			FileOutputStream fos=new FileOutputStream(path);
			
			InputStream is=part.getInputStream();

//reading  data..
			
			byte []data=new byte[is.available()];
			is.read(data);

//writing the data
			fos.write(data);
			
			fos.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
			
			
			
			
		//	out.println("Product save sucess...");
			HttpSession httpsession=request.getSession();
			httpsession.setAttribute("message","Product is  added successfully..");
			response.sendRedirect("admin.jsp");
			return;
			
			
			
		}
	}

}