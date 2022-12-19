<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c"	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>제품 상세페이지</title>
	<style>
		.fileDrop {
			width: 400px;
			height: 400px;
			border: 1px solid gray;
		}
		.testimagebox {
			width: 150px;
			height: 150px;
		}

		.textleft {
			text-align: left;
		}

		/*.border {*/
		/*	border: 1px solid gray;*/
		/*}*/

		.bdr{
			border-right: 1px solid gray;
		}

		#bdrtb{
			border-top: 1px solid gray;
			border-bottom: 1px solid gray;
		}

		#bdrt{
			border-top: 1px solid gray;
		}

		.btn-bd-primary {
			border-radius: .50rem;
		}

		#bdradi {
			border-radius: .50rem;
		}

		#bgcg {
			background-color:rgb(220, 220, 220, 0.2);
		}

		#delivericon {
			background-color:pink;
			border-radius: 50%;
		}

		#bdr40 {
			border-radius: 50%;
		}

		/*a {*/
		/*	color:#333;*/
		/*}*/

		/*#shownav {*/
		/*	margin-top:25px;*/
		/*	height:50px;*/
		/*	background-color: yellow;*/
		/*	opacity: 0;*/
		/*	transition: all 3s;*/
		/*}*/

		#star {
			fill:red;
		}
	</style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
