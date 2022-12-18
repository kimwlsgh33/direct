<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/12/18
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <style>
        .category-nav {
            background-color: #fefefe;
            width: 100%;
            text-align: center;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
            margin-bottom: 20px;
            z-index: 1;
            position: sticky;
            top: 45px;
        }

      .circle {
        width: 70px;
        height: 70px;
        border: 1px solid #F5F5F5;
        transition: 0.3s ease-in-out;
        box-shadow:
                0.7px 0.7px 0.7px rgba(0, 0, 0, 0.02),
                1.7px 1.8px 1.8px rgba(0, 0, 0, 0.028),
                3.3px 3.4px 3.4px rgba(0, 0, 0, 0.035),
                5.8px 6px 6px rgba(0, 0, 0, 0.042),
                10.9px 11.3px 11.3px rgba(0, 0, 0, 0.05),
                26px 27px 27px rgba(0, 0, 0, 0.07);
      }

      .btn-circle:hover .circle {
        background-color: #F5F5F5;
      }
    </style>
</head>
<body>
    <div class="category-nav">
        <c:forEach var="category" items="${categoryList}">
            <a href="${ctx}/item/searchList?category_id=${category.category_id}" class="link-dark btn-circle">
                <div class="rounded-pill d-flex justify-content-center align-items-center mb-2 circle" >
                    <i class="${category.icon} fa-xl" style="color:  ${category.color}"></i>
                </div>
                <span>${category.name}</span>
            </a>
        </c:forEach>
    </div>
</body>
