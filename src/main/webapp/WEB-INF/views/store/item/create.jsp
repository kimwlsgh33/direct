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
    <title>Item Create</title>
    <style>
        iframe {
            background-color: lightgoldenrodyellow;
        }
    </style>
</head>
<body>
<jsp:include page="../../common/header.jsp" flush="false"/>
<div class="container-fluid d-flex flex-column align-items-center p-4">
    <h1 class="mb-3">Item Create</h1>
    <form method="post" class="w-50 bg-light shadow p-3 rounded-4" onsubmit="create()">
        <div class="w-100 d-flex justify-content-between mb-3">
            <div class="pe-2">상품명 : </div>
            <input type="text" id="name" name="name" class="me-3">
        </div>
        <div class="w-100 d-flex justify-content-between mb-3">
            <div class="pe-2">가격 : </div>
            <input type="text" id="icon" name="icon" class="me-3">
        </div>
        <div class="w-100 d-flex justify-content-between">
            <div class="pe-2">상세설명 : </div>
            <input type="text" id="desc" name="desc" class="me-3">
        </div>
        <div class="w-100 d-flex justify-content-between">
            <div class="pe-2">상품재고 : </div>
            <input type="text" id="quantity" name="quantity" class="me-3">
        </div>
        <div class="w-100 d-flex justify-content-between">
            <div class="input-group mb-3">
                <label class="input-group-text" for="inputGroupSelect01">판매상태</label>
                <select class="form-select" id="inputGroupSelect01">
                    <option value="1" selected>판매중</option>
                    <option value="2">판매중지</option>
                </select>
            </div>
        </div>
        <div class="w-100">
            <div class="pe-2">상품 이미지</div>
            <%--페이지를 넘기지 않고, iframe에서 결과를 받는다.--%>
            <form class="form-horizontal" action="${ctx}/util/upload/uploadForm" method="post" enctype="multipart/form-data" target="iframe1">
                <div class="form-group d-flex">
                    <div>
                        <input type="file" class="btn btn-warning" name="file">
                        <input type="submit" class="btn btn-primary" name="Upload">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <iframe name="iframe1" src="" class="container-fluid">
                        </iframe>
                    </div>
                </div>
            </form>
        </div>

        <input type="submit" value="Create" onclick="create()" class="btn btn-success">
    </form>
</div>
<jsp:include page="../../common/footer.jsp" flush="false"/>
</body>
<script>
    $(document).ready(function () {
        $('input[id=name]').focus();

        let imgBox = $('#imgBox');
        imgBox.on('drag', function () {
            alert("ImgBox Click");
        });
    });
    const create = () => {
        let name = $("#name").val();
        let icon = $("#icon").val();
        let color = $("#color").val();

        $.ajax({
            type: "POST",
            url: "/store/category/create",
            data: {name: name, icon: icon, color: color},
            success: function (data) {
                alert("success");
                location.href = "${ctx}/store/category/list";
            },
            error: function (errMsg) {
                alert("error : " + errMsg);
            }
        });
    }
</script>
</html>
