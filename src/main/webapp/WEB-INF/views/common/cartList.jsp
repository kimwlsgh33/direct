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

</head>

<body>
<div id="convertDiv">
                        <c:choose>
                            <c:when test="${empty cartList}">
                                <div class="h-50 d-flex align-items-center  justify-content-center mb-2" >
                                    <p style="font-size: large">Add items to get started.</p>
                                </div>
                                <div>
                                    <button class="btn btn-primary disabled" type="submit">Complete Purchase</button>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${cartList}" var="cart">
                                    <div class="d-flex justify-content-between mb-2">
                                        <div class="d-flex align-items-center">
                                            <img src="${cart.product_image}" alt="product" style="width: 50px; height: 50px">
                                            <p class="ms-2">${cart.product_name}</p>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <p class="me-2">${cart.product_price}</p>
                                                <a id="${cart.product_id}" onclick="deleteCart(${cart.product_id})">
                                                    <i class="fas fa-circle-xmark"></i>
                                                </a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div>
                                    <button class="btn btn-primary" type="submit">Complete Purchase</button>
                                </div>
                            </c:otherwise>
                        </c:choose>
</div>
</body>
<script>
    // deleteCart
    function deleteCart(product_id) {
        alert("궁금하지?")
        $.ajax({
            url: "/cart/deleteCart",
            type: "post",
            data: {"product_id": product_id},
            success: function(data){
                $("#convertDiv").html(data);
                alert("삭제되었습니다.")

            },error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
