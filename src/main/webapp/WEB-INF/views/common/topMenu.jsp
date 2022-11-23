<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
<jsp:include page="./css.jsp" flush="false"/><!-- css페이지 import -->

<%	/*
	sticky-top은 상단 공간을 차지하면서 위에 고정하고,
	fixed-top은 상단 공간을 차지하지 않고 위에 고정된다.
	일부 내용이 상단 메뉴바에 가려져서 보이지 않을 수 있다.
	*/
%>


<nav class="navbar navbar-sticky-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${contextPath}/main.do">Direct</a>
		</div>
		<!-- 실질적인 메뉴를 나열한다. -->
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form class="form-inline my-2 my-lg-0"  style="padding-top: 8px;">
				      <input class="form-control mr-sm-2" type="search" size="100" maxlength="100" placeholder="Search" aria-label="Search">
				      <button class="btn my-2 my-sm-0" type="submit">Search</button>
				    </form>
				</li>
				<li>
					<form class="navbar-form navbar-right" method="post" action="${contextPath}/member/login.do">
						<c:choose>
							<c:when test="${isLogOn == true && member != null}">
								<h5 class="navbar-text">${member.name}님, 즐거운 시간되십시오.</h5>
								<a href="${contextPath}/member/logout.do" class="btn">
								<span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
							</c:when>
							<c:otherwise>
								<div class="form-group">
									<input type="text"     class="form-control" name="id"  size="12" maxlength="12" placeholder="아이디"/>
									<input type="password" class="form-control" name="password" size="12" maxlength="12" placeholder="비밀번호"/>
								</div>
								<button type="submit" class="btn">
									<span class="glyphicon glyphicon-log-in"></span> 로그인
								</button>
							</c:otherwise>
						</c:choose>
					</form>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">기본 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${contextPath}/exam/exam1/doA">doA</a></li>
						<li><a href="${contextPath}/exam/exam1/doB">doB</a></li>
						<li role="presentation" class="divider"></li>
						<li><a href="${contextPath}/exam/exam2/doC">doC</a></li>
						<li><a href="${contextPath}/exam/exam2/gugudanForm.do">구구단</a></li>
						<li role="presentation" class="divider"></li><!-- 메뉴 사이 줄 -->
						<li><a href="${contextPath}/exam/exam3/doD">회원정보(객체)</a></li>
						<li><a href="${contextPath}/exam/exam3/doE">회원정보(Map)</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${contextPath}/member/loginForm.do">로그인</a></li>
						<li><a href="${contextPath}/member/memberForm.do">회원가입</a></li>
						<li><a href="${contextPath}/member/registerAjaxForm.do">회원가입(AJAX))</a></li>
						<li><a href="${contextPath}/member/listMembers.do">회원목록</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">파일 올리기 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${contextPath}/util/upload/uploadForm">파일 올리기 (Form)</a></li>
						<li><a href="${contextPath}/util/upload/uploadAjax">파일 올리기 (Ajax)</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">test <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="${contextPath}/product/productList/">리뷰목록 (수정)</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>








