<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%  request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>임시</title>
	</head>
	<body>
		<!-- 메뉴바 -->
		<jsp:include page="common/header.jsp" flush="false"/>
		
		<!-- 메뉴바 하단에 페이지의 소개를 보여준다. -->
		<div class="container">
			<div class="jumbotron">
				<div class="container text-center">
					<h1>테스트화면</h1>
					<p>ㅁㄴㅇㄹ</p>
				</div>
			</div>
		</div>
		
		<!-- 화면 중앙에 이미지를 보여준다. -->
		<div class="container">
			<div>
				<button type="button" id="test" class="shadow btnn" data-bs-toggle="modal" data-bs-target="#exampleModalToggle">테스트</button>
			</div>
		</div>
		
		
		<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
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
		        <jsp:include page="member/terms.jsp" flush="false" />
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
		        <!--<jsp:include page="member/registerAjax.jsp" flush="false" />-->
		      </div>
		    </div>
		  </div>
		</div>
		<a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle" role="button">다음</a>
		
		
		<!-- 푸터영역 -->
		<jsp:include page="common/footer.jsp" flush="false"/>
	</body>
	<script>
		// 재록's pick ajax
		/*function fn_signIn() {
			$.ajax({
				url: "/member/addMember",
				type:"post",
				data: {"terms_id" : ${terms_id}},
				success: function(result){
					console.log(result);
					$("#exampleModalToggle2 .modal-body").html(result);
					$("#exampleModalToggel2").modal("show");
				}
			})
		}*/
	</script>
</html>






