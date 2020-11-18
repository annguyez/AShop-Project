<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DAILY BLOG</title>
<jsp:include page="header_admin.jsp"></jsp:include>
</head>

<body class="animsition" data-animsition-in-class="zoom-in"
  data-animsition-in-duration="1000"
  data-animsition-out-class="zoom-out"
  data-animsition-out-duration="800">
            <div class="main-content">
                <div class="section__content section__content--p30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card border-secondary">
                                  <div class="card-header bg-dark text-light">Daily Blog</div>
                                  <div class="card-body card-block">
                                       <form id="formBlog">
                                               <label for="heading">HEADING</label><br>
                                               <input type="text" id="heading"  class="form-control" name="heading" required="required"><br>
                                               
                                               <label for="created_date">Created date</label><br>
                                               <input type="date" id="created_date"  class="form-control" name="created_date" required="required"><br>
                                               
                                               <label for="content">Content</label><br>
                                               <textarea type="text" class="ckeditor" name="content" id="content"></textarea>
                                                <input type="text" id="content"  class="form-control" name="content" required="required"><br>
                                                
                                               <label for="image">image</label><br>
                                               <input type="file" id="image" name="image" class="form-control"><br>
                                       </form>     
                                       <div class="col-12 float-left btn btn-group">
                                       <a href='<c:url value="/admin/daily-blog"></c:url>' class="btn btn-success" data-toggle="tooltip" data-placement="top"   id="btnadd">
                                            ADD
                                       </a>
                                       <button type="button" class="btn btn-warning" id="reset">RESET</button>
                                       </div>
                                	</div>
                                </div>
                                <div class="table-responsive table-responsive-data2">
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
                                                <th>HEADING</th>
                                                <th>IMAGE</th>
                                                <th>CONTENT</th>
                                                <th>CONTENT IMG</th>
                                                <th>CREATED DATE</th>
                                                <th>ACTION</th>
                                            </tr>
                                        </thead>
                                        <tbody id="list">
                                  
                                            <c:forEach items="${list }" var="n">
												<tr class="tr-shadow" >
													<td ><input class="check" type="checkbox" name="news_id"
														value="${n.news_id}"></td>
													<td>${n.news_id}</td>
													<td>${n.heading}</td>
													<td><img src="../${n.image}"></td>
													<td>${n.content}</td>
													<td><img src="../${n.content_img}"></td>
													<td>${n.created_date}</td>
													
													
												    <td>  
												    	<div class="btn btn-group">     
                                                        <button class="item update  btn btn-primary">
                                                            <a href="/AShop/blog/${n.news_id}" class="text-light">Read More</a>
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
           
    

	
	<jsp:include page="footer_admin.jsp"></jsp:include>
</body>
<script src='<c:url value="/resources/js/jquery-3.4.1.min.js"></c:url>'></script>
<script src='<c:url value="/resources/daily-blog/js/daily-blog.js"></c:url>'></script>
<script src='<c:url value="/resources/daily-blog/ckeditor/ckeditor.js"></c:url>'></script>
</html>