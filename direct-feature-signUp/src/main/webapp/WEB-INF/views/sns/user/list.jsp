<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/16
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Member List</title>
</head>
<body>
    <h1>Member List</h1>
    <div class="container">
        <c:forEach var="memeber" items="${memberList}">
            <ul>
                <li>${user.id}</li>
                <li>${user.username}</li>
                <li>${user.password}</li>
                <li>${user.email}</li>
                <li>${user.mobile}</li>
            </ul>
        </c:forEach>
    </div>
</body>
</html>
