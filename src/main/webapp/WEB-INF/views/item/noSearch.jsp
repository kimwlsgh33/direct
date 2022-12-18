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
    <jsp:include page="../common/categoryTop.jsp"/>
    <div class="h-75 container-fluid d-flex justify-content-center align-items-center flex-column text-center">
        <h4 style="font-size: large">검색 결과가 존재하지 않습니다.</h4>
        <p style="font-size: small">다른 검색어를 입력해주세요</p>
    </div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
