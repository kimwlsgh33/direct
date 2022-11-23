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

<div class="container">
	<h3 style="margin-left:10px;">${member.id}님의 주문 상품</h3>
	<table class="table table-bordered table-striped table-hover" style="width: 75%; margin-left:10px;">
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
	<div class="col-sm-8">
			<h3 style="margin-left:15px;">2022.11.18</h3>
		<div class="col-sm-7">
			<span>배송완료</span>
			<span class="btn" id ="modalbtn" data-toggle="modal" data-target="#mymodal"><i class="bi bi-three-dots-vertical"></i></span>
			<div class="col-md-10">
				<div class="col-md-3">
					<span>사진</span>
				</div>
				<div class="col-md-7">
					<p>${product[0].order_product_name}</p><br>
					<span class="btn" id="bucket2">장바구니 담기</span>
					<p>${product[0].order_product_price}, ${product[0].order_product_count}개</p>
				</div>
			</div>
		</div>
		<div>
			<span class="col-sm-2">
				<button class="btn" id="bucket">배송조회</button>
				<button class="btn" id="bucket">교환 반품 신청</button>
			</span>
		</div>
	</div>
	<div class="col-sm-8">
			<h3 style="margin-left:15px;">2022.11.18</h3>
		<div class="col-sm-7">
			<span>배송완료</span>
			<span class="btn" id ="modalbtn" data-toggle="modal" data-target="#mymodal"><i class="bi bi-three-dots-vertical"></i></span>
			<div class="col-md-10">
				<div class="col-md-3">
					<span>사진</span>
				</div>
				<div class="col-md-7">
					<p>${product[1].order_product_name}</p><br>
					<span class="btn" id="bucket2">장바구니 담기</span>
					<p>${product[1].order_product_price}, ${product[1].order_product_count}개</p>
				</div>
			</div>
		</div>
		<div>
			<span class="col-sm-2">
				<button class="btn" id="bucket">배송조회</button>
				<button class="btn" id="bucket">교환 반품 신청</button>
			</span>
		</div>
	</div>
</div>
</div>
</div>
<!-- 티켓구매 모달창 구현 -->
<div class="modal fade" id="mymodal" role="dialog">
	<div class="modal-dialog">
		<!-- modal content -->
		<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
						<h4>주문내역 삭제</h4>
				</div>
				<div class="modal-body">
					<h3>삭제하시겠습니까?</h3>
				</div>
				<div class="modal-footer">
					<button type="reset" class="btn pull-left" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> 삭제
					</button>
					<button type="reset" class="btn pull-left" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cansel
					</button>
					<p>Need <a href="#">Help?</a></p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>