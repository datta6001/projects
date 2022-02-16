package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Image
 */
@WebServlet("/image")
public class Image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Image() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpeg");
//		String image =(String) request.getSession().getAttribute("image");
//		if(image == null) {
//			return;
//		}
		
//		File f = new File(System.getProperty("user.home")+"\\Pictures\\"+image);
//		InputStream in = new FileInputStream();
		OutputStream out = response.getOutputStream();
		out.write((byte[])request.getAttribute("image"));
		request.getSession().removeAttribute("image");
		out.flush();
		out.close();
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
