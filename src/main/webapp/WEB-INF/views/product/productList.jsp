<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>구매 상품 목록</title>
	
</head>
<body>

<%
if(session.getAttribute("isLogOn") == null || session.getAttribute("isLogOn").equals("")) {
	response.sendRedirect("/member/loginForm.do");
}
%>

<div class="container">
	<div class="row">
		<div class="col-sm-10" id="top">
			<c:forEach var="p" items="${productLists}">	
			<div class="col-sm-9" style="margin-left: 25px;">
				<div class="row justify-content-between" style="height: 30px;">
					<div class="col-md-4" style=" margin-top: 10px;">
						<h4 style="margin-left:15px;"><fmt:formatDate value="${p.order_date}" pattern="yyyy.MM.dd hh:mm"/></h4>
					</div>
					<div class="col-md-4" style=" margin-top: 10px;">
						<a class="btn btn-sm btn-outline-success" style="margin-left: 95px; "
						href="${contextPath}/product/productSelect?item_id=${p.item_id}">자세히 보기</a>
					</div>
				</div>
				<div class="row justify-content-center">
					<div class="col-sm-7">
						<div style="margin-left: 20px; margin-top: 10px;">
							<span>배송완료
							<span class="btn" data-bs-toggle="modal" data-bs-target="#mymodal"><i class="bi bi-three-dots-vertical"></i></span>
							</span>
						</div>
						<div class="col-md-10 row justify-content-start" style="margin-top: 15px;">
							<div class="col-md-3">
								<span><img src="${p.item_url}" width="100" height="100"/></span>
							</div>
							<div class="col-md-6">
								<p>${p.name}</p><br>
								<p>${p.price}원, ${p.count}개</p>
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

</body>
</html>