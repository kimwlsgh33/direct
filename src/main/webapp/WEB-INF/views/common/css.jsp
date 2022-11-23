<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("UTF-8");%>  

<style>
.navbar {
		margin-bottom: 10;
		background: #fff2ee;
		border: 0;
		font-size: 15px;
		letter-spacing: 2px;
	}
	
.navbar-form {
   margin: 0px;
   padding-top: 8px;
}
	
.btn {
	background: gray;
	color: white;
}

.navbar-brand {
	font-size: 20px;
	font-weight: bold;
}

#mypage {
	padding: 30px;
	color: gray;
}
	
nav.col-sm-2 {
	background: #fff2ee;
	padding: 0;
	flex-direction: row;
}

h4 {
	color: gray;
}

#line {
	border: 1px dashed lightgray;
}

#c1 {
	background: #fff2ee;
	color: gray;
	text-align: center;
}

#top {
	padding: 0px;
}

a {
	color: gray;
	text-decoration: none;
}

a:hover {
	text-decoration: none;
}

a:active {
	text-decoration: none;
}


ul {
	text-align: center;
}

.nav-tabs.nav-justified {
	width: 100%;
	height: 80px;
}

#search {
	padding: 30px;
	width: 50%;
}

div .col-sm-8 {
	border: 1px solid lightgray;
	height: 300px;
	margin-left:10px;
	border-radius: 10px;
	margin-bottom: 20px;
}

div .col-sm-7 {
	border: 1px solid lightgray;
	width: 70%;
	height: 220px;
	margin-left:10px;
	border-radius: 10px;
}

div .col-md-3 {
	border: 1px solid lightgray;
	border-radius: 10px;
	height: 100px;
	margin-left:10px;
}

div .col-md-7 {
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-left:10px;
	height: 100px;
}

#modalbtn {
	background: rgba(0,0,0,0);
}

i {
	color: gray;
}

.col-sm-2 {
	padding: 20px;
}




</style>