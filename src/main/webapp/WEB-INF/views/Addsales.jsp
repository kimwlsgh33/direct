<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 등록 화면</title>

<style>

.green {
 color: green;
}

.red {
 color: red;
}

.fileDrop {
			width: 5%;
			height: 100px;
			border: 1px dotted gray;
		}
		
.imagebox {
	width: 150px;
	height: 150px;	
}

.blue {
 color: blue;
}
</style>
</head>
<body>
	<div>
		<h2>상품등록</h2>
	</div><hr>
	<div>
		<h3>복사등록</h3>
	</div><hr>
	<div>
		<h3>카테고리</h3><hr>
			<button>카테고리명 검색</button><button>카테고리명 선택</button>
			<button>카테고리 템플릿</button>
			<input type="checkbox" name="template" value="템플릿추가"/>템플릿 추가
			<br/>
		<div>
			<input type="text" name="insertCategory" placeholder="카테고리명 입력"/>
		</div>
		<br/>
		<span class="green">상품과 맞지 않는 카테고리에 등록할 경우 강제 이동되거나 판매중지, 판매금지 될 수 있습니다.</span>
	</div><hr>
	<div>
		<h3>상품명</h3>
		<textarea cols="100" rows="1" maxlength="100" placeholder="상품명을 입력하세요"></textarea><br/>
		<span class="green">판매 상품과 직접 관련이 없는 다른 상품명, 스팸성 키워드 입력 시 관리자에 의해 판매 금지될 수 있습니다.</span><br/>
		<span class="green">유명 상품 유사문구를 무단으로 도용하여 ~스타일, ~st 등과 같이 기재하는 경우 별도 고지 없이 제재될 수 있습니다.</span><br/>
		<span class="green">전용 상품명을 사용 중인 경우 대표 상품명 수정 시에도 전용 상품명으로 노출됩니다.</span><br/>
		<span class="green">상품명을 검색최적화 가이드에 잘 맞게 입력하면 검색 노출에 도움이 될 수 있습니다.</span><button>상품명 검색품질 체크</button>
	</div><hr>
	<div>
		<h2>판매가</h2><hr>
	</div>
	<div style="display:flex">
			<div style="height: 150px">	
			<div>판매가<input type="number" name="price" placeholder="숫자만 입력">원</div>
			</div>
			<span class="green">네이버 쇼핑을 통한 주문일 경우 네이버쇼핑 매출연동수수료가 2%가 네이버페이 결제수수료와 별도로 과급됩니다.</span><br/>
			<span class="green">판매가, 할인가를 활용한 비정상 거래는 자동 탐지되어 판매지수에 포함되지 않으니 유의해주세요.</span>
			<hr>
	</div>
	<div>
		할인<button>설정함</button><button>설정안함</button>
	</div><hr>
	<div>
		판매기간<button>설정함</button><button>설정안함</button>
	</div><hr>
	<div>
		부가세<button>과세상품</button><button>면세상품</button><button>영세상품</button>
	</div><hr>
	<div>
		<h3>네이버 풀필먼트</h3>
	</div><hr>
	<div>
		<h3>재고수량</h3>
	</div><hr>
	<div>
		<input type="number" name="price" placeholder="숫자만 입력">개<span style="color: green"> 옵션 재고수량을 사용하면, 옵션의 재고수량으로 적용되어 자동으로 입력됩니다.</span>
	</div><hr>
	<div>
		<h3>상세설명</h3>
	</div><hr>
	<div>
		<textarea cols="300" rows="30" placeholder="작성된 내용이 없습니다" style="text-align:center"></textarea><br/>
		<span class="red">외부 링크(네이버 폼 등)를 통한 개인정보(휴대폰 번호, 이메일 주소)수집은 금지되므로 등록시 노출이 제재될 수 있습니다. 개인정보보호정책</span><br/>
		<span class="green">상품명과 직접적 관련 없는 상세설명, 외부 링크 입력 시 관리자에 의해 판매 금지 될 수 있습니다.</span><br/>
		<span class="green">안전거래정책에 위배될 경우 관리자에 의해 제재조치가 있을 수 있습니다.</span><br/>
		<span class="green">네이버 이외의 외부링크, 일부 스크립트 및 태그는 자동 삭제될 수 있습니다.</span><br/>
		<span class="green">상세설명 권장 크기: 가로 860px</span>
	</div><hr>
	<div>
		<h2>상품이미지</h2>
	</div><hr>
	<div>
		<div class="imagebox">대표이미지</div>
		<div class="fileDrop"></div><div class="green">권장 크기: 1000 x 1000 (윈도우대상 750 x 1000)<br/>대표이미지 기준 1000 x 1000 이상 이미지를 등록하시면, 이미지 확대 기능이 제공됩니다.<br/>쇼핑검색에 노출되지 않는 경우 가이드를 확인해주세요</div>
	</div><hr>
	<div>
		<div class="imagebox">추가이미지 (0/9)</div>
		<div class="fileDrop"></div><div class="green">권장 크기: 1000 x 1000 (윈도우대상 750 x 1000)<br/>추가이미지는 최대 9개까지 설정할 수 있습니다.<br/>jpg,jpeg,gif,png,bmp 형식의 이미지만 등록됩니다.(움직이는 이미지의 경우 첫 번째 컷이 등록)</div>
	</div><hr>
	<div>
		<div class="imagebox">동영상</div>
		<div class="fileDrop"></div><div class="green">권장 크기: 1000 x 1000 (윈도우대상 750 x 1000)<br/>추가이미지는 최대 9개까지 설정할 수 있습니다.<br/>jpg,jpeg,gif,png,bmp 형식의 이미지만 등록됩니다.(움직이는 이미지의 경우 첫 번째 컷이 등록)</div>
	</div><hr>
	<div>
		<h3>배송</h3>
	</div><hr>
	<span>
			배송여부
			<button>배송</button><button>배송없음</button>
			<button style="margin-left: 10px">배송비 템플릿</button>
			<input type="checkbox" name="template" value="템플릿추가"/>템플릿 추가
	</span><hr>
	<div>
		<div>배송방법</div>
		<div>
			<button>택배,소포,등기</button><button>직접배송(화물배달)</button>
			<input type="checkbox" name="template" value="방문수령"/>방문수령
			<input type="checkbox" name="template" value="퀵서비스"/>퀵서비스
		</div>
	</div><hr>
	<span>택배사
	<select name="deliver" style="width:150px">
		<option>선택</option>
		<option>cj대한통운</option>
		<option>로젠택배</option>
		<option>한진택배</option>
		<option>우체국택배</option>
		<option>롯데택배</option>
	</select>
	</span><hr>
	<div>
		<div>배송속성</div>
		<button>일반배송</button><button>오늘출발</button>
		<input type="checkbox" name="template" value="주문확인 후 제작"/>주문확인 후 제작
	</div><hr>
	<div>
			<div>묶음배송</div>
		<div>
			<div>
				<button>가능</button><button>불가능(개별계산)</button><button style="margin-left:10px">배송비 묶음 그룹 선택</button>
				<span class="blue">기본 배송비 묶음 그룹</span>
			</div><hr>
				<span class="blue">계산방식 : 묶음 그룹에서 가장 작은 배송비로 부과</span><br/>
				<span class="blue">제주/도서산간 추가배송비 : 설정안함</span><br/>
				<span class="green">배송비 묶음그룹의 관리는 배송정보 관리 메뉴에서 할 수 있습니다. 배송비 묶음 그룹 관리.</span>
		</div>
	</div><hr>
	
	<span>상품별 배송비 <select name="deliverprice" style="width:150px">
		<option>유료</option>
		<option>1000</option>
		<option>2000</option>
		<option>3000</option>
		<option>4000</option>
		<option>5000</option>
	</select></span><hr>
	
	<span>기본 배송비 <input type="text" name="기본 배송비" placeholder="가격을 입력하세요.">원</span><hr>
	
	<span class="delprice">결제방식
	    <label><input type="radio" name="delprice" value="착불" checked="checked">착불</label>
	    <label><input type="radio" name="delprice" value="선결제">선결제</label>
	    <label><input type="radio" name="delprice" value="착불 또는 선결제">착불 또는 선결제</label>
	</span><hr>
	
	<div>제주/도서산간 추가배송비</div>
	<div>
		<div class="green">묶음배송 가능인 경우 배송비 묶음그룹 관리에서 설정할 수 있고, 배송비와 함께 노출됩니다.<br/></div>
		<div class="red">제주/도서산간 추가배송비는 상품관리>배송정보 관리에서 설정 후 배송비 묶음 그룹을 다시 선택해주세요.</div>
	</div><hr>
	
	<div>지역별 차등 배송비</div>
	<div class="green">
		<input type="text" name="eachprice" placeholder="제주/도서산간 제외 입력"><br/>
		묶음배송 가능인 경우 배송비 묶음그룹에 입력한 제주/도서산간 추가배송비와 함께 노출됩니다.<br/>
		제주/도서산간을 제외한 지역별 차등 배송비가 있는 경우에만 입력해주세요.<br/>
		희망일배송인 경우 [희망일 배송그룹 > 희망일자 > 지역별 예상 배송비] 항목에 입력해주세요.
	</div><hr>
	
	<span>별도 설치비 <button>있음</button><button>없음</button></span><hr>
	
	<div>
		<div>출고지</div>
		<div class="blue">
			상품출고지<br/>서울특별시 광진구 광나루로56길 32 (구의현대2단지아파트)(우 : 05118)
		</div>
		<button>판매자 주소록</button>
	</div><hr>
	
	<div>반품/교환</div><hr>
	<div>반품/교환 택배사
		<select name="selectdeliver" style="width:150px">
			<option>기본 반품택배사(한진택배)</option>
			<option>cj대한통운</option>
			<option>로젠택배</option>
			<option>한진택배</option>
			<option>우체국택배</option>
			<option>롯데택배</option>	
		</select>
		<div class="green">기본 반품택배사는 네이버페이 지정택배(한진택배)로 최초 자동설정 됩니다.<br/>별도 계약된 택배사로 설정을 원하시는 경우,<span class="blue">[판매자정보>택배사 계약정보 확인] 역역을 통해 '택배사 계약정보 확인완료'후 기본 반품택배사를 설정해주세요.</span><br/>반품택배사 설정 자세히 보기.</div>
	</div><hr>
	
	<div>
		<div>반품배송비(편도)</div>
		<div>
			<input type="text" name="cancelprice">원<br/>
			<span class="green">최초 배송시의 배송비가 무료인 경우 왕복 배송비 6,000원이 청구됩니다.</span>
		</div>
	</div><hr>
	
	<div>
		<div>교환배송비(왕복)</div>
		<div>
			<input type="text" name="cancelprice">원<br/>
		</div>
	</div>
	
	<div>
	<div>반품/교환지</div>
	<div>상품출고지</div>
	<div class="blue">
			상품출고지<br/>서울특별시 광진구 광나루로56길 32 (구의현대2단지아파트)(우 : 05118)
		</div>
		<button>판매자 주소록</button>
	</div><hr>
	
	<span>A/S, 특이사항</span><hr>
	
	<div>
	<div>A/S전화번호</div>
	<div>
		<input type="text" name="ph">
		<button>A/S 템플릿</button><br>
		<input type="checkbox" name="AStemplate" value="템플릿 추가"/>템플릿 추가
	</div><hr>
	</div>
	
	<div>
	<div>A/S안내</div>
	<div class="green">
	<textarea rows="10" cols="300"></textarea>
	법률에 근거하지 않은 판매자의 임의적인 A/S 규정 및 청약철회 기준 안내 시, 이용정지 및 관련 법에 의거하여 제재될 수 있습니다.
	</div>
	</div><hr>
	
	<div>
	<div>판매자 특이사항</div>
	<div>
	<textarea rows="10" cols="300"></textarea>
	<ul class="green">
		<li>청약철회,배송기간 및 방법, 교환/반품의 보증 및 추가비용, 판매일시/판매지역/판매수량/인도지역 등과 관련해서 특이사항이 있는 경우, 해외배송상품인 경우 입력합니다.</li>
		<li>법률에 근거하지 않은 판매자의 임의적인 판매규정 및 청약철회 기준 안내 시, 이용정지 및 관련 법에 의거하여 제재될 수 있습니다.</li>
	</ul>
	</div>
	</div>
	
</body>
</html>