<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>ASHOP</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Rubik:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href='<c:url value="/resources/home/fonts/icomoon/style.css"/>' />

<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/bootstrap.min.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/magnific-popup.css"/>' />
	
<link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/font-awesome-4.7/css/font-awesome.min.css"/>'/>


<link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/font-awesome-5/css/fontawesome-all.min.css"/>'/>
 
<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/jquery-ui.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/owl.carousel.min.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/owl.theme.default.min.css"/>' />

<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/aos.css"/>' />

<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/style.css"/>' />
<!--     header -->

<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/core-style.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/style.css"/>' />
	
	

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Detail</strong></div>
        </div>
      </div>
    </div>
    <div id="p1" class="col-3 noti-shop">

	</div>
	<section class="single_product_details_area d-flex align-items-center">

		<!-- Single Product Thumb -->

		<div class="single_product_thumb clearfix">
			<div class="product_thumbnail_slides owl-carousel">
				<img src='<c:url value="/${pr.image }"></c:url> ' alt=""> <img
					src='<c:url value="/${pr.image }" ></c:url>' alt=""> <img
					src='<c:url value="/${pr.image }"  ></c:url>' alt="">
			</div>
		</div>

		<input class="image" data-image="/${pr.image }" hidden="hidden">
		<!-- Single Product Description -->
		<div class="single_product_desc clearfix">
			<a href="">
				<h2 class="product_id" data-product_id="${pr.product_id }">${pr.product_name }</h2>
			</a> <input type="text" value="${pr.product_id }" id="product_id"
				hidden="">
			<c:if test="${discount>0 }">
				<p class="product-price" id="price"
					data-price="${(100-discount)*pr.price/100 }">

					<span class="old-price money">${pr.price}<b>$</b></span><b class="money">${(100-discount)*pr.price/100 }</b>
					$
				</p>
			</c:if>
			<c:if test="${discount<=0 }">
				<p class="product-price " id="price" data-price="${pr.price} ">

					<b class="money">${pr.price} </b>$</p>
			</c:if>
			<div class="product-desc" style="margin-top: 50px">${pr.descriptions }</div>



			<!-- Form -->
			<div class="select-box d-flex mt-50 mb-30">


				<select class="open nice-select  form-control" name="select"
					id="productColor">
					<c:forEach var="color" items="${colors}">
						<option value="${color.getColor_id() }">Color:
							${color.getColor_name() }</option>
					</c:forEach>
				</select> <select class="open nice-select mr-5 form-control" name="select" id="productSize"
					class="nice-select mr-5 open">
					<c:forEach var="sp" items="${pr.products_detail}">
						<option value="${sp.size.size_id }">Size: ${sp.size.size }</option>
					</c:forEach>
				</select>

			</div>
			<div class="cart-fav-box d-flex align-items-center">
				<button class="btn essence-btn btn-cart">Add to cart</button>
				<div class="product-favourite ml-4 btn-favourite">
	                        <a href="#" class="favme fa fa-heart"></a>
	            </div>
            </div>

			
		</div>
	</section>
	
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="popular-products-slides owl-carousel">
						<!-- Single Product -->
						<c:forEach var="pr" items="${newest}">
							<div class="single-product-wrapper border-custom">
								<!-- Product Image -->
								<div class="product-img">
									<img src='<c:url value="/${pr.image }"></c:url> ' alt="">
									<!-- Hover Thumb -->
									<img class="hover-img" src='<c:url value="/${pr.image }"></c:url> ' alt="">
		
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
								<div class="product-description m-15">
									<span>NEW</span> <a href="../details/${pr.product_id}">
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
									<div class="hover-content">
										<!-- Add to Cart -->
										<div class="add-to-cart-btn">
											<a
												href='<c:url value="../details/${pr.getProduct_id()}"></c:url>'
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
		

	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v6.0&appId=2516976671875938&autoLogAppEvents=1"></script>

	<div class="m-115 fb-comments"
		data-href="http://localhost:8080/AShop/details/${pr.product_id}"
		data-width="" data-numposts="5"></div>
</body>
		

	
	<jsp:include page="footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/js/format-money.js"/>'></script>
	<script src='<c:url value="/resources/favourite/js/favouriteShoe.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/recentProduct.js"/>'></script>
</body>
</html>