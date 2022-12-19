<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %><%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/24
  Time: 12:01 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    ArrayList<String> list = new ArrayList<String>(Arrays.asList(""));
    list.add("상점ID");
    list.add("상점이름");
    list.add("상점주소");
    list.add("상점사진");
    list.add("전화번호");
    list.add("소개글");
    list.add("평점");
    list.add("리뷰수");
    list.add("즐겨찾기수");
    list.add("운영시간");
    list.add("휴무일");
    list.add("상태");
%>
<html>
<head>
    <title>주문 목록</title>
    <style>
        .item-infos {
            width: 75%;
            margin: 20px 0 30px 0;
        }

        .item-info {
            width: 100%;
            background-color: #FEFEFE;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            padding: 30px;
            margin-bottom: 10px;
            border-radius: 15px;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
        }

        .item-info-column {
            display: flex;
            flex-direction: column;
        }

        .item-info-main {
            width: 300px;
        }

        .item-info-column:not(:last-child) {
            margin-right: 30px;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>

<div class="container-fluid d-flex flex-column align-items-center p-3">
    <h1>주문 목록</h1>
    <div name="item-infos" class="item-infos">
        <c:forEach var="item" items="${orderList}">
            <div class="item-info">
                <div class="item-info-column item-info-main">
                    <div>상품정보</div>
                    <div class="d-flex align-items-center pt-2">
                        <img src="${item.img_url}" alt="logo" width="100" height="100" class="item-img">
                        <div>
                            <div>${item.item_name} 등 3개...</div>
                        </div>
                    </div>
                </div>
                <div class="item-info-column">
                    <div>수신자</div>
                    <div class="my-2 item-info-value"><span><i class="fa-solid fa-truck-fast"></i></span>${item.receiver}</div>
                    <div class="item-info-value">
                        <c:out value="${fn:substring(item.phone, 0, 3)}-${fn:substring(item.phone, 3, 7)}-${fn:substring(item.phone, 7, 11)}"/>
                    </div>
                </div>
                <div class="item-info-column">
                    <div>주소</div>
                    <div class="my-2 item-info-value">${item.address}${item.address_detail}(${item.zip_code})</div>
                </div>
                <div class="item-info-column">
                    <div>배송메시지</div>
                    <div class="item-info-value">${item.msg}</div>
                </div>
                <div class="item-info-column">
                    <div>가격 </div>
                    <div class="item-info-value">
                        <fmt:formatNumber value="0" type="number" pattern="#,###" />
                        원</div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
</html>
