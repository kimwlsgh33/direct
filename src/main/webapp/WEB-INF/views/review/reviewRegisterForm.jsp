<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰 등록 화면</title>
	<script src="${contextPath}/resources/js/review.js"></script>
	<% // wepapp 밑의 resouces를 의미함%>
</head>
<body>

<!-- 상단 메뉴 -->
<jsp:include page="../common/topMenu.jsp" flush="false"/>
<div class="container">
	<div class="row">
	<jsp:include page="../common/sideMenu.jsp" flush="false"/>

<div class="container">
	<form class="form-horizontal" name="reviewRegisterForm">
		<div class="form-group" style="height: 50px;">
			<div class="col-sm-offset-2 col-sm-5">
				<h2 align="center">리뷰 등록</h2>
			</div>
		</div>
		<div class="form-group" style="height: 50px;">
			<label class="col-sm-2 control-label">제	목</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="subject" name="subject" maxlength="200" placeholder="제목을 입력하세요."/>
			</div>
		</div>
		<div class="form-group" style="height: 50px;">
			<label class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id=id name="id" maxlength="20" placeholder="아이디를 입력하세요."/>
			</div>
		</div>
		<div class="form-group" style="height: 50px;">
			<label class="col-sm-2 control-label">상품 번호</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="product_no" name="product_no" maxlength="20" placeholder="상품번호를 입력하세요."/>
			</div>
		</div>
		<div class="form-group" style="height: 50px;">
			<label class="col-sm-2 control-label">내	용</label>
			<div class="col-sm-5">
				<textarea  class="form-control" id="content" name="content" rows="10" cols="160" placeholder="내용을 입력하세요"></textarea>
			</div>
		</div>
		<div class="form-group" style="height: 50px;">
			<div class="col-sm-offset-2 col-sm-5">
				<button type="reset" class="btn">다시 입력</button>
				<button type="button" class="btn" onclick="fn_reviewRegister();">리뷰 등록</button>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<!-- 하단 메뉴 -->
<jsp:include page="../common/footer.jsp" flush="false"/>

</body>
</html>