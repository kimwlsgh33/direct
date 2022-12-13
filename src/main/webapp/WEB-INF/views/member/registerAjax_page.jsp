<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%	request.setCharacterEncoding("UTF-8"); %>


<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  

<style>
	#idCheck {
		height: 40px;
		background: pink;
	}
	#reset {
		background: pink;
	}
	#submit {
		background: gray;
	}
	.container {
		background-image: url(${ctx}/resources/icons/logo.svg);
		background-repeat: no-repeat;
		background-position: top right;
		background-size: 700px 650px;
		background-origin: padding-box;
	}
	.input-group {
		height:	30px;
	}
	.label {
		width: 180px;
		height: 40px;
		padding: 10px;
		text-align: center;
		background: gray;
	}
	.btn {
		width: 100px;
		height: 50px;
	}

</style>

</head>
<body>

<!-- 메뉴바 -->
<jsp:include page="../common/topMenu.jsp" flush="false" />
<h1 align="center" style="padding-top: 50px">
	<font color="pink">D </font>
	<font color="gray">i </font>
	<font color="pink">r </font>
	<font color="gray">e </font>
	<font color="pink">c </font>
	<font color="gray">t </font>
	<font color="pink">. </font>
	<font color="gray">o </font>
	<font color="pink">l </font>
	<font color="gray">d </font>
</h1><br>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#mySmallCenterModal">
  모달테스트
</button>

<!-- Small Modal at Center -->
<div class="modal modal-right fade" id="mySmallCenterModal" tabindex="-1" role="dialog" aria-labelledby="mySmallCenterModalLabel">
  <div class="modal-dialog modal-sm modal-right" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal 제목</h4>
      </div>
      <div class="modal-body">
        Modal 내용
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<div class="container">
	<form class="form-horizontal" method="post" action="${ctx}/member/addMember">
		<div class="form-group, col-sm-4">
			<span class="input-group">
				<label for="id" class="label">아 이 디</label>
				<input type="text" class="form-control" id="id" name="id" maxlength="20" placeholder="Enter ID" />
				<button class="idCheck btn" type="button" id="idCheck"
					onClick="fn_idCheck();" value="N">중복확인</button>
			</span>
		</div><br>
		<div class="form-group col-sm-4">
			<span class="input-group">
		    	<label for="id" class="label">비밀번호</label>
		        <input type="password" class="form-control" id="pwd" name="pwd" maxlength="20" placeholder="Enter PASSWORD"/>
			</span>
	    </div><br>
	    <div class="form-group col-sm-4">
	    	<span class="input-group">
		    	<label for="id" class="label">비밀번호 확인</label>
		        <input type="password" class="form-control" id="repwd" name="repwd" maxlength="20" placeholder="Enter PASSWORD RE"/>
	    	</span>
	    </div><br>
	    <div class="form-group col-sm-3">
	    	<span class="input-group">
		    	<label for="id" class="label">이  름</label>
		        <input type="text" class="form-control" id="name" name="name" maxlength="30" placeholder="Enter NAME"/>
	    	</span>
	    </div><br>
        <div class="form-group col-sm-4">
        	<span class="input-group">
        		<label for="id" class="label">이메일</label>
            	<input type="email" class="form-control" id="email" name="email" maxlength="30" placeholder="Enter Email"/>
        	</span>
      	</div><br>
      	<div class="form-group col-sm-5">
      		<span class="input-group">
	    		<label for="id" class="label">휴대폰 번호</label>
	            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" maxlength="11" placeholder="Enter PHONE_NUMBER (without -)"/>
      		</span>
	    </div><br>
	    <div class="form-group col-sm-5">
	    	<span class="input-group">
	    		<label for="id" class="label">생년월일</label>
	            <input type="text" class="form-control" id="birthday" name="birthday" maxlength="8" placeholder="Enter Your BirthDay (ex : 19900101)" />
	    	</span>
	    </div><br>
  		<div class="form-group col-sm-4">
  			<span class="input-group">
	  			<label for="id" class="label">우편번호</label>
				<input type="text" 		class="form-control" name="zipcode" id="zipcode" readonly />
				<input type="button"	class="form-control" onclick="daumZipCode()" value="우편번호검색" />
  			</span>
		</div><br>
		<div class="form-group col-sm-6">
			<span class="input-group">
				<label for="id" class="label">주소</label>
				<input type="text" class="form-control" id="address01" name="address01" />
			</span>
		</div><br>
		<div class="form-group col-sm-6">
			<span class="input-group">
				<label for="id" class="label">상세주소</label>
				<input type="text" class="form-control" id="address02" name="address02" />
			</span>
		</div><br>
		<img src="${ctx}/resources/icons/logo.svg" width="300" height="240" class="float-end"/>
      	<div class="form-group">
      		<div class="btn-group">
	            <button type="reset"  class="btn" id="reset">입력내용 초기화</button>
	            <button type="submit" class="btn" id="submit">가입</button>
      		</div>
	    </div>
      	<!--  <div class="form-group">
        	<div class="col-sm-offset-2 col-sm-5">
            <input type="text" class="form-control msg" name="msg" placeholder="Message" id="msg" readonly/>
        	</div>
        	<div id="msg2"></div> 
      	</div> -->
	</form>
</div>

<jsp:include page="../common/footer.jsp" flush="false" />
</body>


