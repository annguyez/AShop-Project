<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD SALEOFF</title>
<link rel="stylesheet"
	href='<c:url value="/resources/css/responsived.css"/>' />
	<link rel="stylesheet"
	href='<c:url value="/resources/css/noti.css"/>' />
<jsp:include page="header_admin.jsp"></jsp:include>
</head>

<body class="animsition" data-animsition-in-class="zoom-in"
	data-animsition-in-duration="1000" data-animsition-out-class="zoom-out"
	data-animsition-out-duration="800">
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div id="container">



					<%-- <div class="c7">
							<input id="findby" value="${command }" hidden>
							<div class="row">

								<div class="c12" style="width:100% !important">
									<form method="post"
										action='<c:url value="/admin/sale/getsale"></c:url>'>
										<c:choose>
											<c:when test="${product_id==0 }">
												<input type="number" name="product_id"
													placeholder="Mã sản phẩm">
											</c:when>
											<c:otherwise>
												<input type="number" name="product_id"
													placeholder="Mã sản phẩm" value="${product_id }">
											</c:otherwise>

										</c:choose>
										<select name="command" id="slcommand">
											<option value="0">Tất cả khuyến mãi</option>
											<option value="1">Đang tiến hành</option>
											<option value="2">Đã kết thúc</option>
											<option value="3">Chưa bắt đầu</option>
										</select>
										<button type="submit">Xem</button>
									</form>
									<button type="button" class="btn btn-outline-danger"
										id="delete">DELETE</button>
								</div> 
							

							 </div>
							<div id="listsale" class="row">
								<table id="tblSale" border="1" class="table-earning">
									<thead>
										<tr>
											<th><input id="chkAll" type="checkbox"></th>
											<th>ID</th>
											<th>SALE</th>
											<th>START</th>
											<th>END</th>
											<th>SALE (%)</th>
										</tr>
									</thead>
									<tbody id="tbSale">
										<c:forEach items="${sales }" var="sale">
											<tr class="sale">
												<td><input class='chkSale' name='sale_id'
													type='checkbox' value='${sale.getSale_id() }'></td>
												<td class="sale_id_search">${sale.getSale_id()}</td>
												<td>${sale.getSale_name()}</td>
												<td>${sale.getSale_start()}</td>
												<td>${sale.getSale_end()}</td>
												<td>${sale.getDiscount()}</td>
											<tr>
										</c:forEach>
									</tbody>
								</table>
								<ul class="pagination">
									<c:forEach begin="1" end="${totalpage }" var="i">
										<c:choose>
											<c:when test="${i==page}">
												<li class="page-item acitve"><a class="page-link"
													href='<c:url value="/admin/sale/${command }/${product_id }/${i }"></c:url>'>${i }</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href='<c:url value="/admin/sale/${command }/${product_id }/${i }"></c:url>'>${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</div>  --%>


					<!-- <table id="tbProduct" class="table table-borderless table-striped table-earning">
									<thead>
										<tr>
											<th>ID</th>
											<th>NAME</th>
											<th>IMAGE</th>
											<th>PRICE</th>
											<th>ACTION</th>
										</tr>
									</thead>
									<tbody id="listProduct">


									</tbody>
								</table> -->
								

					<div class="col-md-12">
						<div class="card-header bg-dark text-light">BOX SEARCH
							PROMOTION</div>
						<div class="card-body card-block bg-success">
							<div class="row input-group">
								<input name="search_id" id="search_id" class="form-control"
									placeholder="Nhập mã sale để tìm">
								<button id="search" class="btn btn-primary">SEARCH</button>
							</div>
						</div>
					</div>
					






					<div class="col-md-12 mt-5">
						<div class="card border-secondary">
							<div class="card-header bg-dark text-light">ADD SALE OFF</div>
							<div class="card-body card-block">
								<div class="row">
									<div class="col-12 float-left">
										<form id="frmSale" id="frmSale" method="post"
											onsubmit="return false">
											<input id="command" value="add" hidden>
											<div id="forUpdate">
												<label for="sale_id">ID</label> <input type="number"
													id="sale_id" name="sale_name" class="form-control"
													disabled="disabled"><br>
											</div>
											<label for="sale_name">NAME</label> <input type="text"
												class="form-control" id="sale_name" name="sale_name"
												required="required"><br> <label
												for="sale_start">START DATE</label> <input type="date"
												class="form-control" id="sale_start" name="sale_start"
												required="required"><br> <label for="sale_end">END
												DATE</label> <input type="date" class="form-control" id="sale_end"
												name="sale_end" required="required"><br> </br> <label
												for="discount" required="required">DISCOUNT</label> <input
												type="number" id="discount" class="form-control"
												name="discount" min="1" max="100"><br> <label
												for="descriptions">DESCRIPTION</label><br>
											<textarea rows="5" cols="30" id="descriptions"
												class="form-control" name="descriptions"></textarea>
											<br>
											<p>Applicable Products</p>
											<button type="button" class="btn btn-secondary mb-1"
												data-toggle="modal" data-target="#scrollmodal">
												LIST PRODUCT
											</button>

											<div class="modal fade" id="scrollmodal" tabindex="-1"
												role="dialog" aria-labelledby="scrollmodalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg" role="document">
													<div class="modal-content margin-custom">
														<div class="modal-header bg-light">
															<div class="d-flex justify-content-start btn-group">
																<button class="btn btn-primary" for="product_name">FILTER</button> 
																<select id="category_id" name="category_id"
																	class="form-control">
																<option value="0">ALL</option>
																<c:forEach items="${categories }" var="c">
																	<option value="${c.getCategory_id() }">${c.getCategory_name()}</option>
																</c:forEach>
																</select>
																</div>
																<div class="d-flex justify-content-end">
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
																
															</div>
															<div id="p1" class="col-6 noti">

															</div>
														</div>
														<div class="modal-body">
															<table id="tbProduct"
																class="table table-borderless table-striped table-earning">
																<thead>
																	<tr>
																		<th>ID</th>
																		<th>NAME</th>
																		<th>IMAGE</th>
																		<th>PRICE</th>
																		<th>ACTION</th>
																	</tr>
																</thead>
																<tbody id="listProduct">


																</tbody>
															</table>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Cancel</button>
															<button type="button" class="btn btn-primary">Confirm</button>
														</div>
													</div>
												</div>
											</div>


											<div id="sale_products" class="c8"></div>
											<div class="clr"></div>
											<button type="submit" class="btn btn-success" id="btnAdd">ADD</button>
											<button type="button" class="btn btn-warning" id="btnReset">RESET</button>
											<button type="submit" class="btn btn-primary" id="btnUpdate">UPDATE</button>
											<button type="button" class="btn btn-danger" id="btnCancle">CANCEL</button>
										</form>
									</div>
								</div>
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
<script src='<c:url value="/resources/js/sale.js"></c:url>'></script>
</html>