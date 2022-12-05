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
</head>
<body>

<jsp:include page="../common/topMenu.jsp" flush="false"/>

<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-5" style="margin-top: 30px;">
						<h2>배송지 목록</h2>
					</div>
				</div>
				<table class="table table-bordered table-striped table-hover" >
				<c:forEach var="addr" items="${address}">
				<tr>
					<td align="center">${addr.id}</td>
					<td align="center">${addr.address}</td>
				</tr>
				</c:forEach>
				</table>
				<div class="form-group" style="margin-top: 50px;">
					<label for="id" class="form-label">주소</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="id" name="id" maxlength="20" value="${address.address}" readonly/>
					</div>
				</div>
		
		</div>
	</div>
</div>
<!-- 하단 메뉴 -->
<jsp:include page="../common/footer.jsp" flush="false"/>

</body>
</html>