<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>개인정보 확인/수정</title>
</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="../common/topMenu.jsp" flush="false"/>
	
<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
		<nav class="nav navbar-nav" id="c1">
			<!-- nav-pills 영역안에서 가로로 펼쳐짐, 세로메뉴 하려면 nav-stacked필요 -->
			<ul class="nav nav-pills justify-content-around">
				<li><div><h2>배송중</h2><h1><a href="#">0</a></h1></div></li>
				<li><div><h2>쿠폰</h2><h1><a href="#">0</a></h1></div></li>
				<li><div><h2>리뷰</h2><h1><a href="#">0</a></h1></div></li>
			</ul>
		</nav>
	<form class="form-horizontal" method="post" name="memModifyForm" action="${contextPath}/member/modifyMember.do" style="margin-left: 30%;">
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5" style="margin-top: 30px;">
				<h2>개인정보 확인/수정</h2>
			</div>
		</div>
		<div class="form-group" style="margin-top: 50px;">
			<label for="id" class="form-label">아이디</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="id" name="id" maxlength="20" value="${member.id}" readonly/>
			</div>
		</div>
		<div class="form-group">
			<label for="id" class="form-label">비밀번호</label>
			<div class="col-sm-5">
				<input type="password" class="form-control" id="pwd" name="password" maxlength="20" value="${member.password}"/>
			</div>
		</div>
		<div class="form-group">
			<label for="id" class="form-label">비밀번호 확인</label>
			<div class="col-sm-5">
				<input type="password" class="form-control" id="repwd" name="repwd" maxlength="20" value="${member.password}"/>
			</div>
		</div>
		<div class="form-group">
			<label for="id" class="form-label">이  름</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="name" name="name" maxlength="50" value="${member.name}"/>
			</div>
		</div>
		<div class="form-group">
			<label for="id" class="form-label">이메일</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="email" name="email" maxlength="20" value="${member.email}"/>
			</div>
		</div>
		<div class="form-group">
			<label for="id" class="form-label">주소</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="address" name="address" maxlength="50" value="${member.address}"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-4">
				<button type="reset"  class="btn">다시 입력</button>
				<button type="submit" class="btn">회원 정보 수정</button>
			</div>
		</div>
	</form>
	</div>
	</div>
</div>
	
<!-- 푸터 -->
<jsp:include page="../common/footer.jsp" flush="false"/>
	
</body>
</html>









