<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.incontainer {
	width: 40%;
	height: 40%;
	margin: 0 auto;
}

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

#border {
	border: 1px solid gray;
}

#bdr{
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

#bgcg {
	background-color:Gainsboro;
}

</style>

</head>
<body>
<div align="center" class="container"><hr>
		<div class="row" id="border">
				<div class="col-md-6" id="bdr">			
					<div class="imagebox">대표이미지</div>
					<div class="text-center">
					  	<img src="../../resources/image/숨숨터널3.gif" class="img-fluid">
					</div>
					<div style="height:280px;"></div>
				</div>
				<div class="col-md-6">
					<div style="text-align:left; padding-top:10px;">펫프렌즈 | 관심고객수</div>
					<div style="text-align:left;">고양이 숨숨터널</div>
						<div style="text-align:right;">15000원</div>
					<div id="border">
						<div style="text-align:left; border-bottom: 1px solid gray; padding:5px;">회원님을 위한 혜택</div>
					<div class="row" style="padding:5px;">
						<div class="col-sm-6" style="text-align:left;">최대 적립 포인트</div>
						<div class="col-sm-6" style="text-align:right;">1500원</div>
					</div>
					<div style="padding:9px;">
						<div id="border" style="padding:7px;">
							<div class="row">
								<div class="col-sm-6" style="text-align:left;">포인트 더 받는 방법</div>
								<div class="col-sm-6" style="text-align:right;">+최대 1500원</div>
							</div>
							<div class="row">
								<div class="col-sm-6" style="text-align:left;">최대 5% 적립,무료 시작 ></div>
								<div class="col-sm-6" style="text-align:right;">1500원</div>
							</div>
							<div class="row">
								<div class="col-sm-6" style="text-align:left;">네이버 현대카드로 결제 시</div>
								<div class="col-sm-6" style="text-align:right;">1500원</div>
							</div>
							<div class="row">
								<div class="col-sm-6" style="text-align:left;">네이버페이 머니로 결제 시</div>
								<div class="col-sm-6" style="text-align:right;">750원</div>
							</div>
						</div>
					</div>
					</div>
					<div style="padding:15px;">
					<div class="row" id="border" style="height:40px; justify-content:center; align-aitems:center;">
						<div class="col-sm-6" style="text-align:left;">이 상품 5% 돌려받기</div>
						<div class="col-sm-6" style="text-align:right;">></div>
					</div>
					</div>	
					
					<div style="text-align:left;">무이자할부 | 카드 자세히보기</div><hr>
					
					<div style="padding:15px;">
						<i class="fa-solid fa-truck"></i>
						<div class="row" id="border" style="height:60px; padding:7px;">
							<div class="col-sm-2">나는아이콘</div>
							<div class="col-sm-10" style="text-align:left;">오늘 출발 상품<br>13:00까지 결제 시 오늘 바로 발송됩니다.</div>
						</div>
					</div>
					
					<div>
					<div style="text-align:left;">택배배송 | 3,000원(주문시 결제)|CJ대한통운</div>
					<div style="text-align:left;">70,000원 이상 구매 시 무료 / 제주 추가 3,000원,제주 외 도서지역 추가 6,000원</div>
					<div style="text-align:left;">배송비 절약상품 보기</div>
					</div>
					
					<div class="col-sm-12 dropdown shadow">
						  <button class="col-sm-12 btn">색상선택</button>
						  <button class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						    <span class="caret"></span>
					  		</button>
						  <ul class="col-sm-1 dropdown-menu">
						    <li>빨강</li>
						    <li>파랑</li>
						    <li>노랑</li>
						  </ul>
					</div>
					
					<div class="row">
						<div class="col-sm-6" style="text-align:left;">총 상품 금액</div>
						<div class="col-sm-6" style="text-align:right;">총 수량0개 | 0원</div>
					</div>
					
					<div class="col-lg" style="padding:5px; margin-bottom:45px;">
					  <button class="col-sm-12 btn btn-success" type="button" style="padding:15px;">구매하기</button>
					</div>
					<div style="padding:5px;">
						<button class="col-sm-4 btn btn-outline-secondary" type="button" style="padding:10px;">톡톡문의</button>
						<button class="col-sm-4 btn btn-outline-secondary" type="button" style="padding:10px;">찜하기</button>
						<button class="col-sm-4 btn btn-outline-secondary" type="button" style="padding:10px;">장바구니</button>
					</div>
					<div style="text-align:left; margin-top:40px;">쇼핑할 때 필독 안전거래TIP</div>
				</div>
			</div>
			
			<div class="row" id="bdrtb" style="margin-top:25px;">
				<div class="col-md-3" style="border-right: 1px solid;">상세정보</div>
				<div class="col-md-3" style="border-right: 1px solid;">리뷰</div>
				<div class="col-md-3" style="border-right: 1px solid;">Q&A</div>
				<div class="col-md-3">반품/교환정보</div>
			</div>
			
		<div>
			<div>
				<div style="text-align:left;"><h3>상품정보</h3></div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg" style="text-align:left;">상품번호</div>
				<div class="col-sm-4" style="text-align:left;">1234123456</div>
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">상품상태</div>
				<div class="col-sm-4" style="text-align:left;">신상품</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">제조사</div>
				<div class="col-sm-4" style="text-align:left;">삼성</div>
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">브랜드</div>
				<div class="col-sm-4" style="text-align:left;">삼성</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">모델명</div>
				<div class="col-sm-4" style="text-align:left;">고양이 숨숨터널</div>
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">원산지</div>
				<div class="col-sm-4" style="text-align:left;">대한민국</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div style="text-align:left;">상품정보 관련 문의사항은 Q&A에 남겨주세요.</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">소재</div>
				<div class="col-sm-4" style="text-align:left;">나무</div>
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">기능</div>
				<div class="col-sm-4" style="text-align:left;">두뇌개발,흥미유발,분리불안해소</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">영수증발급</div>
				<div class="col-sm-4" style="text-align:left;">신용카드전표,현금영수증발급</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">A/S안내</div>
				<div class="col-sm-4" style="text-align:left;">1800-9808<br>1800-9808</div>
			</div>
		</div>
	<div class="text-center">
  	<img src="../../resources/image/숨숨터널3.gif" class="img-fluid" style="width:100%">
	</div>
	<div class="text-center">
  	<img src="../../resources/image/숨숨터널4.jpg" class="img-fluid" style="width:100%">
	</div><hr>
	
	<div style="text-align:left;">관련태그</div>
	
	<div class="row" style="padding:15px;">
	<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#고양이용품</button>
	<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#고양이터널</button>
	<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#고양이집</button>
	<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#캣터널</button>
	<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#펫하우스</button>
	</div>
	
	<div class="textleft"><h3>상품정보 제공고시</h3></div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-2" id="bgcg" style="text-align:left;">품명 / 모델명</div>
			<div class="col-sm-4" style="text-align:left;">상품상세참조 / 상품상세참조</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-2" id="bgcg" style="text-align:left;">법에 의한 인증, 허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</div>
			<div class="col-sm-4" style="text-align:left;">상품상세참조</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-2" id="bgcg" style="text-align:left;">제조자(사)</div>
			<div class="col-sm-4" style="text-align:left;">삼성</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-2" id="bgcg" style="text-align:left;">제조국</div>
			<div class="col-sm-4" style="text-align:left;">한국</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-2" id="bgcg" style="text-align:left;">AS 책임자</div>
			<div class="col-sm-4" style="text-align:left;">1800-9808</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-2" id="bgcg" style="text-align:left;">AS 전화번호</div>
			<div class="col-sm-4" style="text-align:left;">1800-9808</div>
		</div>
		
	<div class="textleft" style="margin-top:30px;"><h3>거래조건에 관한 정보</h3></div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">재화등의 배송방법에 관한 정보</div>
			<div class="col-sm-8" style="text-align:left;">택배</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">주문 이후 예상되는 배송기간</div>
			<div class="col-sm-8" style="text-align:left;">대금 지급일로부터 3일 이내에 발송</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">제품하자,오배송 등에 따른 청약철회 등의 경우 청약철회 등을 할 수 있는 기간 및 통신판매업자가 부담하는 반품비용 등에 관한 정보</div>
			<div class="col-sm-8" style="text-align:left;">전자상거래등에서의 소비자 보고에관한법률 등에 의한 제품의 하자 또는 오배송 등으로 인한 청약철회의 경우에는 상품 수령 후 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 청약철회를 할 수 있으며,반품 비용은 통신판매업자가 부담합니다.</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">제품하자가 아닌 소비자의 단순변심,착오구매에 따른 청약철회시 소비자가 부담하는 반품비용 등에 관한 정보</div>
			<div class="col-sm-8" style="text-align:left;">편도 5000원(최초 배송비 무료인 경우 10000원 부과)</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">제품하자가 아닌 소비자의 단순변심,착오구매에 따른 청약철회가 불가능한 경우 그 구체적 사유와 근거</div>
			<div class="col-sm-8" style="text-align:left;">전자상거래등에서의 소비자보호에관한법률 등에 의한 청약철회 제한 사유에 해당하는 경우 및 기타 객관적으로 이에 준하는 것으로 인정되는 경우 청약철회가 제한될 수 있습니다.</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">재화등의 교환,반품,보증 조건 및 품징보증기준</div>
			<div class="col-sm-8" style="text-align:left;">소비자분쟁해결기준(공정거래위원회 고시)및 관계법령에 따릅니다.</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">재화등의 A/S 관련 전화번호</div>
			<div class="col-sm-8" style="text-align:left;">1800-9808</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">대금을 환불받기 위한 방법과 환불이 지연될 경우 지연에 따른 배상금을 지급받을 수 있다는 사실 및 배상금 지급의 구체적 조건 및 절차</div>
			<div class="col-sm-8" style="text-align:left;">주문취소 및 대금의 환불은 네이버 페이 마이페이지에서 신청할 수 있으며, 전자상거래 등에서의 소비자보호에 관한 법률에 따른 소비자의 청약철회 후 판매자가 재화 등을 반환 받은 날로부터 3영업일 이내에 지급받은 대금의 환급을 정당한 사유 없이 지연하는 때에는 소비자는 지연기간에 대해서 연 15%의 지연배상금을 판매자에게 청구할 수 있습니다.</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">소비자피해보상의 처리,재화등에 대한 불만 처리 및 소비자와 사업자 사이의 분쟁처리에 관한 사항</div>
			<div class="col-sm-8" style="text-align:left;">소비자분쟁해결기준(공정개러위원회 고시)및 관계법령에 따릅니다.</div>
		</div>
		<div class="row" id="bdrt" style="padding:8px;">
			<div class="col-sm-4" id="bgcg" style="text-align:left;">거래에 관한 약관의 내용 또는 확인할 수 있는 방법</div>
			<div class="col-sm-8" style="text-align:left;">상품상세 페이지 및 페이지 하단의 이용약관 링크를 통해 확인할 수 있습니다.</div>
		</div>
	<div class="textleft" style="margin-top:60px;">
		<h2>상품리뷰</h2><br>
		상품을 구매하신 분들이 작성하신 리뷰입니다. 리뷰 작성시 아래 금액만큼 포인트가 적립됩니다.<br>텍스트 리뷰 : 50원 | 포토/동영상 리뷰: 150원
	</div><hr style="border:2px solid;">
		
			<div class="row" id="border" style="height:50px;">
				<div class="col-md-3" id="bdr">전체보기</div>
				<div class="col-md-3" id="bdr">포토/동영상</div>
				<div class="col-md-3" id="bdr">스토어PICK</div>
				<div class="col-md-3">한달사용리뷰</div>
			</div>
			<div class="row" id="border" style="height:50px;">
			<div class="row" style="padding:15px;">
				<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#고양이용품</button>
				<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#고양이터널</button>
				<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#고양이집</button>
				<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#캣터널</button>
				<button class="col-sm-1 btn btn-bd-primary" style="text-align:center; margin-right:15px;">#펫하우스</button>
				</div>
			</div>
		
			<div class="textleft">
				<h3>Q&A</h3><br>
					<h5>구매하시려는 상품에 대해 궁금하신 점이 있으신 경우 문의해주세요. '판재마 톡톡문의'를 통해 판매자와 간편하게 1:1 상담도 가능합니다.</h5>
					<div class="row">
						<div class="col-sm-6" style="text-align:left">
							<button type="button" class="btn btn-dark">상품 Q&A 작성하기</button>
							<button type="button" class="btn btn-outline-secondary">나의 Q&A조회 ></button>
						</div>
						<div class="col-sm-6" style="text-align:right">
							<div style="text-align:right;">내 Q&A 보기</div>
							<div>토글 버튼</div>
							<div>드롭 다운버튼</div>
						</div>
					</div>
			</div>
			<div class="textleft"><h3>반품/교환정보</h3></div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-4" id="bgcg" style="text-align:left;">판매자 지정택배사</div>
				<div class="col-sm-8" style="text-align:left;">CJ대한통운</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg" style="text-align:left;">반품배송비</div>
				<div class="col-sm-4" style="text-align:left;">편도 5,000원(최초 배송비 무료인 경우 10,000원 부과)</div>
				<div class="col-sm-2" id="bgcg" style="text-align:left;">교환배송비</div>
				<div class="col-sm-4" style="text-align:left;">10,000원</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
					<div class="col-sm-4" id="bgcg" style="text-align:left;">반품/교환 사유에 따른 요청 가능 기간</div>
				<div style="padding:8px;">
					<div class="col-sm-6" style="text-align:left;">구매자 단순 변심은 상품 수령 후 7일 이내(구매자 반품배송비 부담)</div><hr>
					<div class="col-sm-6" style="text-align:left;">표시/광고와 상이,계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내(판매자 반품 배송비 부담) 둘 중 하나 경과 시 반품/교환 불가</div>
				</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg" style="text-align:left;">반품/교환 불가능 사유</div>
				<div class="row-sm-8">
				<div class="col-sm-4" style="text-align:left;">1.반품요청기간이 지난 경우</div>
				<div class="col-sm-4" style="text-align:left;">2.구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우(단,상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</div>
				<div class="col-sm-4" style="text-align:left;">3.구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우(예: 식품,화장품,향수류,음반 등)</div>
				<div class="col-sm-4" style="text-align:left;">4.구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</div>
				<div class="col-sm-4" style="text-align:left;">5.시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</div>
				<div class="col-sm-4" style="text-align:left;">6.고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우(판매자에게 회복불가능한 손해가 예상되고, 그러한 예정으로 청약철회권 행사가 불가능하다는 사실을 서면 동의 받은 경우)</div>
				<div class="col-sm-4" style="text-align:left;">7.복제가 가능한 상품 등의 포장을 훼손한 경우(CD/DVD/GAME/도서의 경우 포장 개봉 시)</div>
				</div>
			</div>
			
			<div class="textleft"><h2>판매자정보</h2></div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">상호명</div>
				<div class="col-sm-4" style="text-align:left;">삼성</div>
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">대표자</div>
				<div class="col-sm-4" style="text-align:left;">삼성</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">사업자등록번호</div>
				<div class="col-sm-4" style="text-align:left;">1234123456</div>
				<div class="col-sm-2" id="bgcg"  style="text-align:left;">통신판매업번호</div>
				<div class="col-sm-4" style="text-align:left;">2020-서울강서-3486</div>
			</div>
			<div class="row" id="bdrt" style="padding:8px;">
				<div class="col-sm-4" id="bgcg" style="text-align:left;">사업장소재지</div>
				<div class="col-sm-8" style="text-align:left;">서울특별시 강서구 방화대로(우: 12345)(메일:naver@naver.com)</div>
			</div>
			<div id="border" style="text-align:left; padding:8px;">
				<h5>네이버파이낸셜(결제대금예치업 등록번호: 02-006-00056)</h5>
				<h6>네이버파이낸셜은 전자금융거래법에 따라 결제대금예치업을 운영할 수 있는 전자금융업자로 금융위원회에 등록되었으며,<br>본 판매자는 구매금액,결제수단에 관계없이 모든 거래에 대해 자동적으로 네이버파이낸셜이 제공하는<br>구매안전서비스를 적용하고 있습니다. 서비스 가입사실 확인</h6>
			</div>
			
			<div style="text-align:left">
			<div><h5>주의사항</h5></div>
			<div><h6>·전자상거래 등에서의 소비자보호에 관한 법률에 의한 반품규정이 판매자가 지정한 반품 조건보다 우선합니다.</h6></div>
			<div><h6>·전자상거래 등에서의 소비자보호에 관한 법류에 의거하여 미성년자가 물품을 구매하는 경우,법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소할 수 있습니다.</h6></div>
			<div><h6>·전기용품 및 생황용품 안전관리법 및 어린이제품 안전 특별법 규정에 의한 안전관리대상 품목인 전기용품,생활용품,어린이제품을 판매 또는 구매하실 경우에는 해당 제품이 안전인증,안전확인,공급자적합성확인,안전기준준수 적용제품인지 확인하시기 바랍니다.</h6></div>
			<div><h6>·네이버의 결제시스템을 이용하지 않고 판매자와 직접 거래하실 경우 상품을 받지 못하거나 구매한 상품과 사이한 상품을 받는 등 피해가 발생할 수 있으니 유의하시기 바랍니다.</h6></div>
			<div><h6>·네이버에 등록된 판매상품과 상품의 내용은 판매자가 등록한 것으로 네이버는 등록된 내용에 대하여 일체의 책임을 지지 않습니다.</h6></div>
			</div>
			
			<div class="row" id="border" style="margin-bottom:50px; margin-top:25px;">
			<div class="col-sm-6" style="padding:8px; text-align:left">
				<h5>신고센터</h5>
				<h6>네이버는 소비자의 보호와 사이트의 안전거래를 위해 신고센터를 운영하고 있습니다.<br>안전거래를 저해하는 경우 신고하여 주시기바랍니다.</h6>
			</div>
			<div class="col-sm-6" style="padding:8px; text-align:left">
				<h5>지식재산권신고센터</h5>
				<h6>네이버는 지적재산권 보호를 위해 노력합니다.<br>지식재산권 침해상품이 있을 경우 신고하여 주시기 바랍니다.</h6>
			</div>
			</div>
			
			
			
</div>
</body>
</html>