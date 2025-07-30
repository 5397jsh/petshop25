<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>주문 상세</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/vendor.css">
  <link rel="stylesheet" href="/style.css">
</head>
<body>
<jsp:include page="/views/header.jsp"/>

<main class="container mt-5">
  <h1 class="fw-bold mt-4 mb-3">주문 상세</h1>
  <dl class="row">
    <dt class="col-sm-3">주문번호</dt><dd class="col-sm-9">${base.orderId}</dd>
    <dt class="col-sm-3">주문일시</dt>
    <dd class="col-sm-9"><fmt:formatDate value="${base.regDate}" pattern="yyyy-MM-dd HH:mm"/></dd>
    <dt class="col-sm-3">수령인</dt><dd class="col-sm-9">${base.recipientName}</dd>
    <dt class="col-sm-3">총 결제금액</dt>
    <dd class="col-sm-9">
      <fmt:formatNumber value="${base.totalAmount}" pattern="###,###"/>원
    </dd>
  </dl>

  <table class="table mt-4 align-middle">
    <thead>
    <tr>
      <th>이미지</th><th>상품명</th><th>수량</th><th>단가</th><th>소계</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="i" items="${items}">
      <tr>
        <td><img src="${i.productImg}" style="width:60px;" alt=""/></td>
        <td>${i.productName}</td>
        <td>${i.quantity}</td>
        <td>
          <fmt:formatNumber value="${i.unitPrice}" pattern="###,###"/>원
        </td>
        <td>
          <fmt:formatNumber value="${i.subtotal}" pattern="###,###"/>원
        </td>
      </tr>
    </c:forEach>
    <c:if test="${empty items}">
      <tr><td colspan="5" class="text-center">주문 상품이 없습니다.</td></tr>
    </c:if>
    </tbody>
  </table>

  <a href="/mypage/orders" class="btn btn-secondary">목록으로</a>
</main>

<jsp:include page="/views/footer.jsp"/>
<script src="/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/js/script.js"></script>
</body>
</html>
