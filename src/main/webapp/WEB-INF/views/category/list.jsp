<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/24
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>
    <title>Category List</title>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>


<%
    while(rs.next()){
%>
    <h1><%=rs.getString("name")%></h1>
    <a href='/예약.jsp?열차ID=<%=rs.getInt("id")%>'>예약</a>
<%
    }
%>

<div class="container-fluid">
    <h1>Category List</h1>
    <table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">Category ID</th>
            <th scope="col">Icon</th>
            <th scope="col">Color</th>
            <th scope="col" class="d-flex justify-content-between align-items-end">
                <div>Category Name</div>
                <a href="${ctx}/category/createForm" class="btn btn-success">Create</a>
            </th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${categoryList}" var="category">
        <tr class="table-primary">
            <td>${category.category_id}</td>
            <td>${category.icon}</td>
            <td>${category.color}</td>
            <td class="d-flex justify-content-between">${category.name}
                <div>
                    <a href="${ctx}/category/updateForm?id=${category.category_id}" class="btn btn-primary me-2">update</a>
                    <a href="${ctx}/category/delete?id=${category.category_id}" class="btn btn-danger">delete</a>
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
