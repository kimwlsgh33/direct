<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소지 목록</title>
<script src="${contextPath}/resources/js/address.js"></script>
</head>
<body>

<jsp:include page="../common/topMenu.jsp" flush="false"/>

<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
			<div style="margin-left: 20%; margin-top: 30px;">
				<div class="row justify-content-between">
					<h2 class="col-md-4">배송지 목록</h2>
					<div class="col-md-4" style="margin-right: 110px;">
						<a class="btn btn-sm btn-outline-success"
						href="${contextPath}/util/address">배송지 추가</a>
					</div>
				</div>
				<c:forEach var="addr" items="${address}">
					<div class="form-group" style="margin-top: 50px;">
						<label for="id" class="form-label">받는 사람</label>
						<div class="col-md-8">
							<input type="text" class="form-control" maxlength="20" value="${addr.receiver}" readonly/>
						</div>
						<label for="id" class="form-label">연락처</label>
						<div class="col-md-8">
							<input type="text" class="form-control" maxlength="20" value="${addr.phone}" readonly/>
						</div>
						<label for="id" class="form-label">우편번호</label>
						<div class="col-md-8">
							<input type="text" class="form-control" maxlength="20" value="${addr.zip_code}" readonly/>
						</div>
						<label for="id" class="form-label">주소</label>
						<div class="col-md-8">
							<input type="text" class="form-control" maxlength="20" id ="address" value="${addr.address}" readonly/>
						</div>
						<label for="id" class="form-label">상세주소</label>
						<div class="col-md-8">
							<input type="text" class="form-control" maxlength="20" value="${addr.address_detail}" readonly/>
						</div>
					</div>
					<button type="button" class="btn btn-sm btn-outline-success" onclick="fn_addressDelete(${addr.address_id})">
						주소 삭제
					</button>
					<button type="button" class="btn btn-sm btn-outline-success" onclick="fn_addressUpdate()">
						대표주소 설정
					</button>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<!-- href="${contextPath}/util/address" -->
<!-- 하단 메뉴 -->

</body>
</html>