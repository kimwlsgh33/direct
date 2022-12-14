<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
    <title>noSearch</title>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    <div class="h-75 container-fluid d-flex justify-content-center align-items-center flex-column text-center">
                <h4 style="font-size: large">검색 결과가 입력되지 않았습니다.</h4>
                <p style="font-size: small">정확한 검색어를 입력하여 다시 입력해주세요</p>
    </div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
