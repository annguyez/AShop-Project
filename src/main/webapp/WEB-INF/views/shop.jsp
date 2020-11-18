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

	<section class="shop_grid_area section-padding-80">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-4 col-lg-3">
					<div class="shop_sidebar_area">
						<div class="widget catagory">
							<input type="number" hidden="" id="category_id" value="${category_id }"/>				
							<select class="form-control" id="category">
							<option value="0">All</option>
								<c:forEach var="cate" items="${category }">
									<option value="${cate.category_id }">${cate.category_name }</option>
								</c:forEach>

							</select>
							
						</div>

					
						<div class="widget-title">
							<input type="text" class="form-control mt-5" id="name" placeholder="Product name" value="${name }">
							
						</div>
						
						
						<div class="widget price row mt-5">
							
							<div class="col-2">
							<p>from</p>
							</div>
							
							<div class="col-4">
								<input  class="form-control" id="minPrice" placeholder="min" value="${minPrice }"/>
							</div>
							
							<div class="col-2">
							<p>to</p>
							</div>
							
							<div class="col-4"> 
								<input class="form-control" id="maxPrice" placeholder="max" value="${maxPrice }"/>
							</div>
							
							
						</div>
						<button type="submit" id="search" style="border-radius: 35px" class="btn btn-success mb-5 mt-1 form-control"><span class="text-light">SEARCH</span></button>
						<p> You have <span>${total}</span> result..</p>
						
					</div>
				</div>
				<c:if test="${total == 0 }">
					<div class="col-12 col-md-8 col-lg-9">
						<div class="shop_grid_product_area">
							<div class="row ml-5">
								<img
									src='<c:url value="/resources/shop/image/no-record.png"/>'
									alt="Image">
							</div>
						</div>
					</div>
				</c:if>
				
				
				<div class="col-12 col-md-8 col-lg-9">
					<div class="shop_grid_product_area">
						<div class="row">
							<div class="col-12">
								<div
									class="product-topbar d-flex align-items-center justify-content-between">
								
									<div class="product-sorting d-flex">
									<input type="number" id="orderby" value="${orderby }" hidden="">
										<p>Filter:</p>
											<select name="select" id="filter">
												<option value="1">HOT</option>
												<option value="2">NEW</option>
												<option value="3">LOW</option>
												<option value="4">HIGH</option>
											</select> 
									</div>
								</div>
							</div>
						</div>
						<c:if test="${total > 0 }">
						<div class="row">
							<c:forEach var="pr" items="${product }">
								<div class="product-item men">
									<div class="product discount product_filter">
										<div class="product_image">
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
						</c:if>
					</div>
					
					
					<input type="number" id="page" value="${page }" hidden="">
					<nav aria-label="navigation" hidden="">
						
						<ul>
                           
                           <c:if test="${page>1 }">
                            	 <li class="page-item">
                            	 <a class="border " href='<c:url value="${url }/${page-1}"></c:url>'>
                            	 <i class="fa fa-angle-left"></i>
                            	 </a>
                            	 </li>
                            </c:if>
                           
                            <c:forEach begin="1" end="${totalpage }" var="i">
                            	
                            	<c:if test="${i==page }">
                            		<li class="page-item active"><a class="page-link" href='<c:url value="${url }/${i}"></c:url>'>${i }</a></li>
                            	</c:if>
                            	<c:if test="${i!=page }">
                            		<li class="page-item "><a class="page-link" href='<c:url value="${url }/${i}"></c:url>'>${i }</a></li>
                            	</c:if>
                            </c:forEach>
                            <c:if test="${page<totalpage }">
                            	<li class="page-item"><a class="page-link" href='<c:url value="${url }/${page+1}"></c:url>'><i class="fa fa-angle-right"></i></a></li>
                            </c:if>
                        </ul>
					</nav>
				</div>
				
			</div>
		</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/shop/js/search.js"></c:url>'></script>
	<script src='<c:url value="/resources/js/format-money.js"/>'></script>
</body>
</html>