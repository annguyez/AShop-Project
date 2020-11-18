<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a>
          <span class="mx-2 mb-0">/</span> <a href="/AShop/track-order">Tracking</a>
           <span class="mx-2 mb-0">/</span> <strong class="text-black">Result Tracking </strong>
           
           </div>
        </div>
      </div>
    </div>
	<div class="main-content justify-content-center">
		<div class="section__content section__content--p30 custom-mg">
			<div class="container-fluid ">
				<div class="row">
					<div class="col-md-12 p-10">
						<h3 class="ml-2 mt-5 mb-5">Result Track Your Order</h3>
						<h3>${mess}</h3>
						<table class="table table-striped table-bordered table-hover">
							<thead class="bg-success">
								<tr>
									<th>ORDER ID</th>
									<th>CUSTOMER NAME</th>
									<th>ADDRESS</th>
									<th>PHONE</th>
									<th>STATUS</th>
									<th>ORDER DATE</th>
									<th>NOTE</th>
								</tr>
							</thead>
							<tbody id="listOrder">
								<tr class="tr-shadow">
									<td>${id}</td>
									<td>${name}</td>
									<td>${address}</td>
									<td>${phone}</td>
									<td class="order_status"><c:choose>
											<c:when test="${status==0}"><span class="badge badge-secondary">Not process</span></c:when>
											<c:when test="${status==1}"><span class="badge badge-success">Accomplished</span></c:when>
											<c:when test="${status==2}"><span class="badge badge-danger">Cancel</span></c:when>
											<c:when test="${status==3}"><span class="badge badge-warning">Processing</span></c:when>
										</c:choose></td>
									<td>${date}</td>
									<td>${note}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div
		class="brands-area d-flex align-items-center justify-content-between">
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="../resources/home/img/core-img/brand1.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="../resources/home/img/core-img/brand2.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="../resources/home/img/core-img/brand3.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="../resources/home/img/core-img/brand4.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="../resources/home/img/core-img/brand5.png" alt="">
		</div>
		<!-- Brand Logo -->
		<div class="single-brands-logo">
			<img src="../resources/home/img/core-img/brand6.png" alt="">
		</div>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>