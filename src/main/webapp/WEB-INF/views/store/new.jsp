<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/11/17
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새로운 아이템 등록하기</title>
</head>
<body>
    <h1>새로운 아이템 등록하기</h1>
    <form action="newItem" method="post">
        <table border="1">
            <tr>
                <td>상품명</td>
                <td><input type="text" name="itemName"></td>
            </tr>
            <tr>
                <td>가격</td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td>수량</td>
                <td><input type="text" name="quantity"></td>
            </tr>
            <tr>
                <td>상세설명</td>
                <td><textarea name="description"></textarea></td>
            </tr>
            <tr>
                <td>이미지</td>
                <td><input type="file" name="image"></td>
            </tr>
        </table>
        <input type="submit" value="등록">
    </form>
</body>
</html>
