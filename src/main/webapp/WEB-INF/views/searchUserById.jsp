<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TRACK USER</title>
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
							<div class="card-header bg-dark text-light">USER</div>
							<div class="card-body">
								<form class="text-center"
									action='<c:url value="/admin/employees/search"></c:url>'
									method="post">
									<div class="btn btn-group">
										<label for="id_emp" class="card-header bg-secondary text-light">USER ID</label><br />
										<input id="id_emp" class="form-control col-12" name="id_emp" />

										<button type="submit" class="search btn btn-primary"
											id="search">SEARCH</button>
									</div>
								</form>
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
<script src='<c:url value="/resources/js/employee.js"></c:url>'></script>
</html>