<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!-- Fontfaces CSS-->
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/css/font-face.css"/>'/>
 
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/font-awesome-4.7/css/font-awesome.min.css"/>'/>
    
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/font-awesome-5/css/fontawesome-all.min.css"/>'/>
    
    
	<link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/mdi-font/css/material-design-iconic-font.min.css"/>'/>
	
    <!-- Bootstrap CSS-->
    
	<link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/bootstrap-4.1/bootstrap.min.css"/>'/>
	
    <!-- Vendor CSS-->
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/animsition/animsition.min.css"/>'/>
    
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"/>'/>
    
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/wow/animate.css"/>'/>
    
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/css-hamburgers/hamburgers.min.css"/>'/>
    
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/slick/slick.css"/>'/>
    
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/select2/select2.min.css"/>'/>
    
    
	<link rel="stylesheet" href='<c:url value="/resources/Styles/vendor/perfect-scrollbar/perfect-scrollbar.css"/>'/>
	
    <!-- Main CSS-->
    
    <link rel="stylesheet" href='<c:url value="/resources/Styles/css/theme.css"/>'/>
<body class="animsition">
<div class="page-wrapper">
        <!-- HEADER MOBILE-->
       <header class="header-mobile d-block d-lg-none">
            <div class="header-mobile__bar">
                <div class="container-fluid">
                    <div class="header-mobile-inner">
                        <a class="logo" href='<c:url value="/"></c:url>'>
                            <img src="http://localhost:8080/AShop/resources/home/img/core-img/logo.png" />
                        </a>
                        <button class="hamburger hamburger--slider" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </header>
        <!-- END HEADER MOBILE-->

        <!-- MENU SIDEBAR-->
        <aside class="menu-sidebar d-none d-lg-block bg-dark font-color-custom">
            <div class="logo">
                <a href='<c:url value="/"></c:url>'>
                    <img src="http://localhost:8080/AShop/resources/home/img/core-img/logo.png" />
                </a>
            </div>
            <div class="menu-sidebar__content js-scrollbar1" id="menu">
                 <nav class="navbar-sidebar">
                 
                    <ul class="list-unstyled navbar__list ">
	                    <li>
	                        <a href='<c:url value="/admin/"></c:url>'> <i class="fas fa-home"></i>Dashboard </a>
	                    </li>
	                  
                        
                        <p class="p-custom">Management</p>
                        <li>
                           <a href='<c:url value="/admin/product"></c:url>'>
                           <i class="fas fa-archive"></i>PRODUCT</a>
                        </li>
                        <security:authorize access="hasRole('ROLE_ADMIN')">
                        <li>
                            <a href='<c:url value="/admin/category"></c:url>'>
                                <i class="fas fa-calendar"></i>CATEGORY</a>
                        </li>
                         <li>
                           <a href='<c:url value="/admin/color"></c:url>'>
                           <i class="fas  fa-heart"></i>COLOR</a>
                        </li>
                        <li>
                           <a href='<c:url value="/admin/size"></c:url>'>
                           <i class="fas fa-scissors"></i>SIZE</a>
                        </li>
                        <li>
                           <a href='<c:url value="/admin/daily-blog"></c:url>'>
                           <i class="fas fa-edit"></i>DAILY BLOG</a>
                        </li>
                         </security:authorize>
                         <li>
                            <a href='<c:url value="/admin/sale/0/0/1"></c:url>'>
                                <i class="fas  fa-arrow-circle-down"></i>ADD PROMOTION</a>
                        </li>
                        <security:authorize access="hasRole('ROLE_ADMIN')">
                         <li>
                            <a href='<c:url value="/admin/allsale/cmd=0/product-id=0"></c:url>'>
                                <i class="fas  fa-arrow-circle-up"></i>PROMOTION LIST</a>
                        </li>
                        </security:authorize>
                        
                         <li class="has-sub">
                           <a class="js-arrow" href='<c:url value="/admin/order/1"></c:url>'>
                                <i class="fas fa-dollar"></i>ORDER LIST</a>     
                            
                        </li>
                        <p class="p-custom">account</p>
                        
                        <security:authorize access="hasRole('ROLE_ADMIN')">
                        <li>
                            <a href='<c:url value="/admin/permission"></c:url>'>
                             <i class="fas fa-wrench"></i>PERMISSION</a>
                       </li>
                       <li>
                            <a href='<c:url value="/admin/employees"></c:url>'>
                             <i class="fas fa-user"></i>USER</a>
                        </li>
                        </security:authorize>
                       <li>
                            <a href='<c:url value="/admin/track"></c:url>'>
                             <i class="fas fa-filter"></i>TRACK</a>
                        </li>
                       <p class="p-custom">SYSTEM</p>
                       <li>
                            <a href='<c:url value="/admin/event"></c:url>'>
                             <i class="fas fa-film"></i>EVENT - BANNER</a>
                        </li>
                        
                       <security:authorize access="hasRole('ROLE_ADMIN')">
                       <p class="p-custom">other</p>
                       <li>
                           <a href='<c:url value="/admin/chart/singleproduct"></c:url>'>CHART DETAIL PRODUCT</a>
                       </li>
                      
                        
                           <li class="has-sub">
                            <a class="js-arrow" href="#">
                                <i class="fas fa-th"></i>STATISTICS</a>
                            <ul class="navbar-mobile-sub__list list-unstyled js-sub-list bg-dark">
                            
                            	<%-- <li >
                                    <a href='<c:url value="/admin/statistics/category/all"></c:url>'><i class="fas fa-search"></i>All Category</a>
                                </li> --%>
                                <li>
                                    <a href='<c:url value="/admin/statistics/all/0/1/1"></c:url>'><i class="fas fa-search"></i>All</a>
                                </li>
                                <%-- <li>
                                    <a href='<c:url value="/admin/statistics/shipped/0/1/1"></c:url>'><i class="fas fa-ship"></i>Shipped</a>
                                </li>
                                <li>
                                    <a href='<c:url value="/admin/statistics/singleproduct"></c:url>'><i class="fas fa-search"></i>CHART DETAIL PRODUCT</a>
                                </li> --%>
                                 <li>
                                    <a href='<c:url value="/admin/chart/singleproduct"></c:url>'>CHART DETAIL PRODUCT</a>
                                </li>
                                
                            </ul>
                        </li>  
                        </security:authorize>
                       </ul>
                    </ul>
                </nav>
            </div>
        </aside>
        <!-- END MENU SIDEBAR-->

        <!-- PAGE CONTAINER-->
        <div class="page-container">
            <!-- HEADER DESKTOP-->
            <header class="header-desktop">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="header-wrap">
                           <div class="header-button">
                          
                            <div class="header-button">
                                <div class="noti-wrap">
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-comment-more"></i>
                                        <span class="quantity">1</span>
                                        <div class="mess-dropdown js-dropdown">
                                            <div class="mess__title">
                                                <p>You have 2 news message</p>
                                            </div>
                                            <div class="mess__item">
                                                <div class="image img-cir img-40">
                                                    <img src="" alt="Michelle Moreno" />
                                                </div>
                                                <div class="content">
                                                    <h6>Michelle Moreno</h6>
                                                    <p>Have sent a photo</p>
                                                    <span class="time">3 min ago</span>
                                                </div>
                                            </div>
                                            <div class="mess__item">
                                                <div class="image img-cir img-40">
                                                    <img src="" alt="Diane Myers" />
                                                </div>
                                                <div class="content">
                                                    <h6>Diane Myers</h6>
                                                    <p>You are now connected on message</p>
                                                    <span class="time">Yesterday</span>
                                                </div>
                                            </div>
                                            <div class="mess__footer">
                                                <a href="#">View all messages</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-email"></i>
                                        <span class="quantity">1</span>
                                        <div class="email-dropdown js-dropdown">
                                            <div class="email__title">
                                                <p>You have 3 New Emails</p>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, 3 min ago</span>
                                                </div>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, Yesterday</span>
                                                </div>
                                            </div>
                                            <div class="email__item">
                                                <div class="image img-cir img-40">
                                                    <img src="" alt="Cynthia Harvey" />
                                                </div>
                                                <div class="content">
                                                    <p>Meeting about new dashboard...</p>
                                                    <span>Cynthia Harvey, April 12,,2018</span>
                                                </div>
                                            </div>
                                            <div class="email__footer">
                                                <a href="#">See all emails</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="noti__item js-item-menu">
                                        <i class="zmdi zmdi-notifications"></i>
                                        <span class="quantity">3</span>
                                        <div class="notifi-dropdown js-dropdown">
                                            <div class="notifi__title">
                                                <p>You have 3 Notifications</p>
                                            </div>
                                            <div class="notifi__item">
                                                <div class="bg-c1 img-cir img-40">
                                                    <i class="zmdi zmdi-email-open"></i>
                                                </div>
                                                <div class="content">
                                                    <p>You got a email notification</p>
                                                    <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            <div class="notifi__item">
                                                <div class="bg-c2 img-cir img-40">
                                                    <i class="zmdi zmdi-account-box"></i>
                                                </div>
                                                <div class="content">
                                                    <p>Your account has been blocked</p>
                                                    <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            <div class="notifi__item">
                                                <div class="bg-c3 img-cir img-40">
                                                    <i class="zmdi zmdi-file-text"></i>
                                                </div>
                                                <div class="content">
                                                    <p>You got a new file</p>
                                                    <span class="date">April 12, 2018 06:50</span>
                                                </div>
                                            </div>
                                            <div class="notifi__footer">
                                                <a href="#">All notifications</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="account-wrap">
                                    <div class="account-item clearfix js-item-menu">
                                        <div class="image">
                                            <img src="http://localhost:8080/AShop/resources/Styles/images/icon/default_avatar.png" />
                                        </div>
                                        <div class="content">
                                        <security:authentication property="principal" var="user"/>
                                                        
                                            <a class="js-acc-btn" href="#">${user.username }</a>
                                        </div>
                                        <div class="account-dropdown js-dropdown">
                                            <div class="info clearfix">
                                                <div class="image">
                                                    <a href="#">
                                                        <img src="http://localhost:8080/AShop/resources/Styles/images/icon/default_avatar.png"/>
                                                    </a>
                                                </div>
                                                <div class="content">
                                                    <h5 class="name">
                                                    	
                                                        <a href="#">${user.username }</a>
                                                    </h5>
                                                   
                                                </div>
                                            </div>
                                            <div class="account-dropdown__body">
                                                <div class="account-dropdown__item">
                                                    <a href='<c:url value="/admin/employees"></c:url>'>
                                                        <i class="zmdi zmdi-account"></i>Account</a>
                                                </div>
                                             
                                            </div>
                                            <div class="account-dropdown__footer">
                                            
                                            <security:authorize access="isAuthenticated()">
                                            	 <a href='<c:url value="/logout"></c:url>'>
                                                    <i class="zmdi zmdi-power"></i>Logout</a>
                                            </security:authorize>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- END HEADER DESKTOP-->

</body>