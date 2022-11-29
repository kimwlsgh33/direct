<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<jsp:include page="../common/headMenu.jsp" flush="false"/>
		<h3 style="padding-left: 25px; margin-top: 30px;">${member.id}님의 주문 상품</h3>
		<table class="table table-bordered table-striped table-hover" style="width: 75%; margin-left: 25px; margin-top: 20px;">
			<tr class="info">
				<td align="center" width="60"><b>상품 번호</b></td>
				<td align="center" width="60"><b>주문 번호</b></td>
				<td align="center" width="120"><b>상품 이름</b></td>
				<td align="center" width="60"><b>상품 가격</b></td>
				<td align="center" width="60"><b>상품 개수</b></td>
				<td align="center" width="60"><b>주문 날짜</b></td>
			</tr>
			<c:forEach var="p" items="${product}">	
			<tr>
				<td align="center">${p.product_no}</td>
				<td align="center">${p.order_product_no}</td>
				<td align="center">${p.order_product_name}</td>
				<td align="center">${p.order_product_price}</td>
				<td align="center">${p.order_product_count}</td>
				<td align="center"><fmt:formatDate value="${p.order_date}" pattern="yyyy.MM.dd hh:mm"/></td>
			</tr>
			</c:forEach>
		</table>
		<c:forEach var="p" items="${product}">	
			<div class="col-sm-9" style="margin-left: 25px;">
				<h4 style="margin-left:15px;"><fmt:formatDate value="${p.order_date}" pattern="yyyy.MM.dd hh:mm"/></h4>
				<div class="row justify-content-center">
					<div class="col-sm-7">
						<div style="margin-left: 20px; margin-top: 10px;">
							<span>배송완료
							<span class="btn" data-bs-toggle="modal" data-bs-target="#mymodal"><i class="bi bi-three-dots-vertical"></i></span>
							</span>
						</div>
						<div class="col-md-10 row justify-content-start" style="margin-top: 15px;">
							<div class="col-md-3">
								<span><img src="${p.order_product_url}" width="100" height="100"/></span>
							</div>
							<div class="col-md-6">
								<p>${p.order_product_name}</p><br>
								<input type="hidden" name="id" value="${member.id}"/>
								<p>${p.order_product_price}원, ${p.order_product_count}개</p>
								<button id="detail" class="btn btn-sm btn-outline-success" data-toggle="modal">장바구니 담기</button>
							</div>
						</div>
					</div>
					<span class="col-sm-2" style="margin-top: 45px;">
						<button class="btn btn-outline-success" id="bucket">배송조회</button>
						<button class="btn btn-outline-success" id="bucket">교환/반품</button>
					</span>
				</div>
			</div>
		</c:forEach>
	</div>
	</div>
</div>
<!-- 모달창 구현 -->
<div class="modal fade" id="mymodal" role="dialog" tabindex="-1" aria-hidden="true" >
	<div class="modal-dialog">
		<!-- modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="btn-close" data-bs-dismiss="modal">x</button>
				<h4 class="modal-title fs-5">주문내역 삭제</h4>
			</div>
			<div class="modal-body">
				<h3>삭제하시겠습니까?</h3>
			</div>
			<div class="modal-footer">
				<button type="reset" class="btn pull-left" data-bs-dismiss="modal">
					<i class="glyphicon glyphicon-remove"></i> 삭제
				</button>
				<button type="reset" class="btn pull-left" data-bs-dismiss="modal">
					<i class="glyphicon glyphicon-remove"></i> Cansel
				</button>
				<p>Need <a href="#">Help?</a></p>
			</div>
		</div>
	</div>
</div>

<!-- 푸터영역 -->
<div class="container" style="margin-top: 320px;">
<jsp:include page="../common/footer.jsp" flush="false"/>
</div>

</body>
</html>