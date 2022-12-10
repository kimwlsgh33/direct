<%--
  Created by IntelliJ IDEA.
  User: gimjinho
  Date: 2022/12/09
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Store Detail</title>
</head>
<body>
<jsp:include page="../common/header.jsp" flush="false"></jsp:include>
  <h1>Store Detail</h1>
    <div>${store.name}</div>
    <div>${store.address}</div>
    <div>${store.phone}</div>
<jsp:include page="../common/footer.jsp" flush="false"></jsp:include>
</body>
</html>
