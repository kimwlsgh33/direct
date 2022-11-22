<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/19
  Time: 12:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <title>newHome</title>
    <link href="${ctx}/resources/styles/reset.css" rel="stylesheet" type="text/css">
    <!--fonts-->
    <script src="https://kit.fontawesome.com/217192a703.js" crossorigin="anonymous"></script>
    <!--css-->
    <style>
        html, body {
            font-family: 'NotoSansKR', sans-serif;
            font-size: 16px;
        }

        .container {
            width: 100%;
            height: 100%;
            background-color: #f5f5f5;
        }

        nav {
            height: 65px;
            background-color: black;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        nav a {
            text-decoration: none;
            color: white;
        }

        .nav-link {
            font-size: 16px;
        }

        .logo {
            font-weight: bold;
            display: flex;
            align-items: center;
            font-size: 26px;
        }

        .logo img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        .dropdown {
            position: relative; /* 상대적 위치 지정 */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px 0;
            animation: growDown 300ms ease-in-out forwards;
            transform-origin: top center;
            perspective: 1000px;
        }
        .dropdown:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
        .dropdown:hover .dropdown-content li {
            display: block;
        }

        @keyframes growDown {
            0% {
                transform: scaleY(0);
            }
            75% {
                transform: scaleY(1.1);
            }
            100% {
                transform: scaleY(1);
            }
        }

        .dropdown-content {
            position: absolute; /* 드롭다운 메뉴를 상대적 위치로 지정 */
            top: 100%; /* 드롭다운 메뉴를 부모 요소의 하단에 위치 */
            background-color: #f9f9f9; /* 드롭다운 메뉴의 배경색 */
            min-width: 160px; /* 드롭다운 메뉴의 최소 너비 */
            box-shadow:
                    2.8px 2.8px 2.2px rgba(0, 0, 0, 0.02),
                    6.7px 6.7px 5.3px rgba(0, 0, 0, 0.028),
                    12.5px 12.5px 10px rgba(0, 0, 0, 0.035),
                    22.3px 22.3px 17.9px rgba(0, 0, 0, 0.042),
                    41.8px 41.8px 33.4px rgba(0, 0, 0, 0.05),
                    100px 100px 80px rgba(0, 0, 0, 0.07); /* 드롭다운 메뉴의 그림자 */
            z-index: 1; /* 드롭다운 메뉴를 최상위로 설정 */
        }
        .dropdown-content li {
            display: none;
            /*color: white;*/
            opacity: 0;
        }
        .dropdown-content li:hover {
            background-color: #f1f1f1;
        }


        .dropdown-content--animated {
            display: none; /* 드롭다운 메뉴를 숨김 */
        }
        .dropdown-content--animated li {
            display: block; /* 드롭다운 메뉴를 보임 */
            opacity:1;
        }





        .btn {
            background-color: #f5f5f5;
            color: black;
            border: 1px solid black;
            border: none;
            padding: 10px 26px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 10px;
        }

        .login_btn {
            background-color: #04AA6D;
            color: #f5f5f5;
        }

        .login_btn:hover {
            background-color: #f5f5f5;
            color: #04AA6D;
        }
    </style>
</head>
<body>
<div class="container">
    <nav>
        <div class="logo">
            <img src="${ctx}/resources/icons/logo.svg" alt="logo">
            <a href="#">DIRECT</a>
        </div>
        <div class="dropdown">
            <a class="nav-link" href="#">
                <span>MY INFO</span>
                <i class="fa-solid fa-sort-down"></i>
            </a>
            <ul class="dropdown-content dropdown-content--animated">
                <li class="dropdown-item">
                    <a href="#">주문 목록</a>
                </li>
                <li class="dropdown-item">
                    <a href="#">취소, 반품</a>
                </li>
                <li class="dropdown-item">
                    <a href="#">북마크</a>
                </li>
            </ul>
        </div>
        <div>
            <span>로그인을 진행해주세요.</span>
            <button class="btn login_btn" type="button">로그인</button>
        </div>
    </nav>
    <div class="search_bar">
        <div class="search_logo"></div>
        <input class="search_input" type="text"></input>
        <div
    </div>
</div>
</body>
</html>
