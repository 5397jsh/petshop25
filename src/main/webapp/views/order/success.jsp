<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주문 성공</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="/style.css">
</head>
<body>
<%@ include file="/views/header.jsp" %>

<main class="container mt-5 text-center">
    <div class="p-4 border rounded bg-light shadow-sm">
        <h2>✔️ 주문이 완료되었습니다!</h2>
        <p>주문해 주셔서 감사합니다.</p>
        <a href="/" class="btn btn-primary mt-4">메인으로 이동</a>
        <a href="/product" class="btn btn-secondary mt-4">상품 더 보기</a>
    </div>
</main>

<%@ include file="/views/footer.jsp" %>

<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
