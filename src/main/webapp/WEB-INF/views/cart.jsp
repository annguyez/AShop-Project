<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>CART</title>
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
<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/jquery-ui.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/owl.carousel.min.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/cart/css/owl.theme.default.min.css"/>' />
	<link rel="stylesheet"
	href='<c:url value="/resources/single/styles/responsive.css"/>' />
		<link rel="stylesheet"
	href='<c:url value="/resources/single/styles/main_styles.css"/>' />

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
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
        </div>
      </div>
    </div>
    <c:if test="${countProduct == 0 }">
		<div class="bg-light py-3">
			<div class="container">
				<div class="row">
					<div class="col-md-12 mb-0 ml-5 pl-5 pt-2 pb-2">
						<img
							src='<c:url value="/resources/cart/images/your-cart-is-empty.png"/>'
							alt="Image">
					</div>
				</div>
			</div>
		</div>
	</c:if>
    <c:if test="${countProduct > 0 }">
	<div class="site-section">
		<div class="container">
			<div class="row mb-5">
				<form class="col-md-12" method="post">
					<div class="site-blocks-table">
						<table class="table table-bordered">
							<thead class="bg-success">
								<tr>
									<th class="product-thumbnail">Image</th>
									<th class="product-name">Name</th>
									<th class="product-price">Price</th>
									<th>Size</th>
									<th>Color</th>
									<th class="product-quantity">Quantity</th>
									<th class="product-total">Total</th>
									<th class="product-remove">Remove</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cart" items="${cart}">
									<tr data-product_detail_id="${cart.product_detail_id }"
										class="product">
										<td class="product-thumbnail"><img
											src='<c:url value="/${cart.image}"/>' alt="Image"
											class="img-fluid"></td>
										<td class="product_id" data-product_id="${cart.product_id }">
												<a href="details/${cart.product_id}">
											<h4 
												class="h5 text-black text-center">${cart.product_name }</h4>
												</a>
										</td>
										<td class="price money text-center">${cart.price }<b>$</b></td>
										<td class="size text-center" data-size_id="${cart.size_id }">${cart.size }</td>
										<td class="color text-center" hidden="" style="color:${cart.color_name }; font-weight:bold;" data-color_id="${cart.color_id }">${cart.color_name }</td>
										 <td><span style="display: inline-block; 
													 background-color: ${cart.color_name};
													 border-radius: 50%;
													 width: 50px;
												     height: 50px;"></span>
											</td> 
										<td>
											<div class="input-group mb-3">
												<input class="detail_id text-center" value="${cart.product_detail_id }"
													hidden=""> <input class="old_quantity"
													value="${cart.quantity }" hidden=""> <input
													type="number" class="form-control  quantity"
													value="${cart.quantity }" min="1">

											</div>

										</td>
										<td class="total money text-center">${cart.price}</td>
										<td><a href="#"
											class="btn btn-primary text-center height-auto btn-sm delete-cart">x</a></td>
									</tr>
								</c:forEach>


							</tbody>
						</table>
					</div>
				</form>
			</div>

			<div class="row">
				<div class="col-md-6">
					<div class="row mb-5">
						<div class="col-md-6 mb-3 mb-md-0">
							<a href='<c:url value="/cart"></c:url>'><button
									class="btn btn-primary btn-sm btn-block">UPDATE</button></a>
						</div>
						<div class="col-md-6">

							<a href='<c:url value="/home"></c:url>'><button
									class="btn btn-outline-primary btn-sm btn-block">Back to shop</button></a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label class="text-black h4" for="coupon">Coupon</label>
							<p>Enter your coupon code if you have one.</p>
						</div>
						<div class="col-md-8 mb-3 mb-md-0">
							<input type="text" class="form-control py-3" id="coupon"
								placeholder="Coupon Code">
						</div>
						<div class="col-md-4">
							<button class="btn btn-primary btn-sm px-4">Apply Coupon</button>
						</div>
					</div>

				</div>
				<div class="col-md-6 pl-5">
					<div class="row justify-content-end">
						<div class="col-md-7">
							<div class="row">
								<div class="col-md-12 text-right border-bottom mb-5">
									<h3 class="text-black h4 text-uppercase">You have <span class="countCart"></span>
										Products</h3>
								</div>
							</div>
							<div class="row mb-5">
								<div class="col-md-5">
									<b>Shipping fees: </b>
								</div>
								<div class="col-md-7 text-left">
									<strong class="text-black">free</strong>
								</div>
								<hr/>
								<div class="col-md-5">
									<b>Total: </b>
								</div>
								<div class="col-md-7 text-left">
									<strong class="text-black totalCart money font-40">0</strong> <strong
										class="text-black font-40">$</strong>
								</div>
							</div>

							<div class="row">
								<div class="col-md-12">
									<a class="btn essence-btn btn-block" href="checkout">Checkout</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="benefit mb-3">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>


	<jsp:include page="footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/cart/js/jquery-3.3.1.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/jquery-ui.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/popper.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/bootstrap.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/owl.carousel.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/jquery.magnific-popup.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/aos.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/test.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/main.js"/>'></script>
	<script src='<c:url value="/resources/js/format-money.js"/>'></script>
</body>
</html>