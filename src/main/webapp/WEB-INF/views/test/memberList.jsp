<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>   
</head>
<body>
	<div class="container">
		<h1 align="center">회원 전체 목록</h1>
		<table class="table talbe-bordered table-striped table-hover">
			<tr class="info">
				<td align="center">이	름</td>
				<td align="center">아 이 디</td>
				<td align="center">비밀번호</td>
			</tr>
			<c:forEach var="member" items="${memberList }">
			<tr>
				<td>${member.name }</td>
				<td>${member.id }</td>
				<td>${member.pw }</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>