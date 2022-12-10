<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/12/01
  Time: 6:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order Item</title>
    <style>

    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" flush="false"/>
    <form class="container-fluid px-3 pt-5" method="post">
        <div name="main_title" class="d-flex justify-content-between px-3 mb-3">
            <div class="fs-3" style="font-weight:bold;">주문 / 결제</div>
            <div>장바구니 > 주문/결제</div>
        </div>
        <div name="popup_notification" class="bg-light shadow rounded-2 p-3 mb-4">
            <span>팝업 차단 해제 안내</span>
            <div class="my-2">
                결제하기 버튼을 클릭했을때, 결제창이 뜨지 않고 반응이 없는 경우 팝업차단 기능을 해제하여 주시기 바랍니다.

            </div>
            <span>(사파리 : OS X 메뉴의 Safari > 환경설정 > 보안 > 팝업차단 해제)</span>
        </div>
        <div name="item_info" class="bg-light w-100 d-flex justify-content-between shadow rounded-2 p-3 mb-4">
            <div>
                <div>상품정보</div>
                <div class="d-flex align-items-center pt-2">
                    <img src="${ctx}/resources/icons/logo.svg" alt="logo" width="100" height="100">
                    <div>
                        상세정보
                    </div>
                </div>
            </div>
            <div class="h-auto d-flex flex-column">
                <div>판매자</div>
                <div class="flex-grow-1 d-flex align-items-center">Brand</div>
            </div>
            <div class="h-auto d-flex flex-column">
                <div>배송비</div>
                <div class="flex-grow-1 d-flex align-items-center"><span><i class="fa-solid fa-truck-fast"></i></span>, 4000원</div>
            </div>
            <div class="h-auto d-flex flex-column">
                <div>수량</div>
                <div class="flex-grow-1 d-flex align-items-center">1개</div>
            </div>
            <div class="h-auto d-flex flex-column">
                <div>할인</div>
                <div class="flex-grow-1 d-flex align-items-center">(-) 1000원</div>
            </div>
            <div class="h-auto d-flex flex-column">
                <div>상품금액(할인포함)</div>
                <div class="flex-grow-1 d-flex align-items-center">원가, 할인가(볼드)</div>
            </div>
        </div>
        <div name="shipping_address" class="bg-light w-100 d-flex shadow rounded-2 p-3 mb-4">
            <div class="flex-grow-1">
                <div>
                    <div class="fs-3 fw-bold mb-5">배송지 정보</div>
                    <div class="d-flex">
                        <div class="fs-5 me-5">배송지 선택</div>
                        <div>
                            <div class="d-flex align-items-center">
                                <div class="form-check d-flex align-items-end me-3">
                                    <input class="form-check-input me-1" type="radio" name="selectAddress" value="" id="oldAddress" checked>
                                    <label class="form-check-label" for="oldAddress">
                                        기본 배송지
                                    </label>
                                </div>
                                <div class="form-check d-flex align-items-end me-3">
                                    <input class="form-check-input me-1" type="radio" name="selectAddress" value="" id="newAddress">
                                    <label class="form-check-label" for="newAddress">
                                        신규 배송지
                                    </label>
                                </div>
                                <button type="button" class="btn btn-sm btn-outline-primary">배송지 목록</button>
                            </div>
                            <div class="d-flex align-items-end">
                                <div>최근 : </div>
                                <div class="form-check d-flex align-items-end ms-2">
                                    <input class="form-check-input me-1" type="radio" name="selectAddress" value="" id="oldAddress1">
                                    <label class="form-check-label" for="oldAddress1">
                                        기본 배송지
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="d-grid gap-2">
                    <div class="mb-2 fw-bold">김진호 (김진호)</div>
                    <div class="mb-2">010-9118-6277</div>
                    <div class="mb-2">(05118) 서울특별시 광진구 광나루로 56길 <a class="stretched_link">정보수정</a></div>
                    <div class="mb-2">발효 크림 도넛 5종 수제도넛 도너츠 ( 맛 선책 : 카푸치노 )</div>
                    <input type="text" class="w-75 form-control mb-2" placeholder="배송메세지를 입력해주세요.">
                    <div class="d-flex" style="color: limegreen; font-size: 14px;">
                        <i class="fa-solid fa-exclamation me-2"></i>
                        <div>도서산간 지역의 경우 추후 수령시 추가 배송비가 과금될 수 있습니다.</div>
                    </div>
                </div>
            </div>
            <div class="w-25 border-start p-3">
                <div>주문자 정보</div>
                <div>김지노</div>
                <div>01091186277</div>
                <div>ㅏㅑㅡ진호97@ㅜㅁㅍㄷㄱ.채ㅡ</div>
            </div>
        </div>
        <div name="discount_point" class="bg-light w-100 d-flex shadow rounded-2 p-3 mb-4">
            <div class="flex-grow-1">
                <div class="fs-3 fw-bold mb-5" >할인 및 포인트</div>
                <div>
                    <div class="fs-5 mb-2">쿠폰 할인</div>
                    <div class="d-flex d-grid gap-1 p-2">
                        <div>상품/주문 쿠폰</div>
                        <div>1000원 /</div>
                        <div>쿠폰사용</div>
                        <div>(사용가능 1장 | 보유 0장)</div>
                    </div>
                    <div class="d-flex d-grid gap-1 p-2 ">
                        <div>배송비 쿠폰</div>
                        <div>0원 /</div>
                        <div>쿠폰사용</div>
                        <div>(사용가능 0장 | 보유 0장)</div>
                    </div>
                </div>
                <hr>
                <div>
                    <div class="fs-5 mb-2">포인트</div>
                    <div class="d-flex d-grid gap-1 p-2">
                        <div>보유</div>
                        <div>15000원</div>
                        <div>(포인트 0원 | 머니 15000원)</div>
                    </div>
                    <div class="d-flex d-grid gap-1 p-2">
                        <div>사용</div>
                        <div>0</div>
                        <div>전액사용</div>
                        <div>항상 전액사용</div>
                    </div>
                </div>
            </div>
            <div class="w-25 border-start p-3">
                <div>주문자 정보</div>
                <div>김지노</div>
                <div>01091186277</div>
                <div>ㅏㅑㅡ진호97@ㅜㅁㅍㄷㄱ.채ㅡ</div>
            </div>
        </div>
        <div class="bg-light w-100 d-flex shadow rounded-2 p-3 mb-2">
            <div class="flex-grow-1">

                <div>
                    <div>
                        <div class="fs-3 fw-bold mb-2">결제수단</div>
                        <div class="mb-2">선택하신 카드/계좌정보 변경은 설정 메뉴에서 하실 수 있습니다.</div>
                    </div>
                    <div class="d-flex flex-column justify-content-center mb-2">
                        <div class="p-2 border-bottom">
                            <div class="form-check d-flex align-items-end">
                                <input class="form-check-input me-1" type="radio" name="payment" id="payment1" value="option1" checked>
                                <label class="form-check-label" for="payment1">Naver Pay</label>
                            </div>
                        </div>
                        <div class="p-2 border-bottom">
                            <div class="form-check d-flex align-items-end">
                                <input class="form-check-input me-1" type="radio" name="payment" id="payment2" value="option1" checked>
                                <label class="form-check-label" for="payment2">계좌 간편결제</label>
                            </div>
                        </div>
                        <div class="p-2 border-bottom">
                            <div class="form-check d-flex align-items-end">
                                <input class="form-check-input me-1" type="radio" name="payment" id="payment3" value="option1" checked>
                                <label class="form-check-label" for="payment3">카드 간편결제</label>
                            </div>
                        </div>
                        <div class="p-2 border-bottom">
                            <div class="form-check d-flex align-items-end">
                                <input class="form-check-input me-1" type="radio" name="payment" id="payment4" value="option1" checked>
                                <label class="form-check-label" for="payment4">일반결제</label>
                            </div>
                        </div>
                    </div>

                    <div class="p-3">
                        <div class="d-flex align-items-center">
                            <div class="fs-5 me-5">현금영수증</div>
                            <div >
                                <div class="d-flex align-items-center">
                                    <div class="form-check d-flex align-items-center me-3">
                                        <input class="form-check-input me-1" type="radio" name="cash" value="" id="cash_invid" checked>
                                        <label class="form-check-label" for="cash_invid">
                                            개인소득공제용
                                        </label>
                                    </div>
                                    <div class="form-check d-flex align-items-center me-3">
                                        <input class="form-check-input me-1" type="radio" name="cash" value="" id="cash_comp">
                                        <label class="form-check-label" for="cash_comp">
                                            사업자증빙용 세금계산서
                                        </label>
                                    </div>
                                    <div class="form-check d-flex align-items-center me-3">
                                        <input class="form-check-input me-1" type="radio" name="cash" value="" id="cash_none">
                                        <label class="form-check-label" for="cash_none">
                                            신청안함
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <div class="me-2">휴대폰번호 : 010-9118-6277</div>
                            <button class="btn btn-primary">변경</button>
                        </div>
                    </div>

                    <div class="border border-end-0">
                        <div class="d-flex justify-content-between  border-bottom p-3">
                            <div>포인트 혜택</div>
                            <div style="color:dodgerblue;">최대 297원</div>
                        </div>
                        <div class="d-flex border-bottom p-3">
                            <div class="w-50 d-grid gap-2">
                                <div class="d-flex justify-content-between">
                                    <div>구매적립</div>
                                    <div>총 147원</div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <div>기본적립</div>
                                    <div>35원</div>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <div>페이머니 결제적립</div>
                                    <div>112원</div>
                                </div>
                            </div>
                            <div class="w-50 d-grid gap-2 ps-3">
                                <div class="d-flex justify-content-between">
                                    <div>리뷰적립</div>
                                    <div>최대 150원</div>
                                </div>
                                <div>동일 상품의 상품리뷰/한달사용리뷰 적립은 각각 1회로 제한됩니다.</div>
                            </div>
                        </div>
                        <div class="p-3">결제 후 오늘 가입하면 다 챙겨드려요! + 140원</div>
                    </div>
                </div>
                <hr>
                <div class="mb-3">
                    개인정보 제공 동의 : 랜선식당 상세보기
                </div>
                <div>주문 내용을 확인하였으며, 정보 제공 등에 동의 합니다.</div>
            </div>
            <div class="w-25 border-start p-3">
                <div>주문자 정보</div>
                <div>김지노</div>
                <div>01091186277</div>
                <div>ㅏㅑㅡ진호97@ㅜㅁㅍㄷㄱ.채ㅡ</div>
            </div>
        </div>
        <button class="btn btn-success w-100 shadow">결제하기</button>
    </form>
    <jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>