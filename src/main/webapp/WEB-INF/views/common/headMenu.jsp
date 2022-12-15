<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<nav class="nav navbar-nav" id="c1">
	<!-- nav-pills 영역안에서 가로로 펼쳐짐, 세로메뉴 하려면 nav-stacked필요 -->
	<ul class="nav nav-pills justify-content-around">
		<li><div><h2>배송중</h2><h1><a href="${ctx}/product/productList">0</a></h1></div></li>
		<li><div><h2>쿠폰</h2><h1><a href="${ctx}/coupon/coupon?user_id=${user.user_id}">0</a></h1></div></li>
		<li><div><h2>리뷰</h2><h1><a href="${ctx}/review/reviewList">0</a></h1></div></li>
	</ul>
</nav>

</body>
</html>