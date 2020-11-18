<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page import="java.util.List" %>
<%@ page import="com.annguyen.entity.Orders_detail" %>
<%@ page import="com.annguyen.entity.Product_detail" %>
 <!DOCTYPE html> 
<html>
<head>
    <title>BILL OF SALE</title>
    <link rel="stylesheet" href='<c:url value="/resources/css/view.css"/>'/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("#export").live("click", function () {
            var mess = $("#container").html();
            var printWindow = window.open('', '', 'height=700,width=600');
            printWindow.document.write('<html><head><title>BILL OF SALE</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(mess); 
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            printWindow.print();
        });
        
    </script>
   
</head>
<body onload="convertToWord()">
 <jsp:include page="header_admin.jsp"></jsp:include>
    
     <hr/> <hr/>
                	<div  class="mt-5 card card-body bg-light">
    				<div id="container"> 
	                    <div class="container-fluid bg-light">
	                        <div class="box" id="box">
	                               <div>
	                                   <h1 class="text-center">BILL OF SALE</h1>
	                               </div>
								<div class="row">
									<div class="col">
										<a target="_blank"> <img class="pl-5 mt-3 ml-5"
											src="http://localhost:8080/AShop/resources/home/img/core-img/logo.png"
											data-holder-rendered="true" />
										</a>
									</div>
									<div class="col company-details">
										<h2 class="name">
											<a target="_blank"> ASHOP
											</a>
										</h2>
										<div>Bac Tu Liem street, Ha Noi city, VN</div>
										<div>(123) 456-789</div>
										<div>ashop@gmail.vn</div>
									</div>
								</div>
							</div>
						<hr/>
							<div class="row contacts">
								<div class="col invoice-to">
									<div class="text-gray-light">BILL TO:</div>
									<h2 class="to ml-5">${name }</h2>
									<div class="address">Address: ....................................${address }........................</div>
									<div class="phone">Phone: ....................................${phone }........................</div>
									<div class="email">Note: 
										<a href="mailto:john@example.com">....................................${note }........................</a>
									</div>
								</div>
								<div class="col invoice-details">
									<h3 class="invoice-id">BILL CODE: ${id }</h3>
									<div class="date">Order date: ............${date }............</div>
									
								</div>
							</div>

                                <table border="1" class="table table-bordered table-hover mt-3">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>Color</th>
                                            <th>Size</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Totals</th>
                                        </tr>
                                    </thead>
                                	
                                	
                                
    								<%
                                    List<Orders_detail> orders_detail = (List<Orders_detail>)request.getAttribute("orders_detail");
                                    List<Product_detail> product_detail = (List<Product_detail>)request.getAttribute("product_details");
                                    
                                    float total=0;
                                    float totals=0;
                                    for(int i=0;i<orders_detail.size();i++) {
                                    	 total =orders_detail.get(i).getQuantity()*Float.parseFloat(orders_detail.get(i).getPrice()) ;
                                         totals=totals+total;
                                    %>


								<tr>
									<td><%=i+1 %></td>
									<td><%=product_detail.get(i).getProduct().getProduct_name()%></td>
									<td><%=product_detail.get(i).getColor().getColor_name()%></td>
									<td><%=product_detail.get(i).getSize().getSize()%></td>
									<td><%=orders_detail.get(i).getQuantity()%></td>
									<td><%=(long) Float.parseFloat(orders_detail.get(i).getPrice())%>$</td>
									<td><%=(long) total%>$</td>
								</tr>
								<%
									}
								%>
                                    
                                   
                                    <tr>
                                        <td colspan="6">Total Bill</td>
                                        <input id="number" value="<%=(long) totals%>" style="display:none;"/>
                                        <td><h2><%=(long) totals%>$</h2></td>
                                    </tr>

                                </table>
                                <b class="text-uppercase mt-2">AMOUNT IN WORDS: </b><span id="words" class="text-uppercase ml-5"></span>
					<div class="row">
						<div class="ml-5 mt-3">
							<em class="ml-5"><b>CUSTOMER</b></em>
							<p class="ml-4 min">(Sign and write full name)</p>
							<br>
						</div>
						<div class="padding-custom mt-3">
							<b class="ml-5">VENDER</b>
							<p class="min">(Sign and write full name)
							<p>
								<br> <img class="mr-5 stamp"
									src="http://localhost:8080/AShop/resources/home/img/core-img/con-dau.png"
									data-holder-rendered="true" />
							<h3 class="ml-5">ASHOP</h3>
						</div>
					</div>
				</div>
                  <footer>
                	Bill was created on a computer and is valid without the signature and seal.
            	</footer>
            	</div>
            </div>
            
            <div class="card-footer">
             <a href='<c:url value="/admin/order/1"></c:url>' class="btn btn-warning"><i class="fas  fa-reply">Back</i></a>
             <button id="export" class="btn btn-danger"><i class="fas fa-download">Export To PDF</i></button>
             <button onclick="exportTableToExcel('container')" class="btn btn-success"><i class="fas fa-download">Export To Excel</i></button>
         	<button onclick="Export2Doc('container');" class="btn btn-primary"><i class="fas  fa-download">Export to Docx</i></button>
    		</div>
    	
    <jsp:include page="footer_admin.jsp"></jsp:include>
    <script src='<c:url value="/resources/js/convertNumberToWord.js"/>'></script>
</body>
</html>

