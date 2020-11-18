    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
       
            <nav class="classy-navbar" id="essenceNav">
              
                <a class="nav-brand" href='<c:url value="/home"></c:url>'><img src='<c:url value="/resources/home/img/core-img/logo.png"></c:url>' alt=""></a>
                
                <div class="classy-menu">
                    <!-- close btn -->
                    <div class="classycloseIcon">
                        <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                    </div>
                    <!-- Nav Start -->
                    <div class="classynav">
                        <ul>
                            <li><a href="#">Shoes Type</a>
                                <div class="megamenu">
                                <c:set var="index" value="0"/>
                                  <c:forEach var="sp" items="${category }">
                                    <c:if test="${(index % 4)==0 }">  
                                    	<ul class="single-mega cn-col-4">
                                    </c:if>  	
                                        <li><a href='<c:url value="/searchQuery/${sp.getCategory_id() }/0/0//1/1"></c:url>'>${sp.category_name }</a></li>
   
                                	<c:if test="${(index % 4)==3 }"></ul></c:if>
                                     <c:set var="index" value="${index+1 }"/>
                                    </c:forEach>
                                </div>
                            </li>
                            
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="shop.html">Shop</a></li>
                                    <li><a href="single-product-details.html">Product Details</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                   <li><a href='<c:url value="/recent"></c:url>'>Recent Product</a></li>
                                </ul>
                            </li>
                            <li><a href='<c:url value="/blog"></c:url>'>Blog</a></li>
                            <li><a href='<c:url value="/contact"></c:url>'>Contact</a></li>
                            <li><a href='<c:url value="/track-order"></c:url>'>Tracking</a></li>
                           
                        </ul>
                    </div>
                  
                </div>
            </nav>

            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
                <div class="search-area">
                    <form action='<c:url value="/searchByLikeName"></c:url>' method="post">
                        <input type="search" name="name" id="headerSearch" placeholder="Search AShop">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <!-- Favourite Area -->
                <!-- User Login Info -->
                <div class="user-login-info">
                    <a href='<c:url value="/favourite"></c:url>'><i class="fa fa-heart" aria-hidden="true"></i></a>
                </div>
               
                <div class="user-login-info">
                    <a href='<c:url value="/login"></c:url>'><i class="fa fa-user" aria-hidden="true"></i></a>
                </div>
                 <div class="user-login-info">
                    <a href='<c:url value="/admin"></c:url>'><i class="fa fa-sign-in" aria-hidden="true"></i> </a>
                </div>
                <!-- Cart Area -->
                <div class="cart-area">
                    <a href='<c:url value="/cart"></c:url>' id="essenceCartBtn"><img src='<c:url value="/resources/home/img/core-img/bag.svg"></c:url>' alt=""><span class="countCart"></span></a>
                </div>
            </div>

        </div>
    </header>
    <div class="cart-bg-overlay"></div>
    <div class="right-side-cart-area">

        <div>
            <a href="#"><img src='<c:url value="/resources/home/img/core-img/bag.svg"></c:url>' alt=""> <span>${countProduct }</span></a>
        </div>

        
    </div>
