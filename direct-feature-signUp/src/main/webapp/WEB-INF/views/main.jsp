<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>메인 화면임</title>
	</head>
	<body>
		<!-- 메뉴바 -->
		<jsp:include page="common/header.jsp" flush="false"/>
		
		<!-- 메뉴바 하단에 페이지의 소개를 보여준다. -->
		<div class="container">
			<div class="jumbotron">
				<div class="container text-center">
					<h1>임시 홈화면</h1>
					<p>아모른직다.</p>
				</div>
			</div>
		</div>
		
		<!-- 화면 중앙에 이미지를 보여준다. -->
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				
				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">
						<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
						<img class="img-responsive center-block" src="${contextPath}/resources/images/bada1.jpg" width="80%" height="200px"/>
						<!-- carousel에 설명을 달아준다. -->
						<div class="carousel-caption">
							<h2>바다 1</h2>
						</div>
					</div> 
					<div class="item">
						<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
						<img class="img-responsive center-block" src="${contextPath}/resources/images/bada2.jpg" width="80%" height="200px"/>
						<!-- carousel에 설명을 달아준다. -->
						<div class="carousel-caption">
							<h2>바다 2</h2>
						</div>
					</div> 
					<div class="item">
						<!-- class="img-responsive center-block" : 반응형 이미지를 가운데 정렬한다. -->
						<img class="img-responsive center-block" src="${contextPath}/resources/images/bada3.jpg" width="80%" height="200px"/>
						<!-- carousel에 설명을 달아준다. -->
						<div class="carousel-caption">
							<h2>바다 3</h2>
						</div>
					</div> 
				</div>
				
				<!-- 좌측, 우측으로 그림을 움직일 수 있도록 좌/우버튼을 설정한다. -->
				<a class="left  carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		
		<!-- 푸터영역 -->
		<jsp:include page="common/footer.jsp" flush="false"/>
	</body>
</html>