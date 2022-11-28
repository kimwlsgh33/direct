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

<div class="container">
	<div class="row">
		<div class="col-sm-10" id="top">
			<form class="form-horizontal" method="get" name="product" action="${contextPath}/product/productSelect">
			<input type="hidden" name="id" value="${member.id}"/>
			<h3 style="margin:25px;">상품 목록</h3>
			<button class="btn btn-sm btn-outline-success" style="margin-left: 25px; margin-bottom: 25px;">자세히 보기</button>
			</form>
			<table class="table table-bordered table-striped table-hover" style="width: 95%; margin-left: 25px; ">
				<tr class="info">
					<td align="center" width="60"><b>상품 번호</b></td>
					<td align="center" width="60"><b>주문 번호</b></td>
					<td align="center" width="120"><b>상품 이름</b></td>
					<td align="center" width="60"><b>상품 가격</b></td>
					<td align="center" width="60"><b>상품 개수</b></td>
				</tr>
			<c:forEach var="p" items="${productLists}">	
				<tr>
					<td align="center">${p.product_no}</td>
					<td align="center">${p.order_product_no}</td>
					<td align="center">${p.order_product_name}</td>
					<td align="center">${p.order_product_price}</td>
					<td align="center">${p.order_product_count}</td>
				</tr>
			</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
</html>