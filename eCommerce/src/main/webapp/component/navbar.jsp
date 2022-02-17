<%@page import="entities.User"%>
<%

	User user1=(User)session.getAttribute("current-user");



%>






<nav class="navbar navbar-expand-lg navbar-light custom-bg">
	<div class ="container">
	  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">ADURA'S_SITE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
          
        </li>
        <ul class="navbar-nav ml-auto">
       
       <!-- cart symbol -->
        	
        <li class="nav-item active">
          <a class="nav-link active" href="#!" data-bs-toggle="modal" data-bs-target="#cart"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
  <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
</svg> <span class="ml-0 cart-items">(0)</span></a>
        </li>
        
        
        
        
        <%
       		 if(user1==null){
        	
        	%>
        		
        <li class="nav-item">
          <a class="nav-link active" href="login.jsp">Login</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" href="register.jsp">Register</a>
        </li>	
        	
        	
        	
        	<%    }else{
        		
        		
        		%>
        		
        		<li class="nav-item">
          <a class="nav-link active" href="<%= user1.getUserType().equals("admin")?"admin.jsp": "normal.jsp" %>"><%=user1.getUserName()%></a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link active" href="LogoutServlet">Logout</a>
        </li>	
        		
        		
        		<% 
        		
        
        }
        
        %>
        
        
        
        
      </ul>
      
    </div>
  </div>
	</div>
</nav>