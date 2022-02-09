<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="entities.User"%>
<%

	User user=(User)session.getAttribute("current-user");
	
	if(user==null){
		session.setAttribute("message","You are not logged in!! Login first");
		response.sendRedirect("login.jsp");
	}else{
		if(user.getUserType().equals("normal"));{
		

			session.setAttribute("message","You are not admin ! Do not access this page");
			response.sendRedirect("login.jsp");
			
			
		}
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel</title>
<%@include file="./component/js_css.jsp" %>

</head>
<body>
		<%@include file="./component/navbar.jsp" %>


		<div class="container">
  <!-- first row -->	
			<div class="row mt-3">
			
				<div class="col-md-4">
				
					<div class="card">
						<div class="card-body text-center">
							<div class="container">
							
									<img  style="max-width: 125px ;" class="img-fluid " alt="Useers_icon" src="img/team.png">
							
							</div>
							
						
							<h1>101</h1>
							<h1 class="text-uppercase text-muted">Users</h1>
						
						</div>
					
					</div>
			
			
			</div>
			
			<div class="col-md-4">
			
					<div class="card">
						<div class="card-body text-center">
						
							<div class="container">
							
									<img  style="max-width: 125px ;" class="img-fluid " alt="Category_icon" src="img/list.png">
							
							</div>
							<h1>123</h1>
							<h1 class="text-uppercase text-muted">Categories</h1>
						
						</div>
					
					</div>
			
			
			</div>
			
			<div class="col-md-4">
					
					<div class="card">
						<div class="card-body text-center">
						
							<div class="container">
							
									<img  style="max-width: 125px ;" class="img-fluid " alt="Product_icon" src="img/product.png">
							
							</div>
							<h1>1234</h1>
							<h1 class="text-uppercase text-muted">Products</h1>
						
						</div>
					
					</div>
			
			
			</div>
			
			
			
			
			</div>
			
	<!-- second row -->
	<div class ="row mt-3">
			<div class="col-md-6">
						
						<div class="card">
						<div class="card-body text-center">
							<div class="container">
							
									<img  style="max-width: 125px ;" class="img-fluid " alt="Useers_icon" src="img/categories.png">
							
							</div>
							
						
							<p class="mt-2">Click here to add new category</p>
							<h1 class="text-uppercase text-muted">Add Categories</h1>
						
						</div>
					
					</div>
			
			
			
				</div>
				
			<div class="col-md-6">
						
						<div class="card">
						<div class="card-body text-center">
							<div class="container">
							
									<img  style="max-width: 125px ;" class="img-fluid " alt="Useers_icon" src="img/plus.png">
							
							</div>
							
						
							
							<p class="mt-2">Click here to add new product</p>
							<h1 class="text-uppercase text-muted">Add-Products</h1>
						
						</div>
					
					</div>
			
			
			
				</div>
	
	
	
	
	
	
	
	
	</div>
		
		
		
		
		</div>






</body>
</html>