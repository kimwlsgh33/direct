<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a568cce4e6.js" crossorigin="anonymous"></script>

</head>
<body>		
			
			<div id="reviewDiv">
			 <c:forEach  var="review" items="${reviewlrList}">
				 <div class="d-felx row">
				 	<div class="col-md-10">
				 		<div class="row row-cols-2 d-flex">
				 			<div class="col-md-1 d-flex justify-content-center align-items-center" style="background-color:rgb(192, 192, 192, 0.5); border-radius:50%; width:50px;">
				 				<i class="fa-regular fa-user" style="font-size:20px;"></i>
				 			</div>
				 			<div class="col-md-11">
				 				<div class="col" style="text-align:left;">${review.rating}</div>
				 				<div class="col" style="text-align:left;">${review.user_id} <fmt:formatDate value="${review.created_at}" type="both" pattern="yyyy-MM-dd"/> | 신고</div>
				 			</div>
				 		</div>
				 		<div style="text-align:left; margin-left:50px;">${review.content}</div>
				 	</div>
				 	<div class="col-md-2 d-flex justify-content-center align-items-center" style="border-radius:45%; width:70px; height:40px; border: 1px solid gray;">
	                	<i class="fa-regular fa-thumbs-up" style="color:red;"><span style="color:black; margin-left:5px;">0</span></i>
	          		</div>
				 </div><hr>
			 </c:forEach>
			</div>
</body>
</html>