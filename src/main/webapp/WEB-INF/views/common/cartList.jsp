<%--
  Created by IntelliJ IDEA.
  User: choijaerok
  Date: 2022/12/04
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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



<div class="modal fade" tabindex="-1" id="shoppingModal" data-bs-keyboard="false" aria-labelledby="shoppingModalLabel" aria-hidden="true" >
    <div class="">
        <div class="modal-dialog modal-dialog-scrollable d-flex justify-content-end " style="margin-right: 50px; margin-top: 50px" >
            <div class="modal-content "  id="shoppingCart">
                <div class="modal-header d-flex justify-content-evenly">
                    <h1 class="modal-title fs-5" id="shoppingModalLabel"><b>Your cart</b> <i class="fas fa-circle-info" id="tooltip"></i></h1>
                    <div id="tooltipText">물건을 장바구니에 담아보세요!</div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <form method="get" >
                        <c:choose>
                            <c:when test="${empty cartList}">
                                <div class="h-50 d-flex align-items-center  justify-content-center" >
                                    <p style="font-size: large">Add items to get started.</p>
                                </div>
                                <form>
                                    <div class="d-flex align-items-center h-50 justify-content-center">
                                        <button class="btn btn-primary disabled" type="submit">Complete Purchase</button>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${cartList}" var="cart">
                                    <div class="d-flex justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img src="${cart.product_img}" alt="product" style="width: 50px; height: 50px">
                                            <p class="ms-2">${cart.product_name}</p>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <p class="me-2">${cart.product_price}</p>
                                            <button class="btn btn-primary" type="button" onclick="deleteCart(${cart.cart_id})">Delete</button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
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