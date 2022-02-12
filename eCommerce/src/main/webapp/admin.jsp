<%@page import="java.util.List"%>
<%@page import="dao.CatDao,entities.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not logged in!! Login first");
	response.sendRedirect("login.jsp");
} else {
	if (!user.getUserType().equals("admin")) {
		System.out.println(user.getUserType());
		session.setAttribute("message", "You are not admin ! Do not access this page");
		response.sendRedirect("login.jsp");

	}
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin panel</title>
<%@include file="./component/js_css.jsp"%>

</head>
<body>
	<%@include file="./component/navbar.jsp"%>


	<div class="container">

		<div class="container-fluid mt-3">
			<%@include file="./component/message.jsp"%>
		</div>



		<!-- first row -->
		<div class="row mt-3">

			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px;" class="img-fluid "
								alt="Useers_icon" src="img/team.png">

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

							<img style="max-width: 125px;" class="img-fluid "
								alt="Category_icon" src="img/list.png">

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

							<img style="max-width: 125px;" class="img-fluid "
								alt="Product_icon" src="img/product.png">

						</div>
						<h1>1234</h1>
						<h1 class="text-uppercase text-muted">Products</h1>

					</div>
				</div>
			</div>
		</div>

		<!-- second row -->
		<div class="row mt-3">
			<div class="col-md-6">

				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid "
								alt="Useers_icon" src="img/categories.png">
						</div>

						<p class="mt-2">Click here to add new category</p>
						<h1 class="text-uppercase text-muted">Add Categories</h1>

					</div>
				</div>
			</div>

			<div class="col-md-6">

				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">

							<img style="max-width: 125px;" class="img-fluid "
								alt="Useers_icon" src="img/plus.png">

						</div>

						<p class="mt-2">Click here to add new product</p>
						<h1 class="text-uppercase text-muted">Add Products</h1>

					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- add category modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="add-category-model" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header  custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- form -->

					<form action="ProductActionServlet" method="post"
						enctype="multipart/form-data">

						<input type="hidden" name="operation" value="addcategory">

						<div class="form-group">

							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter category title" required />
						</div>
						<div class="form-group">
							<textarea style="height: 350px;" class="form-control"
								placeholder="Enter category decription" name="catDescription"
								required></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- end category modal -->


	<!-- add product modal -->
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="add-product-model" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header  custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill product
						details</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<!-- form -->

					<form action="ProductActionServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct">
						<!-- product title -->
						<div class="form-group">
							<input type="text" class="form-control" name=" pName"
								placeholder="Enter  title title of product" required />
						</div>
						<!-- product description -->
						<div class="form-group">
							<textarea style="height: 150px;" class="form-control"
								placeholder="Enter product decription" name="pDescription"
								required></textarea>
						</div>
						<!-- product price -->
						<div class="form-group">
							<input type="number" class="form-control" name=" pPrice"
								placeholder="Enter price of product" required />
						</div>
						<!-- product discount -->
						<div class="form-group">
							<input type="number" class="form-control" name=" pDiscount"
								placeholder="Enter product discount" required />
						</div>
						<!-- product quantity -->
						<div class="form-group">
							<input type="number" class="form-control" name=" pQuantity"
								placeholder="Enter product quantity" required />
						</div>
						<!-- product category -->

						<%
						CatDao cdao = new CatDao();
						List<Category> list = cdao.getcategories();
						%>


						<div class="form-group">
							<select name="catId" form-control=" id-">

								<%
								for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>

								<%
								}
								%>
							</select>
						</div>


						<!-- product file -->
						<div class="form-group">
							<label for="pPic">Select Picture Of Product</label> <br> <input
								type="file" id="pPic" name="pPic" required />
						</div>


						<!-- product file -->
						<div class="form-group">
							<label for="pPic">Select Picture Of Product</label> <br> <input
								type="file" id="pPic" name="pPic" required />
						</div>
						<!-- submit button -->
						<div class="container text-center">

							<button class="btn btn-outline-success">Add Products</button>
						</div>


						<!-- end form -->

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
						</div>
						</form>
				</div>

			</div>
		</div>
	</div>
	<!-- end category modal -->


</body>
</html>