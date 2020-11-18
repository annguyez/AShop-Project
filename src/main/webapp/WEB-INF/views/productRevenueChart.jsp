<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCT REVENUE CHART</title>
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
                        
                               
                           <div class="au-card m-b-30 resize">
                                    <div class="au-card-inner">
                                        <h3 class="title-2 m-b-40">a</h3>
                                        <canvas id="pieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                     
                        <div class="row">
                            <div class="col-md-12">
                                        
                                <p>${total }</p>
                                <div class="table-responsive m-b-40">
                                    <table class="table table-borderless table-striped table-data3" id="tbColor">
                                        <thead>
                                           	<tr>
                                           		<th>Số thứ tự</th>
                                           		<th>Mã sản phẩm</th>
                                           		<th>Tên sản phẩm</th>
                                           		<th>Danh mục</th>
                                           		<th>Số lượng đặt hàng</th>
                                           		<th>Doanh thu dự kiến</th>
                                           	</tr>
                                        </thead>
                                        <tbody>
                                        
                                  			<c:forEach items="${products }" var="product" >
                                  				<tr>
                                  			
                                  					<td>${product.getProduct_id() }</td>
                                  					<td>${product.getProduct_name() }</a></td>
                                  					<td>${product.getCategory_name() }</td>
                                  					<td>${product.getTotal()}</td>
                                  					<td class="money">${product.getTotal_money()}</td>
                                  				</tr>
                                  			
                                  			 </c:forEach>
                                            
                                       
                                        </tbody>
                                    </table>
                                </div>
                                
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
									
									data : [ 50,
										50
										]
									
									backgroundColor : [
											"green",
											"red"
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
</html>