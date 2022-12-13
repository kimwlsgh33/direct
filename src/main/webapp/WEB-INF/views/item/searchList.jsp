<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"	uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>검색 결과</title>
</head>
<style>
    .flip-card {
        background-color: transparent;
        width: 300px;
        height: 300px;
        perspective: 1000px;
        margin-bottom: 40px;
    }
    .flip-card-inner {
        position: relative;
        width: 100%;
        height: 100%;
        text-align: center;
        transition: transform 0.8s;
        transform-style: preserve-3d;
    }
    .flip-card:hover .flip-card-inner {
        transform: rotateY(180deg);
    }

    .flip-card-front, .flip-card-back {
        position: absolute;
        width: 100%;
        height: 100%;
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        border-radius: 16px;
    }

    .flip-card-front  {
        background-color: #FFFFFF;
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
    }
    .flip-card-front img {
        width: 140px;
        margin-top: 1rem;
        border-radius: 16px;
    }

    .flip-card-back {
        background-image: linear-gradient(315deg, #FFFFFF, black);
        transform: rotateY(180deg);
    }
    .flip-card-back img {
        width: 100%;
        height: 100%;
    }
    .flip-card-front h1 {
        margin: 0;
        font-size: 1.5rem;
        color: black;
    }
    .flip-card-front h3 {
        margin-bottom: 0.3rem;
        color: black;
        margin-top: 1rem;
    }
    .flip-card-front p {
        color: black;
    }
    .mainContainer_style {
        margin-right: 80px;
        margin-left: 80px;
    }

</style>
<body>
<%--상단 메뉴--%>
<jsp:include page="../common/header.jsp" flush="false"/>

<div class="toast-container position-fixed bottom-0 end-0 p-3">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <img src="..." class="rounded me-2" alt="...">
            <strong class="me-auto">알림</strong>
            <small>짝짝쓰~</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            장바구니에 추가 되었습니당~
        </div>
    </div>
</div>

<div class="container-fluid" style="background-color: white">
    <%-- <p>  ${검색한 내용} 에 대한 검색 결과입니다. </p>   --%>


    <%--상품 검색 결과--%>
    <div class="mainContainer flex-wrap" style=""> <!-- 헤더 밑 전체 부분 -->
        <div class="mainContainer_style "> <!-- 전체 부분 포지션 잡기 위한 div  -->


        <%--            <h2 class="blind">검색결과</h2>--%>
            <div class="d-flex align-items-center"  style="height: 40px"> <!-- "에 대한 검색 결과입니다" 큰 div -->
                <div class="result_info_text" >
                    <p id="searchResult"> <em style="color: gray; font-size: 20px;">${keyword}</em> 에 대한 검색 결과입니다. </p>
                </div>
            </div>
            <div class="filter_finder"> <!-- 결과 필터 부분 큰 div-->
                <div class="filter_finder_style"> <!-- 피터 부분 포지션 잡기 위한 div -->
<%--                    <h3 class="blind">검색 필터</h3>--%>
                    <div class="filter_finder_col"> <!-- 검색 필터 네모 한줄  -->
                        <div class="filter_finder_col_left"></div> <!-- 왼쪽 표 자리 잡기 ex) 카테고리 -->
                        <div class="filter_finder_col_right"></div> <!-- 오른쪽 표 자리 잡기 ex) 생활/건강 디지털/가전 -->
                    </div>
                    <div class="filter_finder_col"> <!-- 검색 필터  -->
                        <div class="filter_finder_col_left"></div> <!-- 왼쪽 표 자리 잡기 ex) 카테고리 -->
                        <div class="filter_finder_col_right"></div> <!-- 오른쪽 표 자리 잡기 ex) 생활/건강 디지털/가전 -->
                    </div>
                    <div class="filter_finder_col"> <!-- 검색 필터  -->
                        <div class="filter_finder_col_left"></div> <!-- 왼쪽 표 자리 잡기 ex) 카테고리 -->
                        <div class="filter_finder_col_right"></div> <!-- 오른쪽 표 자리 잡기 ex) 생활/건강 디지털/가전 -->
                    </div>
                    <div class="filter_finder_col"> <!-- 검색 필터  -->
                        <div class="filter_finder_col_left"></div> <!-- 왼쪽 표 자리 잡기 ex) 카테고리 -->
                        <div class="filter_finder_col_right"></div> <!-- 오른쪽 표 자리 잡기 ex) 생활/건강 디지털/가전 -->
                    </div>
                </div>
            </div>
            <div class="search_result_content flex-wrap"> <!--검색 결과 본문 -->
            <%--========================================================================================================  --%>
                <%--=========================================검  색  필  터===================================================  --%>
                <%--========================================================================================================  --%>
                <div class="d-flex justify-content-between mb-3" style="border-top: 1px solid gainsboro; border-bottom: 1px solid gainsboro;"> <!-- 낮은 가격순, 높은 가격순, 이 필터  flex_between 사용 예정  -->
                    <div class="row justify-content-evenly w-50 align-items-center subFilter"  >
                        <a id="lowPrice"  href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=lowPrice&perPageNum=${perPageNum}" role="button" class="col" style="color: black">낮은 가격순</a>
                        <a id="highPrice" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=highPrice&perPageNum=${perPageNum}" role="button" class="col" style="color: black">높은 가격순</a>
                        <a href="#" role="button" class="col" style="color: black">리뷰 높은순</a>
                        <a id="product_date" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=product_date" role="button" class="col" style="color: black">등록일 순</a>
                    </div>

