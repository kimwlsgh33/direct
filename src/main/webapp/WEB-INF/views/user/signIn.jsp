<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="result"		 value="${param.result}"/>
<%
	request.setCharacterEncoding("UTF-8");
	String msg = request.getAttribute("msg") == null ? "" : (String)request.getAttribute("msg");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 화면</title>
	<style>
		#back	{
			background-image: url(${ctx}/resources/icons/logo.svg);
			background-repeat: no-repeat;
			background-position: right;
			background-size: 700px 650px;
			margin-top: 100px;
		}
		#signupbtn {
			background: pink;
		
		}
		#subbtn {
			background: gray;
		}
		#gray {
			background: gray;
		}
		#pink {
			background: pink;
			border : 1px;
		}
		.gray {
			background: gray;
		}
		.label {
			padding: 10px;
			text-align: center;
			width: 90px;
		}
		.input {
			margin-left: 200px;
			padding-top: 50px;
			align-content: center;
		}
        .btnnn {
			width: 			150px;
			height:			50px;
			border-radius:	10px;
			border:			1px;
		}
	</style>
	
<c:choose>	
	<c:when test="${result == 'loginFailed'}">
		<script>
		window.onload = function() {
			alert("\n아이디를 확인해 주세요~\n");
		}
		</script>
	</c:when>
	<c:when test="${result == 'PasswordFailed'}">
		<script>
		window.onload = function() {
			alert("\n비밀번호를 확인해주세요~\n");
		}
		</script>
	</c:when>
</c:choose>
	
</head>
<body>

<jsp:include page="../common/header.jsp" flush="false" />

<div class="container-sm" id="back">
	<form class="form-horizontal" method="post" action="${ctx}/user/login">
		<div class="form-group">
			<div align="center">
				<h1 align="center">
					<font color="pink">D </font>
					<font color="gray">i </font>
					<font color="pink">r </font>
					<font color="gray">e </font>
					<font color="pink">c </font>
					<font color="gray">t </font>
				</h1>
			</div>
		</div><br><br>
		<div class="input">
			<div class="form-group col-sm-4 shadow">
				<span class="input-group gray">
					<label class="label">아이디</label>
					<input type="text" class="form-control" name="id" maxlength="10" placeholder="아이디"/>
				</span>
			</div><br><br>
			<div class="form-group col-sm-4 shadow">
				<span class="input-group gray">
					<label class="label">비밀번호</label>
					<input type="password" class="form-control" name="pwd" maxlength="20" placeholder="비밀번호"/>
				</span>
			</div><br><br>
			<div class="form-group">
				<div class="col-sm-offset-5 col-sm-6">
                    <h4>비밀번호를 잊으셨나요?</h4><a href="">비밀번호 변경하러 가기</a>
				</div>
			</div><br><br>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-5">
                    <button type="button" id="signupbtn" class="shadow btnnn" data-bs-toggle="modal" data-bs-target="#exampleModalToggle">회원가입</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="submit" id="subbtn" class="shadow btnnn">로그인</button>
				</div>
			</div>
			
		</div>
	</form>
		<!-- Modal -->
        <div class="modal fade" id="exampleModalToggle" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">
                            <font color="pink">D </font>
                            <font color="gray">i </font>
                            <font color="pink">r </font>
                            <font color="gray">e </font>
                            <font color="pink">c </font>
                            <font color="gray">t </font>
                        </h1>
                    </div>
                    <div class="modal-body" id="registerModal">
                        <jsp:include page="terms.jsp" flush="false" />
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">
                            <font color="pink">D </font>
                            <font color="gray">i </font>
                            <font color="pink">r </font>
                            <font color="gray">e </font>
                            <font color="pink">c </font>
                            <font color="gray">t </font>
                        </h1>
                    </div>
                    <div class="modal-body" id="modal-body">
                    </div>
                </div>
            </div>
        </div>
	<div align="right">
		<img src="${ctx}/resources/icons/logo.svg" width="300" height="240" class="d-inline-block align-text-right"/>
	</div>
</div>

<jsp:include page="../common/footer.jsp" flush="false" />
</body>
<script>
	$(document).ready(function() {
		if("<%=msg%>" != "") {
			alert("<%=msg%>");
		}
	});
</script>
</html>
