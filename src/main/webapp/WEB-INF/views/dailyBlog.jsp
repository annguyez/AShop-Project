<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>Daily Blog</title>
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
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Daily Blog</strong></div>
        </div>
      </div>
    </div>
    
	<section class="site-section" id="blog-section">
      <div class="container">
        <div class="row justify-content-center" data-aos="fade-up">
          <div class="col-lg-6 text-center heading-section mb-5">
            <div class="paws">
              <span class="icon-paw"></span>
            </div>
            <h2 class="text-black mb-2">Daily Blog</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
          </div>
        </div>
        <div class="row">
        <c:forEach items="${list }" var="list">
          <div class="col-md-6 mb-4" data-aos="fade-up"  data-aos-delay="">
            <div class="d-lg-flex blog-entry">
              <figure class="mr-4">
                <a href="/AShop/blog/${list.news_id}"><img src="${list.image }" alt="Image" class="img-fluid"></a>
              </figure>
              <div class="blog-entry-text">
                <h3><a href="/AShop/blog/${list.news_id}">${list.heading}</a></h3>
                <span class="post-meta mb-3 d-block">${list.created_date}</span>
                <c:set var="msg" value="${list.content}"/>
                <p>${fn:substring(msg, 0, 80)}...</p>
                <p><a href="/AShop/blog/${list.news_id}" class="">Read More..</a></p>
              </div>
            </div>
          </div>
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