<!-- 주소 입력 로직(다음) -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function daumZipCode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업창에서 검색한 결과 중 항목을 클릭하였을 경우에 실행할 코드를 이곳에 작성한다.
				
				// 각 주소의 노출 규칙에 따라서 주소를 조합해야 한다.
				// 내려호는 변수가 값이 없는 경우에는 공백('') 값을 가지므로 이름을 참고하여 분기한다.
				var fullAddr	= '';	// 최종 주소 변수
				var subAddr		= '';	// 조합형 주소 변수
				
				// 사용자가 선택한 주소의 타입에 따라서 해당 주소 값을 가져온다.
				if(data.userSelectedType == 'R') {	// 도로명 주소를 선택한 경우
					fullAddr	= data.roadAddress;
				} else {	// 지번 주소를 선택한 경우
					fullAddr	= data.jibunAddress;
				}
				
				// 사용자가 선택한 주소가 도로명 타입일 때 조합한다.
				if(data.userSelectedType == 'R') {
					// 법정동명이 있을 경우에 추가한다.
					if(data.bname != '') {
						subAddr += data.bname;
					}
					// 건물명이 있을 경우에 추가한다.
					if(data.buildingName != '') {
						subAddr += (subAddr != '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					fullAddr += (subAddr != '' ? '(' + subAddr + ')' : '');
				}
				
				// 우편번호와 주소정보를 화면의 해당 필드에 출력시킨다.
				// 5자리의 새 우편번호
				document.getElementById('zipcode').value	= data.zonecode;
				document.getElementById('address01').value	= fullAddr;
				
				// 커서를 상세주소 입력란으로 이동시킨다.
				document.getElementById('address02').focus();
			}
		
		
		}).open({
			// 우편번호 팝업 창이 여러개 뜨는 것을 방지하기 위해서 popupName을 사용한다.
			popupName:	'postcodePopup'
		});
	}
</script>

</html>

<!-- 아이디 중복검사 로직 -->
<script>
function fn_idCheck() {
	// alert($("#id").val());
	$.ajax({
		url:		"/member/idCheck",
		type:		"post",
		dataType:	"json",
		data:		{"id" : $("#id").val()},
		success:	function(data) {
			if(data == 1) {
				alert("이미 사용 중인 아이디 입니다. \n\n 다른 아이디를 입력하십시오.");
			} else if (data == 0) {
				$("#idCheck").attr("value", "Y");	// 버튼 id="idCheck"의 속성인 value의 값을 "Y"로 변경한다.
				alert("사용 가능한 아이디 입니다.");
			}
		}
	})
}
</script>

<script>
$(document).ready(function() {
	// 취소 버튼이 눌렸을 경우 로그인 화면으로 이동한다.
	$(".cancel").on("click", function() {
		location.href = "/main";
	});

	// 회원가입 버튼을 눌렀을 경우
	$("#submit").on("click", function() {
		// alert("회원가입 버튼을 누르셨습니다.");
		if($("#id").val() == "") {
			alert("아이디를 입력하셔야 합니다.");
			$("#id").focus();
			return false;
		}
		if($("#id").val().length < 4) {
			alert("아이디는 최소 4자리를 입력하셔야 합니다.");
			$("#id").focus();
			return false;
		}
		if($("#pwd").val() == "") {
			alert("비밀번호를 입력하셔야 합니다.");
			$("#pwd").focus();
			return false;
		}
		if($("#name").val() == "") {
			alert("이름을 입력하셔야 합니다.");
			$("#name").focus();
			return false;
		}
		if($("#email").val() == "") {
			alert("이메일을 입력하셔야 합니다.");
			$("#email").focus();
			return false;
		}
		if($("#pwd").val() != $("#repwd").val()) {
			alert("비밀번호를 확인해주세요.")
			$("#pwd").focus();
			return false;
		}
	});

	// 아이디 입력란에 글자를 입력하면 실시간으로 사용가능한 아이디 인지 아닌지 검사한다.
	$("#id").on("input", function() {
		// alert("글자를 입력하셨습니다. => " + $("#id").val());
		
		// 입력된 글자의 값을 변수에 저장한다.
		let inputID = $("#id").val();

		// 입력한 아이디가 서버에 존재하는 지 알아낸다.
		$.ajax({
			url:		"/member/idCheck",
			type:		"post",
			dataType:	"json",
			data:		{"id" : $("#id").val()},
			success:	function(data) {
				if(inputID == "" && data == '0') {
					$(".signUpBtn").prop("disabled", true);
					$(".signUpBtn").css("background-color", "#AAAAAA");
					$("#idCheck").css("background-color", "#FFCECE");
					document.getElementById("msg2").innerHTML = "아이디를 입력하십시오.";
					document.getElementById("msg").value = "아이디를 입력하십시오.";
				} else if(inputID != "" && data == '0' && inputID.length >= 4) {
					$("#idCheck").css("background-color", "#B0F6AC");
					document.getElementById("msg2").innerHTML = "사용이 가능한 아이디입니다.";
					document.getElementById("msg").value = "사용이 가능한 아이디입니다.";
					$("#msg").css("background-color", "#B0F6AC");
					$(".signUpBtn").prop("disabled", false);
					$(".signUpBtn").css("background-color", "#4CAF50");
				} else if(data == '1') {
					$(".signUpBtn").prop("disabled", true);
					$(".signUpBtn").css("background-color", "#AAAAAA");
					$("#idCheck").css("background-color", "#FFCECE");
					document.getElementById("msg2").innerHTML = "이미 사용 중인 아이디입니다.";
					document.getElementById("msg").value = "이미 사용 중인 아이디입니다.";
					$("#msg").css("color", "#FFFFFF");
					$("#msg").css("background-color", "#FF3F80");
				}
			}
		});
		
		
	});
	
});
</script>

<!-- 비밀번호 확인관련 로직 -->


















