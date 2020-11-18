<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PERMISSION</title>
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
                                  <div class="card-header bg-dark text-light">PERMISSION</div>
                                  <div class="card-body card-block">
                                <div id="size_info">
                                        <form id="frmRole">
                                                <label for="role_name">NAME</label><br>
                                                <input type="text" id="role"  class="form-control" name="role_name" required="required"><br>
                                                
                                        </form>     
                                        <div class="col-12 float-left btn btn-group">
                                        <a href='<c:url value="/admin/permission"></c:url>' class="btn btn-success" data-toggle="tooltip" data-placement="top"   id="btnadd">
                                             ADD
                                        </a>
                                        <button type="button" class="btn btn-warning" id="reset">RESET</button>
                                        </div>
                                </div>
                                </div>
                                </div>
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-striped table-bordered table-hover" id="tbRole">
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
                                                <th>ICON</th>
                                                <th>ACTION</th>
                                            </tr>
                                        </thead>
                                        <tbody id="listRole">
                                  
                                            <c:forEach items="${list }" var="rs">
												<tr class="tr-shadow" >
													<td ><input class="chkRole" type="checkbox" name="role_id"
														value="${rs.getRole_id()}"></td>
													<td>${rs.getRole_id()}</td>
													<td>${rs.getRole_name()}</td>
													<td>
													<c:choose>
														<c:when test="${rs.getRole_id()==1}"><i class="fas fa-globe"></i></c:when>
														<c:when test="${rs.getRole_id()==2}"><i class="fas fa-user"></i></c:when>
														<c:when test="${rs.getRole_id()==3}"><i class="fas fa-users"></i></c:when>
													</c:choose>
													</td>
												    <td>  
												    	<div class="btn btn-group">     
                                                  		<button class="item edit  btn btn-info" data-toggle="tooltip" data-placement="top"  value="${rs.getRole_id() }">
                                                            VIEW
                                                        </button>
                                                        <button class="item update  btn btn-primary" data-toggle="tooltip" data-placement="top"  value="${rs.getRole_id() }" id="btnupdate">
                                                            UPDATE
                                                        </button>
                                                         <button type="button" class="btn btn-danger" id="delete">
                                                			DELETE
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
<script src='<c:url value="/resources/permission/js/permission.js"></c:url>'></script>
</html>