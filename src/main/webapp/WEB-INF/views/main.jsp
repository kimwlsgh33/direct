<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인화면</title>
	<jsp:include page="./common/css.jsp" flush="false"/><!-- css페이지 import -->
	
</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="./common/topMenu.jsp" flush="false"/>

<!-- 메뉴바 하단에 페이지의 소개를 보여준다. -->
<div class="container">
	<div class="row">
		<jsp:include page="./common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<nav class="nav navbar-nav" id="c1">
			<!-- nav-pills 영역안에서 가로로 펼쳐짐, 세로메뉴 하려면 nav-stacked필요 -->
				<ul class="nav nav-pills nav-justified">
					<li><div><h2>배송중</h2><h1><a href="#">0</a></h1></div></li>
					<li><div><h2>쿠폰</h2><h1><a href="#">0</a></h1></div></li>
					<li><div><h2>리뷰</h2><h1><a href="#">0</a></h1></div></li>
				</ul>
			</nav>
		</div>
			<div class="input-group" id="search">
				<input type="text" class="form-control" placeholder="검색" name="search"/>
				<div class="input-group-btn">
					<button class="btn" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
			<div class="col-sm-10" style="width: 80%; margin-left: 15px;">
			<ul class="nav nav-tabs nav-justified">
			  <li class="nav-item">
			    <a class="nav-link active" data-toggle="tab" href="#home">전체</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu1">배송상품</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu2">여행상품</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" data-toggle="tab" href="#menu3">티켓상품</a>
			  </li>
			</ul>
			</div>
			<!-- Tab panes -->
			<div class="tab-content col-sm-4">
			  <div class="tab-pane container active" id="home"><jsp:include page="./member/mypage.jsp" flush="false"/></div>
			  <div class="tab-pane container fade" id="menu1">ㅠㅠㅠㅠ</div>
			  <div class="tab-pane container fade" id="menu2">여행</div>
			  <div class="tab-pane container fade" id="menu3">티켓</div>
			</div>
		
		</div>
	</div>

<!-- 화면 중앙에 이미지를 보여준다. -->


<!-- 푸터영역 -->
<jsp:include page="./common/footer.jsp" flush="false"/>

</body>
</html>

















