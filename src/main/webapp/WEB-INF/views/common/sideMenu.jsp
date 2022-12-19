<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${ctx}/resources/styles/myInfo.css" rel="stylesheet">


</head>
<body>

<nav class="col-sm-2">
	<!-- nav-pills 영역안에서 가로로 펼쳐짐, 세로메뉴 하려면 nav-stacked필요 -->
		<ul class="nav flex-column"> 
			<li><h2 id="mypage">My page</h2></li>
			<li><h4>My 쇼핑</h4></li>
			<li><a href = "${ctx}/user/myInfo">주문목록/배송조회</a></li>
			<li><a href="${ctx}/order/productRefund?user_id=${user.user_id}">취소/반품/교환/환불 내역</a></li>
			<li><hr class="dropdown-divider"></li>
			<li><h4>My 혜택</h4></li>
			<li><a href="${ctx}/coupon/coupon?user_id=${user.user_id}">할인쿠폰</a></li>
			<li><hr class="dropdown-divider"></li>
			<li><h4>My 활동</h4></li>
			<li><a href="${ctx}/review/reviewRegisterForm?user_id=${user.user_id}">문의하기</a></li>
			<li><a href="${ctx}/review/reviewList">리뷰목록</a></li>
			<li><hr class="dropdown-divider"></li>
			<li><h4>My 정보</h4></li>
			<li><a href="${ctx}/user/updateMemberForm?user_id=${user.user_id}">개인정보확인/수정</a></li>
			<li style="margin-bottom:30px;"><a href="${ctx}/util/addressList?user_id=${user.user_id}">배송지관리</a></li>
		</ul>
	</nav>
<!-- href="${contextPath}/util/addressList?id=${user.id}" -->
</body>
</html>