<div align="center" class="col-sm-6 container"><hr>
	<div class="row" id="border">
		<div class="col-md-6 bdr">
			<div class="text-center">
				<div id="carouselIndicators" class="carousel carousel-dark slide" data-bs-ride="true" style="">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" style="color:red;"></button>
						<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
						<button type="button" data-bs-target="#carouselIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
					</div>
					<div class="carousel-inner">
						<c:forEach items="${itemDTO.imgList}" var="image">
							<div class="carousel-item active ratio ratio-1x1">
								<img src="${image.img_url}" class="d-block" alt="..." style="">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselIndicators" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselIndicators" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>

			</div>
			<div class="d-flex justify-content-start align-items-end" style="height:420px; margin:10px;">리뷰수 <span style="font-weight:bold; font-size:20px;">${reviewCount}</span>·<span>사용자 총 평점</span><span style="font-weight:bold; font-size:20px;">2.0/5</span></div>
		</div>
		<div class="col-md-6">
			<div style="text-align:left; padding-top:10px;"><span style="font-weight:bold">펫프렌즈</span> | <span style="color:rgb(105, 105, 105,0.8)">관심고객수</span></div>
			<div style="text-align:left; font-weight:bold; font-size:25px;">
				${itemDTO.itemVO.name}
			</div>
			<div style="text-align:right; font-weight:bold; font-size:25px;">${itemDTO.itemVO.price}원</div>
			<div class="border">
				<div style="text-align:left; border-bottom: 1px solid gray; padding:5px; font-weight:bold;">회원님을 위한 혜택</div>
				<div class="row" style="padding:5px;">
					<div class="col-sm-6" style="text-align:left;">최대 적립 포인트</div>
					<div class="col-sm-6" style="text-align:right;">1500원</div>
				</div>
				<div style="padding:9px;">
					<div class="border" style="padding:7px; background-color:rgb(220, 220, 220, 0.3)">
						<div class="row">
							<div class="col-sm-6" style="text-align:left; font-weight:bold;"><span class="fst-italic" style="color:red;">TIP.</span> 포인트 더 받는 방법</div>
							<div class="col-sm-6" style="text-align:right; font-weight:bold;">+최대 1500원</div>
						</div>
						<div class="row">
							<div class="col-sm-6 text-decoration-underline" style="text-align:left; font-size:12px;">최대 5% 적립,무료 시작</div>
							<div class="col-sm-6" style="text-align:right; font-size:12px;">1500원</div>
						</div>
						<div class="row">
							<div class="col-sm-6 text-decoration-underline" style="text-align:left; font-size:12px;">네이버 현대카드로 결제 시</div>
							<div class="col-sm-6" style="text-align:right; font-size:12px;">1500원</div>
						</div>
						<div class="row">
							<div class="col-sm-6 text-decoration-underline" style="text-align:left; font-size:12px;">네이버페이 머니로 결제 시</div>
							<div class="col-sm-6" style="text-align:right; font-size:12px;">750원</div>
						</div>
					</div>
				</div>
			</div>
			<div style="padding:15px;">
				<div class="row d-flex justify-content-between align-items-center border" style="height:40px; background-color: rgb(0, 0, 139,0.8);">
					<div class="col-sm-6" style="text-align:left; color:white;">이 상품 <span style="color:SpringGreen;">5%</span> 돌려받기</div>
					<div class="col-sm-6" style="text-align:right; color:white;">></div>
				</div>
			</div>
			<div style="text-align:left;">무이자할부 | 카드 자세히보기</div><hr>
			<div style="padding:15px;">
				<div class="row d-flex justify-content-center align-items-center border" style="height:60px;">
					<div class="col-sm-2" id="delivericon" style="font-size:30px; width:58px;"><i class="fa-solid fa-truck"></i></div>
					<div class="col-sm-10" style="text-align:left;">오늘 출발 상품<br>13:00까지 결제 시 오늘 바로 발송됩니다.</div>
				</div>
			</div>
			<div class="gap-5" style="margin-bottom:10px;">
				<div style="text-align:left;">택배배송 | 3,000원(주문시 결제)|CJ대한통운</div>
				<div style="text-align:left;">70,000원 이상 구매 시 무료 / 제주 추가 3,000원,제주 외 도서지역 추가 6,000원</div>
				<div style="text-align:left;">배송비 절약상품 보기</div>
			</div>

			<div class="col-sm-12 dropdown shadow">
				<button class="col-sm-10 btn">색상선택</button>
				<button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					<span class="caret"></span>
				</button>
				<ul class="col-sm-1 dropdown-menu">
					<li>빨강</li>
					<li>파랑</li>
					<li>노랑</li>
				</ul>
			</div>

			<div class="row d-flex justify-content-between align-items-center" style="margin:10px;">
				<div class="col-sm-6" style="text-align:left;">총 상품 금액</div>
				<div class="col-sm-6" style="text-align:right;">총 수량0개 | 0원</div>
			</div>

			<div class="col-lg" style="margin-bottom:3px;">
				<button class="col-sm-12 btn btn-success" type="button" style="padding:15px;" onclick="fn_order(${itemDTO.itemVO.item_id})">구매하기</button>
			</div>
			<div class=" d-flex justify-content-between" style="">
				<button class="col-sm-4 btn btn-outline-secondary" type="button" style="padding:10px;">톡톡문의</button>
				<button class="col-sm-4 btn btn-outline-secondary" type="button" style="padding:10px;">찜하기</button>
				<button class="col-sm-4 btn btn-outline-secondary" type="button" style="padding:10px;" onclick="fn_addCart(${itemDTO.itemVO.item_id})">장바구니</button>
			</div>
			<div style="text-align:left; margin-top:10px;">쇼핑할 때 필독 <span style="color:green;">안전거래TIP ></span></div>
			<div style="text-align:left; margin-top:10px; margin-bottom:10px;">상품정보에 문제가 있나요? <span style="color:green;">신고하기 ></span></div>
		</div>
	</div>

	<div class="sticky-top" style="padding-top: 55px;">
		<nav id="navbarspy" class="navbar row pt-2 h-100" style="background-color:rgb(220, 220, 220,0.9);">
			<ul class="nav" id="brdtb">
				<li class="col-md-3 nav-item" style="border-right: 1px solid;">
					<a class="nav-link" href="#detail" style="color:#333; font-weight:bold">상세정보</a>
				</li>
				<li class="col-md-3 nav-item" style="border-right: 1px solid;">
					<a class="nav-link" href="#review" style="color:#333; font-weight:bold">리뷰</a>
				</li>
				<li class="col-md-3 nav-item" style="border-right: 1px solid;">
					<a class="nav-link" href="#qna" style="color:#333; font-weight:bold">Q&A</a>
				</li>
				<li class="col-md-3 nav-item">
					<a class="nav-link" href="#rnc" style="color:#333; font-weight:bold">반품/교환정보</a>
				</li>
			</ul>
		</nav>
	</div>

	<!-- 상품정보 -->
	<!-- <p>상세 설명 : ${itemDTO.itemVO.description}</p> -->
	<jsp:include page="./productinfo1.jsp" flush="false"/>

	<!-- 상품 이미지 -->

	<c:forEach items="${itemDTO.imgList}" var="image">
		<div class="text-center">
		  <p>이미지 이름 : ${image.img_name}</p>
		  <img src="${image.img_url}" alt="이미지" class="img-fluid w-100"/>
		</div>
	</c:forEach>
	<hr>

	<!-- 상품정보2 -->
	<jsp:include page="./productinfo2.jsp" flush="false"/>


	<div class="textleft" style="margin-top:60px;">
		<div id="review" style="font-weight:bold; font-size:23px;">상품리뷰</div><br>
		상품을 구매하신 분들이 작성하신 리뷰입니다. 리뷰 작성시 아래 금액만큼 포인트가 적립됩니다.<br>텍스트 리뷰 : <span style="color:rgb(255, 0, 0, 0.5)">50원</span> | 포토/동영상 리뷰: <span style="color:rgb(255, 0, 0, 0.5)">150원</span>
	</div><hr>

	<div class="container">
		<div class="col-md row" style="background-color:rgb(220, 220, 220,0.5); height:400px;">
			<div class="col-md d-flex flex-column jutify-content-around">
				<div class="col-md d-flex justify-content-center align-items-center" style="font-weight:bold; font-size:20px;">사용자 총 평점</div>
				<div class="col-md d-flex justify-content-center align-items-center">
					<i class="fa-regular fa-star" style="font-size:50px;"></i>
					<i class="fa-regular fa-star" style="font-size:50px;"></i>
					<i class="fa-regular fa-star" style="font-size:50px;"></i>
					<i class="fa-regular fa-star" style="font-size:50px;"></i>
					<i class="fa-regular fa-star" style="font-size:50px;"></i>
				</div>
				<div class="col-md d-flex justify-content-center align-items-center" style="font-weight:bold; font-size:70px;">2.0/5</div>
			</div>
			<div class="col-md d-flex flex-column jutify-content-around" style="">
				<div class="col-md d-flex justify-content-center align-items-center" style="font-weight:bold; font-size:20px;">전체 리뷰수</div>
				<div class="col-md d-flex justify-content-center align-items-center"><i class="fa-regular fa-comment-dots" style="font-size:80px;"></i></div>
				<div class="col-md d-flex justify-content-center align-items-center" style="font-weight:bold; font-size:70px;">${reviewCount}</div>
			</div>
			<div class="col-md d-flex justify-content-center align-items-center" style="">
				<div class="col-md d-flex justify-content-center align-items-center" style="font-weight:bold; font-size:20px;">평점 비율</div>
				<div></div>
			</div>

		</div>
	</div>

	<div class="text-dark"><hr style="border:1px solid;"></div>

	<div class="row" style="margin-top:15px; margin-bottom:15px;">
		<div class="col-md" style="text-align:left; font-weight:bold">리뷰 ${reviewCount}건</div>
		<div class="row col-md" style="text-align:right;">
			<div class="col">최신순</div>
			<div class="col">평점 높은순</div>
			<div class="col">평점 낮은순</div>
		</div>
	</div>
	<div class="row d-flex align-items-center" id="border" style="height:50px;">
		<div class="col-md-3 bdr">전체보기</div>
		<div class="col-md-3 bdr">포토/동영상</div>
		<div class="col-md-3 bdr">스토어PICK</div>
		<div class="col-md-3">한달사용리뷰</div>
	</div>
	<hr>
	<!-- 댓글화면 -->
	<jsp:include page="./reviewpage.jsp" flush="false"/>

	<!-- Q&A화면 -->
	<jsp:include page="./QandA.jsp" flush="false"/>

	<!-- 반품/교환정보 -->
	<jsp:include page="./returnchange.jsp" flush="false"/>


