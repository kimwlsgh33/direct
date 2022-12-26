<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%
	ArrayList<Integer> recommendList = new ArrayList<Integer>();
	for (int i = 0; i < 10; i++) {
		recommendList.add(i);
	}
%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<style>
	.mainContainer {
		background-color: white;
	}

	.mainCategory{
		border-radius: 20px;
		overflow: hidden;
		box-shadow:
				0.7px 0.7px 0.7px rgba(0, 0, 0, 0.02),
				1.7px 1.8px 1.8px rgba(0, 0, 0, 0.028),
				3.3px 3.4px 3.4px rgba(0, 0, 0, 0.035),
				5.8px 6px 6px rgba(0, 0, 0, 0.042),
				10.9px 11.3px 11.3px rgba(0, 0, 0, 0.05),
				26px 27px 27px rgba(0, 0, 0, 0.07);
	}

	.mainNavs {
		border-radius: 0 0 20px 20px;
		padding:0 20px;
	}

	.title2 {
		font-family: 'DoHyeon';
	}

	.circle {
		width: 70px;
		height: 70px;
		border: 1px solid #F5F5F5;
		transition: 0.3s ease-in-out;
		box-shadow:
				0.7px 0.7px 0.7px rgba(0, 0, 0, 0.02),
				1.7px 1.8px 1.8px rgba(0, 0, 0, 0.028),
				3.3px 3.4px 3.4px rgba(0, 0, 0, 0.035),
				5.8px 6px 6px rgba(0, 0, 0, 0.042),
				10.9px 11.3px 11.3px rgba(0, 0, 0, 0.05),
				26px 27px 27px rgba(0, 0, 0, 0.07);
	}

	.btn-circle:hover .circle {
		background-color: #F5F5F5;
	}

	.square {
		width: 70px;
		height: 70px;
		border: 1px solid #F5F5F5;
		transition: 0.3s ease-in-out;
		box-shadow:
				0.7px 0.7px 0.7px rgba(0, 0, 0, 0.02),
				1.7px 1.8px 1.8px rgba(0, 0, 0, 0.028),
				3.3px 3.4px 3.4px rgba(0, 0, 0, 0.035),
				5.8px 6px 6px rgba(0, 0, 0, 0.042),
				10.9px 11.3px 11.3px rgba(0, 0, 0, 0.05),
				26px 27px 27px rgba(0, 0, 0, 0.07);
	}

	.square:hover {
		background-color: #F5F5F5;
	}

	.itemCard {
		opacity: 0;
		box-shadow:
				0.7px 0.7px 0.7px rgba(0, 0, 0, 0.02),
				1.7px 1.8px 1.8px rgba(0, 0, 0, 0.028),
				3.3px 3.4px 3.4px rgba(0, 0, 0, 0.035),
				5.8px 6px 6px rgba(0, 0, 0, 0.042),
				10.9px 11.3px 11.3px rgba(0, 0, 0, 0.05),
				26px 27px 27px rgba(0, 0, 0, 0.07);
	}

	.itemCard:hover {
		box-shadow:
				0.7px 0.7px 0.7px rgba(0, 0, 0, 0.02),
				1.7px 1.8px 1.8px rgba(0, 0, 0, 0.028),
				3.3px 3.4px 3.4px rgba(0, 0, 0, 0.035),
				5.8px 6px 6px rgba(0, 0, 0, 0.042),
				10.9px 11.3px 11.3px rgba(0, 0, 0, 0.05),
				26px 27px 27px rgba(0, 0, 0, 0.2);
	}

	.itemVO-lists {
		overflow-x:scroll;
		overflow-y:hidden;
	}

	::-webkit-scrollbar {
		display: none;
	}

	.itemVO-lists::-webkit-scrollbar {
		display: block;
	}

	.itemVO-lists::-webkit-scrollbar-track {
		background: transparent;
	}

	.itemVO-lists::-webkit-scrollbar-thumb {
		background: #888;
		border-radius: 10px;
	}

	.itemVO-lists::-webkit-scrollbar-thumb:hover {
		background: #555;
	}


	@keyframes testAnim {
		0% {
			opacity: 0;
			transform: scale(0.5) translateX(100%);
		}
		100% {
			opacity: 1;
			transform: scale(1) translateX(0);
		}
	}

	.fadeInRight {
		animation-name: testAnim;
		animation-duration: 1s;
		opacity: 1;
	}

