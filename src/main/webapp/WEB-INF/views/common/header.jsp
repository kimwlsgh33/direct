<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%   request.setCharacterEncoding("UTF-8"); %>
<!--bootstrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!--reset css-->
<link href="${ctx}/resources/styles/reset.css" rel="stylesheet">
<%--jQuery--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--fontawesome-->
<script src="https://kit.fontawesome.com/217192a703.js" crossorigin="anonymous"></script>
<!-- navbar-expand-lg : 화면크기에 따라 nav구조 변경  -->
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

<nav class="navbar sticky-top navbar-expand-lg navbar-white bg-white">
    <div class="container-fluid d-flex">
        <div>
            <a class="navbar-brand" href="${ctx}/"><img src="${ctx}/resources/icons/logo.svg" alt="home" width="30" height="24" class="d-inline-block align-text-top">DIRECT</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportContent" aria-controls="navbarSupportContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="w-50 ">
            <form id="searchList" method="get"  action="${ctx}/item/searchList">
                <div class="form-group justify-content-between w-100">
                    <span id="searchBar" class="input-group w-100 align-items-center">
                        <input class="form-control" type="text" id="searchKeyword" value="${keyward}"  name="keyword" placeholder="원하시는 상품을 찾아보세요!" style="border-width: thin">
                        <button id="searchButton" type="submit" class="btn" style="border-width: 0">
                            <i class="fas fa-search"></i>
                        </button>
                    </span>
                </div>
            </form>
        </div>
        <div class="w-50 ">
            <ul class="nav d-flex align-items-center justify-content-evenly">
                <li class="nav-item" >
                    <a class="nav-link" aria-current="page" href="#" style="color: black">Active</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:black">
                        관리자 페이지
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown" >
                        <li><a class="dropdown-item" href="${ctx}/test" style="color:black">Test</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${ctx}/admin" style="color:black">INDEX ADMIN</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"  style="color: black">Link</a>
                </li>
                <li class="nav-item user">
                    <i class="fas fa-user-circle" style="color: black" ></i>
                </li>
                <li class="nav-item " id="myModal" data-bs-toggle="modal" data-bs-target="#shoppingModal" onclick="fn_cartList(1)">
                    <form method="get" action="${ctx}/cart/cartList">
                    <i class="fas fa-shopping-cart" style="color: black" ></i>
                    </form>
                </li>
            </ul>
        </div>
        </div>
</nav>
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

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    //tooltip 구현
    $(document).ready(function(){
        $("#tooltip").hover(function(){
            $("#tooltipText").css("display", "block");
        }, function(){
            $("#tooltipText").css("display", "none");
        });

        $("#dropDown").hover(function(){
            $("#dropDownMenu").css("display", "block");
        }, function(){
            $("#dropDownMenu").css("display", "none");
        });
    });

</script>
<script>

    function fn_cartList(user_id) {
        // cartController에서 ajax로 cartList를 가져온다.
        $.ajax({
            url: "${ctx}/cart/cartList",
            type: "get",
            success: function(result){
                $("#shoppingModal .modal-body").html(result);
                $("#shoppingModal").modal("show");
            },
            error:function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });

    }

</script>