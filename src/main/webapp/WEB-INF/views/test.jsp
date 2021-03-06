<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div class="#">
    <input id="uploadImage" type="file" name="photo" />
    <input id="caption" type="text" name="caption" placeholder="caption" />

    <label for="color">Blue</label>
    <input id="color" type="radio" name="color" value="blue" />

    <label for="green">Green</label>
    <input id="color" type="radio" name="color" value="green" />

    <label for="red">Red</label>
    <input id="color" type="radio" name="color" value="red" />

    <canvas id="canvas" width="640" height="480" style="border:1px solid #ccc"></canvas>

    <br />

    <h5>Preview</h5>
    <a href="#" id="imageData" type="text" target="_blank">
        <img id="preview" style="width:200px; height: 200px;" />
    </a>
</div>
</body>
<script src='<c:url value="/resources/js/test.js"></c:url>'></script>
</html>