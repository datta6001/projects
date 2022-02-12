
<%@page import="javax.net.ssl.ManagerFactoryParameters"%>
<%@page import="com.ibm.icu.text.PluralRules.Factory"%>
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
			
				ProductDao dao=new ProductDao(FactoryProvider.getFactory);
				List<Product>list=dao.getAllProducts();
				
				CategoryDao cdao=new categoryDao(FactoryProvider.getFactory);
				List<Category>list=cdao.getAllCategories();
				
			
			
			
			%>
		
		
		<!-- show categories -->
			<div class="col-md-2">
				<h1><%= clist.size() %></h1>
				
				<%
					
					for(category c: clist){
						
					
						out.println(c.getCategoryTitle()+"<br>");
						
						
					}
				
				
				%>
			
			</div>
		<!-- show products -->	
			<div class="col-md-8">
			
				<h1>Number of products is <%=list.size() %></h1>	
				<%
					for(Product product:list){
						
						out.println(product.getPhoto()+"<br>");
						out.println(product.getName()+"<br><br>");
					}
				
				
				
				%>
			</div>
		
		
		</div>
</body>
</html>