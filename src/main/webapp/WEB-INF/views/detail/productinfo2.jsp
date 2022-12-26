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
	<div class="textleft" style="font-size:15px; font-weight:bold; margin-bottom:10px;">상품정보 제공고시</div>
		<div class="row" id="bdrt" style="height:40px">
			<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">품명 / 모델명</div>
			<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">상품상세참조 / 상품상세참조</div>
		</div>
		<div class="row" id="bdrt" style="height:105px;">
			<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">법에 의한 인증, 허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</div>
			<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">상품상세참조</div>
		</div>
		<div class="row" id="bdrt" style="height:40px">
			<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">제조자(사)</div>
			<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">삼성</div>
		</div>
		<div class="row" id="bdrt" style="height:40px">
			<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">제조국</div>
			<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">한국</div>
		</div>
		<div class="row" id="bdrt" style="height:40px">
			<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">AS 책임자</div>
			<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">1800-9808</div>
		</div>
		<div class="row" id="bdrt" style="height:40px">
			<div class="col-sm-2 d-flex align-items-center" id="bgcg" style="text-align:left;">AS 전화번호</div>
			<div class="col-sm-4 d-flex align-items-center" style="text-align:left;">1800-9808</div>
		</div>
		
	<div class="textleft" style="margin-top:30px; font-size:15px; font-weight:bold; margin-bottom:10px;">거래조건에 관한 정보</div>
		<div class="row" id="bdrt" style="height:40px">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">재화등의 배송방법에 관한 정보</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">택배</div>
		</div>
		<div class="row" id="bdrt" style="height:40px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">주문 이후 예상되는 배송기간</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">대금 지급일로부터 3일 이내에 발송</div>
		</div>
		<div class="row" id="bdrt" style="height:100px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">제품하자,오배송 등에 따른 청약철회 등의 경우 청약철회 등을 할 수 있는 기간 및 통신판매업자가 부담하는 반품비용 등에 관한 정보</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">전자상거래등에서의 소비자 보고에관한법률 등에 의한 제품의 하자 또는 오배송 등으로 인한 청약철회의 경우에는 상품 수령 후 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회를 할 수 있으며,반품 비용은 통신판매업자가 부담합니다.</div>
		</div>
		<div class="row" id="bdrt" style="height:80px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">제품하자가 아닌 소비자의 단순변심,착오구매에 따른 청약철회시 소비자가 부담하는 반품비용 등에 관한 정보</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">편도 5000원(최초 배송비 무료인 경우 10000원 부과)</div>
		</div>
		<div class="row" id="bdrt" style="height:80px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">제품하자가 아닌 소비자의 단순변심,착오구매에 따른 청약철회가 불가능한 경우 그 구체적 사유와 근거</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">전자상거래등에서의 소비자보호에관한법률 등에 의한 청약철회 제한 사유에 해당하는 경우 및 기타 객관적으로 이에 준하는 것으로 인정되는 경우 청약철회가 제한될 수 있습니다.</div>
		</div>
		<div class="row" id="bdrt" style="height:60px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">재화등의 교환,반품,보증 조건 및 품징보증기준</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">소비자분쟁해결기준(공정거래위원회 고시)및 관계법령에 따릅니다.</div>
		</div>
		<div class="row" id="bdrt" style="height:40px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">재화등의 A/S 관련 전화번호</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">1800-9808</div>
		</div>
		<div class="row" id="bdrt" style="">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">대금을 환불받기 위한 방법과 환불이 지연될 경우 지연에 따른 배상금을 지급받을 수 있다는 사실 및 배상금 지급의 구체적 조건 및 절차</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">주문취소 및 대금의 환불은 네이버 페이 마이페이지에서 신청할 수 있으며, 전자상거래 등에서의 소비자보호에 관한 법률에 따른 소비자의 청약철회 후 판매자가 재화 등을 반환 받은 날로부터 3영업일 이내에 지급받은 대금의 환급을 정당한 사유 없이 지연하는 때에는 소비자는 지연기간에 대해서 연 15%의 지연배상금을 판매자에게 청구할 수 있습니다.</div>
		</div>
		<div class="row" id="bdrt" style="height:75px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">소비자피해보상의 처리,재화등에 대한 불만 처리 및 소비자와 사업자 사이의 분쟁처리에 관한 사항</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">소비자분쟁해결기준(공정개러위원회 고시)및 관계법령에 따릅니다.</div>
		</div>
		<div class="row" id="bdrt" style="height:40px;">
			<div class="col-sm-4 d-flex align-items-center" id="bgcg" style="text-align:left;">거래에 관한 약관의 내용 또는 확인할 수 있는 방법</div>
			<div class="col-sm-8 d-flex align-items-center" style="text-align:left;">상품상세 페이지 및 페이지 하단의 이용약관 링크를 통해 확인할 수 있습니다.</div>
		</div>

</body>
</html>