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
<link rel="stylesheet"
href='<c:url value="/resources/single/styles/responsive.css"/>' />
	<link rel="stylesheet"
href='<c:url value="/resources/single/styles/main_styles.css"/>' />
<link rel="stylesheet"
href='<c:url value="/resources/home/scss/style.scss"/>' />
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
							
							<h2 class="ml-5">ASHOP CENTER</h2>
							<a href='<c:url value="/search/0/0/0//1/1"></c:url>'
								class="btn essence-btn">Mua hàng</a>
						</div>
					</div>
				</div>
			</div>  --%>
	</section>
	<!-- <section class="yellow-custom section-padding-80">
		<div class="section-heading text-center">
		
			<h1>ASHOP CENTER</h1>
		</div>
	</section> -->
	
	
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background-image:url(resources/single/images/3shoe.gif)">
						
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background-image:url(resources/single/images/cr7.gif)">
						<div class="banner_category">
							<a href="">ASHOP</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background-image:url(resources/single/images/2020.gif)">
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Welcome Area End ##### -->

	<!-- ##### New Arrivals Area Start ##### -->
	<section class="new_arrivals_area section-padding-80 clearfix ">
		<%-- <div class="container ">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<a href='<c:url value="/search/0/0/0//1/1"></c:url>'><h2>NEWEST</h2></a>
					</div>
				</div>
			</div>
		</div> --%>
		
		

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
		style="background-image: url(resources/home/img/bg-img/1.gif); height: 500px;">
	</section>
	
	<div class="deal_ofthe_week">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="deal_ofthe_week_img">
						<img src="resources/home/img/bg-img/giphy.gif" alt="">
					</div>
				</div>
				<div class="col-lg-6 text-right deal_ofthe_week_col">
					<div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
						<div class="section_title">
							<h2>Deal Of The Week</h2>
						</div>
						<ul class="timer">
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="day" class="timer_num">03</div>
								<div class="timer_unit">Day</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="hour" class="timer_num">15</div>
								<div class="timer_unit">Hours</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="minute" class="timer_num">45</div>
								<div class="timer_unit">Mins</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="second" class="timer_num">23</div>
								<div class="timer_unit">Sec</div>
							</li>
						</ul>
						<div class="red_button deal_ofthe_week_button"><a href="#">shop now</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- ##### New Arrivals Area Start ##### -->
	<section class="new_arrivals_area section-padding-80 clearfix ">
		<div class="container ">
			<div class="row">
				<div class="col-12">
					<div class="section-heading text-center">
						<a href="/home"><h2>TOP 5 BEST SELLING OF 2020</h2></a>
					</div>
				</div>
			</div>
		</div>

		<div class="container ">
			<div class="row ">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">

						<!-- Single Product -->
						<c:forEach var="pr" items="${bestseller}" varStatus="loop">
							<div class="single-product-wrapper border-custom">
								
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
									<%-- <span>HOT ${loop.index + 1}</span>  --%>
									<c:choose>
										<c:when test="${loop.index + 1==1}">
											<span class="badge badge-warning"><i class="fas fa-trophy">1</i></span>
										</c:when>
										<c:when  test="${loop.index + 1 ==2}">
											<span class="badge badge-warning"><i class="fas fa-trophy">2</i></span>
										</c:when>
										<c:when test="${loop.index + 1 ==3}">
											<span class="badge badge-warning"><i class="fas fa-trophy">3</i></span>
										</c:when>
										<c:when test="${loop.index + 1 == 4}">
										<span class="badge badge-light">4</span>
										</c:when>
										<c:when test="${loop.index + 1 == 5}">
										<span class="badge badge-light">5</span>
										</c:when>
									</c:choose>
									<a href="details/${pr.product_id}">
										<h6>${pr.product_name}</h6>
									</a>

									<c:if test="${pr.getDiscount()>0 }">
										<c:set var="discount" value="${100-pr.getDiscount() }"></c:set>
										<p class="product-price">
											<span class="old-price money">${pr.price }<b>$</b></span> <b
												style="color: red"><b class="money font-23">${discount*pr.price/100}</b> $</b>
										</p>
									</c:if>
									<c:if test="${pr.getDiscount()<=0 }">
										<p class="product-price"><b class="money font-23">${pr.price }</b> $</p>
									</c:if>


									<!-- Hover Content -->
									<div class="hover-content l-7">
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
	
	<section class="welcome_area bg-img background-overlay section-padding-80"
		style="background-image: url(resources/home/img/bg-img/sale1.png); height: 550px;">
	</section>
	
	<div
		class="brands-area d-flex align-items-center justify-content-between">
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/giphy6.gif" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/giphy5.gif" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/giphy7.gif" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/giphy3.gif" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/giphy8.gif" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="resources/home/img/core-img/giphy1.gif" alt="">
		</div>
	</div>
	
	
	
	

	<jsp:include page="footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/js/format-money.js"/>'></script>
	<script src='<c:url value="/resources/single/js/custom.js"/>'></script>
</body>
</html>