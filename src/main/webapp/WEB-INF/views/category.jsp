<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CATEGORY</title>
<jsp:include page="header_admin.jsp"></jsp:include>
<link rel="stylesheet"
	href='<c:url value="../resources/home/css/bootstrap.min.css"/>' />
	    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" />' />
    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-4.7/css/font-awesome.min.css" />' />
</head>
<body class="animsition" data-animsition-in-class="zoom-in"
  data-animsition-in-duration="1000"
  data-animsition-out-class="zoom-out"
  data-animsition-out-duration="800">
            <!-- MAIN CONTENT-->
          <div class="page-wrapper">
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                             
                              <div class="card border-secondary">
                                  <div class="card-header bg-dark text-light">CATEGORY</div>
                                  <div class="card-body card-block">
	                                <div class="row">
	                                	<div class="col-12 float-left">
			                                  <form id="frmCategory">
		                                          <label for="category_name">NAME</label><br>
		                                          <input class="form-control" type="text" id="category_name" name="category_name" required="required"><br>
		                                  		</form>   
			                              </div>
			                             <!-- <div class="col-6 float-left">  
			                                      <label for="price">IMAGE</label><br>
											<input id="oldimg" hidden >
												<a id="url" hidden target="blank">Xem ảnh sản phẩm</a>
											<input type="file" id="image" name="image"><br>
											
											</div> -->
											<div class="col-12 float-left btn btn-group">
			                                      <a href='<c:url value="/admin/category"></c:url>' class="btn btn-success" data-toggle="tooltip" data-placement="top" id="btnadd">
			                                                Add
			                                      </a>
			                                <button type="button" id="reset" class="btn btn-warning" value="reset">RESET</button>
			                                </div>
	                                </div>
                                </div>
                               </div>
                                
									<hr/>
							          
                                    <table class="table table-striped table-bordered table-hover " id="tbCategory">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>
                                                    <label class="au-checkbox">
                                                        <input type="checkbox" id="chkAll">
                                                        <span class="au-checkmark"></span>
                                                    </label>
                                                </th>
                                                <th>ID</th>
                                                <th>NAME</th>
                                               	<th>IMAGE</th>
                                                <th>ACTION</th>
                                               
                                            </tr>
                                        </thead>
                                        <tbody id="listCategory">
                                  
                                            <c:forEach items="${list }" var="rs">
												<tr class="tr-shadow " >
													<td ><input class="chkCategory" type="checkbox" name="category_id"
														value="${rs.getCategory_id()}"></td>
													<td>${rs.getCategory_id()}</td>
													<td>${rs.getCategory_name()}</td>
													<td>${rs.getImage()}</td>
												    <td>  
												    	<div class="btn btn-group">   
                                                  		<button class="item edit btn btn-info" data-toggle="tooltip" data-placement="top"  value="${rs.getCategory_id() }">
                                                            <i class="fas fa-eye"></i>VIEW
                                                        </button>
                                                        <button class="item update btn btn-primary" data-toggle="tooltip" data-placement="top"  value="${rs.getCategory_id() }" id="btnupdate">
                                                            <i class="fa fa-pencil"></i>UPDATE
                                                        </button>
                                                        <button type="button" class="btn btn-danger" id="delete">
                                                			<i class="fa fa-trash-o"></i>DELETE
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

<script src='<c:url value="/resources/category/js/category.js"></c:url>'></script>
<script src='<c:url value="/resources/home/js/bootstrap.min.js"/>'></script>
</html>

