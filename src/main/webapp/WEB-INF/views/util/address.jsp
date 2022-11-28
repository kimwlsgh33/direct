<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	// https://postcode.map.daum.net/guide 다음 주소 검색 API
	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 검색</title>
</head>
<body>

<!-- 상단 메뉴 -->
<jsp:include page="../common/topMenu.jsp" flush="false"/>

<div class="container">
	<div class="row">
		<jsp:include page="../common/sideMenu.jsp" flush="false"/>
		<div class="col-sm-10" id="top">
			<jsp:include page="../common/headMenu.jsp" flush="false"/>
		<form class="row g-3" name="zipForm" method="post" style="margin-left: 30%;">
			<h2 style="padding-top: 30px;">배송지 관리</h2>
			<div class="form-group" style="margin-top: 50px;">
				<label class="form-label" style="text-align: right">우편번호</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" name="zipcode" id="zipcode" readonly/>
					<input type="button" class="form-control" onclick="daumZipCode()" value="우편번호검색"/>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label" style="text-align: right">주 소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="address01" name="address01"/>
				</div>
			</div>
			<div class="form-group">
				<label class="form-label" style="text-align:right">상세주소</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="address02" name="address02"/>
				</div>
			</div>
			<button class="btn" type="submit">등록</button>
		</form>
		</div>
	</div>
</div>

<!-- 하단 메뉴 -->
<jsp:include page="../common/footer.jsp" flush="false"/>

</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumZipCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업창에서 검색한 결과 중 항목을 클릭했을 경우 실행할 코드
			
			// 각 주소의 노출 규칙에 따라 주소를 조합해야한다.
			// 내려오는 변수가 값이 없는 경우에는 공백('') 값을 가지므로 이름을 참고해 분기한다.
			var fullAddr = '';	// 최종 주소 변수
			var subAddr = '';	// 조합형 주소 변수
			
			// 사용자가 선택한 주소의 타입에 따라서 해당 주소 값을 가져온다
			if(data.userSelectedType == 'R') {	// 도로명 주소 선택할 경우
				fullAddr = data.roadAddress;
			} else {	// 지번 주소 선택할 경우
				fullAddr = data.jibunAddress;
			}
			
			// 사용자가 선택한 주소가 도로명 타입일 때 조합한다.
			if(data.userSelectedType == 'R') {
				// 법정동명이 있을 경우 추가한다.
				if(data.bname != '') { // not null인 경우(데이터있음)
					subAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if(data.buildingName != '') {
					subAddr += (subAddr != '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가해 최종주소를 만든다.
				fullAddr += (subAddr != '' ? '(' + subAddr + ')' : '');
			}
			
			// 우편번호와 주소정보를 화면의 해당 필드에 출력시킨다.
			// 5자리의 새 우편번호
			document.getElementById('zipcode').value = data.zonecode;
			document.getElementById('address01').value = fullAddr;
			
			// 커서를 상세주소 입력란으로 이동시킨다.
			document.getElementById('address02').focus();
		}
	}).open({
		// 우편번호 팝업창이 여러개 뜨는 것을 방지하기 위해 popupName사용
		popupName: 'postcodePopup'
	});
}
</script>

</html>