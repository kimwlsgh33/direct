<%@ page import="java.util.*" %>
<%@ page import="com.mysql.cj.conf.ConnectionUrlParser" %><%--
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
    request.setCharacterEncoding("UTF-8");
    ArrayList<Map.Entry> list = new ArrayList<Map.Entry>();
    list.add(new AbstractMap.SimpleEntry("상점이름", "name"));
    list.add(new AbstractMap.SimpleEntry("상점주소", "address"));
    list.add(new AbstractMap.SimpleEntry("상점사진", "store_img_url"));
    list.add(new AbstractMap.SimpleEntry("전화번호", "phone"));
    list.add(new AbstractMap.SimpleEntry("소개글", "introduce"));
    list.add(new AbstractMap.SimpleEntry("운영시간", "business_hour"));
    list.add(new AbstractMap.SimpleEntry("휴무일", "holiday"));
%>
<head>
    <title>Item Create</title>
    <style>
        .has-error .form-control {
            border-color: #a94442;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 6px rgba(169, 68, 66, .6);
        }

        .error-div {
            color: #a94442;
            margin-top: 5px;
            font-size: 12px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
<div class="container-fluid d-flex flex-column align-items-center p-4">
    <h1 class="mb-3">Store Create</h1>
    <form class="w-50 bg-light shadow p-3 rounded-4">

        <c:forEach var="column" items="<%=list%>">
            <div id="${column.value}-div" class="input-group mt-3">
                <label for="${column.value}" class="input-group-text">${column.key}</label>
                <input type="text" class="form-control" id="${column.value}" name="${column.value}">
            </div>
        </c:forEach>
        <select id="selectCategory" class="form-select mt-3" aria-label="Select Category">
            <option selected>메인 카테고리 선택</option>
            <c:forEach var="category" items="${categoryList}">
                <option value="${category.category_id}" class="dropdown-item">${category.name}</option>
            </c:forEach>
        </select>

        <button onclick="create()" id="btn_submit" class="btn btn-success mt-3">Create</button>
    </form>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
<script>
    $(document).ready(function(){
        $("form").submit(function(e){
            e.preventDefault();
        });
    })

    const reset_div = () => {
        $("div[id$='-div']").removeClass("has-error");
        $(".error-div").remove();
    }

    const create = () => {
        const name = $("#name");
        const address = $("#address");
        const phone = $("#phone");
        reset_div();

        if(name.val() === "") {
            const error = '<div class="error-div">상점이름을 입력해주세요</div>';
            const parent = name.parent();
            parent.after(error);
            parent.addClass("has-error");

            name.get(0).scrollIntoView(true);
            name.focus();
            return;
        } else if(address.val() === "") {
            const error = '<div class="error-div">주소를 입력해주세요</div>';
            const parent = address.parent()
            parent.after(error);
            parent.addClass("has-error");

            address.get(0).scrollIntoView(true);
            address.focus();
            return;
        } else if(phone.val() === "") {
            const error = '<div class="error-div">전화번호를 입력해주세요</div>';
            const parent = phone.parent();
            parent.after(error);
            parent.addClass("has-error");

            phone.get(0).scrollIntoView(true);
            phone.focus();
            return;
        }

        const selectCategory = $('#selectCategory');

        if(selectCategory.val() === "메인 카테고리 선택") {
            //alert("카테고리를 선택해주세요");
            const error = '<div class="error-div">카테고리를 선택해주세요</div>';
            selectCategory.after(error);
            selectCategory.focus();
            return;
        }


        // select 가져와서, value값을 form에 추가
        const selected = selectCategory.find("option:selected");
        const categoryInput = document.createElement('input');
        categoryInput.setAttribute('type', 'hidden');
        categoryInput.setAttribute('name', 'category_id');
        categoryInput.setAttribute('value', selected.val());

        const form = document.querySelector('form');
        form.appendChild(categoryInput);
        form.action = '/store/create';
        form.method = 'post';
        form.submit();
        alert("success");
    }

</script>
</html>
