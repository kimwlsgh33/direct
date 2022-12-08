<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ page import="java.util.*" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰 상세 정보</title>
	<script src="${contextPath}/resources/js/review.js"></script>
</head>
<body>

<!-- 상단 메뉴 -->
<jsp:include page="../common/topMenu.jsp" flush="false"/>

<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
	<form class="form-horizontal" id="frm" style="margin-left: 30%;">
			<div>
		<div class="form-group" style="height: 50px; margin-top: 30px;">
			<div class="col-sm-offset-2 col-sm-5">
				<h2>리뷰 상세 정보</h2>
			</div>
		</div>
		<div class="form-group" style="margin-top: 10px;">
			<label for="subject" class="form-label">제  목</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="subject" name="subject" maxlength="200" value="${reviewDetail.subject}" readonly/>
			</div>
		</div>
		<div class="form-group">
			<label for="subject" class="form-label">작성일자</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" id="reg_date" name="reg_date" value="<fmt:formatDate value='${reviewDetail.reg_date}' pattern='yyyy년 MM월 dd일 a hh시 mm분'/>" readonly/>
			</div>
		</div>
		<div class="form-group">
			<label for="subject" class="form-label">상품명</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="item_name" name="item_name" maxlength="20" value="${reviewDetail.item_name}" readonly/>
			</div>
		</div>
		<div class="form-group">
			<label for="subject" class="form-label">평점</label>
			<div class="col-sm-3">
				<input type="text" class="form-control" id="rating" name="rating" maxlength="20" value="${reviewDetail.rating}" readonly/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-3">
				<input type="hidden" class="form-control" id="user_id" name="user_id" maxlength="20" value="${reviewDetail.user_id}" readonly/>
			</div>
		</div>
		<div class="form-group">
			<label for="subject" class="form-label">내 용</label>
			<div class="col-sm-5">
				<textarea rows="8" cols="160" class="form-control" id="content" name="content" readonly>${reviewDetail.content}</textarea>
			</div>
		</div>
		<div class="form-group"  style="margin-top: 20px;">
			<button type="button" class="btn btn-sm btn-outline-success" onclick="location.href='${contextPath}/review/reviewList'">
					게시글 목록
			</button>
			<button type="button" class="btn btn-sm btn-outline-success" onclick="fn_reviewUpdateForm(${reviewDetail.review_no})">
				게시글 수정
			</button>
			<button type="button" class="btn btn-sm btn-outline-success" onclick="fn_reviewDelete(${reviewDetail.review_no})">
				게시글 삭제
			</button>
		</div>
		</div>
	</form>
		</div>
		</div>
</div>

<!-- 하단 메뉴 -->
<div class="container" style="margin-top: 120px;">
<jsp:include page="../common/footer.jsp" flush="false"/>
</div>

</body>
</html>