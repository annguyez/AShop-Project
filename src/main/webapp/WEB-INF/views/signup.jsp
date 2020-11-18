<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/css/font-face.css"/>'/>
    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-4.7/css/font-awesome.min.css"/>'/>
    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/font-awesome-5/css/fontawesome-all.min.css" />'/>
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/mdi-font/css/material-design-iconic-font.min.css"/>'/>

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/bootstrap-4.1/bootstrap.min.css" />'/>

    <!-- Vendor CSS-->
    <link rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/animsition/animsition.min.css" />'/>
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"/>'/>
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/wow/animate.css" />'/>
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/css-hamburgers/hamburgers.min.css"/>'/>
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/slick/slick.css"/>'/>
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/select2/select2.min.css"/>'/>
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.css"/>'/>

    <!-- Main CSS-->
    <link  rel="stylesheet" media="all" href='<c:url value="/resources/admin/css/theme.css"/>'/>
</head>
<body class="animsition" data-animsition-in-class="flip-in-y"
  data-animsition-in-duration="1000"
  data-animsition-out-class="flip-out-y"
  data-animsition-out-duration="800">
    <div class="page-wrapper">
        <div class="page-content--bge5">
            <div class="container">
                <div class="login-wrap">
                    <div class="login-content">
                        <div class="login-logo">
                            <a href="login">
                                <img src="http://localhost:8080/AShop/resources/home/img/core-img/logo.png">
                            </a>
                        </div>
                        <div class="login-form">
                            <form action='<c:url value="/signup"></c:url>' method="post">
                                <div class="form-group">
                                    <label>Fullname*</label>
                                    <input class="au-input au-input--full" type="text" name="fullname" placeholder="Fullname" required>
                                </div>
                                <div class="form-group">
                                    <label>Username*</label>
                                    <input class="au-input au-input--full" name="username" placeholder="Username" required>
                                </div>
                                <div class="form-group">
                                    <label>Password*</label>
                                    <input class="au-input au-input--full" type="password" name="password" placeholder="Password" required>
                                </div>
                                <div class="form-group">
                                    <label>Re password*</label>
                                    <input class="au-input au-input--full" type="password" name="repassword" placeholder="Password" required>
                                </div>
                                <div class="login-checkbox">
                                    <label>
                                        <input type="checkbox" name="aggree">Agree the terms and policy
                                    </label>
                                </div>
                                <div>
                                	<label class="badge badge-danger">${mess }</label>
                                </div>
                                <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">register</button>
                                <div class="social-login-content">
                                    <div class="social-button">
                                        <button class="au-btn au-btn--block au-btn--blue m-b-20">register with facebook</button>
                                        <button class="au-btn au-btn--block au-btn--blue2">register with twitter</button>
                                    </div>
                                </div>
                            </form>
                            <div class="register-link">
                                <p>
                                    Already have account?
                                    <a href='<c:url value="/login"></c:url>'>Sign In</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
	
 <script src='<c:url value="/resources/admin/vendor/jquery-3.2.1.min.js"/>'></script>
    <!-- Bootstrap JS-->
    <script src='<c:url value="/resources/admin/vendor/bootstrap-4.1/popper.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/bootstrap-4.1/bootstrap.min.js"/>'></script>
    <!-- Vendor JS       -->
    <script src='<c:url value="/resources/admin/vendor/slick/slick.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/wow/wow.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/animsition/animsition.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/counter-up/jquery.waypoints.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/counter-up/jquery.counterup.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/circle-progress/circle-progress.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/perfect-scrollbar/perfect-scrollbar.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/chartjs/Chart.bundle.min.js"/>'></script>
    <script src='<c:url value="/resources/admin/vendor/select2/select2.min.js"/>'></script>

    <!-- Main JS-->
    <script src='<c:url value="/resources/admin/js/main.js"/>'></script>
</body>
</html>