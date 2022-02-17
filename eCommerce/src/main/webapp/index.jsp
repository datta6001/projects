
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

<%@include file="./component/js_css.jsp"%>
</head>
<script type="./js/Script.js"></script>

<body>
	<div class="container-fluid">

		<%@include file="/component/navbar.jsp"%>
		<div class="row mt-3 mx-2">

			<%
			String cat = request.getParameter("category");
			//out.println(cat);

			ProductDao dao = new ProductDao();

			List<Product> list = null;
			if (cat == null || cat.trim().equals("all")) {
				list = dao.getAllProducts();
			} else {
				int cid = Integer.parseInt(cat.trim());
				list = dao.getAllProductsById(cid);
			}

			CatDao cdao = new CatDao();
			List<Category> clist = cdao.getcategories();
			%>

			<!-- show categories -->
			<div class="col-md-2">

				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>
					<%
					for (Category c : clist) {
					%>

					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

					<%
					}
					if (list.size() == 0) {
					out.println("<h3>No item in this category</h3>");
					}
					%>
				</div>

			</div>
			<!-- show products -->
			<div class="col-md-10">
				<!-- row -->
				<div class="row mt-4">
					<!-- column-12 -->

					<div class="col-md-12">

						<div class="card-columns">
							<!-- traversing products -->
							<%
							for (Product p : list) {								
							%>
							<!-- product card -->
							<div class="card product-card">

								<div class="container text-center">
									
									<img class="card-img-top m-2" src="image?id=<%=p.getpId() %>"
										style="max-height: 270px; max-width: 100%; width: auto;"
										alt="Card image cap">
				
								</div>

								<div class="crad-body">

									<h5 class="card-title"><%=p.getpName()%></h5>

									<p class="card-text">

										<%=Helper.get10Words(p.getpDescription())%>
									</p>

								</div>
								<div class="card-footer text-center">

									<button class="btn custom-bg text-white"
										onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAterApplyingDisount()%> )">Add
										to chart</button>

									<button class="btn btn-outline-success">
										&#8377;<%=p.getPriceAterApplyingDisount()%>/-<span
											class="test-secondary discount-label"> &#8377;<%=p.getpPrice()%>,
											<%=p.getpDiscount()%> off
										</span>
									</button>

								</div>

							</div>
							<%
							}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
		<%@include file="/component/comman_modal.jsp"%>
	
	
</body>
</html>