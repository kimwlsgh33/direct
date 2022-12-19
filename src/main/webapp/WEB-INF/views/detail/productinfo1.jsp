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

		<div>
			<div>
				<div id="detail" style="text-align:left; margin-top:30px; font-size:15px; font-weight:bold; margin-bottom:10px;">상품정보</div>
			</div>
			<div class="row" id="bdrt" style="height:40px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">상품번호</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">${itemDTO.itemVO.item_id}</div>
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">상품상태</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">신상품</div>
			</div>
			<div class="row" id="bdrt" style="height:40px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">제조사</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">삼성</div>
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">브랜드</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">삼성</div>
			</div>
			<div class="row" id="bdrtb" style="height:40px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">모델명</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">${itemDTO.itemVO.name}</div>
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">원산지</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">대한민국</div>
			</div>
			
			<div class="row" id="bdrtb" style="height:40px; margin-top:15px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">소재</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">나무</div>
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">기능</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">두뇌개발,흥미유발,분리불안해소</div>
			</div>
			
			<div class="row" id="bdrt" style="height:40px; margin-top:15px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">영수증발급</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">신용카드전표,현금영수증발급</div>
			</div>
			<div class="row" id="bdrtb" style="height:60px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">A/S안내</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">1800-9808<br>1800-9808</div>
			</div>
		</div>

</body>
</html>