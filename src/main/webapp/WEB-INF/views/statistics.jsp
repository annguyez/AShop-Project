<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Revenue All</title>
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
                                <!-- DATA TABLE -->
                                <h1 class="title-5 m-b-35">ALL PRODUCT</h1>
                                <div>
                                        <form id="frmStatistic" action='<c:url value="/admin/statistics/all"></c:url>'  method="post">
                                                <label for="month">Revenue Month</label><input type="month" id="month" name="month" value="${month }">
                                                <%-- <label for="orderby">Fillter</label>     
                                                <select name="orderby">
                                                	<option value="1">Quantity</option>
                                                	<option value="2">Revenue</option>
                                                	<option value="3">ID</option>
                                                </select>
                                                <label for="category_id">Category</label>
                                                <select id="category_id" name="category_id" >
                                                	<option value="0">All</option>
                                                	<c:forEach items="${categories }" var="category">
                                                		<option value="${category.getCategory_id() }">${category.getCategory_name() }</option>
                                                	</c:forEach>
                                                </select> --%>
                                              	<button class="btn btn-primary" type="submit">Search</button>
                                        </form>     
                                </div>
                             
							                                
                                <p>${total }</p>
                                <div class="table-responsive m-b-40">
                                    <table class="table table-borderless table-striped table-data3">
                                        <thead>
                                           	<tr>
                                           		<th>No.</th>
                                           		<th>ID</th>
                                           		<th>NAME</th>
                                           		<th>CATEGORY</th>
                                           		<th>ORDER QUANTITY</th>
                                           		<th>REVENUE </th>
                                           	</tr>
                                        </thead>
                                        <tbody id="listProducts">
                                        	<%
                                        		int i = ((Integer)request.getAttribute("page")-1)*10+1;
                                        	%>
                                  			<c:forEach items="${products }" var="product" >
                                  				<tr>
                                  					<td><%=i++ %></td>
                                  					<td>${product.getProduct_id() }</td>
                                  					<td><a href='<c:url value="/admin/statistics/singleproduct/${product.getProduct_id() }/${month }"></c:url>'>${product.getProduct_name() }</a></td>
                                  					<td>${product.getCategory_name() }</td>
                                  					<td>${product.getTotal()}</td>
                                  					<td class="money">${product.getTotal_money()}$</td>
                                  				</tr>
                                  			
                                  			 </c:forEach>
                                            
                                       
                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE -->
                                	<ul class="pagination">
                        				<c:forEach begin="1" end="${totalpage }" var="i">
                        					  <c:choose>
                        					  		<c:when test="${i==page}">
                        					  			<li class="page-item acitve"><a class="page-link" href='<c:url value="${url }/${i }"></c:url>'>${i }</a></li>
                        					  		</c:when>
                        					  		<c:otherwise>
                        					  			<li class="page-item"><a class="page-link" href='<c:url value="${url }/${i }"></c:url>'>${i }</a></li>
                        					  		</c:otherwise>
                        					  </c:choose>
                        				</c:forEach>
                        			</ul>	
                                <!-- END DATA TABLE-->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

	
	<jsp:include page="footer_admin.jsp"></jsp:include>
</body>

	<script>

	(function($) {
		// USE STRICT
		"use strict";
		try {
			
			//pie chart
			var ctx = document.getElementById("pieChart");
			if (ctx) {
				ctx.height = 250;
				var myChart = new Chart(ctx,
						{
							type : 'pie',
							
							data : {
								
								datasets : [ {
									
									data : [
									50 ,70],
									
									
									backgroundColor : [
											"green","red"
											 ]
								} ],
								
								labels : [ "Total", "Cancel" ]
							},
							
							options : {
								legend : {
									position : 'top',
									labels : {
										fontFamily : 'Poppins'
									}

								},
								responsive : true
							}
						});
			}

			
		} catch (error) {
			console.log(error);
		}
	})(jQuery);
</script>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/js/statistics.js"></c:url>'></script>
<script src='<c:url value="/resources/js/format-money.js"/>'></script>
</html>