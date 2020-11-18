<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ORDER LIST</title>
<jsp:include page="header_admin.jsp"></jsp:include>
</head>

<body class="animsition" data-animsition-in-class="zoom-in"
  data-animsition-in-duration="1000"
  data-animsition-out-class="zoom-out"
  data-animsition-out-duration="800">
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
						<div class="card border-secondary">
							<div class="card-header bg-dark text-light">ORDER</div>
							<div class="card-body card-block">
								<form action='<c:url value="/admin/order/search"></c:url>'
									method="post">
								<div class="input-group">
									<label for="search_orderid" class="btn btn-success mt-2">ORDER ID</label>
									<input id="search_orderid" class="form-control"
										name="search_orderid" />
									<button type="submit" class="search btn btn-primary"
										id="search">SEARCH</button>
										<!-- <button type="button" id="resetText" class="btn btn-warning"
											value="reset">RESET</button> -->
									</div>
								</form>
							</div>
						</div>
					</div>
					<%-- <div class="col-md-12">
						<div class="card border-secondary">
							<div class="card-header bg-dark text-light">CATEGORY</div>
							<div class="card-body card-block">
								<div id="size_info">
									<form action='<c:url value="/admin/order/searchPr"></c:url>'
										method="post">
										<label for="pr_id">Sản phẩm</label></br> <input id="pr_id"
											name="pr_id" /></br>
										<button type="submit" class="search" id="search1"
											style="background: lightblue; padding: 5px; border-radius: 8px; margin-right: 46px;">Tìm
											kiếm</button>
										<button></button>
										<button type="button" id="resetText"
											style="background: lightblue; padding: 5px; border-radius: 8px;"
											value="reset">Đặt lại</button>

									</form>
								</div>
							</div>
						</div> --%>
					</div> 
				




				 <form id="frmOrder" style="display: none;" class="frmOrder_detail"
					action='<c:url value="/admin/order/update"></c:url>' method="post">
					<div class="card border-secondary">
						<div class="card-header bg-dark text-light">UPDATE ORDER
							STATUS</div>
						<div class="card-body card-block">
							<div id="detail_container" class="detail_container">
								<table class="table table-striped table-bordered table-hover">
									<tr>
										<td><label for="order_id">ID</label></td>
										<td><input type="text" id="order_id" name="order_id"
										 required="required" class="form-control"> </td>
									</tr>
									<tr>
										<td><label for="username">CUSTOMER NAME</label></td>
										<td><input type="text" id="username" name="username"
											class="form-control" required="required" disabled="disabled"></td>
									</tr>
									<tr>
										<td><label for="phone">PHONE</label></td>
										<td><input type="text" id="phone" name="phone"
											class="form-control" required="required" disabled="disabled"></td>
									</tr>
									<tr>
										<td><label for="address">ADDRESS</label></td>
										<td><input type="text" id="address" name="address"
											class="form-control" required="required" disabled="disabled"></td>
									</tr>
									<tr>
										<td><label for="order_status">STATUS</label></td>
										<td><select name="order_status" id="order_status"
											class="form-control">
												<option value="${rs.getOrders_status()}">
													<c:choose>
														<c:when test="${rs.getOrders_status()==0}">
															Not process
														</c:when>
														<c:when test="${rs.getOrders_status()==1}">
															Accomplished
														</c:when>
														<c:when test="${rs.getOrders_status()==2}">
															Cancel
														</c:when>
														<c:when test="${rs.getOrders_status()==3}">
															Processing
														</c:when>
													</c:choose>
												</option>
												<option value="0">Not process</option>
												<option value="1">Accomplished</option>
												<option value="2">Cancel</option>
												<option value="3">Processing</option>
										</select></td>
									</tr>
									<tr>
										<td><label for="order_date">ORDER DATE</label></td>
										<td><input type="text" id="order_date" name="order_date"
											required="required" class="form-control" disabled="disabled">
										</td>
									</tr>
									<tr>
										<td><label for="note">NOTE</label></td>
										<td><input type="text" id="note" name="note"
											class="form-control" required="required" disabled="disabled">
										</td>
									</tr>
								</table>
								<div class="input-group">
								<button class="item update btn btn-primary" data-toggle="tooltip"
									data-placement="top" value="${rs.getOrders_id() }"
									id="btnupdate">UPDATE
								</button>
								<button id="cancel" class="btn btn-warning">
									CANCEL
								</button>
								</div>
							</div>
						</div>
					</div>
				</form> 

			<div class="table-responsive table-responsive-data2"
					style="overflow-x: scroll;">
					<table class="table table-striped table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th><label class="au-checkbox"> <input
										type="checkbox" id="chkAll"> <span
										class="au-checkmark"></span>
								</label></th>
								<th>ID</th>
								<th>CUSTOMER NAME</th>
								<th>PHONE</th>
								<th>ADDRESS</th>
								<th>STATUS</th>
								<th>ORDER DATE</th>

								<th>NOTE</th>
								<th>ACTION</th>
							</tr>

						</thead>
						<tbody id="listOrder">

							<c:forEach items="${list }" var="rs">
								<tr class="tr-shadow">
									<td><input class="chkOrder" type="checkbox"
										name="orders_id" value="${rs.getOrders_id()}"></td>
									<td>${rs.getOrders_id()}</td>
									<td>${rs.getCustomer_name()}</td>
									<td>${rs.getPhone()}</td>
									<td>${rs.getAddress()}</td>

									<!-- 													<td><select name="order_status"> -->
									<%-- 															<option value="${rs.getOrders_status()}"> --%>
									<%-- 															<c:choose> --%>
									<%-- 																<c:when test="${rs.getOrders_status()==0}">Chưa xử lý</c:when> --%>
									<%-- 																<c:when test="${rs.getOrders_status()==1}">Đã giao</c:when> --%>
									<%-- 																<c:when test="${rs.getOrders_status()==2}">Hủy đơn</c:when> --%>
									<%-- 															</c:choose> --%>
									<!-- 															</option> -->


									<!-- 															<option value="0" name="order_status">Chưa xử lý</option> -->
									<!-- 															<option value="1">Đã Giao</option> -->
									<!-- 															<option value="2">Hủy Đơn</option> -->

									<!-- 														</select> -->
									<!-- 													</td> -->
									<td class="order_status text-center"><c:choose>
											<c:when test="${rs.getOrders_status()==0}">
												<span class="badge badge-secondary">Not process</span>
											</c:when>
											<c:when test="${rs.getOrders_status()==1}">
												<span class="badge badge-success">Accomplished</span>
											</c:when>
											<c:when test="${rs.getOrders_status()==2}">
												<span class="badge badge-danger">Cancel</span>
											</c:when>
											<c:when test="${rs.getOrders_status()==3}">
												<span class="badge badge-warning">Processing</span>
											</c:when>
										</c:choose></td>
									<td style="display: none;">${rs.getOrders_status()}</td>
									<td>${rs.getOrders_date()}</td>
									<td>${rs.getNote()}</td>
									<td>
										<div class="btn btn-group">
											<button class="item edit btn btn-primary"
												data-toggle="tooltip" data-placement="top"
												value="${rs.getOrders_id() }">CHANGE STATUS</button>
											<button class="btn btn-success">
												<a class="text-light" 
													href='<c:url value="/admin/order/viewOrderDetail/${rs.getOrders_id() }"></c:url>'
													target="_blank">VIEW IN BLANK WEBSITE</a>
											</button>
											<button type="button" class="btn btn-danger" id="delete">DELETE</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<ul class="pagination">
					<c:forEach var="i" begin="1" end="${total }">
						<li class="page-item"><a class="page-link"
							href='<c:url value="/admin/order/${i }"></c:url>'>${i }</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	


	<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/js/order.js"></c:url>'></script>
</html>