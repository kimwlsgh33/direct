<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글</title>
</head>
<body>

<jsp:include page="../common/topMenu.jsp" flush="false"/>
<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
			<div>
			<form class="form-horizontal"  style="margin-left: 30%;" action="/review/insertProc" method="post">
			<div id="review">
			<a style="font-size: 30px;" data-bs-toggle="collapse" href="#collapseDetail" aria-expanded="false">리뷰 상세정보</a>
			</div>
			<div class="collapse" id="collapseDetail">
				<div class="form-group" style="margin-top: 10px;">
					<label for="subject" class="form-label">제  목</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="subject" name="subject" maxlength="200" value="${detail.subject}" readonly/>
					</div>
				</div>
				<div class="form-group">
					<label for="subject" class="form-label">상품명</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="item_name" name="item_name" maxlength="20" value="${detail.item_name}" readonly/>
					</div>
				</div>
				<div class="form-group">
					<label for="subject" class="form-label">아이디</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="user_id" name="user_id" maxlength="20" value="${detail.user_id}" readonly/>
					</div>
				</div>
				<div class="form-group">
					<label for="subject" class="form-label">내 용</label>
					<div class="col-sm-5">
						<textarea rows="8" cols="160" class="form-control" id="content" name="content" readonly>${detail.content}</textarea>
					</div>
				</div>
			<!--<div class="btn-group btn-group-sm" role="group" style="margin-left: 10%; padding: 20px;">
					<button type="button" class="btn btn-sm btn-outline-success"    onclick="location.href='/review/delete/${detail.review_no}'">삭제</button>
					<button type="button" class="btn btn-sm btn-outline-success" onclick="location.href='/review/update/${detail.review_no}'">수정</button>
					<button type="button" class="btn btn-sm btn-outline-success" onclick="location.href='/review/reviewList'">목록</button>
				</div>
				-->
				</div>
				</form>
				
				<!-- 댓글을 입력하는 영역 -->
				<div class="col-sm-4" style="margin-left: 30%; margin-top: 20px;">
					<label for="comment" class="form-label">댓글</label>
					<form name="commentInsertForm">
						<div class="input-group">
							<input type="hidden" name="review_no" value="${detail.review_no}"/>
							<input type="text" class="form-control" id="content" name="content" placeholder="댓글을 입력하십시오"/>
							<span class="input-group-btn">
								<button class="btn btn-outline-success" type="button" name="commentInsertBtn">등록</button>
							</span>
						</div>
					</form>
				</div>
				<!-- 저장된 댓글을 보여주는 영역 -->
				<div class="container">
					<div class="commentList"></div>
				</div>
				<%@ include file="commentAction.jsp" %>
			</div>
		</div>
	</div>
</div>
<div class="container" style="margin-top: 400px;">
<jsp:include page="../common/footer.jsp" flush="false"/>
</div>
</body>
</html>