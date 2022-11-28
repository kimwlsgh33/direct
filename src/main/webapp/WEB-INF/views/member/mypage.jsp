<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 전체 목록</title>
	
</head>
<body>

<%
if(session.getAttribute("isLogOn") == null || session.getAttribute("isLogOn").equals("")) {
	response.sendRedirect("/member/loginForm.do");
}
%>

<div class="container">
	<div class="col-sm-9">
			<h4 style="margin-left:15px;">2022.11.18</h4>
		<div class="row justify-content-center">
		<div class="col-sm-7">
			<span>배송완료</span>
			<span class="btn" data-toggle="modal" data-target="#mymodal"><i class="bi bi-three-dots-vertical"></i></span>
			<div class="col-md-10 row justify-content-start">
				<div class="col-md-3">
					<span>사진</span>
				</div>
				<div class="col-md-6">
					<p>${member.name}</p><br>
					<form class="form-horizontal" method="get" name="product" action="${contextPath}/product/productSelect">
						<input type="hidden" name="id" value="${member.id}"/>
						<p>150,000원 1개</p>
						<button id="detail" class="btn btn-sm btn-outline-success">상세보기</button>
					</form>
				</div>
			</div>
		</div>
			<span class="col-sm-2" style="margin-top: 40px;">
				<button class="btn btn-outline-success" id="bucket">배송조회</button>
				<button class="btn btn-outline-success" id="bucket">교환/반품</button>
			</span>
		</div>
	</div>
</div>
<!-- 모달창 구현 -->
<div class="modal fade" id="mymodal" role="dialog" aria-labelledby="mymodalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
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




