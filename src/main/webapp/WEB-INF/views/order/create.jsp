<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/12/01
  Time: 6:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<String> bankList = new ArrayList<>();
    bankList.add("국민은행");
    bankList.add("신한은행");
    bankList.add("우리은행");
    bankList.add("하나은행");
    bankList.add("농협은행");
    bankList.add("기업은행");
    bankList.add("외환은행");
    bankList.add("씨티은행");
    bankList.add("카카오뱅크");
    bankList.add("케이뱅크");
    bankList.add("SC제일은행");
    bankList.add("대구은행");
    bankList.add("부산은행");
    bankList.add("광주은행");
    bankList.add("제주은행");
    bankList.add("전북은행");
    bankList.add("경남은행");
    bankList.add("경기은행");
    bankList.add("새마을금고");
    bankList.add("신협");
    bankList.add("수협");
    bankList.add("우체국");
    bankList.add("저축은행");
    bankList.add("산업은행");
    bankList.add("한국씨티은행");

    // 총 25개의 은행이 존재한다.

    // 할부 개월 리스트
    List<String> installmentList = new ArrayList<>();
    installmentList.add("일시불");
    for(int i = 2; i <= 12; i++) {
        installmentList.add(i + "개월");
    }

%>
<html>
<head>
    <title>Order Item</title>
    <style>
        .address-list div {
            margin-bottom: 10px;
        }
    </style>
    <link href="${ctx}/resources/styles/payments.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
<form class="w-100 d-flex flex-column align-items-center px-3 pt-5" method="post">
    <div name="main_title" class="w-75 d-flex justify-content-between px-3 mb-3">
        <div class="fs-3" style="font-weight:bold;">주문 / 결제</div>
        <div>장바구니 > 주문/결제</div>
    </div>
    <div name="popup_notification" class="w-75 bg-light shadow rounded-2 p-3 mb-4">
        <span>팝업 차단 해제 안내</span>
        <div class="my-2">
            결제하기 버튼을 클릭했을때, 결제창이 뜨지 않고 반응이 없는 경우 팝업차단 기능을 해제하여 주시기 바랍니다.

        </div>
        <span>(사파리 : OS X 메뉴의 Safari > 환경설정 > 보안 > 팝업차단 해제)</span>
    </div>
    <div name="item_info" class="bg-light w-75 d-flex justify-content-between shadow rounded-2 p-3 mb-4">
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
    <div name="shipping_address" class="bg-light w-75 d-flex shadow rounded-2 p-3 mb-4">
        <div class="flex-grow-1">
            <div>
                <div class="fs-3 fw-bold mb-5">배송지 정보</div>
                <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addressListModal" onclick="getAddressList()">배송지 선택하기</button>
                <div class="modal fade" id="addressListModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addressModalLabel">배송지 목록</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div id="addressList" class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="d-grid gap-2">
                <div id="ord_name" class="mb-2 fw-bold">${user.name}</div>
                <div id="ord_phone" class="mb-2">${user.phone}</div>
                <div class="d-flex">
                    <div class="d-flex me-2">
                        (<div id="ord_zip_code">${user.zip_code}</div>)
                    </div>
                    <div id="ord_address" class="me-1">${user.address}</div>
                    <div id="ord_address_detail" class="me-2">${user.address_detail}</div>
                    <a class="stretched_link" href="#">정보수정</a>
                </div>
                <input id="ord_msg" type="text" class="w-75 form-control mb-2" placeholder="배송메세지를 입력해주세요.">
                <div class="d-flex" style="color: limegreen; font-size: 14px;">
                    <i class="fa-solid fa-exclamation me-2" style="color: limegreen;"></i>
                    <div>도서산간 지역의 경우 추후 수령시 추가 배송비가 과금될 수 있습니다.</div>
                </div>
            </div>
        </div>
        <div class="w-25 border-start p-3">
            <div class="mb-1">주문자 정보</div>
            <div class="mb-1">${user.name}</div>
            <div class="mb-1">${user.phone}</div>
            <div class="mb-1">${user.email}</div>
        </div>
    </div>
    <div name="discount_point" class="bg-light w-75 d-flex shadow rounded-2 p-3 mb-4">
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
    </div>
    <div class="bg-light w-75 d-flex shadow rounded-2 p-3 mb-2">
        <div class="flex-grow-1">
            <div>
                <div>
                    <div class="fs-3 fw-bold mb-2">결제수단</div>
                    <div class="mb-2">선택하신 카드/계좌정보 변경은 설정 메뉴에서 하실 수 있습니다.</div>
                </div>
                <div class="d-flex flex-column justify-content-center mb-2">
                    <div class="payment-select">
                        <div id="naverPay" class="radio-btn-row">
                            <div class="radio-btn-box">
                                <input type="radio" name="radio" id="radio1" checked>
                                <label for="radio1">Naver Pay</label>
                            </div>
                        </div>
                        <div id="accountPay" class="radio-btn-row">
                            <div class="radio-btn-box">
                                <input type="radio" name="radio" id="radio2">
                                <label for="radio2">계좌결제</label>
                            </div>
                        </div>
                        <div id="cardPay" class="radio-btn-row">
                            <div class="radio-btn-box">
                                <input type="radio" name="radio" id="radio3">
                                <label for="radio3">카드결제</label>
                            </div>
                        </div>
                        <div id="normalPay" class="radio-btn-row">
                            <div class="radio-btn-box">
                                <input type="radio" name="radio" id="radio4">
                                <label for="radio4">일반결제</label>
                            </div>
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
                개인정보 제공 동의 : DIRECT 상세보기
            </div>
            <div>주문 내용을 확인하였으며, 정보 제공 등에 동의 합니다.</div>
        </div>
    </div>
    <button class="w-75 btn btn-success mt-3 shadow" onclick="location.href = '${ctx}/order/complete'">결제하기</button>
