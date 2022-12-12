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
<%--                                    <div id="cart_count">--%>
<%--&lt;%&ndash;                                        ${item_count}&ndash;%&gt;--%>
<%--                                    </div>--%>
                                    <div>
                                    <button class="btn" style="width: 90px; margin-bottom: 5px;" onclick="deleteAllCart(1)">전체 삭제</button>
                                    </div>
                                </div>
                                <c:forEach items="${cartList}" var="cart">
                                    <div class="d-flex justify-content-between mb-2">
                                        <div class="d-flex align-items-center">
<%--                                            <img src="${cart.product_image}" alt="product" style="width: 50px; height: 50px">--%>
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
                                    <button class="btn btn-primary" type="submit">Complete Purchase</button>
                                </div>
                                <div>
                                </div>

                            </c:otherwise>
                        </c:choose>
</div>
</body>
<script>
    // deleteCart
    function deleteCart(item_id) {
        alert("궁금하지?")
        $.ajax({
            url: "/cart/deleteCart",
            type: "post",
            data: {"item_id": item_id},
            success: function(data){
                $("#convertDiv").html(data);
                alert("삭제되었습니다.")

            },error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
    // deleteAll Cart
    function deleteAllCart(user_id) {
        $.ajax({
            url: "/cart/deleteAllCart",
            type: "post",
            data: {"user_id": user_id},
            success: function (data) {
                $("#convertDiv").html(data);
                alert("장바구니가 전체 삭제되었습니다.")

            },error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }


</script>

</html>
