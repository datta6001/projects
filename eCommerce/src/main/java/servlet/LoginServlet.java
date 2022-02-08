package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DaoRef;
import entities.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
	
		  String email =request.getParameter("email");
		  String password =request.getParameter("password");
		  // Authentication
		  User user = DaoRef.userdao.getUserByEmailAndPassword(email, password);

		  HttpSession httpsession= request.getSession();
			System.out.println(user);
		  
		  if(user==null) {

				httpsession.setAttribute("message", "Invalid Details !! Try With Another  one  ");
				response.sendRedirect("login.jsp");
				return;
			  
		  }else {
			  out.println("<h1> Welcome "+ user.getUserName() +" </h1>");
		  }
	}

}