<%--                    dropdown으로 버튼 만들기--%>
                    <div>
                        <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            ${perPageNum}개씩 보기
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=8">8개씩 보기</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=12">12개씩 보기</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=16">16개씩 보기</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=20">20개씩 보기</a></li>
                        </ul>
                    </div>
                </div>
                <%--========================================================================================================  --%>
                <%--===============================================구 매 할 제 품============================================  --%>
                <%--========================================================================================================  --%>
                <div >
                    <a class="d-flex flex-wrap justify-content-evenly" style="text-decoration: none; color: black" href="#">
                    <c:forEach var="item" items="${searchList}">
                    <div class="flip-card">
                        <div class="flip-card-inner">
                            <div class="flip-card-front">
<%--                                <img src="${item.product_image}" />--%>
                                <h3>${item.name}</h3>
                                <h1>${item.price}원</h1>
                                <p>${item.created_at}</p>
                                <div class="progress d-flex" style="width: 80%; margin-left: auto; margin-right: auto" >
                                    <div class="progress-bar progress-bar-striped bg-warning" style="width: 25%;" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="flip-card-back align-items-center" >
                                <form>  <!-- 나중에 제품 상세 페이지로 ACTION 주기. -->
<%--                                <img src="${item.product_image}"/>--%>
                                </form>
                                <button class="btn btn-outline-dark" id="${item.item_id}" style="width:100%; border-radius: 16px; border-width: 1px;" onclick="fn_addCart(${item.item_id})" ><i class="fas fa-shopping-cart"></i></button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                </a>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <c:if test="${pageMaker.prev }">
                            <li class="page-item">
                                <a class="page-link" href='<c:url value="/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=${perPageNum}&page=${pageMaker.startPage-1 }"/>'>이전</a>
                            </li>
                        </c:if>
                        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                            <li class="page-item">
                                <a class="page-link" href='<c:url value="/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=${perPageNum}&page=${pageNum }"/>'><i>${pageNum }</i></a>
                            </li>
                        </c:forEach>
                        <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
                            <li class="page-item">
                                <a class="page-link" href='<c:url value="/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=${perPageNum}&page=${pageMaker.endPage+1 }"/>'>다음</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>


<jsp:include page="../common/footer.jsp" flush="false"/>
</body>
<script>
    function fn_addCart(item_id) {
        $.ajax({
            url: "/cart/addCart",
            type: "POST",
            data: {
                "item_id": item_id,
            },
            success: function (data) {
                alert("장바구니에 추가되었습니다.");
            },
            error: function (request, status, error) {
                alert(item_id + "============================" + "code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

</script>

<script>
    const toastTrigger = document.getElementById('addCart')
    const toastLiveExample = document.getElementById('liveToast')
    if (toastTrigger) {
        toastTrigger.addEventListener('click', () => {
            const toast = new bootstrap.Toast(toastLiveExample)
            toast.show()
        })
    }

    const subFilter = document.getElementById('subFilter');



    $(document).ready(function(){

        $("#${subFilter}").css("fontWeight", "bold");
        $("#${subFilter}").css("color", "black");
        if("${keyword == null}"){
            $("searchResult").hide();
        }

    })



</script>

</html>
