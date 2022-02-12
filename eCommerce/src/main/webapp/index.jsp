
<%@page import="dao.CatDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.List"%>
<%@page import="entities.Category"%>
<%@page import="entities.Product"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADURA'S_SITE..</title>
<%@include file="./component/js_css.jsp" %>
</head>
<script type="./js/Script.js"></script>

<body>
<%@include file="/component/navbar.jsp" %>
		<div class="row mt-3 mx-2">
		
			<%
			
				ProductDao dao= new ProductDao();
				List<Product> plist=dao.getAllProducts();
				
				CatDao cdao=new CatDao();
				List<Category> clist=cdao.getcategories();
				
			
			
			
			%>
		
		
		<!-- show categories -->
			<div class="col-md-2">
				<h1><%= clist.size() %></h1>
				
				<%
					
					for(Category c: clist){
						
					
						out.println(c.getCategoryTitle()+"<br>");
						
						
					}
				
				
				%>
			
			</div>
		<!-- show products -->	
			<div class="col-md-8">
			
				<h1>Number of products is <%=plist.size() %></h1>	
				<%
					for(Product product:plist){
						
						out.println(product.getpPhoto()+"<br>");
						out.println(product.getpName()+"<br><br>");
					}
				
				
				
				%>
			</div>
		
		
		</div>
</body>
</html>