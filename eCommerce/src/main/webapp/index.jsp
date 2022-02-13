
<%@page import="helper.Helper"%>
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
				
				<div class="list-group mt-4">
				<a href="#" class="list-group-item list-group-item-action active">
  					  All Products
 			    </a>
 			    
  			
 			    <%
					for(Category c: clist){
					
				%>
					
				 <a href="#" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
				
				<% 		
					}
				
				%>
				
				</div>
			
			</div>
		<!-- show products -->	
			<div class="col-md-8">
		<!-- row -->	
				<div class="row mt-4">
		<!-- column-12 -->	
				
				<div class="col-md-12">
				
				<div class="card-columns">
		<!-- traversing products -->
				<%
				
					for(Product p:list){
				
				%>
					<div class="card">
					
					<div class="container text-center">
					 	
  						<img class="card-img-top m-2" src="img/products/<%= p.getpPhoto() %>" style="max-height: 270px; max-width:100%; width:auto;" alt="Card image cap">
					
					</div>
					
					<div class="crad-body">
							
							<h5 class="card-title"><%=p.getpName() %></h5>
							
								<p class="card-text">
							
								<%= Helper.get10Words(p.getpDescription()) %>
							</p>
							
					</div>
						
						<div class="card-footer">
						
							<button class="btn custom-bg text-white">Add to chart</button>
							
							<button class="btn btn-outline-primary">&#8377;<%=p.getpPrice() %></button>
						
						
						</div>
						
						
						
					</div>
				<%}
					%>
				</div>	
			</div>	
		</div>
	</div>
</div>
</body>
</html>