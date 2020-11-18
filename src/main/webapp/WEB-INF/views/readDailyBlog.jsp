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
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a> 
          <span class="mx-2 mb-0">/</span> <a href="/AShop/blog">Daily Blog</a> 
          <span class="mx-2 mb-0">/</span> <strong class="text-black">${news.heading }</strong>
          </div>
        </div>
      </div>
    </div>
    
	<div class="site-blocks-cover bg" data-aos="fade">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-12 mt-lg-5 text-center">
            <h1 class="text-light">${news.heading }</h1>
            <p class="post-meta">${news.created_date } &bull; Posted by <a href="#">Admin</a></p>
          </div>
        </div>
      </div>
    </div>  

    
    
    <section class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-8 blog-content">
          	<c:set var="msg" value="${news.content}"/>

            <p class="lead mb-5">${fn:substring(msg, 0, 80)}?</p>
                <p class="p-line-height-3">${fn:substring(msg, 80, 200)}</p>
            <div class="row mb-5">
              <div class="col-lg-12">
                <figure><img src="../${news.image }" alt="Image" class="img-fluid">
                  <figcaption>${news.heading }</figcaption></figure>
              </div>
              <div class="col-lg-12">
                <figure><img src="../${news.content_img }" alt="Image" class="img-fluid">
                  <figcaption>${news.heading }</figcaption></figure>
              </div>
            </div>
            

            
             <blockquote><p class="p-line-height-3">${fn:substring(msg, 200, 450)}</p></blockquote>
            
            <p class="p-line-height-3">${fn:substring(msg, 450, 700)}</p>
            <p class="p-line-height-3">${fn:substring(msg, 700, 8000)}</p>
            <div class="pt-5">
              <p>Categories:  <a href="#">Design</a>, <a href="#">Events</a>  Tags: <a href="#">#html</a>, <a href="#">#trends</a></p>
            </div>
            </div>
          <div class="col-md-4 sidebar">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
            <div class="sidebar-box">
              <div class="categories">
                <h3>Categories</h3>
                <li><a href="#">Dog <span>(12)</span></a></li>
                <li><a href="#">Dog Food <span>(22)</span></a></li>
                <li><a href="#">Vetenirarian <span>(37)</span></a></li>
                <li><a href="#">Events<span>(42)</span></a></li>
              </div>
            </div>
            <div class="sidebar-box">
              <img src="images/person_1.jpg" alt="Image placeholder" class="img-fluid mb-4">
              <h3>About The Author</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
              <p><a href="#" class="btn btn-primary btn-sm">Read More</a></p>
            </div>

            <div class="sidebar-box">
              <h3>Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v6.0&appId=2516976671875938&autoLogAppEvents=1"></script>

	<div class="m-115 fb-comments"
		data-href="http://localhost:8080/AShop/blog/${news.news_id}"
		data-width="" data-numposts="5"></div>
    
    
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