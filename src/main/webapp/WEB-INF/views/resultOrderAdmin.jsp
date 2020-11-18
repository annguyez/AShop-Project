<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>RESULT</title>
<jsp:include page="header_admin.jsp"></jsp:include>
</head>

<body class="animsition">
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive table-responsive-data2" >
                                <h1 style="text-align: center;">${mess}</h1>
                                    <table class="table table-striped table-bordered table-hover">
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
                                               <th>PHONE</th>
                                               <th>ADDRESS</th>
                                               <th>ORDER STATUS</th>
                                               <th>ORDER DATE</th>
                                               <th>NOTE</th>
                                            </tr>
                                        </thead>
                                        <tbody id="listOrder">
												<tr class="tr-shadow" >
													<td ><input class="chkOrder" type="checkbox" name="order_id"
														value="${id}"></td>
													<td>${id}</td>
													<td>${name}</td>
													<td>${address}</td>
													<td>${phone}</td>
													<td class="order_status" >
														<c:choose> 
															<c:when test="${order_status==0}">
																<span class="badge badge-secondary">Not process</span>
															</c:when>
															<c:when test="${order_status==1}">
																<span class="badge badge-success">Accomplished</span>
															</c:when>
															<c:when test="${order_status==2}">
																<span class="badge badge-danger">Cancel</span>
															</c:when>
															<c:when test="${order_status==3}">
																<span class="badge badge-warning">Processing</span>
															</c:when>
														</c:choose>
													</td>
													<td>${order_date}</td>
													<td>${note}</td>
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
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
</html>