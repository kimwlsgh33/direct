<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		
		<style>
			.view {
				border: 		1px solid #ccc;
				background: 	#ccc;
				border-radius: 	5px;
			}
			.addon {
				background:		#ccc;
				border-radius: 	5px;
			}
		</style>
		
	</head>
	<body>
		<div class="container" align="center" style="padding-top: 20px">
			<form class="form-horizontal" method="post" name="memInsForm" action="${ctx}/member/addMember">
				<div class="form-group">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  					Launch demo modal
				</button>
					<div class="modal" tabindex="-1">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title">Modal title</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">닫기</button>
					      </div>
					      <div class="modal-body">
					        <p>Modal body text goes here.</p>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					        <button type="button" class="btn btn-primary">Save changes</button>
					      </div>
					    </div>
					  </div>
					</div>
					<div align="center">
						<h1>
							<font color="red">D </font>
							<font color="orange">i </font>
							<font color="yellow">r </font>
							<font color="green">e </font>
							<font color="blue">c </font>
							<font color="navy">t </font>
							<font color="purple">. </font>
						</h1>
					</div>
					<br><br>
				</div>
				
				<div class="form-group">
					<span class="input-group">
						<div class="view">아 이 디</div>
						<input type="text" class="form-control" id="id" name="id" maxlength="15" placeholder="ID"/>
						<br>
					</span>
					
					<div>
						<div class="view">비밀번호</div>
						<input type="password" class="form-control" id="pwd" name="pwd" maxlength="20" placeholder="Password"/>
						<br>
					</div>
					<div>
						<div class="view">비밀번호 다시 입력</div>
						<input type="password" class="form-control" id="repwd" name="repwd" maxlength="20" placeholder="Re Password"/>
						<br>
					</div>
					<div>
						<div class="view">이 름</div>
						<input type="text" class="form-control" id="name" name="name" maxlength="40" placeholder="Name"/>
						<br>
					</div>
					<div>
						<div class="view">이 메 일</div>
						<input type="text" class="form-control" id="email" name="email" maxlength="40" placeholder="E-mail"/>
						<br>
					</div>
					<div>
						<div class="view">휴대폰 번호('-' 없이 번호만 입력해 주세요.)</div>
						<input type="text" class="form-control" id="phone" name="phone" maxlength="11" placeholder="Phone-number"/>
						<br>
					</div>
					<div>
						<div class="view">생년월일</div>
						<input type="text" class="form-control" id="birthday" name="birthday" maxlength="8" placeholder="ex) 19900101"/>
						<br><br>
					</div>
					<div class="form-group">
						<div>
							<div class="addon">우편번호</div>
							<input type="text" 		class="form-control" name="zipcode" id="zipcode" readonly />
							<input type="button"	class="form-control" onclick="daumZipCode()" value="우편번호검색" />
							<br>
						</div>
						<div>
							<div class="addon">주소</div>
							<input type="text" class="form-control" id="address01" name="address01" />
							<br>
						</div>
						<div>
							<div class="addon">상세주소</div>
							<input type="text" class="form-control" id="address02" name="address02" />
							<br><br>
						</div>
					</div>
				</div>
				
			
				<div class="form-group">
					<label for="id" class="col-sm-3 control-label">회원가입 동의</label>
					<div class="col-sm-2">
						<label class="radio-inlne">
							<input type="radio" id="registerYn" name="registerYn" value="Y" checked> 동의&nbsp;&nbsp;
						</label>
						<label class="radio-inlne">
							<input type="radio" id="registerYn" name="registerYn" value="N"> 동의 안함
						</label>
					</div>
				</div>
				
				
				<div class="alert alert-info fade in col-sm-offset-1 col-sm-10">
					<strong>[도서쇼핑몰의 개인 정보 수집 및 이용 안내]</strong>
					<h5>
					개인 정보 제3자 제공 동의
					<br>① 개인정보를 제공받는 자: BookStore
					<br>② 개인정보를 제공받는 자의 개인 정보 이용 목적 : 영업관리, 
					설문조사 및 프로모션, 이벤트 경품 제공, eDM 발송, 행사 관련 마케팅
					<br>③ 제공하는 개인정보항목 : 이름, 이메일주소, 회사명, 직무/직책, 연락처, 휴대전화
					<br>④ 개인정보를 제공받는 자의 개인 정보 보유 및 이용 기간 :
					개인정보 취급 목적을 달성하여 더 이상 개인정보가 불 필요하게 된 경우이거나
					5년이 지나면 지체 없이 해당 정보를 파기할 것입니다.
					<br>귀하는 위와 같은 BookStore의 개인정보 수집 및 이용정책에 동의하지 
					않을 수 있으나, BookStore으로부터 솔루션, 최신 IT정보, 행사초청안내 등의 
					유용한 정보를 제공받지 못 할 수 있습니다.
					<br> 개인 정보 보호에 대한 자세한 내용은 http://www.BookStore.com 을 참조바랍니다.
					</h5>
					<div class="checkbox" align="center">
						<label>
							<input type="checkbox" id="is_subscribed" name="is_subscribed" value="o"/>
						</label> BookStore의 개인정보 수집 및 이용에 동의합니다.
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-4">
						<button type="reset"  class="btn btn-warning">다시 입력</button>
						<button type="submit" class="btn btn-primary">회원 가입</button>
						<input type="submit" value="회원가입"/>
					</div>
				</div>
			</form>
		</div>
			
		<!-- 푸터 -->
		<jsp:include page="../common/footer.jsp" flush="false"/>
	</body>
	
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
	
	<!-- 회원가입 성공시 표시할 알림문구 -->
	
	<script>
		int result = ${result};
		if(result != 0) {
			alert("회원가입이 완료되었습니다! \n 로그인 해주세요~");
			
			result = 0;
		}
	
	</script>
	
	<script>
	const myModal = document.getElementById('myModal')
	const myInput = document.getElementById('myInput')

	myModal.addEventListener('shown.bs.modal', () => {
	  myInput.focus()
	})
	</script>
	
</html>