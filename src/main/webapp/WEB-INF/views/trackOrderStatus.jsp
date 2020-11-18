<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>TRACK ORDER</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
		    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" />' />
    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-4.7/css/font-awesome.min.css" />' />

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
<body class="animsition" data-animsition-in-class="zoom-in"
  data-animsition-in-duration="1000"
  data-animsition-out-class="zoom-out"
  data-animsition-out-duration="800">
  <jsp:include page="header.jsp"></jsp:include>
  <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Tracking </strong></div>
        </div>
      </div>
    </div>
 
            <div class="main-content justify-content-center" >
                <div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12 p-10 ">
					<h3 class="ml-5 mb-5 mt-5">Tracking Your Order</h3>
						<div class="card border-success custom-mg">
							
							<div class="card-header bg-success text-light">Look up bill of lading</div>
							<div class="card-body card-block custom-mg-1">
								<div>
									<form action='<c:url value="/track-order/result-search"></c:url>'
										method="post">
										<div class="input-group">
										<label for="search_orderid" class="card-header bg-success text-light">NAME</label></br>
										 <!-- <input
											id="search_orderid" class="form-control" name="search_orderid" placeholder="Search by order code" /></br>
										 --><input
											id="name" class="form-control" name="name" placeholder="Type the customer name" /></br>
											
										<button type="submit" class="search btn btn-primary" id="search"><i class="fas fa-search"></i> Find Order
											</button>
										</div>
									</form>
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
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>