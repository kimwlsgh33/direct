<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 전체 목록</title>
	
</head>
<body>

<%
if(session.getAttribute("isLogOn") == null || session.getAttribute("isLogOn").equals("")) {
	response.sendRedirect("/user/signIn");
}
/*
<c:choose>
	<c:when test="${isLogOn == true && member != null}">
		<p><b>${member.name}님, 즐거운 시간되십시오.</b></p>
		<a href="${contextPath}/member/logout.do" class="btn btn-danger">
			<span class="glyphicon glyphicon-log-out"></span>로그아웃
		</a>
	</c:when>
</c:choose>
*/
%>

<!-- 메뉴바 -->
<jsp:include page="../common/header.jsp" flush="false"/>



<div class="container">
	<h1 align="center">회원 전체 목록</h1>
	<div style="margin-bottom: 20px;">
		<a href="${ctx}/user/logout" class="btn btn-sm btn-outline-primary"><span class="glyphicon glyphicon-log-out">로그아웃</span></a>
		<a class="btn btn-sm btn-outline-primary" href="${ctx}/user/signIn">로그인</a>
	</div>
	<table class="table table-bordered table-striped table-hover">
		<tr class="info">
			<td align="center" width="80"><b>아이디</b></td>
			<td align="center" width="80"><b>이  름</b></td>
			<td align="center" width="100"><b>우편번호</b></td>
			<td align="center" width="300"><b>주  소</b></td>
			<td align="center" width="100"><b>상세주소</b></td>
			<td align="center" width="100"><b>비밀번호</b></td>
			<td align="center" width="150"><b>가입일자</b></td>
			<td align="center" width="300"><b>이 메 일</b></td>
			<td align="center" width="80"><b>수정</b></td>
			<td align="center" width="80"><b>삭제</b></td>
		</tr>
	<c:forEach var="member" items="${memberLists}">	
		<tr>
			<td align="center">${member.id}</td>
			<td align="center">${member.name}</td>
			<td align="center">${member.zip_code}</td>
			<td align="center">${member.address}</td>
			<td align="center">${member.address_detail}</td>
			<td align="center">${member.pwd}</td>
			<td align="center"><fmt:formatDate value="${member.created_at}" pattern="yyyy년 MM월 dd일"/></td>
			<td align="center">${member.email}</td>
			<td align="center"><a class="btn btn-sm" href="${ctx}/member/updateMemberForm?user_id=${member.user_id}">수정</a></td>
			<td align="center"><a class="btn btn-sm" href="${ctx}/member/removeMember?user_id=${member.user_id}">삭제</a></td>
		</tr>
	</c:forEach>	
	</table>
</div>

<jsp:include page="../common/footer.jsp" flush="false"/>

</body>
</html>