</div>
</body>
<script>
	// #reviewDiv
	// 원래 페이지(detail Product)에 들어가자마자 리뷰 목록을 보여준다.
	//
	let observer = new IntersectionObserver((e)=> {
		e.forEach((박스)=> {
			if(박스.isIntersecting){
				박스.target.style.opacity = 1;
			} else {
				박스.target.style.opacity = 0;
			}
		})
	})
	let navnav = document.querySelectorAll('#shownav');

	observer.observe(navnav[0]);

	$(function(){
		$.ajax({
			url:"/review/reviewList",
			type:"get",
			success: function(result){
				$("#reviewDiv").html(result);
			},
			error: function(){
				alert("데이터 요청 실패!");
			}

		})
	})

	function fn_addCart(item_id) {
		$.ajax({
			url: "/cart/addCart",
			type: "POST",
			data: {
				"item_id": item_id,
			},
			success: function (data) {
				alert("장바구니에 추가되었습니다.");
			},
			error: function (request, status, error) {
				alert(item_id + "============================" + "code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	}

	function fn_order(item_id) {
		const form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post");
		form.setAttribute("action", "/order/createForm");
		const hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "item_id");
		hiddenField.setAttribute("value", item_id);
		form.appendChild(hiddenField);
		form.submit();
	}
</script>
</html>