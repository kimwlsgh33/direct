<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<style>
    table {
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 5px;
    }
</style>
<body>
<%--상단 메뉴--%>
<jsp:include page="../common/topMenu.jsp" flush="false"/>

<div class="container">
    <form class="form-horizontal" id="frm">
        <div class="form-group">

            <div class="col-sm-6">
                <input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요">
            </div>
            <div class="col-sm-2">
                <button type="button" class="btn btn-primary" id="btnSearch">검색</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2">
                <select class="form-control" id="searchType" name="searchType">
                    <option value="date">최신순</option>
                    <option value="click">조회순</option>
                    <option value="comment">댓글순</option>
                    <option value="review">평점순</option>
                    <option value="price">가격순</option>
                </select>
            </div>
        </div>
    </form>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>제품이름</th>
            <th>제품</th>
            <th>올린 날짜</th>
            <th>조회수</th>
            <th>가격</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${searchList}">
            <tr>
                <td>${list.product_name}</td>
                <td><a href="${contextPath}/list/listDetail?seq=${list.product_num}">${list.product_image}</a></td>
                <td>${list.product_date}</td>
                <td>${list.click_count}</td>
                <td>${list.product_price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>
</body>
</html>
