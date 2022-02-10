<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>

<%@include file="./component/js_css.jsp" %>
</head>
<body>
	<%@include file="/component/navbar.jsp" %>
		<div class ="container">
		<div class="row">
		<div class="col-md-6 offset-md-3">
		 
		 <div class="card mt-3">
		 
		 <div class="card-header custom-bg text-white">
		  <h3>Login_Here</h3>
		 </div>
		 
		 <div class="card-body">

		<%@include file="./component/message.jsp" %>
				
		 <form action="LoginServlet" method="post">
  <div class="mb-3">
		 <form>
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input  name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1">
  </div>
       <a href="register.jsp" class="text-center d-block mb-2">if not registered click here</a>
    <div class="container text-center"> 
    <button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
    <button type="reset" class="btn btn-primary  border-0 custom-bg">Reset</button>
    </div>
 
</form>
		 
		  	</div>
		 
		 
		 
		 
		 </div>
		
		
		
		
		
		
		 </div>
		</div>
	</div>
		
		

</body>
</html>