<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 리뷰</title>
	
</head>
<body>

<%
if(session.getAttribute("isLogOn") == null || session.getAttribute("isLogOn").equals("")) {
	response.sendRedirect("/user/signIn");
}
%>

<jsp:include page="../common/header.jsp" flush="false"/>
<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
			<div>
			<h3 style="margin: 25px;">리뷰 목록</h3>
				<form class="form-horizontal" id="frm">
					<div class="form-group">
						<button type="button" class="btn btn-sm btn-outline-primary" onclick="location.href='/review/reviewRegisterForm?user_id=${user.user_id}'" style="margin-left: 25px; margin-bottom: 25px;">
							리뷰 작성
						</button>
					</div>
				</form>
			</div>
		<table class="table table-bordered table-striped table-hover" style="width: 80%; margin-left: 25px; ">
		<thead>
			<tr class="info">
				<th>no</th>
				<th class="col-sm-2 text-center">상품</th>
				<th class="col-sm-1 text-center">상품명</th>
				<th class="col-sm-2 text-center">제목</th>
				<th class="col-sm-3 text-center">내용</th>
				<th class="col-sm-1 text-center">평점</th>
				<th class="col-sm-2 text-center">등록일자</th>
				<th class="col-sm-2 text-center">댓글</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="review" items="${reviewList}">	
					<tr>
						<td align="center">${review.review_no}</td>
						<td align="center"><c:if test="${review.img_url != null}"><img src="${review.img_url}" width="50" height="50"/></c:if></td>
						<td align="center">${review.item_name}</td>
						<td align="center"><a href="${ctx}/review/reviewDetail?review_no=${review.review_no}">${review.subject}</a></td>
						<td align="center">${review.content}</td>
						<td align="center">${review.rating}</td>
						<td align="center"><fmt:formatDate value="${review.reg_date}" pattern="MM월 dd일 a hh시 mm분"/></td>
						<td align="center" onclick="location.href='/review/detailComment/${review.review_no}'">
						댓글<c:if test="${review.cnt > 0}" ><span style="color: #6495ED;">(${review.cnt})</span></c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>