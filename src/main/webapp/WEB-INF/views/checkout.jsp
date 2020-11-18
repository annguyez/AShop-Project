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
	<title>ORDER PAYMENT</title>

	<link rel="stylesheet" href='<c:url value="/resources/home/css/core-style.css"/>'/>
	<link rel="stylesheet" href='<c:url value="/resources/home/css/style.css"/>'/>
	<link rel="stylesheet"
	href='<c:url value="/resources/single/styles/responsive.css"/>' />
		<link rel="stylesheet"
	href='<c:url value="/resources/single/styles/main_styles.css"/>' />
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="breadcum b_area bg-img" style="background-image: url('<c:url value="/resources/home/img/bg-img/back.png"/>')">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="page-title text-center">
                        <h2 >ORDER PAYMENT</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Checkout Area Start ##### -->
    <div class="checkout_area section-padding-80">
        <div class="container">
            <div class="row">

				
				<div class="col-md-12 mb-0">
					<a href="/AShop/home">Home</a> <span class="mx-2 mb-0">/</span> <a
						href="/AShop/cart" class="text-black">Cart</a><span class="mx-2 mb-0">/</span> <strong
						class="text-black">Check Out</strong>
				</div>
						

				<div class="col-12 col-md-6">
                    <div class="checkout_details_area mt-50 clearfix">

                        <div class="cart-page-heading mb-30">
                            <h5>CUSTOMER INFORMATION</h5>
                        </div>

                        <form action="checkout" method="post">
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <label for="customer_name">NAME <span>*</span></label>
                                    <input type="text" class="form-control rounded border border-success" name="customer_name" id="first_name" value="" placeholder="Nguyễn Văn A" required>
                                </div>
                                <div class="col-12 mb-3">
                                    <label for="address">ADDRESS<span>*</span></label>
                                    <input type="text" class="form-control rounded border border-success" name="address" id="last_name" value="" placeholder="Hoàn Kiếm - Hà Nội"  required>
                                </div>
                                <div class="col-12 mb-3">
                                    <label for="phone">PHONE NUMBER</label>
                                    <input type="text" class="form-control rounded border border-success" name="phone"  value="" placeholder="0988-868-686" required> 
                                </div>
                                <div class="col-12 mb-3">
                                    <label for="note">NOTE<span>*</span></label>
                                    <input type="text" class="form-control rounded border border-success" name="note" value="" placeholder="Giao nhanh - Nhận liền">
                                </div>
                                <div>
                               		 <input type="submit" class="btn essence-btn right-order" value="ORDER"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-5 ml-lg-auto">
                    <div class="order-details-confirmation">

                        <div class="cart-page-heading">
                            <h5>INFORMATION LINE</h5>
                          
                        </div>
						<c:forEach var="cart" items="${cart}"> 
						<div>
	                        <ul class="order-details-form mb-4">
	                            <li ${cart.product_detail_id }><span>NAME</span> <a href="details/${cart.product_id}"><span>${cart.product_name }</span></a></li>
	                            <li><span>Image</span><span><img style="width:250px;height:250px;"  src='<c:url value="/${cart.image}"/>' alt="Image"></span></li>
	                            <li><span>QUANTITY</span> <span>${cart.quantity }</span></li>
	                            <li><span>PRICE</span> <span>${cart.price }<b>$</b></span></li>
	                        </ul>
	                        <br><br>	
                        </div>
						</c:forEach>
                        
                        <a href="home" type="submit" class="btn essence-btn">CONTINUES SHOPPING</a>
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
	
	<jsp:include page="footer.jsp"></jsp:include>
	<script src='<c:url value="/resources/home/js/jquery/jquery-2.2.4.min.js"/>'></script>
    <!-- Popper js -->
    <script src='<c:url value="/resources/home/js/popper.min.js"/>'></script>
    <!-- Bootstrap js -->
    <script src='<c:url value="/resources/home/js/bootstrap.min.js"/>'></script>
    <!-- Plugins js -->
    <script src='<c:url value="/resources/home/js/plugins.js"/>'></script>
    <!-- Classy Nav js -->
    <script src='<c:url value="/resources/home/js/classy-nav.min.js"/>'></script>
    <!-- Active js -->
    <script src='<c:url value="/resources/home/js/active.js"/>'></script>
    <script src='<c:url value="/resources/home/js/cart.js"/>'></script>
</body>
</html>