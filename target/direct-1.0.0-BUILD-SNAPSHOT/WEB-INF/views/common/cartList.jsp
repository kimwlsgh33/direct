<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head><%--
  Created by IntelliJ IDEA.
  User: choijaerok
  Date: 2022/12/04
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<style>
    #shoppingCart {
        height: 500px;
        width: 80%;
    }
    #tooltip {
        display: inline-block;
        color: deeppink;
        font-weight: bold;
        align-items: center;
    }

    #tooltipText {
        display: none;
        position: absolute;
        text-align: center;
        padding-top: 10px;
        padding-bottom: 10px;
        max-width: 200px;
        border: 1px solid;
        border-radius: 5px;
        font-size: 0.8em;
        color: gray;
        background: pink;
    }
</style>
</head>

<body>
                        <c:choose>
                            <c:when test="${empty cartList}">
                                <div class="h-50 d-flex align-items-center  justify-content-center" >
                                    <p style="font-size: large">Add items to get started.</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${cartList}" var="cart">
                                    <div class="d-flex justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img src="${cart.product_image}" alt="product" style="width: 50px; height: 50px">
                                            <p class="ms-2">${cart.product_name}</p>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <p class="me-2">${cart.product_price}</p>
                                            <form method="get" action="${ctx}/cart/deleteCart">
                                                <button class="btn btn-primary" type="button" onclick="deleteCart(${cart.product_id})">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
</body>

<script>
    // deleteCart
    function deleteCart(id) {
        $.ajax({
            url: "/cart/delete/" + id,
            type: "DELETE",
            success: function (result) {
                if (result == "success") {
                    alert("장바구니에서 삭제되었습니다.");
                    location.reload();
                } else {
                    alert("장바구니 삭제에 실패했습니다.");
                }
            }
        });
    }
    // deleteAll Cart
    function deleteAllCart() {
        $.ajax({
            url: "/cart/deleteAll",
            type: "DELETE",
            success: function (result) {
                if (result == "success") {
                    alert("장바구니가 비워졌습니다.");
                    location.reload();
                } else {
                    alert("장바구니 비우기에 실패했습니다.");
                }
            }
        });
    }
</script>

</html>
