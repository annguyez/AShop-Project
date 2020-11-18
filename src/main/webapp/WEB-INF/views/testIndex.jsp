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
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>ASHOP</title>

<!-- Favicon  -->

<!-- Core Style CSS -->
		    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" />' />
    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-4.7/css/font-awesome.min.css" />' />
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/core-style.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/style.css"/>' />

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<!-- ##### Welcome Area Start ##### -->
	<section class="welcome_area bg-img background-overlay"
		style="background-image: url(${event.image});">
		<!-- <video autoplay loop muted height="600px" poster="true">
			<source src="resources/home/img/bg-img/bg-video.mp4" type="video/mp4">
		</video> -->
			<%-- <div class="container h-100">
				<div class="row h-100 align-items-center">
					<div class="col-12">
						<div class="hero-content">
							<h6>ESENCE</h6>
							<h2>Thời trang cho phái đẹp</h2>
							<a href='<c:url value="/search/0/0/0//1/1"></c:url>'
								class="btn essence-btn">Mua hàng</a>
						</div>
					</div>
				</div>
			</div> --%>
	</section>
	<section class="yellow-custom section-padding-80">
		<div class="section-heading text-center">
		
			<h1>ASHOP CENTER</h1>
		</div>
	</section>
	<!-- ##### Welcome Area End ##### -->

	<!-- ##### New Arrivals Area Start ##### -->
	<section class="new_arrivals_area section-padding-80 clearfix ">
		<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>New Arrivals</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">all</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".women">women's</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".accessories">accessories</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".men">men's</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>

						<!-- Product 1 -->
						<c:forEach var="pr" items="${newest}">
							<div class="product-item men">
								<div class="product discount product_filter">
									<div class="product_image">
										<img src="${pr.image }" alt="">

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
										<a href="details/${pr.product_id}">
										<h5 class="product_name">
											${pr.product_name} 
										</h5>
										</a>
										<c:if test="${pr.getDiscount()>0 }">
										<c:set var="discount" value="${100-pr.getDiscount() }"></c:set>
										<p class="product-price">
											<strike>${pr.price }<b>$</b></strike>
											 <b class="ml-2" style="color: red"><b class="money">${discount*pr.price/100}</b> $</b>
										</p>
										</c:if> 
										<c:if test="${pr.getDiscount()<=0 }">
											<b class="money">${pr.price }<span>$</span></b> 
										</c:if>
									</div>
								</div>
								<div class="hover-content-1">
									<!-- Add to Cart -->
									<div class="add-to-cart-btn">
										<a
											href='<c:url value="details/${pr.getProduct_id()}"></c:url>'
											class="btn essence-btn">SHOPPING NOW</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	
	<section class="welcome_area bg-img background-overlay section-padding-80"
		style="background-image: url(resources/home/img/bg-img/banner-sale.jpg); height: 500px;">
	</section>
	
	
	<!-- ##### New Arrivals Area Start ##### -->
	<section class="new_arrivals_area section-padding-80 clearfix ">
		<div class="container ">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<a href='<c:url value="/search/0/0/0//2/1"></c:url>'><h2>BEST SELLER</h2></a>
					</div>
				</div>
			</div>
		</div>

		<div class="container ">
			<div class="row ">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">

						<!-- Single Product -->
						<c:forEach var="pr" items="${bestseller}">
							<div class="single-product-wrapper">
								<!-- Product Image -->
								<div class="product-img">
									<img src="${pr.image }" alt="">
									<!-- Hover Thumb -->
									<img class="hover-img" src="${pr.image }" alt="">
		
									<div class="product-badge offer-badge">
										<span>Hot</span>
									</div>
				

								</div>
								<!-- Product Description -->
								<div class="product-description">
									<span>HOT</span> <a href="details/${pr.product_id}">
										<h6>${pr.product_name}</h6>
									</a>

									<c:if test="${pr.getDiscount()>0 }">
										<c:set var="discount" value="${100-pr.getDiscount() }"></c:set>
										<p class="product-price">
											<span class="old-price money">${pr.price }<b>$</b></span> <b
												style="color: red"><b class="money">${discount*pr.price/100}</b> $</b>
										</p>
									</c:if>
									<c:if test="${pr.getDiscount()<=0 }">
										<p class="product-price"><b class="money">${pr.price }</b> $</p>
									</c:if>


									<!-- Hover Content -->
									<div class="hover-content">
										<!-- Add to Cart -->
										<div class="add-to-cart-btn">
											<a
												href='<c:url value="details/${pr.getProduct_id()}"></c:url>'
												class="btn essence-btn">SHOPPING NOW</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="yellow-custom section-padding-80">
		
	</section>
	
	<section class="new_arrivals_area section-padding-80 clearfix ">
		<div class="container ">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<h2>SALE OFF</h2></a>
					</div>
				</div>
			</div>
		</div>

		<div class="container ">
			<div class="row">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">

						<!-- Single Product -->
						<c:forEach var="pr" items="${newest}">
							<div class="single-product-wrapper">
								<!-- Product Image -->
								<div class="product-img">
									<img src="${pr.image }" alt="">
									<!-- Hover Thumb -->
									<img class="hover-img" src="${pr.image }" alt="">
		
									<div class="product-badge new-badge">
										<span>NEW</span>
									</div>
									<c:if test="${pr.getDiscount()>0 }">
												<div class="product-badge offer-badge">
													<span>&#8595; ${pr.getDiscount() }%</span>
												</div>
									</c:if>
								</div>
								<!-- Product Description -->
								<div class="product-description">
									<span>NEW</span> <a href="details/${pr.product_id}">
										<h6>${pr.product_name}</h6>
									</a>

									<c:if test="${pr.getDiscount()>0 }">
										<c:set var="discount" value="${100-pr.getDiscount() }"></c:set>
										<p class="product-price">
											<span class="old-price money">${pr.price }<b>$</b></span> 
											<b
												style="color: red"><b class="money">${discount*pr.price/100}</b> $</b>
										</p>
									</c:if>
									<c:if test="${pr.getDiscount()<=0 }">
										<p class="product-price"><b class="money">${pr.price }</b> $</p>
									</c:if>
									
									<!-- Hover Content -->
									<div class="hover-content">
										<!-- Add to Cart -->
										<div class="add-to-cart-btn">
											<a
												href='<c:url value="details/${pr.getProduct_id()}"></c:url>'
												class="btn essence-btn">SHOPPING NOW</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	

	<!-- ##### New Arrivals Area End ##### -->



	<!-- ##### Brands Area Start ##### -->
	<div
		class="brands-area d-flex align-items-center justify-content-between">
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/brand1.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/brand2.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/brand3.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/brand4.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/brand5.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/brand6.png" alt="">
		</div>
	</div>
	
	<!-- ##### Brands Area End ##### -->



	<jsp:include page="footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/js/format-money.js"/>'></script>
</body>
</html>