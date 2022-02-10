package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CatDao;
import entities.Category;
import entities.Product;

@MultipartConfig
@WebServlet("/ProductActionServlet")
public class ProductActionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Object FactoryProvider;
       
    public ProductActionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
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
					
			// category database save
			CatDao catDao=new CatDao(FactoryProvider.getFactory());	
				int catId=catDao.saveCategory(category);
				HttpSession httpsession=request.getSession();
				httpsession.setAttribute("message","Category added successfully:"+catId);
				response.sendRedirect("admin.jsp");
				return;
				
		}else if(op.trim().equals("addproduct")) {
			//add product
			

			String pName =request.getParameter("pNmae");
			String pDescription =request.getParameter("p");
			int pPrice =Integer.parseInt(request.getParameter("pPrice"));
			int pDiscount =Integer.parseInt(request.getParameter("pDiscount"));
			int pQuantity =Integer.parseInt(request.getParameter("pQuantity"));
			int catId =Integer.parseInt(request.getParameter("catId"));
			Part part=request.getPart("pPic");
			
			
			
			Product p=new Product();
			p.setpName(pName);
			p.setpDescription(pDescription);
			p.setpPrice(pPrice);
			
			
			
			
			
			
		}
	}

}
