<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags-->
	<meta charset="UTF-8">
	
	<title>Modal</title>
	<script>
	$(document).on("click", ".page-item", function() {
		current = $(this).find('a').text();
		current = parseInt(current);
		category_id = $("#slcategory_id").val();
		$.ajax({
			url : '/AShop/admin/product/getproductssale',
			type : 'get',
			data : {
				category_id : category_id,
				page : current,
				limit : 15,
			},
			success : function(data) {
				$("#listProduct").html(data.html);
				page(current, data.total);
			},

		});

	});
	</script>
<jsp:include page="header_admin.jsp"></jsp:include> 
<link rel="stylesheet" href='<c:url value="../resources/Styles/vendor/bootstrap-4.1/bootstrap.min.css"/>'/>
</head>
<body class="animsition">
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<button type="button" class="btn btn-secondary mb-1"
								data-toggle="modal" data-target="#largeModal">Large</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="largeModal" tabindex="-1" role="dialog"
		aria-labelledby="largeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="largeModalLabel">Large Modal</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p id="listProduct">${event.image }</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary">Confirm</button>
				</div>
			</div>
		</div>
	</div>





	<jsp:include page="footer_admin.jsp"></jsp:include> 
	
	 <script src='<c:url value="../resources/Styles/vendor/jquery-3.2.1.min.js"/>'></script>
	 
	 <script src='<c:url value="../resources/Styles/vendor/bootstrap-4.1/bootstrap.min.js"/>'></script>
    <!-- Bootstrap JS-->
    
    <script src='<c:url value="../resources/Styles/vendor/bootstrap-4.1/popper.min.js"/>'></script>
    
   
   <script src='<c:url value="../resources/Styles/vendor/bootstrap-4.1/popper.min.js"/>'></script>
    <!-- Vendor JS       -->
    
    <script src='<c:url value="../resources/Styles/vendor/slick/slick.min.js"/>'></script>
    
    
    <script src='<c:url value="../resources/Styles/vendor/wow/wow.min.js"/>'></script>
    
    
    <script src='<c:url value="../resources/Styles/vendor/animsition/animsition.min.js"/>'></script>
    
    
   <script src='<c:url value="../resources/Styles/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>'></script>
    
    
    <script src='<c:url value="../resources/Styles/vendor/counter-up/jquery.waypoints.min.js"/>'></script>
    
    
    <script src='<c:url value="../resources/Styles/vendor/counter-up/jquery.counterup.min.js"/>'></script>
    
   
    <script src='<c:url value="../resources/Styles/vendor/circle-progress/circle-progress.min.js"/>'></script>
    
   
    <script src='<c:url value="../resources/Styles/vendor/perfect-scrollbar/perfect-scrollbar.js"/>'></script>
    
   
    <script src='<c:url value="../resources/Styles/vendor/chartjs/Chart.bundle.min.js"/>'></script>
    
    
	<script src='<c:url value="../resources/Styles/vendor/select2/select2.min.js"/>'></script>
    <!-- Main JS-->
    
    <script src='<c:url value="../resources/Styles/js/main.js"/>'></script>
</body>
</html>