</form>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
<script>
    const getAddressList = () => {
        $.ajax("${ctx}/util/addressList?user_id=${user.user_id}", {
            type: "POST",
            dataType: "json", // 서버에서 보내줄 데이터의 타입
            success: (data) => {
                let html = "";
                data.forEach((item) => {
                    console.log(item);
                    html += `<div id="address-` + item.address_id + `" class="d-flex justify-content-between align-items-center border-bottom p-2 address-list">
                                <div>`
                        + `<div name="name">`
                        + item.receiver
                        + `</div><div name="phone">`
                        + item.phone
                        + `</div><div name="zip_code">`
                        + item.zip_code
                        + `</div><div name="address">`
                        + item.address
                        + `</div><div name="address_detail">`
                        + item.address_detail
                        + `</div></div>
                                <div>
                                    <button type="button" class="btn btn-primary btn-sm" data-bs-dismiss="modal" onclick="selectAddress(` + item.address_id + `)">선택</button>
                                </div>
                            </div>`;
                });
                $("#addressList").html(html);
                $("#addressList").show();
            },
            error: (e) => {
                console.log(e);
            }
        });
    }
    const selectAddress = (address_id) => {
        // alert('selectAddress');
        const selected = document.querySelector('#address-' + address_id);

        const name = selected.querySelector('[name=name]').innerText;
        const phone = selected.querySelector('[name=phone]').innerText;
        const zip_code = selected.querySelector('[name=zip_code]').innerText;
        const address = selected.querySelector('[name=address]').innerText;
        const address_detail = selected.querySelector('[name=address_detail]').innerText;

        document.querySelector('#ord_name').innerHTML = name;
        document.querySelector('#ord_phone').innerHTML = phone;
        document.querySelector('#ord_zip_code').innerHTML = zip_code;
        document.querySelector('#ord_address').innerHTML = address;
        document.querySelector('#ord_address_detail').innerHTML = address_detail;

        $("#addressListModal").close();

    }
