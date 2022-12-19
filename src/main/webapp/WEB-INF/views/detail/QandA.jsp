<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

			<div class="textleft">
				<h3 id="qna" style="margin-top:30px; font-weight:bold; font-size:23px;">Q&A</h3><br>
					<div style="font-size:12px; color:rgb(192, 192, 192)">구매하시려는 상품에 대해 궁금하신 점이 있으신 경우 문의해주세요. '판재마 톡톡문의'를 통해 판매자와 간편하게 1:1 상담도 가능합니다.</div>
					<div class="row" style="margin-top:20px;">
						<div class="col-sm-8" style="">
							<button type="button" class="btn btn-dark">상품 Q&A 작성하기</button>
							<button type="button" class="btn btn-outline-secondary">나의 Q&A조회 ></button>
						</div>
						<div class="row col d-flex justify-content-end align-items-center " style="">
							<div class="col" style="text-align:right;">내 Q&A 보기</div>
						 	<div class="col" style="font-size:14px; text-align:right;">
						 	<select>
								<option>답변상태</option>
								<option>답변상태</option>
								<option>미답변</option>
								<option>답변완료</option>
							</select>
						 </div>
						</div>
					</div>
					<hr style="border:2px solid;">
				<div class="row">
					<div class="col" style="font-size:13px;">답변상태</div>
					<div class="col-sm-8" style="font-size:13px; text-align:center;">제목</div>
					<div class="col" style="font-size:13px; text-align:center;">작성자</div>
					<div class="col" style="font-size:13px; text-align:center;">작성일</div>
					<hr style="margin-top:15px;">
					<i class="fa-solid fa-circle-exclamation d-flex justify-content-center align-items-center" style="font-size:30px; padding:15px;"></i>
					<div class="col d-flex justify-content-center align-items-center" style="">작성된 상품 Q&A가 없습니다.</div>
					<hr style="margin-top:15px;">
				</div>	
			</div>
</body>
</html>