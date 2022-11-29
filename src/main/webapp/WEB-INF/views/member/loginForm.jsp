<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="result"		 value="${param.result}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<!--bootstrap 5.2.2-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">
</script>
	
<c:choose>	
	<c:when test="${result == 'loginFailed'}">
		<script>
		window.onload = function() {
			alert("\n아이디를 잘못 입력하셨습니다.\n\n다시 로그인을 해주세요!");
		}
		</script>
	</c:when>
	<c:when test="${result == 'PasswordFailed'}">
		<script>
		window.onload = function() {
			alert("\n비밀번호를 잘못 입력하셨습니다.\n\n다시 로그인을 해주세요!");
		}
		</script>
	</c:when>
</c:choose>
	
</head>
<body>

<div class="container">
<div class="row justify-content-center">
	<form class="form-horizontal" method="post" action="${contextPath}/member/login.do">
		<div class="form-group row justify-content-center">
			<div class="col-sm-4">
				<div align="center" style="margin-top: 30px;">
	            <h1 align="center">
	               <font color="pink">D </font>
	               <font color="gray">i </font>
	               <font color="pink">r </font>
	               <font color="gray">e </font>
	               <font color="pink">c </font>
	               <font color="gray">t </font>
	            </h1>
         		</div>
			</div>
		</div>
		<div class="form-group row justify-content-center" style="padding: 10px;">
			<div class="col-sm-4 input-group-lg">
				<input type="text" class="form-control" id="id" name="id" maxlength="10" placeholder="ID"/>
			</div>
		</div>
		<div class="form-group row justify-content-center" style="padding: 10px;">
			<div class="col-sm-4 input-group-lg">
				<input type="password" class="form-control" id="pwd" name="password" maxlength="20" placeholder="PassWord"/>
			</div>
		</div>
		<div class="form-group row justify-content-center">
			<div class="col-sm-4 row justify-content-center">
				<button type="submit"	class="btn btn-lg btn-outline-dark" style="margin: 10px;">로그인</button>
			</div>
		</div>
	</form>
	<form class="form-horizontal" method="get" action="${contextPath}/member/memberForm.do">
		<div class="form-group row justify-content-center">
			<div class="col-sm-4 row justify-content-center">
				<button type="submit"	class="btn btn-lg btn-outline-secondary" style="margin: 10px;">회원가입</button>
			</div>
		</div>
	</form>
</div>
</div>
<!-- 푸터영역 -->
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>


















