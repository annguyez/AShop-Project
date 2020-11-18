<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ASHOP</title>
<link href="https://fonts.googleapis.com/css?family=Rubik:400,700" rel="stylesheet">
    <link rel="stylesheet" href='<c:url value="/resources/cart/fonts/icomoon/style.css"/>'/>

    <link rel="stylesheet" href='<c:url value="/resources/cart/css/bootstrap.min.css"/>'/>
    <link rel="stylesheet" href='<c:url value="/resources/cart/css/magnific-popup.css"/>'/>
    <link rel="stylesheet" href='<c:url value="/resources/cart/css/jquery-ui.css"/>'/>
    <link rel="stylesheet" href='<c:url value="/resources/cart/css/owl.carousel.min.css"/>'/>
    <link rel="stylesheet" href='<c:url value="/resources/cart/css/owl.theme.default.min.css"/>'/>


    <link rel="stylesheet" href='<c:url value="/resources/cart/css/aos.css"/>'/>

    <link rel="stylesheet" href='<c:url value="/resources/cart/css/style.css"/>'/>
<!--     header -->
    
    <link rel="icon" href="img/core-img/favicon.ico">
	
	<!-- Core Style CSS -->
	<link rel="stylesheet" href='<c:url value="/resources/home/css/core-style.css"/>'/>
	<link rel="stylesheet" href='<c:url value="/resources/home/css/style.css"/>'/>
</head>
<body>
	  <jsp:include page="header.jsp"></jsp:include>
	  <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="index.html">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Successfully</strong></div>
        </div>
      </div>
    </div>  
	<div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            
	           <div class="bg-light py-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 mb-0 ml-5 pl-5 pt-2 pb-2">
							<img
								src='<c:url value="/resources/shop/image/successfully.jpg"/>'
								alt="Image">
						</div>
					</div>
				</div>
			</div>
            <p class="lead mb-5">You order was successfully completed..</p>
            <p class="lead mb-5">Your order will be shipped in two business days!</p>
            <p><a href="home" class="btn btn-sm btn-success">Back to shop</a></p>
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
      <script src='<c:url value="/resources/cart/js/jquery-3.3.1.min.js"/>'></script>
  <script src='<c:url value="/resources/cart/js/jquery-ui.js"/>'></script>
  <script src='<c:url value="/resources/cart/js/popper.min.js"/>'></script>
  <script src='<c:url value="/resources/cart/js/bootstrap.min.js"/>'></script>
  <script src='<c:url value="/resources/cart/js/owl.carousel.min.js"/>'></script>
  <script src='<c:url value="/resources/cart/js/jquery.magnific-popup.min.js"/>'></script>
  <script src='<c:url value="/resources/cart/js/aos.js"/>'></script>

  <script src='<c:url value="/resources/cart/js/main.js"/>'></script>
</body>
</html>