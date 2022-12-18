<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/25
  Time: 3:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>INDEX ADMIN</title>
</head>
<body>
<jsp:include page="common/header.jsp" flush="false"/>
<div class="container-fluid d-flex flex-column align-items-center gap-3 pt-3">
    <div class="w-75 d-flex justify-content-between rounded-3 shadow p-3">
        <h1>카테고리</h1>
        <div>
            <a href="${ctx}/category/createForm" class="btn btn-success">create</a>
            <a href="${ctx}/category/list" class="btn">list</a>
        </div>
    </div>
    <div class="w-75 d-flex justify-content-between rounded-3 shadow p-3">
        <h1>상품</h1>
        <div>
            <a href="${ctx}/item/createForm" class="btn btn-success">create</a>
            <a href="${ctx}/item/list" class="btn">list</a>
        </div>
    </div>
    <div class="w-75 d-flex justify-content-between rounded-3 shadow p-3">
        <h1>주문</h1>
        <div>
            <a href="${ctx}/order/createForm" class="btn btn-success">create</a>
            <a href="${ctx}/order/list" class="btn">list</a>
        </div>
    </div>
    <div class="w-75 d-flex justify-content-between rounded-3 shadow p-3">
        <h1>쿠폰</h1>
        <div>
            <a href="${ctx}/coupon/createForm" class="btn btn-success">create</a>
            <a href="${ctx}/order/list" class="btn">list</a>
        </div>
    </div>
</div>
<jsp:include page="common/footer.jsp" flush="false"/>
</body>
</html>