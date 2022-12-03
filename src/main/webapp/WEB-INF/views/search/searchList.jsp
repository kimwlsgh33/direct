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
    #itemList {
        border-bottom: thin solid aliceblue;
        border-top: thin solid aliceblue;
    }
    #itemList:hover{
        background-color: #f5f5f5;
        border: pink solid thin;
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
            <small>10 minute ago</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            3번째 방문입니다!
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
                    <p id="searchResult"> <em style="color: green">${keyword}</em> 에 대한 검색 결과입니다. </p>
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
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=10">10개씩 보기</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=20">20개씩 보기</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=30">30개씩 보기</a></li>
                            <li><a class="dropdown-item" href="${contextPath}/search/searchList?keyword=${keyword}&subFilter=${subFilter}&perPageNum=40">40개씩 보기</a></li>
                        </ul>
                    </div>
                </div>
                <%--========================================================================================================  --%>
                <%--===============================================구 매 할 제 품============================================  --%>
                <%--========================================================================================================  --%>
                <ul class="row d-flex basicList flex-wrap"> <!-- 구매할 제품 리스트 -->
                        <c:forEach var="product" items="${searchList}" >
                        <li class="basicList_item" id="itemList"> <!-- 1개 큰 틀자리 잡기 -->
                            <div class="d-flex justify-content-start" style="margin: 20px"> <!-- 1개 작은 틀 자리 잡기 -->
                                <div class="basicList_img_area" style="text-align: start; height: 100%;  border: solid thin #f5f5f5" > <!-- 제품 이미지 넣을 공간 -->
                                    <a href="#" class="basicList_link" id="liveToastBtn" type="button">
                                        <img src="${product.product_image}" style="width: 50%;">
                                    </a>
                                </div>
                                <div class="d-flex row justify-content-evenly basicList_info_area">
                                    <div class="basicList_title">
                                        <a href="#" class="basicList_link">
                                            ${product.product_name}
                                        </a>
                                    </div>
                                    <div class="basicList_price_area">
                                        <a href="#" data-bs-toggle="tooltip" data-bs-title="Default tooltip"></a>
                                            <%--  툴팁 실패...       --%>
                                            <span>${product.product_price}</span>
                                            <span>원</span>

                                    </div>
                                    <div class="basicList_review_area">
                                        <div class="progress">
                                            <div class="progress-bar" style="width: 25%" role="progressbar" aria-label="Basic example" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                        <div class="basicList_product_date">
                                            <span class="basicList_num_text">등록일</span>
                                            <span class="basicList_num">${product.product_date}</span>
                                        </div>
<%--                                    <button type="button" class="btn btn-primary" id="liveToastBtn">Show live toast</button>--%>
                                    </div>
                            </div>
                        </li>
                        </c:forEach>
                </ul>
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
    const toastTrigger = document.getElementById('liveToastBtn')
    const toastLiveExample = document.getElementById('liveToast')
    if (toastTrigger) {
        toastTrigger.addEventListener('click', () => {
            const toast = new bootstrap.Toast(toastLiveExample)
            toast.show()
        })
    }

    const toastTrigger1 = document.getElementById('liveToastBtn1')
    const toastLiveExample1 = document.getElementById('liveToast')
    if (toastTrigger) {
        toastTrigger.addEventListener('click', () => {
            const toast = new bootstrap.Toast(toastLiveExample1)
            toast.show()
        })
    }


    const subFilter = document.getElementById('subFilter');



    $(document).ready(function(){

        if("${subFilter}"==null){

        }
        $("#${subFilter}").css("fontWeight", "bold");
        if("${keyword == null}"){
            $("searchResult").hide();
        }

    })


</script>
</html>
