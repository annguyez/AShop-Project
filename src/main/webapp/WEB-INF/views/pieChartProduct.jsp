<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="com.annguyen.model.Product_detailDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PIE CHAR</title>
 

</head>

<body class="animsition" data-animsition-in-class="zoom-in"
  data-animsition-in-duration="1000"
  data-animsition-out-class="zoom-out"
  data-animsition-out-duration="800">
<jsp:include page="header_admin.jsp"></jsp:include>
	<!-- MAIN CONTENT-->
	<div class="main-content">
		<div class="section__content section__content--p30">
			<div class="container-fluid">
				<form
					action='<c:url value="/admin/chart/redirectSingleproduct"></c:url>'
					method="post" class="form-horizontal">
					<div class="row form-group">
						<div class="col col-md-12">
							<div class="input-group">
								<input type="text" name="product_id" placeholder="PRODUCT ID"
									class="form-control" required="required"> <input
									type="month" name="month" class="form-control">
								<div class="input-group-btn">
									<button type="submit" class="btn btn-primary">
										<i class="fa fa-search"></i>PROCESS
									</button>
								</div>
							</div>
						</div>
					</div>

				</form>
				<c:choose>
					<c:when test="${product==null}">
						<span class="badge badge-danger ">There are no record</span>
					
						<div class="bg-light py-3">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<img
											src='<c:url value="/resources/admin/images/no-data-found-images.png"/>'
											alt="Image">
									</div>
								</div>
							</div>
						</div>
					</c:when>
				<c:otherwise>
					<div class="row">
						
						<div class="col-lg-6">
							<div class="au-card m-b-30 resize">
								<div class="au-card-inner">
									<h3 class="title-2 m-b-40">${product.getProduct_name()}</h3>
									<canvas id="pieChart"></canvas>
								</div>
							</div>
						</div>
	
						<div class="col-lg-6">
							<div class="au-card m-b-30 resize">
								<div class="au-card-inner">
									<h3 class="title-2 m-b-40">Revenue</h3>
									<canvas id="polarChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>


	<jsp:include page="footer_admin.jsp"></jsp:include>
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
									data : [ ${shipped.getTotal()+notShipped.getTotal()+canceled.getTotal()+shipping.getTotal()},
										${canceled.getTotal() }, 
										${shipped.getTotal()},
										${shipping.getTotal()},
										${notShipped.getTotal()} ],
									backgroundColor : [
											"green",
											"red",
											"blue",
											"yellow",
											"gray" ]
								} ],
								labels : [ "Total", "Cancel", "Shipped","Shipping", "Not Ship" ]
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
		
		try {

		    // polar chart
		    var ctx = document.getElementById("polarChart");
		    if (ctx) {
		      ctx.height = 270;
		 
		      var myChart = new Chart(ctx, {
		        type: 'polarArea',
		        data: {
		          datasets: [{
		            data: [${shipped.getTotal_money() + notShipped.getTotal_money()}, ${shipped.getTotal_money()} ],
		            backgroundColor: [
		              "green",
		              "yellow"
		            ]

		          }],
		          labels: [
		        	 "Expected revenue",
		            "Current revenue"
		            
		            
		          ]
		        },
		        options: {
		          legend: {
		            position: 'top',
		            labels: {
		              fontFamily: 'Poppins'
		            }

		          },
		          responsive: true
		        }
		      });
		    }

		  } catch (error) {
		    console.log(error);
		  }
	})(jQuery);
	
	
	
</script>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/js/statistics.js"></c:url>'></script>
</html>