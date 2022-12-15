<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
</head>
<body>

<jsp:include page="../common/header.jsp" flush="false"/>

<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
			<div style="margin-left: 20%; margin-top: 30px;">
				<div class="row justify-content-between">
					<h2 class="col-md-4">쿠폰 목록</h2>
				</div>
				<!-- 쿠폰번호 입력하는 영역 -->
				<div class="col-sm-6" style="margin-top: 20px;">
					<label class="form-label">댓글</label>
					<form name="couponInsertForm">
						<div class="input-group">
							<input type="hidden" id="user_id" name="user_id" value="${user.user_id}"/>
							<input type="text" class="form-control" id="coupon_id" name="coupon_id" placeholder="쿠폰번호를 입력하십시오"/>
							<span class="input-group-btn">
								<button class="btn btn-outline-success" type="button" name="couponInsertBtn">등록</button>
							</span>
						</div>
					</form>
				</div>
				<!-- 저장된 쿠폰목록을 보여주는 영역 -->
				<div class="container">
					<div class="couponList"></div>
					<jsp:include page="couponAction.jsp" flush="false"/>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- href="${contextPath}/util/address" -->
<!-- 하단 메뉴 -->

</body>
</html>