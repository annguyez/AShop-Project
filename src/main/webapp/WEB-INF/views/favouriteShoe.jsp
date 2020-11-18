<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>FAVOURITE SHOE</title>
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
	
	
<link rel="stylesheet" href='<c:url value="/resources/favouritePage/css/aos.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/favouritePage/css/style.css"/>' />
<link rel="stylesheet" href='<c:url value="/resources/favourite/css/style.css"/>' />



</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

	<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="/AShop/home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Favourite Shoes </strong></div>
        </div>
      </div>
    </div>
	<div class="container">
		<p>Post saved (${count } / 100)</p>
	</div>
	
	<%-- <section class="site-section">
	
	<c:forEach var="favourite" items="${favourite}">
		<div class="container" id="delete">
			<div class="row hover-1-wrap mb-5 mb-lg-0">
				<div class="col-12">
					<div class="row">
						<div class="mb-4 mb-lg-0 col-lg-2" data-aos="fade-left">
							<a href="#" class="hover-1"> <img alt="Image"
								class="img-fluid" style="height: 200px; width: 200px;"
								src='<c:url value="${favourite.image }"></c:url>'>
							</a>
						</div>
						<div class="col-lg-9 ml-auto align-self-center"
							data-aos="fade-right">
							<a href="details/${favourite.product_id}">
							<h2 class="text-black product_id" data-product_id="${favourite.product_id }">${favourite.product_name }</h2>
							</a>
							<p class="mb-4 ">${favourite.price }</p>
							
						</div>
						<div class="col-lg-1 auto align-self-center">
							<p>
								<i class="fas fa-heart btn btn-danger un-favourite"></i>
							</p>
						</div>
					</div>
				</div>
			</div>
			<hr />
		</div>
	</c:forEach>	
	</section>
	 --%>
	 <div id="p1" class="col-3 noti-shop">

	</div>
	 <section class="site-section">
		<div class="container" id="delete">
				<div class="row hover-1-wrap mb-5 mb-lg-0">
					<div class="col-12">
						<div class="row">
							<table>
								<tbody>
									<c:forEach var="favourite" items="${favourite}">
										<tr data-product_detail_id="${favourite.product_detail_id }" class="product mt-custom">
											<td class="product-thumbnail">
												<img src='<c:url value="/${favourite.image}"/>' class="img-fluid img-width">
											</td>
											<td class="product_id min-width" data-product_id="${favourite.product_id }">
												<a href="details/${favourite.product_id}">
													<h4 class="text-black ml-5 mb-2">${favourite.product_name }</h4>
													<p class="ml-5 mb-5 color">${favourite.price }<b>$</b>
													</p>
												</a>
												
											</td>
											<td colspan="2" class="text-right">
											<p>
												<i class="fas fa-heart btn btn-outline-danger un-favourite"></i>
											</p>
											</td>
										</tr>
										<hr/>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<hr />
		</div>
	</section>
	

	<jsp:include page="footer.jsp"></jsp:include>
	
<!-- 	<script type="text/javascript">
	window.fbAsyncInit = function () {
		FB.init({
			appId: '657549527725084',
			xfbml: true,
			version: 'v2.6'
		});
	};
	(function (d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<div class="fb-page"
     data-href="https://www.facebook.com/AShop-108038744140897/"
     data-tabs="messages"
     data-width="400"
     data-height="300"
     data-small-header="true">
	<div class="fb-xfbml-parse-ignore">
		<blockquote></blockquote>
	</div>
</div> -->
	
	<script src='<c:url value="/resources/cart/js/jquery-3.3.1.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/jquery-ui.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/popper.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/bootstrap.min.js"/>'></script>
	<script src='<c:url value="/resources/cart/js/owl.carousel.min.js"/>'></script>
	<script
		src='<c:url value="/resources/cart/js/jquery.magnific-popup.min.js"/>'></script>
	<script src='<c:url value="/resources/favouritePage/js/main.js"/>'></script>
	<script src='<c:url value="/resources/favouritePage/js/jquery.sticky.js"/>'></script>
	<script src='<c:url value="/resources/favourite/js/favouriteShoe.js"/>'></script>
</body>
</html>