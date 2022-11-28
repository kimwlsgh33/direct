<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="container">
			<form class="form-horizontal" method="get" name="product" action="${contextPath}/product/productSelect">
			<input type="hidden" name="id" value="${member.id}"/>
			
			<h3 style="margin-left:10px;">주문 상품</h3>
			<button class="btn">내 상품 보기</button>
			<table class="table table-bordered table-striped table-hover" style="width: 75%; margin-left:10px;">
				<tr class="info">
					<td align="center" width="60"><b>상품 번호</b></td>
					<td align="center" width="60"><b>주문 번호</b></td>
					<td align="center" width="120"><b>상품 이름</b></td>
					<td align="center" width="60"><b>상품 가격</b></td>
					<td align="center" width="60"><b>상품 개수</b></td>
				</tr>
			<c:forEach var="product" items="${productLists}">	
				<tr>
					<td align="center">${product.product_no}</td>
					<td align="center">${product.order_product_no}</td>
					<td align="center">${product.order_product_name}</td>
					<td align="center">${product.order_product_price}</td>
					<td align="center">${product.order_product_count}</td>
				</tr>
			</c:forEach>
			</table>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>