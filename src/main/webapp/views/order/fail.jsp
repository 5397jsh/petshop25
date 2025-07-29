<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문 실패</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            padding: 30px;
            font-family: 'Open Sans', sans-serif;
            background-color: #f8d7da;
        }
        .container {
            background-color: #fff;
            border: 1px solid #f5c6cb;
            padding: 30px;
            border-radius: 8px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-danger">❌ 주문 처리에 실패했습니다</h2>
    <hr>
    <p>
        ${msg}
    </p>
    <a href="/checkout?custId=${logincust.custId}" class="btn btn-outline-danger">장바구니로 돌아가기</a>
</div>

</body>
</html>