</style>
<body>
<jsp:include page="common/header.jsp" flush="false"/>

<div class="container-fluid pt-5 mainContainer">
	<div class="row">
		<div class="d-flex justify-content-center mb-4 fs-3 fw-bold">오늘바로 받아보는 당일배송</div>
	</div>
	<div class="row">
		<div class="col">
			<div class="mainCategory flex-column" style="background-color: #619DFF;">
				<div class="flex-column justify-content-center align-items-center p-4">
					<div class="bg-light text-center rounded-pill p-1 col-lg-4 ">지역한정 당일배송</div>
					<div class="fs-1 fw-bold text-light mt-3 title2">어바웃펫</div>
					<div class="text-light pt-1">사료, 일상, 케어까지 한번에</div>
					<a class="btn btn-outline-light rounded-pill mt-4" href="${ctx}/events/1">바로가기</a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary container-fluid mainNavs" style="padding:0 20px;">
					<div class="navbar-nav container-fluid">
						<li class="nav-itemVO">
							<a href="#" class="nav-link">행사중</a>
						</li>
						<li class="nav-itemVO">
							<a href="#" class="nav-link">베스트</a>
						</li>
						<li class="nav-itemVO">
							<a href="#" class="nav-link">펫상담</a>
						</li>
					</div>
				</nav>
			</div>
		</div>
		<div class="col">
			<div class="mainCategory flex-column" style="background-color: #FF5E93;">
				<div class="flex-column justify-content-center align-items-center p-4">
					<div class="bg-light text-center rounded-pill p-1 col-lg-4 ">지역한정 새벽배송</div>
					<div class="fs-1 fw-bold text-light mt-3 title2">어바웃펫</div>
					<div class="text-light pt-1">사료, 일상, 케어까지 한번에</div>
					<a class="btn btn-outline-light rounded-pill mt-4" href="${ctx}/events/2">바로가기</a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-dark container-fluid mainNavs" style="padding:0 20px; background-color: #EB5787;">
					<div class="navbar-nav container-fluid">
						<li class="nav-itemVO">
							<a href="#" class="nav-link">행사중</a>
						</li>
						<li class="nav-itemVO">
							<a href="#" class="nav-link">베스트</a>
						</li>
						<li class="nav-itemVO">
							<a href="#" class="nav-link">펫상담</a>
						</li>
					</div>
				</nav>
			</div>
		</div>
	</div>

	<div class="row mt-5 mb-4">
		<div class="d-flex justify-content-center mb-2 fs-3 fw-bold">믿고사는 브랜드직영관</div>
	</div>

	<div class="container text-center d-flex justify-content-center flex-wrap gap-4 mb-4">
		<c:forEach var="category" items="${categoryList}">
			<a href="${ctx}/item/searchList?category_id=${category.category_id}" class="link-dark btn-circle">
				<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
					<i class="${category.icon} fa-xl" style="color:  ${category.color}"></i>
				</div>
				<span>${category.name}</span>
			</a>
		</c:forEach>
	</div>

	<hr class="my-4">

	<div class="container text-center d-flex justify-content-center flex-wrap gap-4 mb-4">
		<a href="#" class="link-dark">
			<div class="rounded-2 d-flex justify-content-center align-items-center mb-2 square" >
				<i class="fa-brands fa-apple fa-xl" style="color: silver;"></i>
			</div>
			<span>Apple</span>
		</a>
		<a href="#" class="link-dark">
			<div class="rounded-2 d-flex justify-content-center align-items-center mb-2 square" >
				<i class="fa-brands fa-xbox fa-xl" style="color:limegreen;"></i>
			</div>
			<span>XBox</span>
		</a>
		<a href="#" class="link-dark">
			<div class="rounded-2 d-flex justify-content-center align-items-center mb-2 square" >
				<i class="fa-brands fa-playstation fa-xl" style="color:blue;"></i>
			</div>
			<span>Playstation</span>
		</a>
	</div>

	<div class="d-flex justify-content-center pb-3">
		<a class="btn btn-outline-success btn-lg rounded-pill" href="#" role="button">브랜드관 바로가기
			<i class="fa-solid fa-chevron-right"></i>
		</a>
	</div>
