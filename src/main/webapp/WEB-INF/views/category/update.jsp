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
<% request.setCharacterEncoding("UTF-8"); %>
<head>
    <title>Category Update</title>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
<div class="container-fluid d-flex flex-column align-items-center p-4">
    <h1 class="mb-3">Category Update : ${category.category_id}</h1>
    <form method="post" class="w-50 bg-light shadow p-3 rounded-4 d-flex justify-content-between" onsubmit="create()">
        <input type="hidden" name="_method" value="put">
        <div>
            <div class="w-100 d-flex justify-content-between mb-3">
                <div class="pe-2">Category Name : </div>
                <input type="text" id="name" name="name" class="me-3" value="${category.name}">
            </div>
            <div class="w-100 d-flex justify-content-between mb-3">
                <div class="pe-2">Category Icon : </div>
                <input type="text" id="icon" name="icon" class="me-3" value="${category.icon}">
            </div>
            <div class="w-100 d-flex justify-content-between">
                <div class="pe-2">Icon Color : </div>
                <input type="text" id="color" name="color" class="me-3" value="${category.color}">
            </div>
        </div>
        <input type="submit" value="Update" onclick="update()" class="btn btn-primary">
    </form>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
<script>
    $(document).ready(function () {
        const main = $('input[name=name]');
        const end = main.val().length;
        main.selectionStart(end);
        main.focus();
    });
    const update = () => {
        let name = $("#name").val();
        let icon = $("#icon").val();
        let color = $("#color").val();
        let category_id = ${category.category_id};
        $.ajax({
            type: "POST",
            url: "/category/update",
            data: {category_id: category_id,name: name, icon: icon, color: color},
            success: function (data) {
                alert("success")
                location.href = "${ctx}/category/list";
            },
            error: function (errMsg) {
                alert("error : " + errMsg);
            }
        });
    }
</script>
</html>
