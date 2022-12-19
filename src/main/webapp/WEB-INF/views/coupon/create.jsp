<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/24
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>
<head>
    <title>쿠폰 Create</title>
    <style>
        .create-row {
            display: flex;
            width: 100%;
            justify-content: space-between;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
<div class="container-fluid d-flex flex-column align-items-center p-4">
    <h1 class="mb-3">쿠폰 Create</h1>
    <div class="w-50 bg-light shadow p-3 rounded-4">
        <div class="create-row">
            <div class="pe-2">쿠폰 이름 : </div>
            <input type="text" id="name" name="name" class="me-3">
        </div>
        <div class="create-row coupon-radio">
            <div>쿠폰 종류 : </div>
            <div class="d-flex">
                <div class="me-2">
                    <input type="radio" name="discount_type" id="percent" checked>
                    <label for="percent">비율 (%)</label>
                </div>
                <div>
                    <input type="radio" name="discount_type" id="amount">
                    <label for="amount">금액 (원)</label>
                </div>
            </div>
        </div>
        <div class="create-row">
            <div class="pe-2">최소 주문 금액 : </div>
            <input type="text" id="min_price" name="min_price" class="me-3">
        </div>
        <div class="create-row">
            <div class="pe-2">소멸 시간 </div>
            <input type="date" id="expired_date" name="expired_date" class="me-3">
        </div>
        <input type="button" value="Create" class="btn btn-success" onclick="onSubmit()">
    </form>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
<script>
    $(document).ready(function () {
        $('input[id=name]').focus();

        const priceContent = `<div class="create-row discount-price-row">
            <div class="pe-2">차감 금액 : </div>
            <div>
                <input type="text" id="discount_price" name="discount_price" class="me-1" style="width: 100px;">
                <span>원</span>
            </div>
        </div>`
        const rateContent = `<div class="create-row discount-rate-row">
            <div class="pe-2">차감 비율 : </div>
            <div>
                <input type="text" maxlength="3" id="discount_rate" name="discount_rate" class="me-1" style="width:50px;">
                <span>%</span>
            </div>
        </div>`
        $('.coupon-radio').after(rateContent);
        $('input[name=discount_type]').click(function () {
            if ($(this).attr('id') == 'amount') {
                // 금액
                $('.discount-rate-row').remove();
                $('.coupon-radio').after(priceContent);
            } else {
                $('.discount-price-row').remove();
                $('.coupon-radio').after(rateContent);
            }
        })
    });

    // $('input[id=expired_date]').val(new Date().toISOString().split('T')[0]);
    $('input[id=expired_date]').change(function () {
        const date = new Date($(this).val());
        const today = new Date();
        if (date < today) {
            alert('오늘 이후의 날짜를 선택해주세요.');
            $(this).val('');
        } else {
            alert(date);
        }
    })

    const onSubmit = () => {
        const name = $('input[id=name]').val();
        const discount_price = $('input[id=discount_price]').val();
        const discount_rate = $('input[id=discount_rate]').val();
        const min_price = $('input[id=min_price]').val();
        const expired_date = $('input[id=expired_date]').val();

        if (name === '') {
            alert('쿠폰 이름을 입력해주세요.');
            $('input[id=name]').focus();
            return;
        }

        if (discount_price === '') {
            alert('차감 금액을 입력해주세요.');
            $('input[id=discount_price]').focus();
            return;
        }

        if (discount_rate === '') {
            alert('차감 비율을 입력해주세요.');
            $('input[id=discount_rate]').focus();
            return;
        }

        if (min_price === '') {
            alert('최소 주문 금액을 입력해주세요.');
            $('input[id=min_price]').focus();
            return;
        }

        if (expired_date === '') {
            alert('소멸 시간을 입력해주세요.');
            $('input[id=expired_date]').focus();
            return;
        }


        $.ajax({
            url: '${ctx}/coupon/create',
            type: 'POST',
            data: {
                name: name,
                discount_price: discount_price,
                discount_rate: discount_rate,
                min_price: min_price,
                expired_date: expired_date + " 00:00:00"
            },
            success: function (data) {
                if (data === 'success') {
                    alert('쿠폰 생성에 성공했습니다.');
                    location.href = '/coupon/listAll';
                } else {
                    alert('쿠폰 생성에 실패했습니다.');
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>
</html>
