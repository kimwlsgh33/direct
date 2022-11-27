<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/27
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <h1>Upload Result</h1>
<%--    <p>File Name : ${fileName}</p>--%>
    <c:choose>
        <c:when test="${not empty uuid}">
            <p>File Name : ${uuid}</p>
        </c:when>
        <c:otherwise>
            <p>File Name : No File</p>
        </c:otherwise>
    </c:choose>
</div>
