<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RESULT USER</title>
<jsp:include page="header_admin.jsp"></jsp:include>
</head>

<body class="animsition">
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-12">

						<h1>${error}</h1>

						<div class="card">
							<table class="table table-striped table-bordered table-hover">
								<thead class="bg-dark text-light">
									<tr>
										<th>ID</th>
										<th>NAME</th>
										<th>ADDRESS</th>
										<th>GENDER</th>
										<th>CMND</th>
										<th>PERMISSION</th>
										<th>EMAIL</th>
										<th>USERNAME</th>
									</tr>
								</thead>
								<tbody>
									<tr class="tr-shadow">
										<td>${id}</td>
										<td>${fullname}</td>
										<td>${address}</td>
										<td><c:choose>
												<c:when test="${gender==0}">MALE</c:when>
												<c:when test="${gender==1}">FEMALE</c:when>
												<c:when test="${gender==2}">OTHER</c:when>

											</c:choose></td>
										<td>${cmnd}</td>
										<td>${role}</td>
										<td>${email}</td>
										<td>${username}</td>
									</tr>
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

</html>