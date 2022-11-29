<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%   request.setCharacterEncoding("UTF-8"); %>
<!--bootstrap-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!--reset css-->
<link href="${ctx}/resources/styles/reset.css" rel="stylesheet">
<!--fontawesome-->
<script src="https://kit.fontawesome.com/217192a703.js" crossorigin="anonymous"></script>
<!-- navbar-expand-lg : 화면크기에 따라 nav구조 변경  -->
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="${ctx}/resources/icons/logo.svg" alt="home" width="30" height="24" class="d-inline-block align-text-top">DIRECT</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportContent" aria-controls="navbarSupportContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportContent">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">홈</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Dropdown
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>

            <div class="d-flex">
                <c:choose>
                    <c:when test="${sessionScope.loginUser != null}">
                        <div class="nav-item">
                            <a class="nav-link" href="${ctx}/member/logout">로그아웃</a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="nav-item d-flex align-items-center">
                            <a class="link-light me-2 " href="${ctx}/member/login">로그인</a>
                        </div>
                        <div class="nav-item">
                            <a class="btn btn-success" href="${ctx}/member/join">회원가입</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
    <form id="searchList" method="get" class="bg-dark p-3" action="${ctx}/search/searchList">
        <div class="form-group">
                <span id="searchBar" class="input-group m-0 w-50 align-items-center">
                    <input class="form-control" type="text" id="searchKeyword" value="${keyword}" name="keyword" placeholder="원하시는 상품을 찾아보세요!" />
                    <button id="searchButton" type="submit" class="btn btn-outline-secondary">검색</button>
                    <a class="d-flex m-3" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false"  aria-controls="collapseExample">
                    상세 검색
                    </a>
                </span>
        </div>
    </form>
<script>
    $(document).ready(function(){
        var searchObj = $("#searchList")
        $("#searchButton").click(function(){
            var keywordStr = $("#searchKeyword").val();

            if(keywordStr == ""){
                searchObj.val("");
                searchObj.submit();
            } else {
                searchObj.submit();
            }
        })
    })
</script>