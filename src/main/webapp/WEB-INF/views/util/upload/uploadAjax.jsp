<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>파일 올리기 (AJAX)</title>
	<style>
	.fileDrop	{
		width:		100%;
		height:		200px;
		border:		1px dotted blue;
	}
	small	{
		margin-left:	3px;
		font-weight:	bold;
		color:			gray;
	}
	</style>
</head>
<body>

<!-- 상단 메뉴 -->
<jsp:include page="../../common/topMenu.jsp" flush="false"/>

<div class="container">
	<h2>Ajax File Upload</h2>
	<div class="fileDrop"></div>		<!-- 파일을 업로드할 영역 -->
	<div class="uploadedList"></div>	<!-- 업로드된 파일목록을 출력할 영역 -->
</div>

<!-- 하단 메뉴 -->
<jsp:include page="../../common/footer.jsp" flush="false"/>

</body>

<script>
//-----------------------------------------------------------------------------------------------------------
// 스크립트는 jQuery를 불러들인 다음에 기술한다.
// 순서가 바뀌면 스크립트가 작동되지 않는다.
//-----------------------------------------------------------------------------------------------------------
$(function() {
	
	//-----------------------------------------------------------------------------------------------------------
	// 드래그의 기본효과를 막는다.
	// 드래그의 기본효과를 막지 않으면 드래그된 곳에 이미지가 보이게 된다.
	//-----------------------------------------------------------------------------------------------------------
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	//-----------------------------------------------------------------------------------------------------------
	// 그림 전송영역에 그림을 떨어뜨릴때 처리하는 함수 
	//-----------------------------------------------------------------------------------------------------------
	$(".fileDrop").on("drop", function(event) {
		alert("그림을 떨어뜨렸습니다.");
		// 그림이 drop될 때의 기본효과를 막는다.
		event.preventDefault();
	});
	
	// 첨부파일 배열 : 드래그된 파일의 정보
	// Ctrl + 클릭으로 여러개의 파일을 동시에 올릴 수 있다.
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];	// 첫번째 파일
	
	// 파일정보가 콘솔에 올라간다.
	// 웹 브라우저에서 F12키를 누르면 어떤 파일인지 알 수가 있다.
	console.log(file);
	
	// AJAX로 서버에 전달할 때에는 폼이 별도로 존재하지 않기 때문에 폼 객체를 만들어 주어야 한다.
	var formData = new FormData();	// 폼 객체
	
	// 폼에 file 변수를 추가한다.
	formData.append("file", file);
	
	// 서버에 파일을 업로드한다.(백그라운드에서 실행이 된다.)
	// contentType : false => multipart/form-data로 처리가 된다.
	$.ajax({
		
		
		
		
	});
	
	
});

</script>


</html>






