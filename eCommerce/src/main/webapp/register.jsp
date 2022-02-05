<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New_User</title>

<%@include file="./component/js_css.jsp" %>
</head>
<body>
<%@include file="/component/navbar.jsp" %>

  <div class="container-fluid">
  
   <div class="row mt-3">
   <div class="col-md-4 offset-md-4">
	 <h3 class="text-center my-3">Sign up here!</h3>

  <div class="card">
   <div class="card-body px-5">
   
   <form action="RegisterServlet"method="post">
  <div class="form-group">
    <label for="name" class="form-label">User_Name</label>
    <input name="user_name" type="text"  class="form-control" id="name" placeholder="Enter Here" aria-describedby="emailHelp">
   </div>	
	
  <div class="form-group">
    <label for="emial" class="form-label">User_Email</label>
    <input name="user_email" type="email"class="form-control" id="email" placeholder="Enter Here" aria-describedby="emailHelp">
  </div>
  
  
  <div class="form-group">
    <label for="password" class="form-label">User_Password</label>
    <input name="user_password" type="password" class="form-control" id="password" placeholder="Enter Here" aria-describedby="emailHelp">
  </div>
  
  
  <div class="form-group">
    <label for="phone" class="form-label">User_Phone</label>
    <input name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter Here" aria-describedby="emailHelp">
  </div>
  
  
  <div class="form-group">
    <label for="address" class="form-label">User_Address</label>
    <textarea name="user_address" style="height:300px; width:300px" class ="form-control" placeholder="Enter your addrees"></textarea>
  </div>
 
  <div class="container text-center">
   <button class="btn btn-outline-success">Register</button>
   <button class="btn btn-outline-warning">Reset</button>
  </div>
  
</form>
      
   </div>
  
  </div>

</div>
</div>
   
  
  </div>
</body>
</html>