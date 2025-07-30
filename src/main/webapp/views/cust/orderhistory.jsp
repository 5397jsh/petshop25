<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>나의 주문 내역</title>

    <!-- Bootstrap & Font-Awesome -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 프로젝트 CSS -->
    <link rel="stylesheet" href="/css/vendor.css">
    <link rel="stylesheet" href="/style.css">
</head>
<body>

<jsp:include page="/views/header.jsp"/>

<main class="container mt-5">
    <h1 class="fw-bold mt-4 mb-3">나의 주문 내역</h1>
    <table class="table">
        <thead>
        <tr>
            <th>주문번호</th><th>주문일시</th><th>수령인</th>
            <th>총금액</th><th>상세보기</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="o" items="${orders}">
            <tr>
                <td>${o.orderId}</td>
                <td><fmt:formatDate value="${o.regDate}" pattern="yyyy-MM-dd HH:mm"/></td>
                <td>${o.recipientName}</td>
                <td>
                    <fmt:formatNumber value="${o.totalAmount}" pattern="###,###"/>원
                </td>
                <td>
                    <a href="/mypage/orderDetail?orderId=${o.orderId}"
                       class="btn btn-sm btn-outline-primary">보기</a>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${empty orders}">
            <tr>
                <td colspan="5" class="text-center">주문 내역이 없습니다.</td>
            </tr>
        </c:if>
        </tbody>
    </table>
</main>

<jsp:include page="/views/footer.jsp"/>

<!-- JS 로드 -->
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/plugins.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
