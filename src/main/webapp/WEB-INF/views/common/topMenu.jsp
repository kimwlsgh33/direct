<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!--fontawesome-->
<script src="https://kit.fontawesome.com/217192a703.js" crossorigin="anonymous"></script>

<!-- reset.css 
<link href="${contextPath}/resources/styles/reset.css" rel="stylesheet">
-->

<!--bootstrap 5.2.2-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<!-- bootstrap 3.3.2
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
-->
<jsp:include page="../common/css.jsp" flush="false"/> 

<%	/*
	sticky-top은 상단 공간을 차지하면서 위에 고정하고,
	fixed-top은 상단 공간을 차지하지 않고 위에 고정된다.
	일부 내용이 상단 메뉴바에 가려져서 보이지 않을 수 있다.
	*/
%>
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${contextPath}/main.do">
        <img src="${contextPath}/resources/icons/logo.svg" alt="home" width="30" height="24" class="d-inline-block align-text-top">
        DIRECT
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportContent" aria-controls="navbarSupportContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportContent">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${contextPath}/main.do">홈</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    회원관리
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                       	<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
						<li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a href="${contextPath}/member/registerAjaxForm.do">회원가입(AJAX))</a></li>
						<li><a href="${contextPath}/member/listMembers.do">회원목록</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        파일올리기
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                    	<li><a href="${contextPath}/util/upload/uploadForm">파일 올리기 (Form)</a></li>
						<li><a href="${contextPath}/util/upload/uploadAjax">파일 올리기 (Ajax)</a></li>
                    </ul>
                </li>
            </ul>
				<div class="input-group" style="width: 60%; padding-left: 50px; padding-right: 50px;">
				  <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search" aria-describedby="search-addon" />
				  <button type="button" class="btn btn-outline-success">search</button>
				</div>
            <div class="d-flex justify-content-end">
                <form class="navbar-form" method="post" action="${contextPath}/member/login.do">
					<c:choose>
						<c:when test="${isLogOn == true && member != null}">
						<div class="d-flex" >
							<p style="color: gray; margin-top: 10px; margin-right: 20px;"><b>${member.id}님 환영합니다.</b></p>
							<a href="${contextPath}/member/logout.do" class="btn btn-outline-success">로그아웃</a>
						</div>
						</c:when>
						<c:otherwise>
						<div class="input-group">
						  <input
						   name="id"
						    type="text"
						    class="form-control"
						    placeholder="id"
						    aria-label="Username"
						  />
						  <input
						  name="password"
						    type="password"
						    class="form-control"
						    placeholder="password"
						    aria-label="Server"
						  />
						  <button type="submit" class="btn btn-outline-success">로그인</button>
						</div>
						</c:otherwise>
					</c:choose>
				</form>
            </div>
        </div>
    </div>
</nav> 
