<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	.cardImage {
	}
</style>
<body>
<jsp:include page="common/header.jsp" flush="false"/>
<div class="container-fluid p-3 my-2 mainContainer">
	<form class="input-group" method="post" action="${ctx}/search">
		<input id="search" class="form-control" type="search" placeholder="????????? ????????? ??????????????????" aria-label="Search">
		<button class="btn btn-outline-primary" type="submit">
			<i class="fas fa-search"></i>
		</button>
	</form>
</div>
<div class="container-fluid pt-5 mainContainer">
	<div class="row">
		<div class="tete d-flex justify-content-center mb-4 fs-3 fw-bold">???????????? ???????????? ????????????</div>
	</div>
	<div class="row">
		<div class="col">
			<div class="mainCategory flex-column" style="background-color: #619DFF;">
				<div class="flex-column justify-content-center align-items-center p-4">
					<div class="bg-light text-center rounded-pill p-1 col-lg-4 ">???????????? ????????????</div>
					<div class="fs-1 fw-bold text-light mt-3 title2">????????????</div>
					<div class="text-light pt-1">??????, ??????, ???????????? ?????????</div>
					<a class="btn btn-outline-light rounded-pill mt-4" href="${ctx}/events/1">????????????</a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-dark bg-primary container-fluid mainNavs" style="padding:0 20px;">
					<div class="navbar-nav container-fluid">
						<li class="nav-item">
							<a href="#" class="nav-link">?????????</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">?????????</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">?????????</a>
						</li>
					</div>
				</nav>
			</div>
		</div>
		<div class="col">
			<div class="mainCategory flex-column" style="background-color: #FF5E93;">
				<div class="flex-column justify-content-center align-items-center p-4">
					<div class="bg-light text-center rounded-pill p-1 col-lg-4 ">???????????? ????????????</div>
					<div class="fs-1 fw-bold text-light mt-3 title2">????????????</div>
					<div class="text-light pt-1">??????, ??????, ???????????? ?????????</div>
					<a class="btn btn-outline-light rounded-pill mt-4" href="${ctx}/events/2">????????????</a>
				</div>
				<nav class="navbar navbar-expand-lg navbar-dark container-fluid mainNavs" style="padding:0 20px; background-color: #EB5787;">
					<div class="navbar-nav container-fluid">
						<li class="nav-item">
							<a href="#" class="nav-link">?????????</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">?????????</a>
						</li>
						<li class="nav-item">
							<a href="#" class="nav-link">?????????</a>
						</li>
					</div>
				</nav>
			</div>
		</div>
	</div>

	<div class="row mt-5 mb-4">
		<div class="tete d-flex justify-content-center mb-2 fs-3 fw-bold">???????????? ??????????????????</div>
	</div>

	<div class="container text-center d-flex justify-content-center flex-wrap gap-4 mb-4">
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-crown fa-xl" style="color: gold;"></i>
			</div>
			<span>?????????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-gift fa-xl" style="color:goldenrod;"></i>
			</div>
			<span>????????????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-umbrella-beach fa-xl" style="color: lightskyblue;"></i>
			</div>
			<span>????????????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-bowl-food fa-xl" style="color: wheat"></i>
			</div>
			<span>??????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-heart fa-xl" style="color: red"></i>
			</div>
			<span>??????/??????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-shirt fa-xl"></i>
			</div>
			<span>??????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-pump-soap fa-xl" style="color: mediumpurple"></i>
			</div>
			<span>??????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-campground fa-xl" style="color: forestgreen"></i>
			</div>
			<span>????????????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-fish-fins fa-xl" style="color: blue"></i>
			</div>
			<span>????????????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-mobile fa-xl" style="color: black"></i>
			</div>
			<span>????????????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-ghost fa-xl" style="color: darkgray"></i>
			</div>
			<span>?????????</span>
		</a>
		<a href="#" class="link-dark btn-circle">
			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-paw fa-xl" style="color: hotpink"></i>
			</div>
			<span>??? ??????</span>
		</a>
		<a href="#" class="link-dark btn-circle">




     




















			<div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
				<i class="fa-solid fa-boxes-stacked fa-xl" style="color: sandybrown"></i>
			</div>
			<span>??????</span>
		</a>
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
		<a class="btn btn-outline-success btn-lg rounded-pill" href="#" role="button">???????????? ????????????
			<i class="fa-solid fa-chevron-right"></i>
		</a>
	</div>
</div>
<div class="container-fluid bg-primary d-flex justify-content-between align-items-center p-3 mt-2 mainContainer">
	<p style="font-size: 20px;">AI <span style="color:gold">????????????</span>??? ???????????????</p>
	<a class="btn btn-light rounded-pill shadow" href="#" role="button">
		<span>AI ????????????</span>
		<i class="fa-solid fa-chevron-left"></i>
	</a>
</div>
<div class="containerfluid p-3 mt-2 mainContainer">
	<div class="mb-3">
		<i class="fa-solid fa-basket-shopping" style="color:pink"></i>
		<span>????????? ????????????</span>
	</div>

	<div class="gap-3 d-flex" style="overflow:scroll">
		<c:forEach var="item" items="<%=recommendList%>">
			<div id="list-item-${item+1}" class="rounded-4 shadow mb-3 pt-3" >
				<img src="${ctx}/resources/icons/logo.svg" class="card-img-top cardImage" alt="?????????">
				<div class="m-2" style="width: 200px">
					<p class="text-bold mb-2" style="font-size:16px;">???????????? C to C ?????????</p>
					<p class="card-text mb-1"><small class="text-muted">75% / 1000+</small></p>
					<div class="progress">
						<c:choose>
							<c:when test="${item == 3}">
								<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:when>
							<c:otherwise>
								<div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class="container-fluid p-3 mt-2 mainContainer">
	<div>
		<i class="fa-solid fa-certificate" style="color:gold"></i>
		<span style="color:orangered">?????? ??????</span>
	</div>
	<div class="gap-3 d-flex" style="overflow:scroll">
		<c:forEach var="item" items="<%=recommendList%>">
			<div id="list-item-${item+1}" class="rounded-4 shadow mb-3 pt-3" >
				<img src="${ctx}/resources/icons/logo.svg" class="card-img-top cardImage" alt="?????????">
				<div class="m-2" style="width: 200px">
					<p class="text-bold mb-2" style="font-size:16px;">???????????? C to C ?????????</p>
					<p class="card-text mb-1"><small class="text-muted">75% / 1000+</small></p>
					<div class="progress">
						<c:choose>
							<c:when test="${item == 1}">
								<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:when>
							<c:otherwise>
								<div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class="container-fluid p-3 mt-2 mainContainer">
	<div class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-label="Animated striped" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
	</div>
</div>
<jsp:include page="common/footer.jsp" flush="false"/>
</body>
</html>
