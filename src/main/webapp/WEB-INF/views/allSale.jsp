<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LIST SALE</title>
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
							<div class="card-header bg-dark text-light">BOX SEARCH PROMOTION</div>
							<div class="card-body card-block bg-success">
								<div>
									<div class="row input-group">
										<input name="search_id" class="form-control" id="search_id"
											placeholder="Type ID to Search">
										<button id="search" class="btn btn-primary">SEARCH</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					

					<div class="col-md-12">
						<div class="card border-secondary">
							<div class="card-header bg-dark text-light">PROMOTION</div>
							<div class="card-body card-block">
								<div>
									<form id="frmSale" id="frmSale" method="post"
										onsubmit="return false">
										<input id="command" value="add" hidden>
										<div id="forUpdate">
											<label for="sale_id">ID</label> 
											<input type="number" class="form-control" 
												id="sale_id" name="sale_name" disabled="disabled"><br>
										</div>
										<label for="sale_name">NAME</label> 
										<input type="text" class="form-control" 
											id="sale_name" name="sale_name" required="required"><br>
										<label for="sale_start">START DATE</label>
										 <input type="date" class="form-control" 
											id="sale_start" name="sale_start" required="required"><br>
										<label for="sale_end">END DATE</label>
										 <input type="date" class="form-control" 
											id="sale_end" name="sale_end" required="required"><br>
										 <label for="discount" required="required">DISCOUNT</label>
										<input type="number" id="discount" name="discount" min="1" class="form-control" 
											max="100"><br> <label for="descriptions">DESCRIPTION</label><br>
										<textarea rows="5" cols="30" id="descriptions"
											name="descriptions" class="form-control" ></textarea>
										<br>
										
										<button type="submit" id="btnAdd" class="btn btn-success">ADD</button>
										<button type="button" id="btnReset" class="btn btn-warning">RESET</button>
										<button type="submit" id="btnUpdate" class="btn btn-primary">UPDATE</button>
										<button type="button" id="btnCancle" class="btn btn-danger">CANCEL</button>
									</form>
								</div>
							</div>
						</div>




						<table id="tblSale"
							class="table table-striped table-bordered table-hover border-secondary">
							<thead class="thead-dark">
								<tr>
									<th><input id="chkAll" type="checkbox"></th>
									<th>ID</th>
									<th>SALE</th>
									<th>START</th>
									<th>END</th>
									<th>DISCOUNT (%)</th>
									<th>ACTION</th>
								</tr>
							</thead>
							<tbody id="tbSale">
								<c:forEach items="${sales }" var="sale">
									<tr class="sale">
										<td><input class='chkSale' name='sale_id' type='checkbox'
											value='${sale.getSale_id() }'></td>
										<td class="sale_id_search">${sale.getSale_id()}</td>
										<td>${sale.getSale_name()}</td>
										<td>${sale.getSale_start()}</td>
										<td>${sale.getSale_end()}</td>
										<td><span class="badge badge-danger">${sale.getDiscount()}%  <i class="fas  fa-arrow-circle-down"></i></span></td>
										<td><button type="button" class="btn btn-danger"
												id="delete">DELETE</button></td>
									<tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
             </div>
         </div>
 	</div>

	
	<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/js/allsale.js"></c:url>'></script>
</html>