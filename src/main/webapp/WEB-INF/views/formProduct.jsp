<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD PRODUCT</title>
<link rel="stylesheet"
	href='<c:url value="/resources/home/css/bootstrap.min.css"/>' />
<link rel="stylesheet"
	href='<c:url value="/resources/css/style.css"/>' />
<c:url value="/admin/product" var="url"></c:url>
</head>
<body>
	<div id="product_info" class="m-5">
		
			<div class="section__content section__content--p30">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<div class="card border-secondary">
								<div class="card-header bg-success text-light">SEARCH </div>
								<div class="card-body">
									<div class="row form-group">
										<div class="col col-md-12">
											<div class="input-group">
												<input id="product_id" placeholder="TYPE ID"
													class="form-control">
												<button type="button" class="btn btn-primary" id="getinfo">
													<i class="fa fa-search"></i> SEARCH
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				<form id="frmProduct" method="post">

					<label for="product_name">NAME</label><br> 
					<input type="text"
						id="product_name" name="product_name" required="required"
						class="form-control"><br> 
					<label for="category">CATEGORY</label><br> 
					<select id="category_id" name="category_id" class="fields form-control" required="required">
						<c:forEach items="${categories }" var="cat">
							<option value="${cat.getCategory_id() }">${cat.getCategory_name()}</option>
						</c:forEach>
					</select><br> 
					<label for="price">PRICE</label><br> 
					<input min="1" id="price" name="price" required="required" class="form-control"><br>
					<label for="descriptions">DESCRIPTION</label><br>
					<textarea rows="5" cols="40" id="descriptions" name="descriptions"
						class="form-control"></textarea>
					<br> 
					<label for="image">IMAGE</label><br>
					<input id="oldimg" hidden class="form-control"> 
					<img alt="image" id="img-url" src="" class="img-custom"> 
					<a id="url" hidden target="blank">VIEW IMAGE</a> 
					<input type="file" id="image" name="image" class="form-control"><br>
					
					<div id="frmProduct_detail">
						<div id="detail_container"></div>
					</div>
					
					<input value="add" id="command" hidden>
					<button id="addmore" class="btn btn-secondary btn-sm" type="button">ADD
						DETAILS</button>
					<br>
					<br>
					<br>
					<div class="input-group">
						<button type="submit" class="btn btn-success" id="btnadd">ADD</button>
						<button type="submit" class="btn btn-info" id="btnupdate" hidden="">UPDATE</button>
						<button type="button" id="reset" class="btn btn-warning">RESET</button>
						<button type="button" id="back" class="btn btn-danger" hidden="">BACK</button>
					</div>
				</form>
			</div>

			<div id="product_detail" class="product_detail">
				<table>
					<tr>
						<td><select name="color_id" id="color_id" required="required"
							class="form-control">
								<c:forEach items="${colors }" var="color">
									<option value="${color.getColor_id() }">${color.getColor_name()}</option>
								</c:forEach>
						</select>
						<td />
						<td><select name="size_id" id="size_id" required="required"
							class="form-control" style="top: 10px">
								<c:forEach items="${sizes }" var="size">
									<option value="${size.getSize_id() }">${size.getSize()}</option>
								</c:forEach>
						</select></td>
						<td><input type="number" min="0" name="quantity"
							id="quantity" value="1" required="required"
							class="form-control mt-4"><br></td>

						<td>
							<button type="button"
								class="delete btn btn-outline-danger btn-sm zmdi zmdi-delete">

							</button>
						</td>
					</tr>
				</table>
			</div>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/product/js/product.js"></c:url>'></script>
</html>