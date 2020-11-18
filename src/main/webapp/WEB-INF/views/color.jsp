<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>COLOR</title>
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
                                  <div class="card-header bg-dark text-light">COLOR</div>
                                  <div class="card-body card-block">
                                <div id="size_info">
                                        <form id="frmColor">
                                                <label for="color_name">NAME</label><br>
                                                <input type="text" id="color_name" class="form-control" name="color_name" required="required" ><br>
                                        </form>     
                                        <div class="col-12 float-left btn btn-group">
	                                        <a href='<c:url value="/admin/color"></c:url>' class="btn btn-success" data-toggle="tooltip" data-placement="top"   id="btnadd">
	                                                   ADD
	                                        </a>
	                                       
	                                        <button type="button" class="btn btn-warning" id="reset">RESET</button>
                                        </div>
                                </div>
                                </div>
                                </div>
                                	
							                                
                                
                                <div class="table-responsive table-responsive-data2">
                                    <table class="table table-striped table-bordered table-hover" id="tbColor">
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
                                                <th>EXAMPLE</th>
                                                <th>ACTION</th>
                                               
                                            </tr>
                                        </thead>
                                        <tbody id="listColor">
                                            <c:forEach items="${list }" var="color">
												<tr class="tr-shadow color" >
													<td ><input class="chkColor" type="checkbox" name="color_id"
														value="${color.getColor_id()}"></td>
													<td>${color.getColor_id()}</td>
													<td>${color.getColor_name()}</td>
													<td><span style="display: inline-block; 
																	 background-color: ${color.getColor_name()};
																	 border-radius: 50%;
																	 width: 50px;
																     height: 50px;"></span>
													</td>
												    <td>    
												    <div class="btn btn-group">    
                                                  		<button class="item edit btn btn-info" data-toggle="tooltip" data-placement="top"  value="${color.getColor_id() }">
                                                            VIEW
                                                        </button>
                                                        <button class="item update btn btn-primary" id="btnupdate" data-toggle="tooltip" data-placement="top"  value="${color.getColor_id() }" >
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
        </div>

    </div>

	
	<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/color/js/color.js"></c:url>'></script>
</html>