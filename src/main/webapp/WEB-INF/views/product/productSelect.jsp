<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 상품 보기</title>
</head>
<body>

<jsp:include page="../common/topMenu.jsp" flush="false"/>
<div class="container">
	<div class="row">
<jsp:include page="../common/sideMenu.jsp" flush="false"/>
	<div class="col-sm-10" id="top" style="height: 50px;">
		<nav class="nav navbar-nav" id="c1">
			<!-- nav-pills 영역안에서 가로로 펼쳐짐, 세로메뉴 하려면 nav-stacked필요 -->
			<ul class="nav nav-pills justify-content-around">
				<li><div><h2>배송중</h2><h1><a href="#">0</a></h1></div></li>
				<li><div><h2>쿠폰</h2><h1><a href="#">0</a></h1></div></li>
				<li><div><h2>리뷰</h2><h1><a href="#">0</a></h1></div></li>
			</ul>
		</nav>
		<h3 style="padding-left: 25px; margin-top: 30px;">${member.id}님의 주문 상품</h3>
		<table class="table table-bordered table-striped table-hover" style="width: 70%; margin-left: 25px; margin-top: 20px;">
			<tr class="info">
				<td align="center" width="60"><b>상품 번호</b></td>
				<td align="center" width="60"><b>주문 번호</b></td>
				<td align="center" width="120"><b>상품 이름</b></td>
				<td align="center" width="60"><b>상품 가격</b></td>
				<td align="center" width="60"><b>상품 개수</b></td>
			</tr>
			<c:forEach var="p" items="${product}">	
			<tr>
				<td align="center">${p.product_no}</td>
				<td align="center">${p.order_product_no}</td>
				<td align="center">${p.order_product_name}</td>
				<td align="center">${p.order_product_price}</td>
				<td align="center">${p.order_product_count}</td>
			</tr>
			</c:forEach>
		</table>
	<div class="col-sm-9" style="margin-left: 25px;">
		<h4 style="margin-left:15px;">2022.11.18</h4>
		<div class="row justify-content-center">
			<div class="col-sm-7">
				<span>배송완료</span>
				<span class="btn" id ="modalbtn" data-toggle="modal" data-target="#mymodal"><i class="bi bi-three-dots-vertical"></i></span>
				<div class="col-md-10 row justify-content-start">
					<div class="col-md-3">
						<span>사진</span>
					</div>
					<div class="col-md-6">
						<p>${product[0].order_product_name}</p><br>
						<form class="form-horizontal" method="get" name="product" action="${contextPath}/product/productSelect">
							<input type="hidden" name="id" value="${member.id}"/>
							<p>${product[0].order_product_price}원, ${product[0].order_product_count}개</p>
							<button class="btn">장바구니 담기</button>
						</form>
					</div>
				</div>
			</div>
			<span class="col-sm-2">
				<button class="btn" id="bucket">배송조회</button>
				<button class="btn" id="bucket">교환 반품 신청</button>
			</span>
		</div>
	</div>
	</div>
	</div>
</div>
<!-- 푸터영역 -->
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>