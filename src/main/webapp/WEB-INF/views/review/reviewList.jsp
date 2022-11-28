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
	<form class="form-horizontal" id="frm">
		<div>
			<h3 style="margin: 25px;">리뷰 목록</h3>
			<div class="form-group">
					<button type="button" class="btn" onclick="location.href='/review/reviewRegisterForm'" style="margin-left: 20px;">
						리뷰 작성
					</button>
			</div>
		</div>
		<table class="table table-bordered table-striped table-hover" style="width: 70%; margin-left: 25px; ">
		<thead>
			<tr class="info">
				<th class="col-sm-1 text-center">no</th>
				<th class="col-sm-1 text-center">아이디</th>
				<th class="col-sm-2 text-center">제목</th>
				<th class="col-sm-3 text-center">내용</th>
				<th class="col-sm-1 text-center">상품번호</th>
				<th class="col-sm-3 text-center">등록일자</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${reviewList}">	
					<tr>
						<td align="center">${review.review_no}</td>
						<td align="center">${review.id}</td>
						<td align="center"><a href="${contextPath}/review/reviewDetail?review_no=${review.review_no}">${review.subject}</a></td>
						<td align="center">${review.content}</td>
						<td align="center">${review.product_no}</td>
						<td align="center"><fmt:formatDate value="${review.reg_date}" pattern="yyyy년 MM월 dd일 a hh시 mm분"/></td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</form>
</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>