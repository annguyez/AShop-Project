<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EVENT</title>
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
                                  <div class="card-header bg-dark text-light">EVENT</div>
                                  <div class="card-body card-block">
                                <div id="size_info">
                                        <form id="frmColor">
                                                <label for="content">CONTENT</label><br>
                                                <input type="text" id="content" class="form-control" name="content" required="required" ><br>
		                                        <label for="image">IMAGE</label><br>
												<input id="oldimg" hidden class="form-control">
												<img alt="image" id="img-url" src="">
												<a id="url" hidden target="blank">VIEW IMAGE</a>
												<input type="file" id="image" name="image" class="form-control"><br>
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
                                                <th>ID</th>
                                                <th>CONTENT</th>
                                                <th>IMAGE</th>
                                                <th>ACTION</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                           
												<tr class="tr-shadow color" >
													<td>${event.event_id}</td>
													<td>${event.content}</td>
													<td><img src="../${event.image}"></td>
												    <td>    
												    <div class="btn btn-group">    
                                                  		<button class="item getinfo btn btn-info" data-toggle="tooltip" data-placement="top"  value="${event.event_id }">
                                                            VIEW
                                                        </button>
                                                        <button class="item update btn btn-primary" id="btnupdate" data-toggle="tooltip" data-placement="top"  value="${event.event_id }" >
                                                            UPDATE
                                                        </button>
                                                    </div>
                                                </td>
                                            </tr>
                                        
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
<script src='<c:url value="/resources/js/changeEvent.js"></c:url>'></script>
</html>