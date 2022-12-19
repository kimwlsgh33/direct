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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a568cce4e6.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="textleft" id="rnc" style="font-weight:bold; font-size:23px; margin-bottom:15px;">반품/교환정보</div>
			<div class="row" id="bdrt" style="height:40px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">판매자 지정택배사</div>
				<div class="col-sm-10 d-flex align-items-center" style="text-align:left;">CJ대한통운</div>
			</div>
			<div class="row" id="bdrt" style="height:60px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">반품배송비</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">편도 5,000원(최초 배송비 무료인 경우 10,000원 부과)</div>
				<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">교환배송비</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">10,000원</div>
			</div>
			<div class="row" id="bdrt" style="">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">반품/교환 사유에 따른 요청 가능 기간</div>
				<div class="col-sm-10" style="padding:8px;">
					<div class="col" style="text-align:left;">구매자 단순 변심은 상품 수령 후 7일 이내(구매자 반품배송비 부담)</div><hr>
					<div class="col" style="text-align:left;">표시/광고와 상이,계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내(판매자 반품 배송비 부담) 둘 중 하나 경과 시 반품/교환 불가</div>
				</div>
			</div>
			<div class="row" id="bdrt" style="">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="">반품/교환 불가능 사유</div>
				<div class="col-sm-10">
				<div class="col" style="text-align:left;">1.반품요청기간이 지난 경우</div>
				<div class="col" style="text-align:left;">2.구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우(단,상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</div>
				<div class="col" style="text-align:left;">3.구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우(예: 식품,화장품,향수류,음반 등)</div>
				<div class="col" style="text-align:left;">4.구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</div>
				<div class="col" style="text-align:left;">5.시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</div>
				<div class="col" style="text-align:left;">6.고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우(판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가능하다는 사실을 서면 동의 받은 경우)</div>
				<div class="col" style="text-align:left;">7.복제가 가능한 상품 등의 포장을 훼손한 경우(CD/DVD/GAME/도서의 경우 포장 개봉 시)</div>
				</div>
			</div>
			
			<div class="textleft" style="margin-top:25px; margin-bottom:15px; font-size:15px; font-weight:bold; ">판매자정보</div>
			<div class="row" id="bdrt" style="height:40px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">상호명</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">삼성</div>
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">대표자</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">삼성</div>
			</div>
			<div class="row" id="bdrt" style="height:40px;">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">사업자등록번호</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">1234123456</div>
				<div class="col-sm-2 d-flex align-items-center" id="bgcg"  style="text-align:left;">통신판매업번호</div>
				<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">2020-서울강서-3486</div>
			</div>
			<div class="row" id="bdrtb" style="">
				<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left; height:60px;">사업장소재지</div>
				<div class="col-sm-10 d-flex align-items-center" style="font-size:12px; text-align:left;">서울특별시 강서구 방화대로(우: 12345) (메일:naver@naver.com)<br><br>고객센터: 02-511-6381</div>
			</div>
			<div id="border" style="text-align:left; padding:15px; margin-top:30px; background-color:rgb(220, 220, 220, 0.3)">
				<h5>네이버파이낸셜(결제대금예치업 등록번호: 02-006-00056)</h5>
				<div style="font-size:12px;">네이버파이낸셜은 전자금융거래법에 따라 결제대금예치업을 운영할 수 있는 전자금융업자로 금융위원회에 등록되었으며,<br>본 판매자는 구매금액,결제수단에 관계없이 모든 거래에 대해 자동적으로 네이버파이낸셜이 제공하는 구매안전서비스를 적용하고 있습니다. 서비스 가입사실 확인</div>
			</div>
			
			<div style="text-align:left; margin-top:30px;">
			<div><h5>주의사항</h5></div>
			<div style="font-size:12px; color:rgb(255, 0, 0, 0.5)">·전자상거래 등에서의 소비자보호에 관한 법률에 의한 반품규정이 판매자가 지정한 반품 조건보다 우선합니다.</div>
			<div style="font-size:12px; color:rgb(192, 192, 192)">·전자상거래 등에서의 소비자보호에 관한 법류에 의거하여 미성년자가 물품을 구매하는 경우,법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소할 수 있습니다.</div>
			<div style="font-size:12px; color:rgb(192, 192, 192)">·전기용품 및 생황용품 안전관리법 및 어린이제품 안전 특별법 규정에 의한 안전관리대상 품목인 전기용품,생활용품,어린이제품을 판매 또는 구매하실 경우에는 해당 제품이 안전인증,안전확인,공급자적합성확인,안전기준준수 적용제품인지 확인하시기 바랍니다.</div>
			<div style="font-size:12px; color:rgb(192, 192, 192)">·네이버의 결제시스템을 이용하지 않고 판매자와 직접 거래하실 경우 상품을 받지 못하거나 구매한 상품과 사이한 상품을 받는 등 피해가 발생할 수 있으니 유의하시기 바랍니다.</div>
			<div style="font-size:12px;">·네이버에 등록된 판매상품과 상품의 내용은 판매자가 등록한 것으로 네이버는 등록된 내용에 대하여 일체의 책임을 지지 않습니다.</div>
			</div>
			
			<div class="row" id="border" style="margin-bottom:50px; margin-top:25px; background-color:rgb(220, 220, 220, 0.3);">
			<div class="col-sm-6" style="padding:8px; text-align:left">
				<h6>신고센터</h6>
				<div style="font-size:12px; color:rgb(192, 192, 192)">네이버는 소비자의 보호와 사이트의 안전거래를 위해 신고센터를 운영하고 있습니다.<br>안전거래를 저해하는 경우 신고하여 주시기바랍니다.</div>
			</div>
			<div class="col-sm-6" style="padding:8px; text-align:left">
				<h6>지식재산권신고센터</h6>
				<div style="font-size:12px; color:rgb(192, 192, 192)">네이버는 지적재산권 보호를 위해 노력합니다.<br>지식재산권 침해상품이 있을 경우 신고하여 주시기 바랍니다.</div>
			</div>
			</div>
</body>
</html>