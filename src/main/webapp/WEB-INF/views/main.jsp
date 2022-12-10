<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인화면</title>
<!-- css페이지 import -->
<jsp:include page="./common/css.jsp" flush="false"/> 

<!-- reset.css 
<link href="${contextPath}/resources/styles/reset.css" rel="stylesheet">
-->
</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="./common/topMenu.jsp" flush="false"/>

<!-- 메뉴바 하단에 페이지의 소개를 보여준다. -->
<div class="container">
	<div class="row">
		<jsp:include page="./common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
		<jsp:include page="./common/headMenu.jsp" flush="false"/>
			<h3 style="padding-left: 25px; margin-top: 30px;">주문목록</h3>
			<div class="input-group" style="width: 80%; padding-left: 25px; margin-top: 20px;">
				<input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
				<button type="button" class="btn btn-outline-success">search</button>
			</div>
			<div class="col-sm-10" style="width: 80%; margin-left: 15px;">
				<ul class="nav nav-tabs justify-content-around" id="myTab" role="tablist">
				  <li class="nav-item" role="presentation">
				    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">전체</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#menu2" type="button" role="tab" aria-controls="profile" aria-selected="false">배송</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#menu3" type="button" role="tab" aria-controls="contact" aria-selected="false">여행</button>
				  </li>
				  <li class="nav-item" role="presentation">
				    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#menu4" type="button" role="tab" aria-controls="contact" aria-selected="false">티켓</button>
				  </li>
				</ul>
			</div>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			  <jsp:include page="./product/productList.jsp" flush="false"/>
			  </div>
			  <div class="tab-pane fade" id="menu2" role="tabpanel" aria-labelledby="profile-tab">
			  <jsp:include page="./product/productList.jsp" flush="false"/>
			  </div>
			  <div class="tab-pane fade" id="menu3" role="tabpanel" aria-labelledby="contact-tab">여행</div>
			  <div class="tab-pane fade" id="menu4" role="tabpanel" aria-labelledby="contact-tab">티켓</div>
			</div>
		</div>
	</div>
</div>

<!-- 화면 중앙에 이미지를 보여준다. -->


<!-- 푸터영역 -->
<div class="container" style="margin-top: 520px;">
<jsp:include page="./common/footer.jsp" flush="false"/>
</div>

</body>
</html>