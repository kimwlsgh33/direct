<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 완료!</title>
	</head>
	<body>
		<jsp:include page="../common/header.jsp" flush="false"/>
		
		<div class="container">
			<form class="form-horizontal">
				<div>
					<h1>회원가입이 완료되었습니다!</h1><br><br>
					<h2>로그인 해주세요~</h2>
				</div>
			</form>
		</div>
		
		
		
		<jsp:include page="../common/footer.jsp" flush="false"/>
	</body>
</html>