</div>
<div class="container-fluid bg-primary d-flex justify-content-between align-items-center p-3 mt-2 mainContainer">
	<p style="font-size: 20px;">AI <span style="color:gold">추천상품</span>을 만나보세요</p>
	<a class="btn btn-light rounded-pill shadow" href="#" role="button">
		<span>AI 추천상품</span>
		<i class="fa-solid fa-chevron-left"></i>
	</a>
</div>
<div class="w-100 mt-2 mainContainer">
	<div class="p-3">
		<i class="fa-solid fa-basket-shopping" style="color:pink"></i>
		<span class="fw-bold">오늘의 쇼핑제안</span>
	</div>
	<div class="gap-3 d-flex px-3 pb-4 itemVO-lists" >
		<c:forEach var="itemRecomm" items="${recommendList}" varStatus="status">
			<a id="list-recommend-${itemRecomm.item_id}" class="rounded-4 mb-3 pt-3 itemCard btn" href="${ctx}/item/detail?item_id=${itemRecomm.item_id}">
				<img src="${itemRecomm.img_url}" class="card-img-top cardImage" alt="상품명">
				<div class="m-2" style="width: 200px">
					<p class="text-bold mb-2" style="font-size:16px;">${itemRecomm.name}</p>
					<p class="card-text mb-1"><small class="text-muted">75% / 1000+</small></p>
					<div class="progress">
						<c:choose>
							<c:when test="${status.index == 3}">
								<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:when>
							<c:otherwise>
								<div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
	<div class="p-3">
		<i class="fa-solid fa-certificate" style="color:gold"></i>
		<span class="fw-bold" style="color:orangered">특가 상품</span>
	</div>
	<div class="gap-3 d-flex px-3 pb-4 itemVO-lists" style="overflow:scroll">
		<c:forEach var="item" items="${saleList}" varStatus="status">
			<a id="list-recommend-${item.item_id}" class="rounded-4 mb-3 pt-3 itemCard btn" href="${ctx}/item/detail?item_id=${item.item_id}">
				<img src="${item.img_url}" class="card-img-top cardImage" alt="상품명">
				<div class="m-2" style="width: 200px">
					<p class="text-bold mb-2" style="font-size:16px;">${item.name}</p>
					<p class="card-text mb-1"><small class="text-muted">75% / 1000+</small></p>
					<div class="progress">
						<c:choose>
							<c:when test="${status.index == 3}">
								<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:when>
							<c:otherwise>
								<div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
</div>
<div class="w-100 mt-2 mainContainer">
<%--	<div class="progress">--%>
<%--		<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>--%>
<%--	</div>--%>
</div>
<jsp:include page="common/footer.jsp" flush="false"/>
</body>
<script>
	// id에 itemVO-list-1~5까지의 id를 가진 a태그를 선택
	// 선택된 a태그에 click 이벤트를 할당


	const itemCards = document.querySelectorAll('.itemVO-lists a');

	//const btn1 = document.querySelector("#list-itemVO-1");
	const observer = new IntersectionObserver((entries) => {
		entries.forEach((entry, idx) => {
			if (entry.isIntersecting) {
				setTimeout(() => {
					entry.target.classList.add('fadeInRight');
				}, 50 * idx);
			} else {
				// entry.target.classList.remove('fadeInRight');
			}
		});
	});

	//observer.observe(btn1);
	itemCards.forEach((itemCard) => {
		observer.observe(itemCard);
	});

</script>
</html>
