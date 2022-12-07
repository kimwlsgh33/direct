<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>

<%--<html>--%>
<%--<head>&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: choijaerok--%>
<%--  Date: 2022/12/04--%>
<%--  Time: 3:15 PM--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<c:set var="ctx" value="${pageContext.request.contextPath}"/>--%>


<%--&lt;%&ndash;<!--bootstrap-->&ndash;%&gt;--%>
<%--&lt;%&ndash;<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!--reset css-->&ndash;%&gt;--%>
<%--&lt;%&ndash;<link href="${ctx}/resources/styles/reset.css" rel="stylesheet">&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;jQuery&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>&ndash;%&gt;--%>

<%--<style>--%>
<%--    #shoppingCart {--%>
<%--        height: 500px;--%>
<%--        width: 80%;--%>
<%--    }--%>
<%--    #tooltip {--%>
<%--        display: inline-block;--%>
<%--        color: deeppink;--%>
<%--        font-weight: bold;--%>
<%--        align-items: center;--%>
<%--    }--%>

<%--    #tooltipText {--%>
<%--        display: none;--%>
<%--        position: absolute;--%>
<%--        text-align: center;--%>
<%--        padding-top: 10px;--%>
<%--        padding-bottom: 10px;--%>
<%--        max-width: 200px;--%>
<%--        border: 1px solid;--%>
<%--        border-radius: 5px;--%>
<%--        font-size: 0.8em;--%>
<%--        color: gray;--%>
<%--        background: pink;--%>
<%--    }--%>
<%--</style>--%>
<%--</head>--%>

<%--<body>--%>
<%--<div class="modal fade" tabindex="-1" id="shoppingModal" data-bs-keyboard="false" aria-labelledby="shoppingModalLabel" aria-hidden="true" >--%>
<%--    <div class="">--%>
<%--        <div class="modal-dialog modal-dialog-scrollable d-flex justify-content-end " style="margin-right: 50px; margin-top: 50px" >--%>
<%--            <div class="modal-content "  id="shoppingCart">--%>
<%--                <div class="modal-header d-flex justify-content-evenly">--%>
<%--                    <h1 class="modal-title fs-5" id="shoppingModalLabel"><b>Your cart</b> <i class="fas fa-circle-info" id="tooltip"></i></h1>--%>
<%--                    <div id="tooltipText">물건을 장바구니에 담아보세요!</div>--%>
<%--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                </div>--%>

<%--                <div class="modal-body">--%>
<%--                        <c:choose>--%>
<%--                            <c:when test="${empty cartList}">--%>
<%--                                <div class="h-50 d-flex align-items-center  justify-content-center" >--%>
<%--                                    <p style="font-size: large">Add items to get started.</p>--%>
<%--                                </div>--%>
<%--                            </c:when>--%>
<%--                            <c:otherwise>--%>
<%--                                <c:forEach items="${cartList}" var="cart">--%>
<%--                                    <div class="d-flex justify-content-between">--%>
<%--                                        <div class="d-flex align-items-center">--%>
<%--                                            <img src="${cart.product_image}" alt="product" style="width: 50px; height: 50px">--%>
<%--                                            <p class="ms-2">${cart.product_name}</p>--%>
<%--                                        </div>--%>
<%--                                        <div class="d-flex align-items-center">--%>
<%--                                            <p class="me-2">${cart.product_price}</p>--%>
<%--                                            <form method="get" action="${ctx}/cart/deleteCart">--%>
<%--                                                <button class="btn btn-primary" type="button" onclick="deleteCart(${cart.product_id})">Delete</button>--%>
<%--                                            </form>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </c:forEach>--%>
<%--                            </c:otherwise>--%>
<%--                        </c:choose>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${empty cartList}">--%>
<%--                            <button class="btn btn-primary disabled" type="submit">Complete Purchase</button>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <form method="get">  <!-- action으로 결제창으로 가기 -->--%>
<%--                                <button class="btn btn-primary" type="submit">Complete Purchase</button>--%>
<%--                            </form>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>

<%--<script>--%>
<%--    // deleteCart--%>
<%--    function deleteCart(id) {--%>
<%--        $.ajax({--%>
<%--            url: "/cart/delete/" + id,--%>
<%--            type: "DELETE",--%>
<%--            success: function (result) {--%>
<%--                if (result == "success") {--%>
<%--                    alert("장바구니에서 삭제되었습니다.");--%>
<%--                    location.reload();--%>
<%--                } else {--%>
<%--                    alert("장바구니 삭제에 실패했습니다.");--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--    // deleteAll Cart--%>
<%--    function deleteAllCart() {--%>
<%--        $.ajax({--%>
<%--            url: "/cart/deleteAll",--%>
<%--            type: "DELETE",--%>
<%--            success: function (result) {--%>
<%--                if (result == "success") {--%>
<%--                    alert("장바구니가 비워졌습니다.");--%>
<%--                    location.reload();--%>
<%--                } else {--%>
<%--                    alert("장바구니 비우기에 실패했습니다.");--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>
<%--</script>--%>

<%--</html>--%>
