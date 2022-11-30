<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("UTF-8");%>  

<style>
html, body {
    /*font-family: "Gowun Dodum";*/
    font-size: 16px;
    background-color: #E9ECEF;
}

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure,
footer, header, hgroup, menu, nav, section {
    display: block;
}
body {
    line-height: 1;
}
ol, ul {
    list-style: none;
}
blockquote, q {
    quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
    content: '';
    content: none;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}

li {
	padding: 10px;
}

li a {
    text-decoration: none!important;
    color: gray;
}

li a:hover {
	text-decoration: none;
	color: white;
}

.dropdown-menu li a {
	color: gray;
}

.dropdown-menu li a:hover {
	color: black;
}

#mypage {
	padding: 30px;
	color: white;
}
	
nav.col-sm-2 {
	background: #333333;
	padding: 0;
	flex-direction: row;
}

.nav h4 {
	color: white;
}

#top {
	padding: 0px;
	height: 150px;
}

#c1 {
	background: #333333;
	color: white;
	text-align: center;
}

.nav-item button {
	color: gray;
	width: 200px;
}

.nav-item button:hover {
	color: gray;
}

ul {
	text-align: center;
}

div .col-sm-9 {
	background: white;
	height: 300px;
	margin-left:10px;
	border-radius: 10px;
	margin-top: 20px;
	margin-bottom: 20px;
}

div .col-sm-7 {
	border: 1px solid lightgray;
	width: 70%;
	height: 220px;
	margin-left:10px;
	margin-top: 15px;
	border-radius: 10px;
}

div .col-md-3 {
	height: 100px;
	margin-left:10px;
	margin-right: 10px;
}

div .col-md-6 {
	border-radius: 10px;
	margin-left:10px;
	height: 100px;
	width: 80%:
}

i {
	color: gray;
}

.col-sm-2 {
	padding: 20px;
}

td a {
	color: gray;
	text-decoration: none;
}

td a:hover {
	color: black;
}

#detail {
	margin-top: 8px;
}

#bucket {
	margin-top: 8px;
}

.commentArea {
	border-bottom:1px solid darkgray; 
	margin-top: 25px; 
	margin-bottom: 14px; 
}

#review {
	margin-top: 20px;
	margin-right: 20px;
	margin-bottom: 20px;
}

#review a {
	color: #333333;
	text-decoration: none;
}

#review a:hover{
	color: gray;
	text-decoration: none;
}
</style>