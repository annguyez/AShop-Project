<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Recent product</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Rubik:400,700"
	rel="stylesheet">
<link rel="stylesheet"
	href='<c:url value="/resources/home/fonts/icomoon/style.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/font-awesome-5/css/fontawesome-all.min.css"/>'/>

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
	
	
<link rel="stylesheet" href='<c:url value="/resources/recentProduct/css/style.css"/>' />

<link rel="stylesheet" href='<c:url value="/resources/recentProduct/css/aos.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/recentProduct/css/style.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/recentProduct/fonts/flaticon/font/flaticon.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/recentProduct/css/bootstrap-datepicker.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/recentProduct/css/jquery.fancybox.min.css"/>' />



</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Recent Product</strong></div>
        </div>
      </div>
    </div>
	
	<section class="site-section">
	
	<c:forEach var="recent" items="${recent}">
		<div class="container" id="delete">
			<div class="row hover-1-wrap mb-5 mb-lg-0">
				<div class="col-12">
					<div class="row">
						<div class="mb-4 mb-lg-0 col-lg-2" data-aos="fade-left">
							<a href="#" class="hover-1"> <img alt="Image"
								class="img-fluid" style="height: 200px; width: 200px;"
								src='<c:url value="${recent.image }"></c:url>'>
							</a>
						</div>
						<div class="col-lg-10 ml-auto align-self-center"
							data-aos="fade-right">
							<a href="details/${recent.product_id}">
							<h2 class="text-black product_id" data-product_id="${recent.product_id }">${recent.product_name }</h2>
							</a>
							<p class="mb-4">${recent.price }</p>
							
						</div>
						
					</div>
				</div>
			</div>
			<hr />
		</div>
	</c:forEach>	
	</section>
	
	   <section class="site-section" id="gallery-section">
      <div class="container-fluid">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">Recently Viewed Products</h2>
          </div>
        </div>
        
        <div class="row no-gutters">
        <c:forEach var="recent" items="${recent}">
            <a class="col-6 col-md-6 col-lg-4 col-xl-3 gal-item d-block" data-aos="fade-up" data-aos-delay="100" href="${recent.image }" data-fancybox="gal">
            <img src='<c:url value="${recent.image }"></c:url>' alt="Image" class="img-fluid"></a>
         </c:forEach>
        </div>
       
      </div>
    </section>
    
   
    
	 
	

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script src='<c:url value="/resources/recentProduct/js/jquery-3.3.1.min.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/jquery-ui.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/owl.carousel.min.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/jquery.countdown.min.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/jquery.easing.1.3.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/aos.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/jquery.fancybox.min.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/jquery.sticky.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/isotope.pkgd.min.js"/>'></script>
	<script src='<c:url value="/resources/recentProduct/js/main.js"/>'></script>

</body>
</html>