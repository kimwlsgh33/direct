<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/12/13
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Item Detail</title>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"/>
 <div class="bg-light h-75">
     <p>상품 ID : ${itemDTO.itemVO.item_id}</p>
     <p>상품 이름 : ${itemDTO.itemVO.name}</p>
    <p>상품 가격 : ${itemDTO.itemVO.price}</p>
    <p>상세 설명 : ${itemDTO.itemVO.description}</p>
    <p>상품 상태 : ${itemDTO.itemVO.status}</p>
    <p>상품 등록일 : ${itemDTO.itemVO.created_at}</p>
    <p>상품 수정일 : ${itemDTO.itemVO.updated_at}</p>
    <p>카테고리 : ${itemDTO.categoryVO.name}</p>
     <c:forEach items="${itemDTO.imgList}" var="image">
         <p>이미지 이름 : ${image.img_name}</p>
         <img src="${image.img_url}" alt="이미지" width="300" height="300">
     </c:forEach>
 </div>
</body>
</html>
