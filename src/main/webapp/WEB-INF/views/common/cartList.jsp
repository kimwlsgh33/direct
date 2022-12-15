<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<div class="h-100" id="convertDiv">
    <c:choose>
        <c:when test="${empty cartList}">
            <div class="h-50 d-flex align-items-center  justify-content-center mb-2" >
                <p style="font-size: large">Add items to get started.</p>
            </div>
            <div class="d-flex justify-content-center">
                <button class="btn btn-primary disabled" type="submit">Complete Purchase</button>
            </div>
        </c:when>
        <c:otherwise>
            <div class=" d-flex justify-content-between">
                <div>
                <button class="btn" style="width: 90px; margin-bottom: 5px;" onclick="deleteAllCart(1)">전체 삭제</button>
                </div>
            </div>
                 <c:forEach items="${cartList}" var="cart">
                <div class="d-flex justify-content-between mb-2">
                    <div class="d-flex align-items-center">
<!--                        <img src="${cart.product_image}" alt="product" style="width: 50px; height: 50px">-->
                        <p class="ms-2">${cart.product_name}</p>
                    </div>
                    <div class="d-flex align-items-center">
                        <p class="me-2">${cart.product_price}</p>
                            <a id="${cart.item_id}" onclick="deleteCart(${cart.item_id})">
                                <i class="fas fa-circle-xmark"></i>
                            </a>
                    </div>
                </div>
                 </c:forEach>
            <div class= "d-flex justify-content-center">
                <button class="btn btn-primary" type="button" onclick="location.href = '${ctx}/order/createForm'">Complete Purchase</button>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<script src="${ctx}/resources/js/cart.js"></script>