</script>
<script>
    const naverPayContent = `
        <div class="naver-pay-contents pay-contents">
            <dl>
                <dt>출금 계좌</dt>
                <dd>카카오뱅크 333****1796</dd>
            </dl>
            <dl>
                <dt>충전</dt>
                <dd>480,000원</dd>
            </dl>
            <dl>
                <dt>사용</dt>
                <dd>478,000원</dd>
            </dl>
        </div>
    `;
    const accountPayContent = `
        <div class="account-pay-contents pay-contents">
            <div class="card-view">
                <button id="kakao-bank" class="card-layout">
                    <div>kakao<span class="fw-bold">bank</span></div>
                    <div>
                        <div class="text-start text-secondary mb-2">계좌 번호</div>
                        <div>3333-****-1796</div>
                    </div>
                </button>
                <button id="sc-bank" class="card-layout">
                    <div>
                        <div class="fw-normal">Standard</div>
                        <div class="fw-normal">Cartered</div>
                    </div>
                    <div>
                        <div class="text-start text-light mb-2">계좌 번호</div>
                        <div>3333-****-1796</div>
                    </div>
                </button>
                <button id="add-bank" class="card-layout" onclick="">
                <div class="btn-add">+</div>
                <div>계좌 추가</div>
                <div class="btn-add-meta">이용목적에 맞게 최대 30개까지<br>등록할 수 있습니다.</div>
            </button>
            </div>
            <div class="selected-account-box">
                <div>선택 : 카카오뱅크 3333-****-1796</div>
            </div>
        </div>
    `;
    const cardPayContent = `
        <div class="card-pay-contents pay-contents">
            <div class="card-view">
                <button id="naver-pay-card" class="card-layout">
                    <div>Naver <span class="fw-normal">Pay</span></div>
                    <div>
                        <div class="text-start text-secondary mb-2">카드 번호</div>
                        <div>3333 **** **** 1796</div>
                    </div>
                </button>
                <button id="kb-star-check" class="card-layout">
                    <div>
                        KB<span class="fw-normal">국민카드</span>
                    </div>
                    <div>
                        <div class="text-start text-light mb-2">카드 번호</div>
                        <div>4674 **** **** 2092</div>
                    </div>
                </button>
                <button id="add-bank" class="card-layout" onclick="">
                    <div class="btn-add">+</div>
                    <div>카드 추가</div>
                    <div class="btn-add-meta">
                        <span style="color:#14A44D;">빠르고 간편한 결제</span>를 위해
                        <br>카드를 등록할 수 있습니다.</div>
                </button>
            </div>
            <div class="selected-account-box">
                <div>선택 : 카카오뱅크 3333-****-1796</div>
            </div>
        </div>
    `;
    const normalPayContent = `
        <div class="normal-pay-contents pay-contents">
            <div class="normal-select">
                <div>
                    <input type="radio" name="normal-pay" id="normal-pay-1" checked>
                    <label for="normal-pay-1">신용카드</label>
                </div>
                <div>
                    <input type="radio" name="normal-pay" id="normal-pay-2">
                    <label for="normal-pay-2">휴대폰 결제</label>
                </div>
                <div>
                    <input type="radio" name="normal-pay" id="normal-pay-3">
                    <label for="normal-pay-3">무통장 입금</label>
                </div>
            </div>
            <div class="p-3">
                <span class="text-primary">최대 10% 적립, 네이버 현대카드</span> 혜택 받기
                <i class="fa-solid fa-chevron-right"></i>
            </div>
        </div>
    `;

    const normalCredit = `<div class="normal-credit-select pay-normal-selects">
        <div>
            <div class="normal-credit-meta">카드구분</div>
            <div class="d-flex">
                <div class="me-2">
                    <input type="radio" name="normal-credit" id="normal-credit-1" checked>
                    <label for="normal-credit-1">개인카드</label>
                </div>
                <div>
                    <input type="radio" name="normal-credit" id="normal-credit-2">
                    <label for="normal-credit-2">법인카드</label>
                </div>
            </div>
        </div>
        <div>
            <div class="normal-credit-meta">카드선택</div>
            <select>
                <option>선택해주세요</option>
                <c:forEach items="<%=bankList%>" var="bank" varStatus="status">
                    <option value="${bank}">${bank}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <div class="normal-credit-meta">할부개월</div>
            <select id="installment-select">
                <c:forEach items="<%=installmentList%>" var="month" varStatus="status">
                    <option value="${month}">${month}</option>
                </c:forEach>
            </select>
        </div>
    </div>`;
    const normalMobile = `<div class="normal-mobile-select pay-normal-selects">
        <div>
            <div class="normal-mobile-meta">결제구분</div>
            <div class="d-flex">
                <div class="me-2">
                    <input type="radio" name="normal-mobile" id="normal-mobile-1" checked>
                    <label for="normal-mobile-1">간편결제</label>
                </div>
                <div>
                    <input type="radio" name="normal-mobile" id="normal-mobile-2">
                    <label for="normal-mobile-2">일반결제</label>
                </div>
            </div>
        </div>
        <div>
            <div class="normal-mobile-meta">휴대폰 번호</div>
            <div class="normal-mobile-value">
                <select id="mobile-first">
                    <option>010</option>
                    <option>011</option>
                    <option>016</option>
                    <option>017</option>
                    <option>018</option>
                    <option>019</option>
                </select>
                <div class="m-1"> - </div>
                <input type="text" id="mobile-middle" maxlength="4">
                <div class="m-1"> - </div>
                <input type="text" id="mobile-last" maxlength="4">
            </div>
        </div>`;
    const normalBank = `<div class="normal-bank-select pay-normal-selects">
        <div>
            <div class="normal-bank-meta">입금은행</div>
            <select>
                <option>선택해주세요</option>
                <c:forEach items="<%=bankList%>" var="bank" varStatus="status">
                    <option value="${bank}">${bank}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <div class="normal-bank-meta">입금자명</div>
            <input type="text" id="normal-bank-name" maxlength="10" class="normal-bank-input">
        </div>
        <div>
            <div class="normal-bank-meta">입금계좌</div>
            <input type="text" id="normal-bank-account" maxlength="20" class="normal-bank-input">
        </div>
    </div>`;

    $(document).ready(function () {
        $('#naverPay').append(naverPayContent);

        $('input[type=radio]').click(function () {
            if ($(this).attr("id") == "radio1") {
                // naverPay
                if($('#naverPay').find('.naver-pay-contents').length === 0) {
                    $('#naverPay').append(naverPayContent);
                    $('#naverPay').find('.naver-pay-contents').css('animation', 'showPaymentContents 0.5s ease-in-out');
                }

                // pay-contents 클래스를 가진 div중에서, naver-pay-contents 클래스를 가진 div를 제외한 나머지 div를 제거
                $('.pay-contents').not('.naver-pay-contents').remove();

            } else if ($(this).attr("id") == "radio2") {
                // accountPay
                if($('#accountPay').find('.account-pay-contents').length === 0) {
                    $('#accountPay').append(accountPayContent);
                    $('#accountPay').find('.account-pay-contents').css('animation', 'showPaymentContents 0.5s ease-in-out');
                }

                $('.pay-contents').not('.account-pay-contents').remove();

            } else if ($(this).attr("id") == "radio3") {
                // cardPay
                if($('#cardPay').find('.card-pay-contents').length === 0) {
                    $('#cardPay').append(cardPayContent);
                    $('#cardPay').find('.card-pay-contents').css('animation', 'showPaymentContents 0.5s ease-in-out');
                }

                $('.pay-contents').not('.card-pay-contents').remove();

            } else if ($(this).attr("id") == "radio4") {
                // normalPay
                if($('#normalPay').find('.normal-pay-contents').length === 0) {
                    $('#normalPay').append(normalPayContent);
                    $('#normalPay').find('.normal-pay-contents').append(normalCredit);
                    $('#normalPay').find('.normal-pay-contents').css('animation', 'showPaymentContents 0.5s ease-in-out');

                    $('#normal-pay-1').click(function () {
                        if($('#normalPay').find('.normal-credit-select').length === 0) {
                            $('#normalPay').find('.normal-pay-contents').append(normalCredit);
                            $('#normalPay').find('.normal-credit-select').css('animation', 'showPaymentContents 0.5s ease-in-out');
                        }
                        $('.pay-normal-selects').not('.normal-credit-select').remove();
                    });
                    $('#normal-pay-2').click(function () {
                        if($('#normalPay').find('.normal-mobile-select').length === 0) {
                            $('#normalPay').find('.normal-pay-contents').append(normalMobile);
                            $('#normalPay').find('.normal-mobile-select').css('animation', 'showPaymentContents 0.5s ease-in-out');
                            $('#mobile-middle').focus();
                            $('#mobile-middle').keyup(function () {
                                if($(this).val().length === 4) {
                                    $('#mobile-last').focus();
                                }
                            });
                        }
                        $('.pay-normal-selects').not('.normal-mobile-select').remove();
                    });
                    $('#normal-pay-3').click(function () {
                        if($('#normalPay').find('.normal-bank-select').length === 0) {
                            $('#normalPay').find('.normal-pay-contents').append(normalBank);
                            $('#normalPay').find('.normal-bank-select').css('animation', 'showPaymentContents 0.5s ease-in-out');
                        }
                        $('.pay-normal-selects').not('.normal-bank-select').remove();
                    });


                    // normal-credit
                    $('#normal-credit-1').click(function () {
                        $('#installment-select').attr('disabled', false);
                    });
                    $('#normal-credit-2').click(function () {
                        $('#installment-select').val('일시불');
                        $('#installment-select').attr('disabled', true);
                    });
                }
                $('.pay-contents').not('.normal-pay-contents').remove();
            }
        });


        $('#normal-mobile-1').click(function () {
            $('#normalPay').find('.normal-pay-contents').append(normalMobile);
        });
        $('#normal-mobile-2').click(function () {
            $('#normalPay').find('.normal-mobile-select').remove();
        });
    });
</script>
</html>