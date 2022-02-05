package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transaction;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.hibernate.Session;

import com.ibm.icu.impl.ICUService.Factory;

import dao.UserDao;
import entities.User;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
   
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
						
		String userName =request.getParameter("user_name");
		String userEmail =request.getParameter("user_email");
		String userPassword =request.getParameter("user_password");
		String userPhone =request.getParameter("user_phone");
		String userAddress =request.getParameter("user_address");
		
		System.out.println(new User(userName,userEmail,userPassword,userPhone,"default jpg",userAddress));
		
		//creating user object to store data
    		UserDao.addUser(new User(userName,userEmail,userPassword,userPhone,"default jpg",userAddress));
   
    
   out.println("successfully saved");
//   out.println("<br> User id is"+userId);
   
   
		
		
		
	}

}





