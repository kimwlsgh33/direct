<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.AbstractMap" %><%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/24
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    ArrayList<String> list = new ArrayList<String>();
    list.add("상점ID");
    list.add("상점이름");
    list.add("상점주소");
    list.add("상점사진");
    list.add("전화번호");
    list.add("소개글");
    list.add("평점");
    list.add("리뷰수");
    list.add("즐겨찾기수");
    list.add("운영시간");
    list.add("휴무일");
    list.add("상태");
%>
<html>
<head>
    <title>Store List</title>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>

<div class="container-fluid">
    <h1>Store List</h1>
    <table class="table table-striped">
    <thead>
        <tr>
            <c:forEach items="<%=list%>" var="item">
                <th>${item}</th>
            </c:forEach>
            <th scope="col" class="d-flex justify-content-between align-items-end">
                <div>category_id</div>
                <a href="${ctx}/store/createForm" class="btn btn-success">Create</a>
            </th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${storeList}" var="store">
        <tr class="table-primary">
            <td>${store.store_id}</td>
            <td><a href="${ctx}/store/detail?store_id=${store.store_id}">${store.name}</a></td>
            <td>${store.address}</td>
            <td>${store.store_img_url}</td>
            <td>${store.phone}</td>
            <td>${store.introduce}</td>
            <td>${store.rating}</td>
            <td>${store.favorite_count}</td>
            <td>${store.review_count}</td>
            <td>${store.business_hour}</td>
            <td>${store.holiday}</td>
            <td>${store.status}</td>
            <td class="d-flex justify-content-between">${store.name}
                <div>
                    <a href="${ctx}/store/updateForm?store_id=${store.store_id}" class="btn btn-primary me-2">update</a>
                    <a href="${ctx}/store/delete?store_id=${store.store_id}" class="btn btn-danger">delete</a>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>
