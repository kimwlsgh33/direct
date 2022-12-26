<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
</head>
<body>

<jsp:include page="../common/header.jsp" flush="false"/>

<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
			<div style="margin-left: 20%; margin-top: 30px;">
				<div class="row justify-content-between">
					<h2 class="col-md-4">쿠폰 목록</h2>
				</div>
				<!-- 쿠폰번호 입력하는 영역 -->
				<div class="col-sm-6" style="margin-top: 20px;">
					<label class="form-label">쿠폰 번호</label>
					<form name="couponInsertForm">
						<div class="input-group">
							<input type="hidden" id="user_id" name="user_id" value="${user.user_id}"/>
							<input type="text" class="form-control" id="coupon_id" name="coupon_id" placeholder="쿠폰번호를 입력하십시오"/>
							<span class="input-group-btn">
								<button class="btn btn-outline-primary" type="button" name="couponInsertBtn">등록</button>
							</span>
						</div>
					</form>
				</div>
				<!-- 저장된 쿠폰목록을 보여주는 영역 -->
				<div class="couponList"></div>
			</div>
		</div>
	</div>
</div>
<!-- 하단 메뉴 -->
<jsp:include page="../common/footer.jsp" flush="false"/>

<script>

//-----------------------------------------------------------------------------------------------------------
//페이지 로딩시 게시글에 연결된 쿠폰이 있으면 보여준다.
//-----------------------------------------------------------------------------------------------------------
$(document).ready(function() {
	couponList();
});

//-----------------------------------------------------------------------------------------------------------
// jQuery Serialize()
// jQUery Ajax로 호출하기 전에 serialize를 해주면 form안에 값들을
// 한 번에 전송가능한 data로 만들 수 있어서, 많은 data를 보낼 때 유용하다. (Ajax가 아닐 때도 사용가능)
// Format : $("form id" 또는 "form name").serialize();
//-----------------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------------
// 쿠폰 등록 버튼을 눌렀을 경우
//-----------------------------------------------------------------------------------------------------------
$('[name=couponInsertBtn]').click(function() {
	var insertData = $('[name=couponInsertForm]').serialize();	//couponInsertForm의 내용을 가져온다.
	couponInsert(insertData);	
});

//-----------------------------------------------------------------------------------------------------------
// 댓글 등록
//-----------------------------------------------------------------------------------------------------------
function couponInsert(insertData){
	var user_id = $("#user_id").val();
	var coupon_id = $("#coupon_id").val();
	alert("user_id: " + user_id + "coupon_id: " + coupon_id);
	
    $.ajax({
        url : '/coupon/insert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                $("#user_id").val();
                $("#coupon_id").val();
                //couponList(); //쿠폰등록 후 쿠폰목록 reload
                alert("등록 완료!");
                location.href = "/coupon/coupon?user_id=" + user_id;
            }
        }
    });
}

//-----------------------------------------------------------------------------------------------------------
//쿠폰 목록 보기
//-----------------------------------------------------------------------------------------------------------
function couponList() {
	var user_id = $("#user_id").val();
	//alert("아이디: " + user_id + "쿠폰 번호: " + coupon_id)
	
	$.ajax({
		url:	'/coupon/list',
		type:	'get',
		data:	{user_id: user_id},
		success: function(data) {
			var str = '';
			$.each(data, function(key, value){ 
				str += '<div class="couponList">';
				str += '<div class="row justify-content-start">'+ '<div class="col-sm-4">' + '<b>' + '쿠폰이름 :</b> '+value.name + '</div></div>';
				str += '<b>유효기간 :</b> ' + value.expired_date + '';
				str += '<b style="margin-left: 10px;">최소금액 : </b> ' + value.min_price + '원   ';
				str += '<a class="btn btn-sm btn-outline-primary" id="coupon">사용하기</a></div>';
			});
			$(".couponList").html(str);
		},
		complete: function(data) {
			console.log(data);
		}
	})
	
	// 콜백함수 : 요청 성공 시에 호출되는 함수
	// ajax 콜백 함수는 ajax 함수에 연결 연산자를 붙여서 사용한다.
	.done(function(data) {
		////alert("IMSI==>" + imsi);
		////alert(data);
		console.log(data);
		//alert("요청 성공");
		//alert("commentList 요청 성공 data ==> " + data);
	})
	.fail(function() {
		alert("요청 실패");
		alert("couponList 요청 실패 data ==> " + data);
	})
	.always(function() {
		//alert("요청 완료");
		//alert("commentList 요청 완료 data ==> " + data);
	});
	//alert("imsi2["+imsi+"]);
	//alert("commentList 종료.....");
}
</script>
</body>
</html>