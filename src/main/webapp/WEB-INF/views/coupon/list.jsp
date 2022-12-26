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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>쿠폰 List</title>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>

<div class="container-fluid">
    <h1>쿠폰 List</h1>
    <table class="table table-striped">
    <thead>
        <tr>
            <th scope="col">쿠폰 ID</th>
            <th scope="col">쿠폰 이름</th>
            <th scope="col">할인 가격</th>
            <th scope="col">할인 비율</th>
            <th scope="col">최소 주문 금액</th>
            <th scope="col">상태</th>
            <th scope="col" class="d-flex justify-content-between align-items-end">
                <div>소멸 날짜</div>
                <a href="${ctx}/coupon/createForm" class="btn btn-success">Create</a>
            </th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${couponList}" var="coupon">
        <tr class="table-primary">
            <td>${coupon.coupon_id}</td>
            <td>${coupon.name}</td>
            <td>${coupon.discount_price}</td>
            <td>${coupon.discount_rate}</td>
            <td>${coupon.min_price}</td>
            <td>
                <c:if test="${coupon.expired_date != null}">
                    <c:choose>
                        <c:when test="${coupon.expired_date > now}">
                            <span class="badge bg-success">사용가능</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-danger">만료</span>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </td>
            <td class="d-flex justify-content-between">
                <fmt:formatDate value="${coupon.expired_date}" pattern="yyyy-MM-dd"></fmt:formatDate>
                <div>
                    <a href="${ctx}/coupon/updateForm?coupon_id=${coupon.coupon_id}" class="btn btn-primary me-2">update</a>
                    <button class="btn btn-danger" onclick="deleteCoupon(${coupon.coupon_id})" >delete</button>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
<script>
    const deleteCoupon = (coupon_id) => {
        $.ajax({
            url: '${ctx}/coupon/delete',
            type: 'get',
            data: {
                coupon_id: coupon_id
            },
            success: function (data) {
                alert('삭제되었습니다.');
                location.href = '${ctx}/coupon/listAll';
            },
            error: function (error) {
                alert('삭제에 실패했습니다.');
            }
        })
    }
</script>
</html>
