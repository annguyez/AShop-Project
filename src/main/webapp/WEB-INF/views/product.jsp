<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT</title>
<jsp:include page="header_admin.jsp"></jsp:include>
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/bootstrap.min.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/css/responsived.css"/>' />
<c:url value="/admin/product" var="url"></c:url>
</head>

<body class="animsition" data-animsition-in-class="zoom-in"
  data-animsition-in-duration="1000"
  data-animsition-out-class="zoom-out"
  data-animsition-out-duration="800">
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="container">
					<div class="row card">
						<div id="manage" class="c12">
						</div>
					</div>	
					<div class="card row">
							<div class="card-header">
								<div class="float-left">
									<button type="button" class="btn btn-danger"
										id="delete">DELETE</button>
								</div>
								
								<div class="float-right">
									<label>FILLTER</label>
									<select id="slcategory_id" name="category_id" class="fields">
										<option value="0">ALL</option>
										<c:forEach items="${categories }" var="cat">
											<option value="${cat.getCategory_id() }">${cat.getCategory_name()}</option>
										</c:forEach>
									</select>
								</div>
							</div>	
							
							<div class="card-body">
								<div class="card-header bg-dark text-light">
									<div class="c1">
										<input id="chkAll" type="checkbox">
									</div>
									<div class="c2">ID</div>
									<div class="c4">NAME</div>
									<div class="c3">PRICE</div>
									<div>ACTION</div>
									<div class="clr"></div>
								</div>
								<div class="card-body">
									<div id="listProduct">
								</div>

																						<!-- <ul class="pagination">
															
															
																						</ul> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/js/format-money.js"/>'></script>
<script src='<c:url value="/resources/product/js/product.js"></c:url>'></script>
</html>