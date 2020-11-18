<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>ASHOP</title>

<!-- Core Style CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/core-style.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/style.css"/>' />
	
	
	<link rel="stylesheet"
	href='<c:url value="/resources/home/css/core-style.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/style.css"/>' />
<link rel="stylesheet"
href='<c:url value="/resources/single/styles/responsive.css"/>' />
	<link rel="stylesheet"
href='<c:url value="/resources/single/styles/main_styles.css"/>' />
<link rel="stylesheet"
href='<c:url value="/resources/home/scss/style.scss"/>' />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- ##### Breadcumb Area Start ##### -->
	<%-- <div class="breadcumb_area bg-img"
		style="background-image: url(resources/home/img/bg-img/breadcumb.jpg);">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<div class="page-title text-center">
						<c:if test="${category_id!=0 }">
							<h2>${category_name }</h2>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div> --%>

	<!-- ##### Shop Grid Area Start ##### -->
	<section class="shop_grid_area section-padding-80">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-4 col-lg-3">
					<div class="shop_sidebar_area">

						<!-- ##### Single Widget ##### -->
						<div class="widget catagory">
							<!-- Widget Title -->
							<h6 class="widget-title mb-5">
								<label for="category_id">Category</label>
							</h6>	
							<input type="number" hidden="" id="category_id" value="${category_id }"/>				
							<select class="form-control" id="slcategory_id">
							<option value="0">All</option>
								<c:forEach var="cate" items="${category }">
									<option value="${cate.category_id }">${cate.category_name }</option>
								</c:forEach>
							</select>
							
						</div>

						
						<input type="text" class="form-control mt-5" id="name" placeholder="Product name" value="${name }">
					
						
						<div class="widget price row mt-5">
							
							<div class="col-2">
							<p>from</p>
							</div>
							
							<div class="col-4">
								<input  class="form-control" id="minPrice" placeholder="Giá thấp nhất" value="${minPrice }"/>
							</div>
							
							<div class="col-2">
							<p>to</p>
							</div>
							
							<div class="col-4"> 
								<input class="form-control" id="maxPrice" placeholder="Giá cao nhất" value="${maxPrice }"/>
							</div>
							
							<button type="button" id="btnSearch" style="border-radius: 35px" class="btn btn-success mb-5 form-control"><span class="text-light">SEARCH</span></button>
						</div>
						
						
					</div>
				</div>

			
						<div class="row">
							<div class="col-12">
								<div
									class="product-topbar d-flex align-items-center justify-content-between">
									<!-- Total Products -->
									<div class="total-products">
										<p>
											<span>${total}</span> products
										</p>
									</div>
									
									<div class="product-sorting d-flex">
									<input type="number" id="orderby" value="${orderby }" hidden="">
										<p>Fillter:</p>
											<select name="select" id="slorderby">
												<option value="1">HOT</option>
												<option value="2">NEW</option>
												<option value="3">LOW</option>
												<option value="4">HIGHT</option>
											</select> 
									</div>
								</div>
							</div>
						</div>

									<div class="row">
										<c:forEach var="pr" items="${product }">
											<!-- Single Product -->
											
											<div class="product-item men">
											<div class="product discount product_filter">
												<div class="product_image">
													<%-- <img src="${pr.image }" alt=""> --%>
													<img src='<c:url value="/${pr.image }"></c:url>' alt="">
			
												</div>
												<div class="favorite favorite_left"></div>
			
												<c:if test="${pr.getDiscount()>0 }">
													<div
														class="product_bubble product_bubble_right product_bubble_red d-flex flex-column align-items-center">
														<span>&#8595; ${pr.getDiscount() }%</span>
													</div>
												</c:if>
			
												<div
													class="product_bubble product_bubble_left product_bubble_green d-flex flex-column align-items-center">
													<span>new</span>
												</div>
			
			
												<div class="product-description">
													<a href='<c:url value="/details/${pr.product_id }"></c:url>'>
															<h6>${pr.product_name }</h6>
													</a>
													<c:if test="${pr.getDiscount()>0 }">
													<c:set var="discount" value="${100-pr.getDiscount() }"></c:set>
													<p class="product-price">
														<strike>${pr.price }<b>$</b></strike>
														 <b class="ml-2 font-23" style="color: red"><b class="money font-23">${discount*pr.price/100}</b> $</b>
													</p>
													</c:if> 
													<c:if test="${pr.getDiscount()<=0 }">
														<b class="money font-23">${pr.price }<span>$</span></b> 
													</c:if>
												</div>
											</div>
											<div class="hover-content-1">
												<!-- Add to Cart -->
												<div class="add-to-cart-btn">
													<a
														href='<c:url value="/details/${pr.getProduct_id()}"></c:url>'
														class="btn essence-btn">SHOPPING NOW</a>
													</div>
											</div>
										</div>
										</c:forEach>
									</div>
						
						
					</div>
				</div>
			
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/js/search.js"></c:url>'></script>
	<script src='<c:url value="/resources/js/format-money.js"/>'></script>
</body>
</html>

