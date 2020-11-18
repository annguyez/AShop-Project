<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<jsp:include page="header_admin.jsp"></jsp:include>
</head>

<body class="animsition" data-animsition-in-class="zoom-in"
  data-animsition-in-duration="1000"
  data-animsition-out-class="zoom-out"
  data-animsition-out-duration="800">
    
            <!-- MAIN CONTENT-->
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">
							<div class="card border-secondary">
								<div class="card-header bg-dark text-light">
									<label>USER</label>
								</div>
								<div class="card-body card-block">
									<div class="row">
										<div class="col-12 float-left">
											<form id="frmEmp" class="frmEmp">
												<!--Thông tin chi tiết -->
												<div id="detail_container" class="detail_container">

													<table class="table table-striped table-bordered table-hover">
														<tr>
															<!-- 															<td><label for="employee_id">Mã nhân viên</label></td> -->
															<!-- 	                                                		<td><input type="text" id="employee_id" name="employee_id"  ></td> -->


															<td><label for="fullname">NAME</label></td>
															<td><input class="form-control" type="text" id="fullname" name="fullname"
																id="fullname"></td>


														</tr>
														<tr>


															<td><label for="address">ADDRESS</label></td>
															<td><input class="form-control" type="text" id="address" name="address"></td>
														</tr>
														<tr>
															<td><label for="sex">GENDER</label></td>
															<td><select name="sex" id="sex" class="form-control">
																	<option value="${rs.getSex()}">
																		<c:choose>
																			<c:when test="${rs.getSex()==0}">Nam</c:when>
																			<c:when test="${rs.getSex()==1}">Nữ</c:when>
																			<c:when test="${rs.getSex()==2}">Giới tính khác</c:when>

																		</c:choose>
																	</option>


																	<option value="0">Male</option>
																	<option value="1">Female</option>
																	<option value="2">Other</option>

															</select>
															</td>


														</tr>
														<tr>
															<td><label for="idcard">PASSPORT</label></td>
															<td><input class="form-control" type="text" id="idcard" name="idcard"></td>

														</tr>
														<tr>
															<td><label for="role_id">PERMISSION</label></td>
															<!-- 	                                                		<td><input type="text" id="order_status" name="order_status" required="required"></td> -->



															<td>
																<!-- 			                                             	<select name="role_id" style="width: 202px;"> -->
																<!-- 			                                             			<option name="role_name" >Lựa chọn chức vụ</option> -->
																<%-- 																<c:forEach items="${listRole }" var="listR"> --%>
																<%-- 																	<option value="${listR.getRole_id()}" >${listR.getRole_name()}</option> --%>

																<%-- 																</c:forEach> --%> <!-- 															</select> -->
																<!-- 																<input type="text" id="role_name" name="role_name"  > -->

																<select name="role_name" id="role_name" class="form-control">
																	<option value="${rs.getRoles().getRole_id()}">
																		<c:choose>
																			<c:when test="${rs.getRoles().getRole_id()==1}">Admin</c:when>
																			<c:when test="${rs.getRoles().getRole_id()==2}">User</c:when>
																			<c:when test="${rs.getRoles().getRole_id()==3}">Vender</c:when>
																		</c:choose>
																	</option>


																	<option value="1">Admin</option>
																	<option value="2">User</option>
																	<option value="3">Vender</option>

															</select>


															</td>




														</tr>
														<tr>
															<td><label for="email">Email</label></td>
															<td><input class="form-control" type="text" id="email" name="email"></td>
														</tr>
														<tr>
															<td><label for="username">USERNAME</label></td>
															<td><input class="form-control" type="text" id="username" name="username"></td>



														</tr>
														<tr>
															<td><label for="password">PASSWORD</label></td>
															<td><input class="form-control" type="text" id="password" name="password"></td>
														</tr>
													</table>
												</div>
											</form>
											<div class="btn btn-group">
												<a href='<c:url value="/admin/employees"></c:url>'
													class="item btn btn-success" data-toggle="tooltip" data-placement="top"
													id="btnadd" >
													ADD</a>
												<button></button>
												<a href='<c:url value="/admin/employees"></c:url>'
													class="item update btn btn-primary" data-toggle="tooltip"
													data-placement="top" value="${rs.getEmployee_id() }"
													id="btnupdate">UPDATE</a>
												
												<button type="button" id="resetText" class="btn btn-warning"
												>RESET</button>

											</div>
										</div>
									</div>
								</div>
								</div>
							

							<hr />
							
							
							<div class="table-responsive table-responsive-data2"
								style="overflow-x: scroll;">
								<table class="table table-striped table-bordered table-hover"
									id="tbEmp">
									<thead class="thead-dark">
										<tr>
											<th><label class="au-checkbox"> <input
													type="checkbox" id="chkAll"> <span
													class="au-checkmark"></span>
											</label></th>
											<th>ID</th>
											<th>NAME</th>
											<th>ADDRESS</th>
											<th>GENDER</th>
											<th>PASSPORT</th>
											<th>PERMISSION</th>
											<th>EMAIL</th>
											<th>USERNAME</th>
											<th>PASSWORD</th>
											<th>ACTION</th>

										</tr>
									</thead>
									<tbody id="listEmp">

										<c:forEach items="${list }" var="rs">
											<tr class="tr-shadow">
												<td><input class="chkEmp" type="checkbox"
													name="employee_id" value="${rs.getEmployee_id()}"></td>
												<td>${rs.getEmployee_id()}</td>
												<td>${rs.getFullname()}</td>
												<td>${rs.getAddress()}</td>
												<td>
												<c:choose>
														<c:when test="${rs.getSex()==0}"><span class="badge badge-primary">Male</span></c:when>
														<c:when test="${rs.getSex()==1}"><span class="badge badge-danger">Female</span></c:when>
														<c:when test="${rs.getSex()==2}"><span class="badge badge-warning">Other</span></c:when>

												</c:choose>
												</td>
												<td style="display: none;">${rs.getSex()}</td>
												<td>${rs.getIdcard()}</td>


												<td>
													<p name="role_name" id="role_name">
													<p value="${rs.getRoles().getRole_id()}">
														<c:choose>
															<c:when test="${rs.getRoles().getRole_id()==1}">
																<span class="badge badge-success">Admin</span>
															</c:when>
															<c:when test="${rs.getRoles().getRole_id()==2}">
																<span class="badge badge-danger">User</span>
															</c:when>
															<c:when test="${rs.getRoles().getRole_id()==3}">
																<span class="badge badge-warning">Vender</span>
															</c:when>
														</c:choose>
													<p>
												</td>
												<td style="display: none;">${rs.getRoles().getRole_id()}</td>
												<td>${rs.getEmail()}</td>
												<td>${rs.getUsername()}</td>
												<td style="display: none">${rs.getPassword()}</td>
												<td></td>
												<td>
													<div class="btn btn-group">
														<button class="item edit btn btn-info"
															data-toggle="tooltip" data-placement="top"
															value="${rs.getEmployee_id() }">VIEW</button>

														<button class="item update btn btn-primary"
															data-toggle="tooltip" data-placement="top"
															value="${rs.getEmployee_id() }" id="btupdate">
															UPDATE</button>
														<button class="btn btn-danger">
															<a href='<c:url value="/admin/employees">
															</c:url>' type="button" class="text-light" id="delete" value="${rs.getEmployee_id()}"> 
															DELETE</a>
														</button>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>



	<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/js/employee.js"></c:url>'></script>
</html>