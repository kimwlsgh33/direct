<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	#footerNav {
		margin-top: 200px;
		color: rgba(0, 0, 0, 0.5);
	}

	#footerNav a {
		color: rgba(0, 0, 0, 0.5);
		text-decoration: none;
	}

	#footerNav a:hover {
		color: darkslateblue;
	}

	.btn_gotop {
		position:fixed;
		bottom:30px;
		right:30px;
		z-index:999;
		border:1px solid #ccc;
		outline:none;
		background-color:white;
		color:#333;
		cursor:pointer;
		padding:15px 20px;
		border-radius:100%;
	}
</style>
<nav id="footerNav" class="container text-center">
	<a href="#" class="btn_gotop">
		<div class="glyphicon glyphicon-chevron-up">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
			</svg>
		</div>
	</a>
	<a class="nav-link my-3" id="footerExtContents" data-bs-toggle="collapse" href="#collapseFooter" aria-expanded="false">Linker(주) 사업자 정보</a>
	<div class="collapse" id="collapseFooter">
		<ul class="card card-body gap-3">
			<li>대표 이사 : 김진호</li>
			<li>사업자 등록번호 : 123-45-67890</li>
			<li>통신판매업신고번호 : 제 2021-서울강남-00000호</li>
			<li>주소 : 서울특별시 강남구 테헤란로 427, 10층(역삼동, 역삼역 1번 출구)</li>
			<li>전화번호 : 02-1234-5678</li>
			<li>팩스번호 : 02-1234-5679</li>
			<li>이메일 : <a href="mailto:">@linker.com</a></li>
			<li>개인정보관리책임자 : 김진호</li>
		</ul>
	</div>

	<div class="my-3">
		<a  href="#" target="_blank">사업자정보 확인</a>
		|
		<a  href="#">이용 약관</a>
	</div>

	<div>
		<a  href="#">페이</a>
		|
		<a  href="#">안전거래센터</a>
	</div>

	<div class="my-3">
		<a  href="#">전자금융거래약관</a>
		|
		<a  href="#">고객센터</a>
	</div>
	<div>대표전화 1588-3819</div>

	<div class="py-5" style="font-size: 24px;">DIRECT</div>
</nav>